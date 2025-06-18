Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9589C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JxJhlTKaWLHxrr2sQ6HBb0cbTYMQOvF9DeXN1OYDf4=; b=QvIloTvKnShSKG4HtCgPFcBqVb
	NYhjnv6C9MF0QUaFyajnjR6otL5t9t/KJktMax2CQKUN/KWjD3bz85hpc0+btXxvtnnyXi4uCTAmQ
	7XbFTzUPGh7F7JsfwkkvQtZ36Du2fbf5e0qSnszwf7AVkiJRzP25qg08RrZ71hvbJmk2sJgKzvbHz
	7nX3fU3CcnUTmc9A8IhsnulVu33+8ifBf+d7DeJrA4z+gMqwvABosGUh7c2HjAo/R9CpTBYzm2B4O
	nq8v4bR0ypMYSecXMenzFHFITaWMGrkek+zBZmazYUQkRG/vLWuMKO4iGgS69SHf++ruv07N2U5wi
	eC/AmVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwId-0000000AoZu-1eeL;
	Wed, 18 Jun 2025 17:10:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuak-0000000AZmS-0MsQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 15:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4JxJhlTKaWLHxrr2sQ6HBb0cbTYMQOvF9DeXN1OYDf4=; b=Jkk0c4sp0VNMIYAtljhCV97sUH
	6GKtDt2fDQ+zZjsNCRmazLiw/4Dr4lJSJKYnkyjzZzwTisgwFDBmahWEoHFuQEH1mpEDiAlblAGry
	2YY4p5ljpvPv0LPyp3SBx8WNgh8/2ievjvSw4IEBidfEwJzI3IBrgeH0KWQfNVxHjpb/MYik9cxeH
	HnNxm/SsOaY3V55VNCiOHbBjD6FSJOOJb/Qcw9ZHVaak+yizVccdvKpQwZdsahxUuF6QAAzN+rgIZ
	7Sybc6517CICO4emS7GACddKsjmNbsZEex3KMbHNWWOhJvny3Hnv+GltGhE8c+RFVGmft/ZXvS2CL
	a5pE2sDQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuah-000000048xe-38gY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:20:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9JLJ5031604;
	Wed, 18 Jun 2025 15:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JxJhlTKaWLHxrr2sQ6HBb0cbTYMQOvF9DeXN1OYDf4=; b=jvfsGTs3Pe+noeRu
	CNcRfaYnT0EIyyjDpznzPO6MZB4P2ow3qOhR8sP96QIyVsY12zwBS8mCsrbW/qqF
	p8v/Ljq+pUIfI2u7pKJuWxQ18gIFDzTcM+woEltfhlU59xsMRXz1T+ijjJYtVX9d
	CH3m4YExE7+qtSPafp8uYWU9GKzRDV0nV9wVncJbNaHI1aqwL6fAULx1/arSues8
	IQ8gDT0owQQ21HBIZy4PnkiSD2xL2Jvm5XtAkuB2AujOoOcSxzhLOKNYIKwHx6KG
	dXSs9b2XZp60Wb7fRZTifKCBDZ+r+ZmPV9kWZuOgDfxAwU456/4xWldmiRatwTkK
	nuc/OA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9cjgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:20:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55IFKXq3032498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:20:33 GMT
Received: from [10.253.36.28] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Jun
 2025 08:20:28 -0700
Message-ID: <817d069a-5e0e-41a7-95bb-e3c3ac964346@quicinc.com>
Date: Wed, 18 Jun 2025 23:20:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: Build NSS clock controller driver
 for IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
 <20250617-qcom_ipq5424_nsscc-v1-8-4dc2d6b3cdfc@quicinc.com>
 <cf07ac73-9908-4d96-bf44-1f40186df189@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <cf07ac73-9908-4d96-bf44-1f40186df189@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Omg8Eqdm4Mb3wLpwZXdkBmZmrsUHJ3YG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyOSBTYWx0ZWRfX+/IZ9J8TT/Td
 G8mYy/+/6x+v7Ha825s4bs5VEljbG3WJNFdYKLMUTFymiBpGY+o4aF9BS5EzMWJADvf4FqPb22O
 wRGHvrFzhJWd2z8zDES+qaoYrWNMrdvDolh0N7VU2CJyimEzb+ZXXXb1ASEF4YMzdrKeUTkJMbk
 PuiUQWOlTRGd9ZMJWUbqp+W4K6hGvDolyJpLkh96d3YVT4fveab8KjM4KHhvyTdt+bWqBINnsZY
 KiSssFXGyLExhX2E8H72re4CyR1IAdQBPgCJ/H63s7fTd2HUzEcy7OpSNRVxdmGGPa50znNaerX
 e580Emrf85HFxRnHxG+0o5wPfL8Zmqzvl2RAt+nuVC7EwkI1ZQq6Pmey64zEjsGqla6iIjaS6Jt
 LFNOmm7/Xzm+8WZkAwNHU7WK61RwiXZUk4BbqE//hdFBWded90wkh8L98yW5Yf6H4m+w+EYa
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6852d942 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=U-iYb9-RqBH3_7pkrJoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Omg8Eqdm4Mb3wLpwZXdkBmZmrsUHJ3YG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=857
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_162044_067789_241D9D42 
X-CRM114-Status: GOOD (  11.29  )
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



On 6/17/2025 10:49 PM, Krzysztof Kozlowski wrote:
> On 17/06/2025 14:06, Luo Jie wrote:
>> NSS clock controller is needed for supplying clocks and resets
>> to the networking blocks for the Ethernet functions on the
>> IPQ5424 platforms.
> 
> Which boards need it?

All boards based on the IPQ5424 SoC require this driver to be
included in the build. I will update the commit message to
clarify this requirement.

> 
> Also here not really proper wrapping.

I will correct the line wrapping in the next revision.

> 
> Best regards,
> Krzysztof


