Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B839C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=; b=HcjaZmXcyuVFfTqw/VDJfoN2Lv
	0r/uWdrwqAlvbH4NmkuS+uIRcoiLf0lGaucHRHWVtAEWUazyAyZkvaN1Om+fCnKM12aq9MTLKUbwL
	9EFUN92AnbeeQYC7/5oCSKhDq0H/rTQlRAcPByrGrLxYyUNApdO6FG2FHiUwXdBzY/x3EEx151v7s
	8PaamiibIGXhVxZuX2wGI+gHAJxrEpMHK9d8mj41zlBvZ4tGwQ70N5g11Y5e3cPbHh5Xel6y/HOLQ
	w9D0UHNMvUt9xwwlS3Bt3ikN/666NahA4QdGbGcAfj7zf8o0ow3kN2itVa0Hgg/Y3FWH/ifSxXhF1
	C2u2jDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5WU-0000000F1Me-2zT4;
	Tue, 07 Jul 2026 13:07:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5WS-0000000F1M2-0oCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:07:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tr23542181
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 13:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=; b=L7lEwIfhmrJlWiNo
	1bnUAJMzW/LSGvniuGqYWeTH+CRlhdbiiwMOfmYghtgPHbaud1U60yXSpGBgrTwO
	+zJywcpSoeIQxfF7kb1NPliFdM9z663U9mRl0bVJ2M09b2R0l5K71RhzBOHZ8F/a
	AjKXzUTkpg9zq28puAcPT6U5NkZg/h8HOs8/B6Akgo8FvAqDrueyHe++jUNJAt5z
	SLHVNsNV/IniHraf8Q6Qk/Lv/V4WxvEx5pL7TGLWjd2eclnwa1kGiFhgEozYs3xx
	c+6yrUu2RwKh6refVw23EN5lrymswM2TSZcA3q0OOQw9tiMO9OmI0uYxhNkknl2z
	a3T8Xg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su722sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 13:07:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738d9935e23so498402137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783429654; x=1784034454; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=DXTAaShMgyRByXJJ25dj9qBnDs0cnRkL1nalc9BaNN8/q4KPPLDlZkVJvskMij5xCi
         vDyuvNkDyPL6kzkjdnwtrSnOm9qpQd1q3QCQi97g0fjsIORxu3ur+ZxxXhZ2+ntEyZ7X
         vFnSrEtojRniunqZ+P+yRYKOLKDeA6rR60H7UzRM/NLShvAaYEruGVABgQVqoOZqMkAX
         kf7YQ4PVWPCBVrJ3y1b1Yz1xYUw1pldLYpsx7zUtWHkaArHvSk/D7I/qtmlsKHZ9+PCK
         1vXe9DVaPJTQ76WoaPCW3b7roO2fGdNbM3m+c55MmqUXE3b7G5Er7NTgjzg/ftjU5l0a
         1Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429654; x=1784034454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=GQ+hKAG26mllFh+YIvxHFl/aShyIok74qa2uFMTmyR/0IVMrrReDUR0IrAPK7lxI/s
         K7arVqND1WAmUWE+8Isc9ZwHOGuNjxr8rnaji9670FafCkrFfPzJ2RWJaRWkibY2e5YI
         4GUv2vZnFiCTfa5Z2SghRwGn8g6TsxfLbfa6x9Goer0Bdeu8YLdxtttcR6Gr9tbu8apT
         ZAh8i+AViHuTFo0p1+nwjqIK0nnxFQR57KnjoTyz4/M5QoQLqixlAOkSNR2pBkN91XlM
         gyOm3k0s2CT5YUkPmWE+6PseN91le1NH8HlRhaaROmXQgfKb1Gv50k7t2mbbZK8XiKOX
         6gdw==
