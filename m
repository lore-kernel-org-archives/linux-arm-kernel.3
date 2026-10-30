Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93158606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7gY8Zrh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tjw7LyIU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duhi1T1C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=; b=J7gY8Zrh9aL9A5
	tFdVqPbKZyjAQIFVvugpjsasGrCtkSeCZ40xi85qNKGi5k/P+9rsicVrp+wPfRQsjwI/Bqxz2G8Un
	R7U6ECuhpHH8yl0sZyUtVoQLtHfgjDxt0040valYsMHZOIUKlbsFW0kMOIesry81EX07rfb3TDQDy
	L5PbnEi43Gi24Tk2zwBTaisikt1OymMT41fEYi+0GtRVF8tJIdPLMWjze2pVzBhMRK4VittS3k1YS
	wNzpWjTzx2jkQNR8R929/X4IK3xQXs6ZAv6pah0h+giL0HWIlI5wkBIvkCTDtauv62i9t4Ng19P78
	VF4Mw3MdvFpiPTxHLO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmN2-0000000BjnJ-1oK7;
	Fri, 30 Oct 2026 13:10:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmMz-0000000BjmV-2oQS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:10:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG19g2071543
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=; b=Tjw7LyIUXUz7kTQZ
	nHbzHNDytvKwXF7h6fO5R0T7IGPnebTHUPziPf71DnEPsGCP2xg9JiDcZ1BPoF90
	ZFknm9PD/jcRLyWOM9Bn7r2tH5j/hZ7yciCwnxuOnWzEWRVCQiWBIuqkuDN6liSm
	XcRVQZHfLXOydwZa0+rGTK4AalyAr4Ru73e7YYqk4ui4CsnextGljDS09InSXzEF
	frM17HOq+y6Fnki1ziT8eLNBb3LcOZaEafigxUN9sUEI7OZYOqkgwm4XsGDdspzz
	2Qh7ecy6OODRietSmf6tl9TMvx8gHcAinVyJJJox+NZEiitxIZTC7HWS9oQ9qPOE
	msN7aA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p36n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:10:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so3718785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365808; x=1793970608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=duhi1T1CNJ98q2mzfdONXmq8cUQwFq/icsOTQAvMHkNVf6CpcPeZ5IyCoMkjw8Y7ZD
         +9bcr+QYbwG7ARgXui4aEgZFOf43pfVbSsAFb8guGOUhVtU65SdtNTfJ/XpEjFdefq2Z
         sycdfO7urIU+6ZUCEjYT1cAPj/yFbSnW9N7JzGH7tNJDdUgFR2LntRrVbVqZ3d2x8ljM
         1SBVp/0tpVlc3tFhKg3qgZ3QCigQ+BlwRR+xGr5CrR8Dv+yjQIfJO8DReh9TVFkJ7o5v
         /ukOi617NZ4a35bfT3PdkBLm5PdUfMgi+jCxk2iFON+N+dzz0MOVGBZ44DeC0WJa75cC
         P/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365808; x=1793970608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=zNPgg9LtpJOJcNCWqu31JlgV8Y+DqIdyiT+gtNwPHi5auEjXvtEpjxxp8uepVpmrE3
         8UIE/syCyAcAvj5nFu1ZXw9j3RrVQCnlo5Y9XIhNJKfI3VTmIjGJYxNG6P0X/efIwa+M
         ZqciWm+SLDpavMnJ5pCdpEOo9qriYx1nVGIh8dhsdNNN5RKz377lEwrYWbe5PEQ3XDkJ
         0ghbgqClPPiGnU2YsXN0XKLLnEDwGIrW6AWjgIP6mJlKwtWOiPl+/S3eUWPmFL4/0QSd
         8+mlPyU35RF21kZoH4Iowd0kSQtZHhn7as/GkW0Es/Hj9UmuZiR+pmj7QsACb+HDc7Fw
         W9yw==
X-Forwarded-Encrypted: i=1; AKwUvBz0+dkiXv8GzNPb5XiWLVc9p7Y5ijxyCagK/7Apy1uBbXSLYGDeOC44TX8h6B/8PZ17fsG8Gpb2s6cDBWN/h78R@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4/Ct54GwWQm2ZBxTutd/ww1CIhMwGG5QnPqFs5liE/4SGy/WM
	Zz2i/ZtYvHBL1BnBVoF3M92z9po6UMX0bL6vP2BNBpcyYWeB6xYjbUnErFd06/7BVnTi0c2lYWN
	ar28ruwzcWV5Vp7qPl4YXLr6obJtoRtbaQEQMwLkJsTawnsQGLt6lrMWZ3QB6gk2/rerK2dYAuh
	T+lw==
