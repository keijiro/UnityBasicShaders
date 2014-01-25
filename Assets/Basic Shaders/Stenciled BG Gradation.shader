Shader "Stencil/Stenciled BG Gradation"
{
    Properties
    {
        _Color1 ("Color 1", Color) = (1, 0, 0, 1)
        _Color2 ("Color 2", Color) = (0, 1, 0, 1)
    }

    CGINCLUDE

    #include "UnityCG.cginc"
    
    struct v2f
    {
        float4 position : SV_POSITION;
        half2 texcoord : TEXCOORD0;
    };
    
    half4 _Color1;
    half4 _Color2;
    
    v2f vert (appdata_base v)
    {
        v2f o;
        o.position = mul (UNITY_MATRIX_MVP, v.vertex);
        o.position.z = o.position.w;
        o.texcoord = v.texcoord;
        return o;
    }
    
    fixed4 frag (v2f i) : COLOR
    {
        return lerp (_Color1, _Color2, i.texcoord.y);
    }

    ENDCG

    SubShader
    {
        Tags { "Queue"="Overlay+2" }
        Pass
        {
            ZTest Always
            Stencil { Ref 0 Comp Less }
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
        }
    } 
}
