Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E98C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96ROlff/PtcRVbTkV8vw4wdxvl391eyvZo8++Lqhbjg=; b=u0jHhBr2Uqp7Qdhgs4xPTxDi48
	So7a13s5OKQ/fZbubh4bJW1ar79Xx4+hGoTcUdwK+6YEiLn5G3RyRKYAKbTvL9+MWtDXfyxXQ97FA
	RNhR1zpmnYSznSwEgeHeU1MJM0CxXMKOUksUrg8UIhelXcNKeXEGy/DzbkDefPGQpKHYUm089QCIY
	B4jtRTpBL2z8jQ54YBtyYoNqoKhktKWposMYuH9ANL90QAz1wKOegucNLmcwhc4ieyl0Y0x6ZaDdv
	a6kpg6q+EKbOUtBLwD2XSi+55y1e2hP4NFaQ5STfDYxryHsD8WO89vJLp4emtdHsvLdkzRmyVA2G/
	LjxYB5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu45C-00000001Pwn-3V1E;
	Mon, 17 Mar 2025 06:36:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu43W-00000001PTP-1yTp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 06:34:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GNo2R6018547;
	Mon, 17 Mar 2025 06:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96ROlff/PtcRVbTkV8vw4wdxvl391eyvZo8++Lqhbjg=; b=fpe4yHxiPWYYR45R
	+u9qstlUkzLJdg0piHxVKZVlR2B94B3pb9TWgi7T7ctTowWcDhQR4mniRWyOeUfK
	8ephRtGUVnIB+17F+zmVKZNa8euqoGZL6endydYt79Gzh0mCd2qbZ4rny+OkWk3I
	R8vlQ0wnPKJH3whjumCAkdcVoRITEzgflce0sq+7cIS3o03NlDOFip3NV2NFNNpb
	pCo27PGcny8t6nzeWpEjOtn0YJe07cNx2tYr+XsMMlRyVz2rULmeb7URA+9zbITV
	vg4eIag8L9EK5BwPDkbRY8i6AJYaE1wMuiL6dBZvWIzHBZ0yNncgJjxkIG9sX3aB
	98FGBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r13npj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:34:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H6YP31025506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:34:25 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Mar
 2025 23:34:20 -0700
Message-ID: <523b6f39-41b7-41cd-b793-7b768cc71064@quicinc.com>
Date: Mon, 17 Mar 2025 12:04:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
To: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
 <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
 <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
 <5tt4wli2yodoet2l6r7ksq3o743nmi75hfksakqaxre3gmyr2a@zdotamju5ndp>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5tt4wli2yodoet2l6r7ksq3o743nmi75hfksakqaxre3gmyr2a@zdotamju5ndp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d7c272 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=o4nIivdWQW5RE0qCd0YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xcHUOX4X7SA2cw_6MLoREY3gaeoz2rGA
X-Proofpoint-ORIG-GUID: xcHUOX4X7SA2cw_6MLoREY3gaeoz2rGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_233434_634745_101C9D68 
X-CRM114-Status: GOOD (  14.46  )
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



On 3/14/2025 4:47 AM, Bjorn Andersson wrote:
> On Thu, Mar 13, 2025 at 02:18:57PM +0530, Taniya Das wrote:
>>
>>
>> On 3/13/2025 1:54 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
>>>  +
>>>> +  '#reset-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#power-domain-cells':
>>>> +    const: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - '#clock-cells'
>>>> +  - '#reset-cells'
>>>> +  - '#power-domain-cells'
>>>> +
>>>
>>> I don't get why this binding is different than others and you do not
>>> reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
>>> reference.
>>>
>>
>> Yes, I will fix them and resend.
>>
> 
> What is it that you will fix and resend? This patch or all other cases?
> 
> Please stop just throwing stuff at the list and until something sticks,
> talk with the people who review your patches.
> 

Bjorn, I will fix all of them in the series and send out.

> Regards,
> Bjorn
> 
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>


