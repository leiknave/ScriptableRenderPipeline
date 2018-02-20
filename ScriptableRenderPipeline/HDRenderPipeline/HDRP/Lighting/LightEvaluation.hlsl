// This files include various function uses to evaluate lights
// To use deferred directional shadow with cascaded shadow map,
// it is required to define USE_DEFERRED_DIRECTIONAL_SHADOWS before including this files

//-----------------------------------------------------------------------------
// Directional Light evaluation helper
//-----------------------------------------------------------------------------

float3 EvaluateCookie_Directional(LightLoopContext lightLoopContext, DirectionalLightData lightData,
                                  float3 lightToSample)
{

    // Translate and rotate 'positionWS' into the light space.
    // 'GetRight(lightData)' and 'GetUp(lightData)' are pre-scaled on CPU.
    float3x3 lightToWorld  = float3x3(GetRight(lightData), GetUp(lightData), GetForward(lightData));
    float3   positionLS    = mul(lightToSample, transpose(lightToWorld));

    // Perform orthographic projection.
    float2 positionCS    = positionLS.xy;

    // Remap the texture coordinates from [-1, 1]^2 to [0, 1]^2.
    float2 positionNDC = positionCS * 0.5 + 0.5;

    // We let the sampler handle clamping to border.
    return SampleCookie2D(lightLoopContext, positionNDC, GetCookieIndex(lightData), GetTileCookie(lightData));
}

// None of the outputs are premultiplied.
void EvaluateLight_Directional(LightLoopContext lightLoopContext, PositionInputs posInput,
                               DirectionalLightData lightData, BakeLightingData bakeLightingData,
                               float3 N, float3 L,
                               out float3 color, out float attenuation)
{
    float3 positionWS = posInput.positionWS;
    float  shadow     = 1.0;
    float  shadowMask = 1.0;

    color       = GetColor(lightData);
    attenuation = 1.0; // Note: no volumetric attenuation along shadow rays for directional lights

    [branch] if (GetCookieIndex(lightData) >= 0)
    {
        float3 lightToSample = positionWS - GetPositionWS(lightData);
        float3 cookie = EvaluateCookie_Directional(lightLoopContext, lightData, lightToSample);

        color *= cookie;
    }

#ifdef SHADOWS_SHADOWMASK
    // shadowMaskSelector.x is -1 if there is no shadow mask
    // Note that we override shadow value (in case we don't have any dynamic shadow)
    shadow = shadowMask = (GetShadowMaskSelector(lightData).x >= 0.0) ? dot(bakeLightingData.bakeShadowMask, GetShadowMaskSelector(lightData)) : 1.0;
#endif

    [branch] if (GetShadowIndex(lightData) >= 0)
    {
#ifdef USE_DEFERRED_DIRECTIONAL_SHADOWS
        shadow = LOAD_TEXTURE2D(_DeferredShadowTexture, posInput.positionSS).x;
#else
        shadow = GetDirectionalShadowAttenuation(lightLoopContext.shadowContext, positionWS, N, GetShadowIndex(lightData), L, posInput.positionSS);
#endif

#ifdef SHADOWS_SHADOWMASK
        float fade = saturate(posInput.linearDepth * GetFadeDistanceScaleAndBias(lightData).x + GetFadeDistanceScaleAndBias(lightData).y);

        // See comment in EvaluateBSDF_Punctual
        shadow = GetDynamicShadowCasterOnly(lightData) ? min(shadowMask, shadow) : shadow;
        shadow = lerp(shadow, shadowMask, fade); // Caution to lerp parameter: fade is the reverse of shadowDimmer

        // Note: There is no shadowDimmer when there is no shadow mask
#endif
    }

    attenuation *= shadow;
}

//-----------------------------------------------------------------------------
// Punctual Light evaluation helper
//-----------------------------------------------------------------------------

