Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEB6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKoQ4N3icAjL6uyR4WjIfq+9vwxL6ATc8yoGXz9I+cs=; b=eQtZIlunogOsQ3KMr6WaPwoZaz
	6gBvMqItiEz+4wXSgOfparQWFp9nZIMMEzi+h+ba0QE0QhpRUy4s8YXAnuPLYxOz74DTGAqbX8ULI
	0iHn1ElpIdHfY5THmkzxEgfScnTunVWLK3fss/Er7TQEfjoxV7tU7YomKnTAF/s0ZSjZjpMIYxNK2
	gnKBzyP5e8OCNsb9ykxDaujfzxyJzMl5qtlfBOaCa1WxYT84Bk2Dov5k31cFrjNE0aEeaIWeds4SP
	Vekq2XAmYaoX066gcdTlFyiwVeI6TNWziBTs+xyI7EP9iemj7COSy8DIrBqZUuQX/3RUC/1rpcjNI
	x71iG0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYSp-0000000ASEl-30tT;
	Wed, 19 Feb 2025 01:01:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYRK-0000000ARo5-1Zli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:59:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwUcD015154;
	Wed, 19 Feb 2025 00:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKoQ4N3icAjL6uyR4WjIfq+9vwxL6ATc8yoGXz9I+cs=; b=dcUnoPartB5KrVk6
	hjKzOHxLlsHqI5w3MwACCr42zgVmLPkBsaqWBo/ZsS2UyI20mykwynmh+M6tlhXe
	Ku8gbZFzXGO2WNNYAqca7XnPGFXctVxRJ1/KbI1t0LceQH0u5uRenitS7Uiw5I4r
	wfgKks0twgQ3GycH+a1npjxs3BAkn1kOzRunvRpbtDo/PKQQ9fuvXI28ph06WK+d
	I9NXk0YvuR5QQrS8fxKpY7qx2vjFoatn5u+HxxGCqJCmfqhfma/CnGN1tBV4pvab
	TXGjdu40WBDoht2hU2SmxDOD1etHmBTsyxq9QOdqnf4+1vbfha6tonoY7jA6N7XR
	J2V0Vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy48rae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:59:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0xa9p011640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:59:36 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 16:59:32 -0800
Message-ID: <d7680489-db7c-49d5-88ff-29e99a49f624@quicinc.com>
Date: Wed, 19 Feb 2025 08:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/7] Coresight: Add Coresight TMC Control Unit driver
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-ORIG-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_165950_540115_EB0360BD 
X-CRM114-Status: GOOD (  19.93  )
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



On 2/18/2025 6:05 PM, James Clark wrote:
> 
> 
> On 17/02/2025 9:30 am, Jie Gan wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous 
>> configuration
>> registers to control various features related to TMC ETR device.
>>
>> The CTCU device works as a helper device physically connected to the 
>> TMC ETR device.
>> ---------------------------------------------------------
>>               |ETR0|             |ETR1|
>>                . \                 / .
>>                .  \               /  .
>>                .   \             /   .
>>                .    \           /    .
>> ---------------------------------------------------
>> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
>> ---------------------------------------------------
>> Each ETR has four ATID registers with 128 bits long in total.
>> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
>>
>> Based on the trace id which is programed in CTCU ATID register of
>> specific ETR, trace data with that trace id can get into ETR's buffer
>> while other trace data gets ignored. The number of CTCU ATID registers
>> depends on the number of defined TMC ETR devices. For example, two TMC
>> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
>> and ETR1 with ETR1ATID0-ETRATID3.
>>
>> The significant challenge in enabling the data filter function is how
>> to collect the trace ID of the source device. The introduction of
>> trace_id callback function addresses this challenge. The callback 
>> function
>> collects trace ID of the device and return it back. The trace ID will be
>> stored in the structure called coresight_path and transmitted to helper
>> and sink devices.
>>
>> The coresight_path structure is created to address how to transmit
>> parameters needs by coresight_enable_path/coresight_disbale_path
>> functions.
>>
>> Here is the definition of the struct coresight_path:
>> /**
>>   * struct coresight_path - data needed by enable/disable path
>>   * @path:               path from source to sink.
>>   * @trace_id:           trace_id of the whole path.
>>   */
>> struct coresight_path {
>>          struct list_head                *path;
>>          u8                              trace_id;
>> };
>>
>> The atid_offset mentioned before is the offset to ATID register in CTCU
>> device.
>>
>> Enabling the source device will configure one bit in the ATID register 
>> based
>> on its trace ID.
>> Disabling the source devices will reset the bit in the AITD register
>> based on its trace ID.
>>
>> Useage:
>> Enable:
>> STM device with trace ID 5 and ETR0 is activated.
>> Bitmap before the enablement:
>> ETR0ATID0:
>> 31..................543210
>> ==========================
>> 0000000000000000000000...0
>> ==========================
>>
>> Bitmap after the enablement:
>> 31..................543210
>> ==========================
>> 0000000000000...0000100000
>> ==========================
>>
>> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
>> STM device.
>>
>> Disable:
>> STM device with trace ID 5 and ETR0 is activated.
>> Bitmap before the disablement:
>> ETR0ATID0:
>> 31................6543210
>> =========================
>> 000000000010111...0100000
>> =========================
>>
>> Bitmap after the disablement
>> ETR0ATID0:
>> 31................6543210
>> =========================
>> 000000000010111...0000000
>> =========================
>>
>> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
>> device.
>>
>> Sincere thanks to James Clark for providing an excellent idea to handle
>> the trace_id of the path.
>>
>> Changes in V12:
>> 1. Update the method for allocating trace_id for perf mode.
>> Link to V11 - https://lore.kernel.org/linux-arm- 
>> msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
>>
> 
> I tested the latest change, looks good to me.
> 
Hi James,

Thanks for testing.

Jie