X-Forwarded-Encrypted: i=1; AHgh+RoLlnbmXcfTzrLvvjfi2BetZSh/DbS/ku2SPhs8BacsJmDpnE93QFRoRz8XLf117/w4Rwhzt96XKsdnJdMoiCSN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb6RUDWq1mj7QuoIAbD57i8xvEr8kcNQYTCuybI1UOkHc5L180
	t1SKn4r1YeEH1oaY6IIM/efb/LaQmgw0zFv2tM1zIauJXfcyfrkxV841t3rGTbJYqIlaPF5BY1X
	9/ZSaI2EUGhrfaIKQpgPBZvqoT0DHCx9f3N0r4j+EVKEvlCw3bN7a/zAbWc9AO3qAFGBMlfjy3z
	uGEA==
X-Gm-Gg: AfdE7cmsx65aZQmftQp0TMR/sT2C8mW8jcqWYYALs5TlstxIXTjDI6WJ8ihVhz+JQf5
	W+XsOHvx4Ou1NI8iVeNRQ+BwGFyUiF+6RqicxafCAwmkBwUFDRtjvemIAxPhrC5PLrkHas60req
	0IRY9v1MXJUizsbdCCkkxVGh+vjT4mGdxAeYnQHlPMsW8vBBwbQkOhO6ILsNYBuYR7Z9w7re/6n
	X4a1xfTbqQ70Jjkcy4s9ldgYQz6Z4M476Hx+9oGK6FJ3x8xhx72xHt+HHtm5AUzu8djEtOrsxXc
	taf7hwYi2fnqjHsAoYxY62uQIDZb8VnE8ISwKdnGhZyzC7ukBAc+osglrJAGZ57ThSFeGC/ey5t
	8cTyNnNdRYcI59Hkj5AhFn/0nLoPdoVpRCzKO+rM=
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2502995137.24.1783429654270;
        Tue, 07 Jul 2026 06:07:34 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2502943137.24.1783429653657;
        Tue, 07 Jul 2026 06:07:33 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm3703700e87.32.2026.07.07.06.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:07:32 -0700 (PDT)
Message-ID: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:37:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfX4ZVo/RkKyu6H
 63lfUVpor8xp3oMGuAVLvWD0ewbzhkG8kZXIsDtOpSDMjRKQvYIVE2PJlv9i/FTb9ZffQbC/DL4
 x6XGa63xDFSuu+gpmZjP1BNk/jBuGzptIyvdO+I9gBfOTKVtCMfBVvnBdPingay6gGkOpWowxt2
 uiOVnWU9m2jCnnltskO4X9GDwUFIJAuqxPeBW4qoT5maL11Ry1jJriBo7bbujBNULnERoaiWHCZ
 2cJ2uZCox5MF6K5Nu8hX7nd7/Y6urUhZZlXI4Q1hALvRO0YPILm+BEb2RvGLLraPwVkejexUZjU
 Bb7ysXUkQOLOXk4Bxco7fz3OcLfH+jzbZB/USzR+FLqWzq4q0zOz06Lk0swoTG+kUCBNA73OgP+
 dBim42r6eQ1yGKGh08Qc1IT6TsfTzVQPy7ez0Gh4YZTJrO+9WP8OSH6fF/DgcyKE4k2N0vtkdYS
 8ENVRhXTv+iaGdWbi8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfX1WLxaGraBRKZ
 EzFidPEDiTk2gaaYamraIXMekBUR8oS4zhFiBJoA/oy78k+AeaPG4CJ9q+m+yXR1isUEJxf1zsR
 hSotZhUN2/CLgQrjcIOa5G/8Kbe3AkM=
X-Proofpoint-GUID: -WgK8fX2gw5scLbTfzArNWQ8NaSKwjwP
X-Proofpoint-ORIG-GUID: -WgK8fX2gw5scLbTfzArNWQ8NaSKwjwP
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cfa17 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-8xGkPWzXzLllqT0I9MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_060736_243849_68FEFD17 
X-CRM114-Status: GOOD (  19.53  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 90e50c245c0c..721526f023dd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> 
> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and

Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
preventing gem_noc going to sleep when icc_set_bw is being called.

> then drop the extra suspend/resume play?

Not sure if I understood it correctly.
Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
or in arm_smmu_device_shutdown() path?

Thanks & regards,
Bibek

> 
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 


