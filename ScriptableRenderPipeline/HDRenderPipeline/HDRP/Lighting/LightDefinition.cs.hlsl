//
// This file was automatically generated. Please don't edit by hand.
//

#ifndef LIGHTDEFINITION_CS_HLSL
#define LIGHTDEFINITION_CS_HLSL
//
// UnityEngine.Experimental.Rendering.HDPipeline.GPULightType:  static fields
//
#define GPULIGHTTYPE_DIRECTIONAL (0)
#define GPULIGHTTYPE_POINT (1)
#define GPULIGHTTYPE_SPOT (2)
#define GPULIGHTTYPE_PROJECTOR_PYRAMID (3)
#define GPULIGHTTYPE_PROJECTOR_BOX (4)
#define GPULIGHTTYPE_LINE (5)
#define GPULIGHTTYPE_RECTANGLE (6)

//
// UnityEngine.Experimental.Rendering.HDPipeline.GPUImageBasedLightingType:  static fields
//
#define GPUIMAGEBASEDLIGHTINGTYPE_REFLECTION (0)
#define GPUIMAGEBASEDLIGHTINGTYPE_REFRACTION (1)

//
// UnityEngine.Experimental.Rendering.HDPipeline.EnvShapeType:  static fields
//
#define ENVSHAPETYPE_NONE (0)
#define ENVSHAPETYPE_BOX (1)
#define ENVSHAPETYPE_SPHERE (2)
#define ENVSHAPETYPE_SKY (3)

//
// UnityEngine.Experimental.Rendering.HDPipeline.EnvConstants:  static fields
//
#define ENVCONSTANTS_SPEC_CUBE_LOD_STEP (6)

//
// UnityEngine.Experimental.Rendering.HDPipeline.EnvCacheType:  static fields
//
#define ENVCACHETYPE_TEXTURE2D (0)
#define ENVCACHETYPE_CUBEMAP (1)

//
// UnityEngine.Experimental.Rendering.HDPipeline.StencilLightingUsage:  static fields
//
#define STENCILLIGHTINGUSAGE_NO_LIGHTING (0)
#define STENCILLIGHTINGUSAGE_SPLIT_LIGHTING (1)
#define STENCILLIGHTINGUSAGE_REGULAR_LIGHTING (2)

// Generated from UnityEngine.Experimental.Rendering.HDPipeline.DirectionalLightData
// PackingRules = AtomicElement
struct DirectionalLightData
{
    float positionWSX;
    float positionWSY;
    float positionWSZ;

    int tileCookie;

    float colorX;
    float colorY;
    float colorZ;

    int shadowIndex;

    float forwardX;
    float forwardY;
    float forwardZ;

    int cookieIndex;

    float rightX;
    float rightY;
    float rightZ;

    float specularScale;

    float upX;
    float upY;
    float upZ;

    float diffuseScale;

    float fadeDistanceScaleAndBiasX;
    float fadeDistanceScaleAndBiasY;

    float unused0;

    int dynamicShadowCasterOnly;

    float shadowMaskSelectorX;
    float shadowMaskSelectorY;
    float shadowMaskSelectorZ;
    float shadowMaskSelectorW;

};

// Generated from UnityEngine.Experimental.Rendering.HDPipeline.LightData
// PackingRules = AtomicElement
struct LightData
{
    float positionWSX;
    float positionWSY;
    float positionWSZ;

    float invSqrAttenuationRadius;

    float colorX;
    float colorY;
    float colorZ;

    int shadowIndex;

    float forwardX;
    float forwardY;
    float forwardZ;

    int cookieIndex;

    float rightX;
    float rightY;
    float rightZ;

    float specularScale;

    float upX;
    float upY;
    float upZ;

    float diffuseScale;

    float angleScale;

    float angleOffset;

    float shadowDimmer;

    int dynamicShadowCasterOnly;

    float shadowMaskSelectorX;
    float shadowMaskSelectorY;
    float shadowMaskSelectorZ;
    float shadowMaskSelectorW;

    float sizeX;
    float sizeY;

    int lightType;

    float minRoughness;

};

// Generated from UnityEngine.Experimental.Rendering.HDPipeline.EnvLightData
// PackingRules = AtomicElement
struct EnvLightData
{
    float capturePositionWSX;
    float capturePositionWSY;
    float capturePositionWSZ;

    int influenceShapeType;

    float proxyExtentsX;
    float proxyExtentsY;
    float proxyExtentsZ;

    float minProjectionDistance;

    float proxyPositionWSX;
    float proxyPositionWSY;
    float proxyPositionWSZ;