X-Gm-Gg: AYBFou2JjwANut5yqru3YHrTFS4qS8DT+Hwz5MMz2iGhZGrmNbe4gJmKfnX8JrliKUl
	vfJcm0vHTU2urGmYoHpRX2OGridTvYGWPtQ181Lf+Yo/3MKko016J9kXBSgkJL1QnJ07B//9QUf
	qu8nwInhfWrVp6qAXhHSXngE2L6/wy4H6ZieXJ62fxcPEwZDkVNvpMVStmr/DXgyPF9wHiOwDtp
	aa69n6MW27dcTUWM+bzNiwI1YTEGM8+vthiuz53Gtdr9buVlhosmL+Nw8Jrkq5nCiz55TAxFiGU
	E6SSonV+Qe02FCV3AB4Z50+B37ehlBSrST9MvPNp8S2MHq/1M+ASpvQ2yXV0WfSGRDoUG32h778
	b7bCgYPCZ1iw9iB5UsPL4ajOikR0TQNqHUv+UkHM6TD4/E/Md7UVhhU6WmCMqrfiExrgtijc=
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392367485a.5.1793365807970;
        Fri, 30 Oct 2026 06:10:07 -0700 (PDT)
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392359485a.5.1793365807359;
        Fri, 30 Oct 2026 06:10:07 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm65887066b.4.2026.10.30.06.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:10:05 -0700 (PDT)
Message-ID: <4f6e1534-5105-4a4a-83e6-4b2b846b67f9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:10:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX6vjkkkL7dcMN
 7OzN3H8KkJ6R6IxYk0Xjo7aNB9ILUl+3v6jZRBtj4nWMqduYbZT9UINiCnC/c+rf0SELLk6uSwQ
 39z3BjBOQe4KoGAawBLUXJjamoZK0+hj2FWAQPQXY9HOF81FlwAdL8GvcZTV2wJbeisGgcmQwVU
 erO/KEcZcwsCBxc6YdSlj3P4hF40p6Yt0I659+0G4Tw13XnMAkLcFxrZmBbiVBKjIZHWD/CPRDw
 S3SWkEFdJkJdPPtbtFKlZGPjHs6MQalisVPoB4eCqmSytke1M+tcHZSLohMmlDdzP/s4HM/GKE/
 PjE6h0IoU7M/uCXM3Sp4xoDeIspMg1bkGLH7bRDBr5EfxDOumtdgj62SiAYOyQlCC4pDs13HpTV
 FFGl6yQUxyTptr2RofvokxcZcWtB/NUJqjv1jQtnEfaMu8zzoi3BlVy3nunG104N9xVwhtP8Z4f
 8NgiWOSf1ChXPHaeJsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX6uX515fq0jZO
 tyDAyOdebot8jTQynOPgh68KRtnifOtzgTDHxehYCA7ZLbYEglPTI/Me86jJwjEVTwxdGhR1vyK
 i5hYanaDMIQPtg16iMcylMqDyYRtiVg=
X-Proofpoint-ORIG-GUID: J9mi0Q1fovirmbVgFTjRdeG8uH1L8Mw2
X-Proofpoint-GUID: J9mi0Q1fovirmbVgFTjRdeG8uH1L8Mw2
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae49730 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=7uVtGDAPqmP0Npu4MUQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_061009_829339_2BB4844E 
X-CRM114-Status: GOOD (  21.74  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..f47d1dbd06da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> -			iommus = <&adreno_smmu 0 0x0>,
> -				 <&adreno_smmu 1 0x0>;
> +			iommus = <&adreno_smmu 0 0x0>;
>  
>  			operating-points-v2 = <&gpu_opp_table>;
>  
> @@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
>  
>  			status = "disabled";
>  
> +			lpac: lpac {
> +				compatible = "qcom,lpac";

I'm debating what to do with the compatible here.. On one hand they
shouldn't be generic (should be soc hw specific instead, but that
feels a little overkill here) and it may be that we even don't need
one, but the iommu driver needs to know what we need a 1:1 mapping
hmm..

Konrad

> +
> +				iommus = <&adreno_smmu 1 0x0>;
> +			};
> +
>  			gpu_zap_shader: zap-shader {
>  				memory-region = <&gpu_micro_code_mem>;
>  			};
> 

