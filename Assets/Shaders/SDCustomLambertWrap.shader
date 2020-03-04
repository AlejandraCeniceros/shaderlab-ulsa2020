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

            half4 LightingLambertWrap(SurfaceOutput s, half3 lightDir. half atten)
            {
                half NdotL = dot(s.Normal, lightDir);
                half diff = NdotL * 0.5 + 0.5;
                half4 = c;
                c.rgb = c.Albedo * _LightColor0.rgb * diffwrap * atten;
                c.a = s.Alpha;
                return c;
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