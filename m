Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09717C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=; b=gPLmcxW6Oumvahca99wVXQzfZv
	nJlGOp5VmFROp5x74D36t4Jf1A6tnp8ZS9nhSJp4hlyB0amThuPcSDiNoZQGQi+EFucifi8Y7LBp9
	vR0dKFJlA58+GgP2ATCCxVSceUT1+ZtZqb62IgMX0SdTcpJjIMTAEB2BCbuESNdDjozSS2a713Gs0
	/VYMFLoOG7rjLt1j9Mfc1Di8416ShMZVMB0tKYA6pYo9Zf+yv+EFPEpIYR9qxZYT8OUfRweAdeitF
	l3Q47pU3exdnaEa+68fYgLDNAnono8hfHjybhzNTW9Tq52odOvZy4tpU/RiL7wXmFNHjxj6PlVN1x
	hM4Amnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuT7-000000024Zw-1BhQ;
	Wed, 01 Jul 2026 12:55:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuT6-000000024ZN-2Swy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=; b=VmFMeYc+j+yQJUjocJLXKBep5C
	d4fDeCvnVde8PVtDXA7lHlwtdUHqivaNoKyG4UOjE5HIPS1rWvgOYVovA+9/9RK5BP2KNZ+HH3AcX
	1KNh5Ybm8qWDTkxWV59nLbnoVxq20X7q2YWNBJltmSVxQGH3rXa5zyVYMf5tF6QcL/ExTpwNr1Nag
	S71QgE8c1c/NqmIWY6HMyeFzKUSorQkx0pdd+gpS1C+5azT4maM/iduLEWrS/Bn9lR5KJJUdO2TbS
	PERr0rJ852lQZWtAOtNXuO1pIta6r9VMvT1e6ObYHam9cFWQ3xbJ7dn4EnGR7C7rYQAK8M8uF/ndB
	vW1YEGuw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuT3-00000002mln-2qkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:55:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A93iV753728
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=; b=MtSdEaD6slx+sUQx
	jGrKqq9oOpitSm3+7YllihpIWFsbms/IQtzHZpq0YzLf9l+yfGPclBHNT5MsT1XL
	lN+7julGIpxpbGGQo7NWrz4wsu59XWiamJsG7+6wupLbQNJTUlXE1xxvo8wOo/Sv
	DvxwW5ocUcHqJmAXGEXdc17uisw03Pg9MNmhZ5K7NpE0peghZkmrFVzPCUiVqUxx
	kh3tvH6bJ+pLCp4X3ldt5lRaHJxG7TzIT3aGhjmQ42+ooT6VR2TuJty2cYS6MkUu
	LBkUTNzNLGLq7avLyaVmFnyzwD0cEd22Tix9/5Vv4BxXzjM7AlTNwxsqpLtfdF4V
	cWeD7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2te2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 12:55:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a483ea41so788687b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782910500; x=1783515300; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=;
        b=giyrrdsDHnoiZdcr6CtO2Wrz2Ba9WGGaWuawbPGEBIzNvxoJ5GbkxJVAg4zdMceoAe
         3/MI1MJSWVBNSmjgwzxUKYs8QY/H2Yc2QqF1/l1Kqqvt3/wbdgJFNBTikvi+QdBr0rxt
         YY93KrC3K7btnYWWIv8orQpyKnYkOSg2KNO9czDIu3en/zmplVhf9XLy42RxwoWs9T7o
         ZTVIG5GQG/TRabR6fZ6HjTVLTbJky8zNunrp+RzhajWTCydao7DRvSiZqcgd5PrKJZgX
         tLXGEYjkReQu02jGBCJsi8QfuLYoheQz+TyCEJOaC/8C+PzIBYnqsCdyOkBfgExvHDAa
         srTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910500; x=1783515300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhlWz8cCtqL5ox7tNsxAOt2t1RqIW/0rkCL7ft+bkww=;
        b=ekpV4A4tWJ/Fl3Er+b4IdD+q6fSJOyZhVqYe5Qo+H1XX3lH5tHDZ7NgD2lUOoa184h
         w2LNBwYc7or8+yjfrtpVAh6Wvu46PXYTvVGRHZo2jPH0uN5/tFddpsNpWkKu3mmhp8WG
         Ricqpdo3eF8k7+4uEJW293FH+VfW4JQdo2VZRXZ8XNocZJNBVfw77NqVXRF/cL+kKRgH
         DYHwoj4M30eb4x/YejebPJhjE7Kxq4JuEneGsHQ4DHyUimjRDePH6Sfcb+WVf7XuZfUg
         JMdr81BBLxfIvs9c5M0hf0rZcdpsv77YnfwWGfyKZu8rOMSxkaEVUcH79bFmMBXQRkMt
         SGZg==
