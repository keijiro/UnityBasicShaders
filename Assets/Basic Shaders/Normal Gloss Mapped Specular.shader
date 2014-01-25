Shader "Custom/Normal Gloss Mapped Specular"
{
    Properties
    {
        _Color ("Main Color", Color) = (1, 1, 1, 1)
        _SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1)
        _Shininess ("Shininess", Range (0.01, 1)) = 0.078125
        _Gloss ("Gloss", Range (0.0, 2.0)) = 1
        _MainTex ("Base Texture", 2D) = "white" {}
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _GlossMap ("Gloss Map", 2D) = "gloss" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        
        CGPROGRAM

        #pragma surface surf BlinnPhong

        fixed4 _Color;
        half _Shininess;
        half _Gloss;
        sampler2D _MainTex;
        sampler2D _BumpMap;
        sampler2D _GlossMap;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
            float2 uv_GlossMap;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
            o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
            o.Gloss = tex2D (_GlossMap, IN.uv_GlossMap).a * _Gloss;
            o.Specular = _Shininess;
        }

        ENDCG
    } 
    Fallback "Specular"
}
