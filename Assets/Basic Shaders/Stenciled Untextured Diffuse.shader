Shader "Stencil/Stenciled Untextured Diffuse"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Tags { "Queue"="Overlay+3" }
        Stencil { Ref 0 Comp Less }

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
}
