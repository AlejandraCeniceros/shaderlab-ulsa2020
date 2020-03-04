Shader "Custom/SDLambertWrap"
{
    Properties
    {
        [HDR] _RimColor("Rim Color", Color) = (1, 0, 0, 1)
        _RimPower("Rim Power", Range(0.0, 8.0)) = 1.0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM

            #pragma surface surf Lambert

            half4 LightingLambertWrap(SurfaceOutput s, hal3 lightDir. half atten)
            {
                half NdotL =dot(s.Normal, lightDir);
                half4 = c;
                c.rgb = c.Albedo * LightColor0.rgb * NdotL * atten;
                c.a = s.Alpha;
            }
                
            half4 _Albedo;
        
            struct Input
            {
                float2 uv_MainTex;
            };
            
            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo.rgb;
            }
            
        ENDCG
    }
}