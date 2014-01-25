Shader "Custom/Untextured Diffuse No Cull"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Cull off

        CGPROGRAM

        #pragma surface surf Lambert

        half4 _Color;

        struct Input
        {
            float dummy;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
            o.Alpha = _Color.a;
        }

        ENDCG
    } 
    FallBack "Diffuse"
}