float4 EvaluateCookie_Punctual(LightLoopContext lightLoopContext, LightData lightData,
                               float3 lightToSample)
{
    int lightType = GetLightType(lightData);

    // Translate and rotate 'positionWS' into the light space.
    // 'GetRight(lightData)' and 'GetUp(lightData)' are pre-scaled on CPU.
    float3x3 lightToWorld = float3x3(GetRight(lightData), GetUp(lightData), GetForward(lightData));
    float3   positionLS   = mul(lightToSample, transpose(lightToWorld));

    float4 cookie;

    [branch] if (lightType == GPULIGHTTYPE_POINT)
    {
        cookie.rgb = SampleCookieCube(lightLoopContext, positionLS, GetCookieIndex(lightData));
        cookie.a   = 1;
    }
    else
    {
        // Perform orthographic or perspective projection.
        float  perspectiveZ = (lightType != GPULIGHTTYPE_PROJECTOR_BOX) ? positionLS.z : 1.0;
        float2 positionCS   = positionLS.xy / perspectiveZ;
        bool   isInBounds   = Max3(abs(positionCS.x), abs(positionCS.y), 1.0 - positionLS.z) <= 1.0;

        // Remap the texture coordinates from [-1, 1]^2 to [0, 1]^2.
        float2 positionNDC = positionCS * 0.5 + 0.5;

        // Manually clamp to border (black).
        cookie.rgb = SampleCookie2D(lightLoopContext, positionNDC, GetCookieIndex(lightData), false);
        cookie.a   = isInBounds ? 1 : 0;
    }

    return cookie;
}

// None of the outputs are premultiplied.
// distances = {d, d^2, 1/d, d_proj}, where d_proj = dot(lightToSample, lightData.forward).
void EvaluateLight_Punctual(LightLoopContext lightLoopContext, PositionInputs posInput,
                            LightData lightData, BakeLightingData bakeLightingData,
                            float3 N, float3 L, float3 lightToSample, float4 distances,
                            out float3 color, out float attenuation)
{
    float3 positionWS = posInput.positionWS;
    float  shadow     = 1.0;
    float  shadowMask = 1.0;

    color       = GetColor(lightData);
    attenuation = SmoothPunctualLightAttenuation(distances, GetInvSqrAttenuationRadius(lightData),
                                                 GetAngleScale(lightData), GetAngleOffset(lightData));

#if (SHADEROPTIONS_VOLUMETRIC_LIGHTING_PRESET != 0)
    float distVol = (GetLightType(lightData) == GPULIGHTTYPE_PROJECTOR_BOX) ? distances.w : distances.x;
    attenuation *= TransmittanceHomogeneousMedium(_GlobalExtinction, distVol);
#endif

    // Projector lights always have cookies, so we can perform clipping inside the if().
    [branch] if (GetCookieIndex(lightData) >= 0)
    {
        float4 cookie = EvaluateCookie_Punctual(lightLoopContext, lightData, lightToSample);

        color       *= cookie.rgb;
        attenuation *= cookie.a;
    }

#ifdef SHADOWS_SHADOWMASK
    // shadowMaskSelector.x is -1 if there is no shadow mask
    // Note that we override shadow value (in case we don't have any dynamic shadow)
    shadow = shadowMask = (GetShadowMaskSelector(lightData).x >= 0.0) ? dot(bakeLightingData.bakeShadowMask, GetShadowMaskSelector(lightData)) : 1.0;
#endif

    [branch] if (GetShadowIndex(lightData) >= 0)
    {
        // TODO: make projector lights cast shadows.
        float3 offset = float3(0.0, 0.0, 0.0); // GetShadowPosOffset(nDotL, normal);
        float4 L_dist = float4(L, distances.x);
        shadow = GetPunctualShadowAttenuation(lightLoopContext.shadowContext, positionWS + offset, N, GetShadowIndex(lightData), L_dist, posInput.positionSS);
#ifdef SHADOWS_SHADOWMASK
        // Note: Legacy Unity have two shadow mask mode. ShadowMask (ShadowMask contain static objects shadow and ShadowMap contain only dynamic objects shadow, final result is the minimun of both value)
        // and ShadowMask_Distance (ShadowMask contain static objects shadow and ShadowMap contain everything and is blend with ShadowMask based on distance (Global distance setup in QualitySettigns)).
        // HDRenderPipeline change this behavior. Only ShadowMask mode is supported but we support both blend with distance AND minimun of both value. Distance is control by light.
        // The following code do this.
        // The min handle the case of having only dynamic objects in the ShadowMap
        // The second case for blend with distance is handled with ShadowDimmer. ShadowDimmer is define manually and by shadowDistance by light.
        // With distance, ShadowDimmer become one and only the ShadowMask appear, we get the blend with distance behavior.
        shadow = GetDynamicShadowCasterOnly(lightData) ? min(shadowMask, shadow) : shadow;
        shadow = lerp(shadowMask, shadow, GetShadowDimmer(lightData));
#else
        shadow = lerp(1.0, shadow, GetShadowDimmer(lightData));
#endif
    }

    attenuation *= shadow;

}
