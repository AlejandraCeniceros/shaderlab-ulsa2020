Shader "Custom/SDRimLight"
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

            #pragma surface surf CustomLambert

            //light model diffuse (lambert)

            half4 LightingCustomLambert(SurfaceOutput s, half3 lightDir, half atten)
            {
            half NdotL = dot (s.Normal, lightDir);
                half4 c;
                c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
                c.a = s.Alpha;
                return c;
            
            }

                
            half4 _Albedo;
            float _RimPower;

            struct Input
            {
                float3 viewDir;
            };
            
            void surf(Input IN, inout SurfaceOutput o)
            {
                float3 nVD = normalize(IN.viewDir);
                float3 NdotV = dot(nVD, o.Normal);
                half rim = 1 - saturate(NdotV);
                o.Emission = _RimColor.rgb * pow(rim, _RimPower);
            }
            
        ENDCG
    }
}