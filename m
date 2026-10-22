Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpWp9qzr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3bA9Cc2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FufhEsFt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=; b=hpWp9qzrEeTGeo
	QQkaNw1hAmUrOqq7/zVOVGocbK1fZ9+AATdS2Oy2WhpHMXAwPFqeqi0JEYLymA4zjUuXVYqpLvw/X
	llp2qEP6mOik+c/Mw5n/LqwLi1Cp1zSYtRKbkMXbIaEj1eHZPi2vZMoqh5XSS8VI3ugzagWHHEMeO
	89oHj42JRaez5tAU4q51Kp/zUpRJsvmXFRyD+3c/BPidvLY+9vInED2DQ9v8z6JqZRmznop/KL+BH
	rnjnHTER4N/+3XyIpz+0Iae8i5eeiT+6Y8UGgBTVMGBCktFe/wU8+o2bCKS4LQmtPzFANJPwmSewS
	Th+sVcRsJq8fBmH5XUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpoj-0000000Dumt-15nC;
	Thu, 22 Oct 2026 10:14:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpof-0000000DumY-49nh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:14:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xwSs1962204
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=; b=Z3bA9Cc2wmwHfcbQ
	2dXZkTATr0wGHFo6NBXCZxGGDR+EO27hkpzXtAfi2tenSKG7qqXfP0gFmIucLf0h
	MyV0ng3YBN7qFqtcX5HSJkPD4Gkg50I34Zy1kdL2L9x0DFBmYs+7NeWvwptxG3qQ
	yAdqJGbpRKRW/wIKfPUmrzCpsgeCHThUzyZLhf4oUb4ineHgE4IWt4B6Jy0/0G5K
	uhiuMvKSGt6uHG+i3HImzTZd60MTWbpm9kyoBXPRk8XwXLPnnranV9b8SxmAm8C0
	xpbj0Xe+3qsnDXGKJW/8OAkBQKqokJ+TXjOZgDkMuoiNhzS2TdTVNCCAZGG11sW4
	4oSdiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahxj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:14:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so50415985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664072; x=1793268872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=FufhEsFtrnjIu6+v4UkIDgs9rZVXnjP4H6ysB9S5FisiUyd9Dbqt8S9jFgH1ZeBhKK
         G1NntcwQDakv19MH9mEQoIw6/+o44aoHzjLbdO2uY0pZen5oNZ4jRWCFMincNX/e/FYt
         Ee4BmiEeBwJ9XUUvwe+kWoFreeForme2QnnkCdOx8I/AHPvQ0dEnfHYeE4+yigMFOWBT
         AVDpuFznzglcXqKJ1f9FfoMrawc16/nGkffuS/hS2jqsGOA40tXM+gQbJnWJ+iSzYIL2
         Stdo7pcW/0SnB1eTi/cpsHWKFNj5OsrUOevsxy169EI4spKvrhfBsbXImD7iPkh+aiwo
         sPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664072; x=1793268872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=Fi1n0X5DjObUlaS/0v+Fl2eoATFX7NNQmxF1BKRRvfJnZ0rYqIz/cv499JwHYjuk9C
         B2rqzhdBa2fEo9ZouAK0Z32F2LubBvXlLlmBwiULP5xXpXjWuGpoXXnSxDkP8ze56RM1
         GECbfmQTH6luFOhKk4Et0KD4ZTA0Kt+U2AGSVm7YAAH++Q5vit7JN5L5Gue6uv8Xi6Cq
         Kx1gZ/1bjRVa4aZFYy4ew+lQ/fNOit83Gq1QBhd4MgG1YyL/k8aay78+nWiMqnKN7uFi
         RAdlmAOEtxVU0e/tTYo8g+PmTaqed838bcz06+qBegERwJLvqQ2TGWBjuynKJhe+932n
         WnfA==
X-Gm-Message-State: AFq9FYIR+Y7z6ftrmHwlQl2neP77cdNrYAB3R5PRplcLWVn1Fz4Sww77
	dd6ZNAA0oCkEw1J2MX50D16H1PNi8H3fVifmU5ptmiD6vjCezvcLuAOZF5K81G02xrJo3kQ4YWC
	m2VGvU4PCVvUOZAPzAukmtJXEEBr3cUlRnYipxoT5izkY0mraJ/sfo64X8hAIg5VcTZJzu+5rq5
	5gAA==
X-Gm-Gg: AYBFou1HZ4A4HxaaQXVRoiNGlc8OZtyEUdNlLWSKzfzz/znvhvxncr62TSDQdp2LyY2
	huekY7F6vXR+Mkqjv65/f8A+wBatDk9QFRmVmwZAqrHT4BbcVVPYner7qW68tSECaYTzQiURo3c
	HMkpQomDKvNXvZ6R3wJlMVkkN2HrWXDVllFsYuvluMLkdOSYLbHGkziVueXtRoZ8QrcwJr1WqYf
	4egQx887bDl9fAMmWlTnLetqZAM7nEy0HJR7X8Qzd0MfS5kAVyyRPCB6Kks1vwMLoj648nwna0T
	UNolKsbHOxbYaYcTOsEnXoqPIuwtvzaLD1IYkJ72BC0FmdLbaMSltW1iIImFbUHXXviW2D88+z2
	o5y0OIh36ujtXahek5VrwRQ==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137720785a.6.1792664072277;
        Thu, 22 Oct 2026 03:14:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137717885a.6.1792664071871;
        Thu, 22 Oct 2026 03:14:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm89397066b.65.2026.10.22.03.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:14:30 -0700 (PDT)
Message-ID: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:14:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX7Lr3R9hWG9kz
 SA4o6D4ChZdb9C2RkeQYX7ciuFtd+JHyRD1H0QXbNiyODIC4LiNxzFw09E5EdTp40MbI8wjWxPg
 /8+w5uXUYBPRnydqua4bfRZ+YH7NBTXTJt8LxOODUwzToOF2kcrSGpj9OxAONNB7NXxiZ67QoKG
 tAArCOWxROn5b3UQS6Fg2oZmeJ0WLXsM+qcqw0rlmudqmCz6z6Xac2QXuFmv07RPMcOmajEJlyh
 +132bugUE1FsWGTq7Spnv8E/CurSQAkqofpzIpNE44Y+0O+4bJCkuYc7/Yq2N9cKkt5Cp+Nvrta
 jNCKaUO5BQvYdkX4EF5rmzO0Xa8Ah139ezVwmFIoZhSCy/n7wrmQXJhIP31MIYqau8bs7Mv1+tc
 OaKbDVihNTBMzV8wmsZWoRunUnfSfqIc0BMDsULt0toD+VQvXCAMRlbMQMb3fSZWAI/1hRcWTQ5
 /9VYvRxP2msi8EOOPRA==
X-Proofpoint-GUID: dEZ0WYmIytagDDVqZWIsb0A6eWMBRLhy
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9e209 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dEZ0WYmIytagDDVqZWIsb0A6eWMBRLhy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXyrumUpcLMOmr
 WCeMG4wvbtjEW0pDp8qID4NCCw9nQZXyT49CBvOo7WivrHiFoDgGc5BSCLs6anOGDqe54GWHehm
 iTckj63r3I5H91Z0R7wL/ZUXpAuc8o8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_031434_072224_9E6E074E 
X-CRM114-Status: GOOD (  18.20  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---


https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

and

https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

are in flight, you may want to integrate/test them locally!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

