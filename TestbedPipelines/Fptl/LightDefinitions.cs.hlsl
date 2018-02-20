//
// This file was automatically generated. Please don't edit by hand.
//

#ifndef LIGHTDEFINITIONS_CS_HLSL
#define LIGHTDEFINITIONS_CS_HLSL
//
// LightDefinitions:  static fields
//
#define MAX_NR_LIGHTS_PER_CAMERA (1024)
#define MAX_NR_BIGTILE_LIGHTS_PLUSONE (512)
#define VIEWPORT_SCALE_Z (1)
#define TILE_SIZE_CLUSTERED (32)
#define USE_LEFTHAND_CAMERASPACE (0)
#define IS_CIRCULAR_SPOT_SHAPE (1)
#define HAS_COOKIE_TEXTURE (2)
#define IS_BOX_PROJECTED (4)
#define HAS_SHADOW (8)
#define MAX_TYPES (3)
#define SPOT_LIGHT (0)
#define SPHERE_LIGHT (1)
#define BOX_LIGHT (2)
#define DIRECTIONAL_LIGHT (3)
#define NR_LIGHT_MODELS (2)
#define DIRECT_LIGHT (0)
#define REFLECTION_LIGHT (1)

// Generated from SFiniteLightData
// PackingRules = Exact
struct SFiniteLightData
{
    float penumbra;
    int flags;
    uint lightType;
    uint lightModel;
    float3 lightPos;
    float lightIntensity;
    float3 lightAxisX;
    float recipRange;
    float3 lightAxisY;
    float radiusSq;
    float3 lightAxisZ;
    float cotan;
    float3 color;
    int sliceIndex;
    float3 boxInnerDist;
    float decodeExp;
    float3 boxInvRange;
    uint shadowLightIndex;
    float3 localCubeCapturePoint;
    float probeBlendDistance;
};

// Generated from SFiniteLightBound
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

// Generated from DirectionalLight
// PackingRules = Exact
struct DirectionalLight
{
    float3 color;
    float intensity;
    float3 lightAxisX;
    uint shadowLightIndex;
    float3 lightAxisY;
    float pad0;
    float3 lightAxisZ;
    float pad1;
};


#endif
