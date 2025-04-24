Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C03C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlorimMULb+8kz3lWeMKC2xv+9sTTpBrY2NOBLIkBZw=; b=wnKIHypGPFotbu+xYogyvbZNMP
	TJIPvwv/xDmBD+b02HsCrZLGlZJckjHcQHeB0A4oWSpX09yDGM4PperYBse6eMOrLf34dz5/Dh6ld
	lVN6R3ov4OquUHSrTUdrUGXoIWZdXBJuvZWQIyeedeBvT47nxrgJV/cVx9AvrroKsCBTQNHhL+9KT
	5uyBrdDHRLAWaZ8xTcxqbOTvOpRpJ2R6HQEx0X+lWn4CmdsU0mbsoFcTENB8LMLXSFjvGleFbB4qr
	0Exy+Z3yDzBVKl6d+zLGh8rMJ6XGIMGyjbRvCcsB+5yszkINx7hGeiJipdPaMg8ghZlmeACjQ0D4Y
	KCgWG/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7za0-0000000EmII-3NiR;
	Thu, 24 Apr 2025 16:37:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zRE-0000000Ek8L-2XIC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 16:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BlorimMULb+8kz3lWeMKC2xv+9sTTpBrY2NOBLIkBZw=; b=F55Jr6+gXbj4JGDcW4g1/yIqeM
	OsKD4Lg3PDBgvKrD2I1Bq/TqAkEKMuxgaVY5Enr4yR2/T8SS9i+bWjYz6f19c8TzLsxfudjgnc7Hv
	e5USq7NbrhaT6Pck/H2m3dBBu7WzmqJM8dfri+GEHsUoSZqEybJDKa90TzbqDGtFcqHaMI7HKiRfR
	RqUD/nN8kuFIEQNdTnCJ9kyvRAF+6QTQWM3ScvQhO7HcMxbFpvaY7H8CVQZ3NaIntGZYblqo4o//r
	m/nmNUhCNVvCTqfxl0AwtXWw9oHLUpMgeDSYm0WVMmY1swGxD52snyvv+HRkco7eL8wXm0Fy6zS55
	9l1EAEFQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7zRB-0000000BrKq-0RmK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:28:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3DpR016250;
	Thu, 24 Apr 2025 16:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlorimMULb+8kz3lWeMKC2xv+9sTTpBrY2NOBLIkBZw=; b=bwicXPBHEQ0YKLiV
	zY0gBg18cRxxnH0uQIswnf9iJW3gww0sD4eR9dI8sETecnhX9J2RA2nowgAtPA/v
	QKNgR2Apzq09y5bVIboBxH2T+X+k/p7z5cY49dc9TD3Ok4wil6CzP1SAEM/QvTck
	dh+NG12OnV9oi3udzdP8gUvPAG351WUts+93GfUl7Fuj3uEv/KdD1qcmO+WRKXkz
	ZZM44b60VO+D3ZYsDIyULiTBheTJ3tLlMdXQBchpn4S6x8z9SHWxTXEb3wVe7hbQ
	1koyXYAW66Nuh2Anze+mJNEYvK49kRCppqDJcI/PKGJrwmT05PuV2UAXBizatoKK
	YoCMQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ec79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:28:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OGSKTp015600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:28:20 GMT
Received: from [10.216.17.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 09:28:14 -0700
Message-ID: <dfa2ed59-ba7c-4cb4-ac78-97f3de716b9b@quicinc.com>
Date: Thu, 24 Apr 2025 21:58:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <94a5f0d7-b152-4fe3-b312-a0f7792cc076@kernel.org>
 <8552c048-df45-49ba-83b3-5c39d4b770fe@quicinc.com>
 <3bbef5c3-1859-4a4a-b25a-83428dc15e98@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <3bbef5c3-1859-4a4a-b25a-83428dc15e98@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HBUMWYhRGfGqFB9-xVhwgCMrFGT5TG-r
X-Proofpoint-ORIG-GUID: HBUMWYhRGfGqFB9-xVhwgCMrFGT5TG-r
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a66a5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=P-IC7800AAAA:8
 a=qte3l9YSZrOXRyZcDLIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExMyBTYWx0ZWRfX7N+c4nog+brz U0ur3pelvHTIqty9CEytj/4bj743UeFsyNecVVGRNVbu1/qDM/lV3ykKCxohRKoa7blWzR/kNut K+joOk7cddiTQM849C4JcA7SqQG4AMfBN/NvO74QZlzu7BJHYjHDXD1vliEScrPo9b1TQXjnVBV
 B6+yw9a8UUjA8TIk/rk9ShhiLWOVSoBxPITAMIWpRiLUfpWnd+sXElp5IfqA6LtOtdsMEQwjWXU e2LZ0YKNC/ClCWOL7Yju37Ig28JNWCvPsCP5PHEa5jZg2uSF6thaY2Lj61bHw1qKBbsPc6lmwAU cKmf5UkHRXB20p6qq5FRYBfH9T83OS1rsCIrlk1ZfL01/sj01i3l67P1CuIh9Idjpbo9aWSExn/
 RicMEsNk5BrMz0ZYw+FlcKqspvhf4qg31F92x41JLTlSDdH2NBAoKWuPEAaFOsUYbP0X4+7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_172833_579824_5CBB054C 
X-CRM114-Status: GOOD (  16.13  )
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



On 4/24/2025 8:59 PM, Krzysztof Kozlowski wrote:
> On 24/04/2025 13:13, Taniya Das wrote:
>>
>>
>> On 4/24/2025 4:40 PM, Krzysztof Kozlowski wrote:
>>> On 24/04/2025 11:32, Taniya Das wrote:
>>>> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
>>>> Update the defconfig to enable these clock controllers.
>>>>
>>>> Global clock controller support
>>>> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
>>>>
>>>> Changes in v8:
>>>> - Drop the properties which are already covered as part of gcc.yaml [Krzysztof]
>>>> - Drop the RB tag for dt-bindings for Camera clock controller.
>>>
>>> Why?
>>
>> It had comments, so wanted to share the latest RB-by.
> So there were some comments and that's the basis to ask to do review
> twice? So anyone can comment on anything and you will remove people's
> review? I am not going through this again.
> 

It was your comments, so I thought it would not be good to keep the RB
tag if it has so many comments. That was the reason to drop it.

> Read carefully:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> Best regards,
> Krzysztof