X-Forwarded-Encrypted: i=1; AHgh+Roh5vx1+a0xzlL/nn26NqVfxVyKOiM1kAitT1mApF7VTHvhLNL9jCx5uvPJ1s6C5iYY4m/YTpra0F+IK/yFpWXg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cFF21D4ZGLzvx/rB/9ia2Zs8VE8zcisJ9Pxpn5w6UOnUzzY3
	xyTXzeUriKgD7VijENKYxlfvxkACGu5Cq+efUyS5VC0E2jPYODgNIH6jgvc0WbavFcIFxfs8IpA
	pVEwJh+RNu+1fSjm6pEzGYnB/xpyVst/gdOS0T/8zm6/Uz3HbLYdpIKqTJWhfjvbDebnoWg5uPT
	EQTQ==
X-Gm-Gg: AfdE7cnxhlOiKMXUtICgr+6pZm5LfyLOZUhXWhmeEoQyM5RpoytRo22QbSFgdL/h43a
	U2yRlpxIUrD9uVsYynQEG04W5LVUjwz2e6sxQ3/kfI2YE2JvG6pcAwZfl7PFvDAsuru8xR3vSuL
	pys+g5e9nx6QCy2bglWRYVLYYYBfkh+roigEv6UxyyDGYjfJ1+VbzPOrI251S9ZsCIigp7mN5M2
	OvDTaEF3YTBmH0Ki9Qe3Cw4G29PXBQR7p4Gv1rrG+GXXr5093rzM8qo1whwZRy17kKMM0Xyaplc
	Ioq2tYQ3JAc8Bkt2eBhPj7A5bEWpw7P4MJJqSpHw9GbIYJBfBnFxwNpOwjjK81M+9S3VqIb2Keg
	sWUEFesMgGZDTxRC7JlJ2wtdOOo9qTe3R45TW4WZWNQ0wanTgfi/KKYIoIjv2Tos87JKXK6vsDW
	I=
X-Received: by 2002:aa7:9315:0:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847bf944a63mr1320512b3a.15.1782910499772;
        Wed, 01 Jul 2026 05:54:59 -0700 (PDT)
X-Received: by 2002:aa7:9315:0:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847bf944a63mr1320474b3a.15.1782910499241;
        Wed, 01 Jul 2026 05:54:59 -0700 (PDT)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cdfb7sm4008598b3a.39.2026.07.01.05.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:54:58 -0700 (PDT)
Message-ID: <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 20:54:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jvvJfu0MnG6YF-vJI59EG2SUs5EjQ6vl
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a450e24 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=i5S6TmXcA3_pwKZvcRIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfX3qp5/V4f5NIV
 fzKIixmFK4/zb/K6xO6KBnp6Y3KR0Q696VmKPUdLfaJnMyfDjla5jKl/Tms6gbAFKJSPW4q+QhC
 qIwopJVRmh2CznRTyTBgdO9yKR/Gs1MlmyawzzFQYeq6CdI98dFqtextym2wFEm3LXHWWOpA74e
 ZiCoOllLjduQwJrUuhRs9AsK5h1YUO713TO6qBpa8w2JTdIJwny1DcVSbIMmXCW1AxHE8Un60g+
 JPiWv23xTaQcd6ARRMfGGV4gZal7ap27jw3n142F8NvF+shjdJtDS94Os6We8Jp7vrsYVLlWApF
 WCXi9KaDMcrGRTFEAsGw2SMLn1sbHGVH8GHDyPX3b8LJT4b/jxwYmPVkjBdk5/W7XNg/7sADRWM
 wiKfYjdngn/J9F48/4Dtzk78iSdlvRBbsW1L87mYBUeVehNb3IGKvIfh01lkCm8Fei0liNh9mTD
 kESAYJ+galHg1fxoOBA==
X-Proofpoint-ORIG-GUID: jvvJfu0MnG6YF-vJI59EG2SUs5EjQ6vl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfX1JIbCwPWZIwi
 himlydr+Wl7KYsF4/6HQiZN69gLgN4KfllmJiXEA+lJvsT3Yfm1EpqboPQ/kj0FdOJRBAExcsKn
 CPgILX8WGgfyVmITQHwI2H5KgY1jdf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135505_989008_DC2C66BE 
X-CRM114-Status: GOOD (  18.88  )
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



On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
> On 7/1/26 9:31 AM, Jie Gan wrote:
>>
>>
>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>
>>>>
>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>> AMBA bus.
>>>>>>
>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>> created on the platform bus instead of the AMBA bus.
> 
> [...]
> 
>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>> clearly distinguish this platform-specific case from the standard
>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>
>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>> I do not see there a fake, duplicated compatible for the same device.
>>> Can you elaborate how is that relevant?
>>
>> Will fix it by removing AMBA related description.
>>
>> Shall I update the clock name from apb_pclk to apb as a platform device?
> 
> Why?

For the previous platform devices, we got comments to add the clock-name 
with "apb" instead of "apb_pclk".

Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml

Thanks,
Jie

> 
> Konrad