    float proxyForwardX;
    float proxyForwardY;
    float proxyForwardZ;

    float proxyUpX;
    float proxyUpY;
    float proxyUpZ;

    float proxyRightX;
    float proxyRightY;
    float proxyRightZ;

    float influencePositionWSX;
    float influencePositionWSY;
    float influencePositionWSZ;

    float influenceForwardX;
    float influenceForwardY;
    float influenceForwardZ;

    float influenceUpX;
    float influenceUpY;
    float influenceUpZ;

    float influenceRightX;
    float influenceRightY;
    float influenceRightZ;

    float influenceExtentsX;
    float influenceExtentsY;
    float influenceExtentsZ;

    float unused00;

    float blendDistancePositiveX;
    float blendDistancePositiveY;
    float blendDistancePositiveZ;

    float blendDistanceNegativeX;
    float blendDistanceNegativeY;
    float blendDistanceNegativeZ;

    float blendNormalDistancePositiveX;
    float blendNormalDistancePositiveY;
    float blendNormalDistancePositiveZ;

    float blendNormalDistanceNegativeX;
    float blendNormalDistanceNegativeY;
    float blendNormalDistanceNegativeZ;

    float boxSideFadePositiveX;
    float boxSideFadePositiveY;
    float boxSideFadePositiveZ;

    float boxSideFadeNegativeX;
    float boxSideFadeNegativeY;
    float boxSideFadeNegativeZ;

    float dimmer;

    float unused01;

    float sampleDirectionDiscardWSX;
    float sampleDirectionDiscardWSY;
    float sampleDirectionDiscardWSZ;

    int envIndex;

};

//
// Accessors for UnityEngine.Experimental.Rendering.HDPipeline.DirectionalLightData
//
float3 GetPositionWS(DirectionalLightData value)
{
	return float3(value.positionWSX, value.positionWSY, value.positionWSZ);
}
int GetTileCookie(DirectionalLightData value)
{
	return value.tileCookie;
}
float3 GetColor(DirectionalLightData value)
{
	return float3(value.colorX, value.colorY, value.colorZ);
}
int GetShadowIndex(DirectionalLightData value)
{
	return value.shadowIndex;
}
float3 GetForward(DirectionalLightData value)
{
	return float3(value.forwardX, value.forwardY, value.forwardZ);
}
int GetCookieIndex(DirectionalLightData value)
{
	return value.cookieIndex;
}
float3 GetRight(DirectionalLightData value)
{
	return float3(value.rightX, value.rightY, value.rightZ);
}
float GetSpecularScale(DirectionalLightData value)
{
	return value.specularScale;
}
float3 GetUp(DirectionalLightData value)
{
	return float3(value.upX, value.upY, value.upZ);
}
float GetDiffuseScale(DirectionalLightData value)
{
	return value.diffuseScale;
}
float2 GetFadeDistanceScaleAndBias(DirectionalLightData value)
{
	return float2(value.fadeDistanceScaleAndBiasX, value.fadeDistanceScaleAndBiasY);
}
float GetUnused0(DirectionalLightData value)
{
	return value.unused0;
}
int GetDynamicShadowCasterOnly(DirectionalLightData value)
{
	return value.dynamicShadowCasterOnly;
}
float4 GetShadowMaskSelector(DirectionalLightData value)
{
	return float4(value.shadowMaskSelectorX, value.shadowMaskSelectorY, value.shadowMaskSelectorZ, value.shadowMaskSelectorW);
}

//
// Accessors for UnityEngine.Experimental.Rendering.HDPipeline.LightData
//
float3 GetPositionWS(LightData value)
{
	return float3(value.positionWSX, value.positionWSY, value.positionWSZ);
}
float GetInvSqrAttenuationRadius(LightData value)
{
	return value.invSqrAttenuationRadius;
}
float3 GetColor(LightData value)
{
	return float3(value.colorX, value.colorY, value.colorZ);
}
int GetShadowIndex(LightData value)
{
	return value.shadowIndex;
}
float3 GetForward(LightData value)
{
	return float3(value.forwardX, value.forwardY, value.forwardZ);
}
int GetCookieIndex(LightData value)
{
	return value.cookieIndex;
}
float3 GetRight(LightData value)
{
	return float3(value.rightX, value.rightY, value.rightZ);
}
float GetSpecularScale(LightData value)
{
	return value.specularScale;
}
float3 GetUp(LightData value)
{
	return float3(value.upX, value.upY, value.upZ);
}
float GetDiffuseScale(LightData value)
{
	return value.diffuseScale;
}
float GetAngleScale(LightData value)
{
	return value.angleScale;
}
float GetAngleOffset(LightData value)
{
	return value.angleOffset;
}
float GetShadowDimmer(LightData value)
{
	return value.shadowDimmer;
}
int GetDynamicShadowCasterOnly(LightData value)
{
	return value.dynamicShadowCasterOnly;
}
float4 GetShadowMaskSelector(LightData value)
{
	return float4(value.shadowMaskSelectorX, value.shadowMaskSelectorY, value.shadowMaskSelectorZ, value.shadowMaskSelectorW);
}
float2 GetSize(LightData value)
{
	return float2(value.sizeX, value.sizeY);
}
int GetLightType(LightData value)
{
	return value.lightType;
}
float GetMinRoughness(LightData value)
{
	return value.minRoughness;
}

