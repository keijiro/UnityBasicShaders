Shader "Custom/Opaque Line"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    struct v2f
    {
        float4 position : SV_POSITION;
    };
    
    half4 _Color;
    
    v2f vert (appdata_base v)
    {
        v2f o;
        o.position = mul (UNITY_MATRIX_MVP, v.vertex);
        return o;
    }
    
    half4 frag (v2f i) : COLOR
    {
        return _Color;
    }

    ENDCG

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            ENDCG
        }
    } 
    FallBack "Diffuse"
}
