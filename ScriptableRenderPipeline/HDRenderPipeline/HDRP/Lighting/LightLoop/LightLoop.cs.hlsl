//
// This file was automatically generated. Please don't edit by hand.
//

#ifndef LIGHTLOOP_CS_HLSL
#define LIGHTLOOP_CS_HLSL
//
// UnityEngine.Experimental.Rendering.HDPipeline.LightVolumeType:  static fields
//
#define LIGHTVOLUMETYPE_CONE (0)
#define LIGHTVOLUMETYPE_SPHERE (1)
#define LIGHTVOLUMETYPE_BOX (2)
#define LIGHTVOLUMETYPE_COUNT (3)

//
// UnityEngine.Experimental.Rendering.HDPipeline.LightCategory:  static fields
//
#define LIGHTCATEGORY_PUNCTUAL (0)
#define LIGHTCATEGORY_AREA (1)
#define LIGHTCATEGORY_ENV (2)
#define LIGHTCATEGORY_COUNT (3)

//
// UnityEngine.Experimental.Rendering.HDPipeline.LightFeatureFlags:  static fields
//
#define LIGHTFEATUREFLAGS_PUNCTUAL (4096)
#define LIGHTFEATUREFLAGS_AREA (8192)
#define LIGHTFEATUREFLAGS_DIRECTIONAL (16384)
#define LIGHTFEATUREFLAGS_ENV (32768)
#define LIGHTFEATUREFLAGS_SKY (65536)
#define LIGHTFEATUREFLAGS_SSREFRACTION (131072)
#define LIGHTFEATUREFLAGS_SSREFLECTION (262144)

//
// UnityEngine.Experimental.Rendering.HDPipeline.LightDefinitions:  static fields
//
#define MAX_NR_BIG_TILE_LIGHTS_PLUS_ONE (512)
#define VIEWPORT_SCALE_Z (1)
#define USE_LEFT_HAND_CAMERA_SPACE (1)
#define TILE_SIZE_FPTL (16)
#define TILE_SIZE_CLUSTERED (32)
#define NUM_FEATURE_VARIANTS (27)
#define LIGHT_FEATURE_MASK_FLAGS (16773120)
#define LIGHT_FEATURE_MASK_FLAGS_OPAQUE (16642048)
#define LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT (16510976)
#define MATERIAL_FEATURE_MASK_FLAGS (4095)

// Generated from UnityEngine.Experimental.Rendering.HDPipeline.SFiniteLightBound
// PackingRules = Exact
struct SFiniteLightBound
{
    float3 boxAxisX;
    float3 boxAxisY;
    float3 boxAxisZ;
    float3 center;
    float2 scaleXY;
    float radius;
};

// Generated from UnityEngine.Experimental.Rendering.HDPipeline.LightVolumeData
// PackingRules = Exact
struct LightVolumeData
{
    float3 lightPos;
    uint lightVolume;
    float3 lightAxisX;
    uint lightCategory;
    float3 lightAxisY;
    float radiusSq;
    float3 lightAxisZ;
    float cotan;
    float3 boxInnerDist;
    uint featureFlags;
    float3 boxInvRange;
    float unused2;
};


#endif