//
// Accessors for UnityEngine.Experimental.Rendering.HDPipeline.EnvLightData
//
float3 GetCapturePositionWS(EnvLightData value)
{
	return float3(value.capturePositionWSX, value.capturePositionWSY, value.capturePositionWSZ);
}
int GetInfluenceShapeType(EnvLightData value)
{
	return value.influenceShapeType;
}
float3 GetProxyExtents(EnvLightData value)
{
	return float3(value.proxyExtentsX, value.proxyExtentsY, value.proxyExtentsZ);
}
float GetMinProjectionDistance(EnvLightData value)
{
	return value.minProjectionDistance;
}
float3 GetProxyPositionWS(EnvLightData value)
{
	return float3(value.proxyPositionWSX, value.proxyPositionWSY, value.proxyPositionWSZ);
}
float3 GetProxyForward(EnvLightData value)
{
	return float3(value.proxyForwardX, value.proxyForwardY, value.proxyForwardZ);
}
float3 GetProxyUp(EnvLightData value)
{
	return float3(value.proxyUpX, value.proxyUpY, value.proxyUpZ);
}
float3 GetProxyRight(EnvLightData value)
{
	return float3(value.proxyRightX, value.proxyRightY, value.proxyRightZ);
}
float3 GetInfluencePositionWS(EnvLightData value)
{
	return float3(value.influencePositionWSX, value.influencePositionWSY, value.influencePositionWSZ);
}
float3 GetInfluenceForward(EnvLightData value)
{
	return float3(value.influenceForwardX, value.influenceForwardY, value.influenceForwardZ);
}
float3 GetInfluenceUp(EnvLightData value)
{
	return float3(value.influenceUpX, value.influenceUpY, value.influenceUpZ);
}
float3 GetInfluenceRight(EnvLightData value)
{
	return float3(value.influenceRightX, value.influenceRightY, value.influenceRightZ);
}
float3 GetInfluenceExtents(EnvLightData value)
{
	return float3(value.influenceExtentsX, value.influenceExtentsY, value.influenceExtentsZ);
}
float GetUnused00(EnvLightData value)
{
	return value.unused00;
}
float3 GetBlendDistancePositive(EnvLightData value)
{
	return float3(value.blendDistancePositiveX, value.blendDistancePositiveY, value.blendDistancePositiveZ);
}
float3 GetBlendDistanceNegative(EnvLightData value)
{
	return float3(value.blendDistanceNegativeX, value.blendDistanceNegativeY, value.blendDistanceNegativeZ);
}
float3 GetBlendNormalDistancePositive(EnvLightData value)
{
	return float3(value.blendNormalDistancePositiveX, value.blendNormalDistancePositiveY, value.blendNormalDistancePositiveZ);
}
float3 GetBlendNormalDistanceNegative(EnvLightData value)
{
	return float3(value.blendNormalDistanceNegativeX, value.blendNormalDistanceNegativeY, value.blendNormalDistanceNegativeZ);
}
float3 GetBoxSideFadePositive(EnvLightData value)
{
	return float3(value.boxSideFadePositiveX, value.boxSideFadePositiveY, value.boxSideFadePositiveZ);
}
float3 GetBoxSideFadeNegative(EnvLightData value)
{
	return float3(value.boxSideFadeNegativeX, value.boxSideFadeNegativeY, value.boxSideFadeNegativeZ);
}
float GetDimmer(EnvLightData value)
{
	return value.dimmer;
}
float GetUnused01(EnvLightData value)
{
	return value.unused01;
}
float3 GetSampleDirectionDiscardWS(EnvLightData value)
{
	return float3(value.sampleDirectionDiscardWSX, value.sampleDirectionDiscardWSY, value.sampleDirectionDiscardWSZ);
}
int GetEnvIndex(EnvLightData value)
{
	return value.envIndex;
}


#endif
#include "LightDefinition.cs.custom.hlsl"