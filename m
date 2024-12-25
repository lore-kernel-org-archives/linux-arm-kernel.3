Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A7E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+84ak5BMOs6fQ03Y5n5T+59bI7OqN2ndVO++05hIb5Q=; b=DUiQcBhbSgyBZD2TUDpw07SRAL
	7+1uAZazmUnOz0/JftAyo9jyQtB69whL2nQ0jQMDp5QpT2fubVYERIt2dX0PmnTlm46Vi8e+JhvN3
	eSoefZ+eLuHgFa9vhCxKuJicyHSVTMUbt/rcPgZbCckDRmdjOP5VdUeQTSudDCNyqIpzH1voQl/1V
	AMtjXlrszBsWWNx7PwO6ZFRvFvsScyWwlq106WFYMLle/iAaII9/hSwmh8fjnSthA9EGAAXn5Bq2Q
	xDPB5Eh21SRlJlopyY/9j282vLUgI6dQCSNrUF879zycjUgDBGVvA0Mwhw1tEbXyjb/aYO+2b8X7L
	2JUTTdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNFD-0000000DWGS-09Ry;
	Wed, 25 Dec 2024 08:59:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNE0-0000000DW9G-1PpS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 08:58:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3nK3V018158;
	Wed, 25 Dec 2024 08:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+84ak5BMOs6fQ03Y5n5T+59bI7OqN2ndVO++05hIb5Q=; b=VsTdLU8E/qgPevzO
	7IxPY04pADCwHxwJ+28ZkDJ2eHejXgc3wJeL6pBiXgRWETDqSWuOQCuKvoQldmww
	NEPCakAR1jaQfHJsHRVExOB/4kSFs9AkPAlZm9qU40Ih6rav02FMPldacpOjutow
	eNbrfzydSc952JlGXUVcltCTaHDlfQaTSdfXBo+qELzMSWp/QA+cKI5wixV7wZtu
	bILYZBpojS7mpaEnKY5uDOiOacZ0gUhhjA0dPI5brWUhOzr6URA0+pOFY7qyyVqa
	hOkwzuID/3oRFccY0mHPfvsxW29qfnA5+J5kHD7mz98hhbvhTJxlp/F3KOGB/Bj4
	js5SBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rafqhep9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:58:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP8wS50017673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:58:28 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 00:58:23 -0800
Message-ID: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Date: Wed, 25 Dec 2024 16:58:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul
	<vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IVHVoiiAqplRni58Im16n0lJMU1912ZT
X-Proofpoint-GUID: IVHVoiiAqplRni58Im16n0lJMU1912ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_005840_507930_7D25A5EA 
X-CRM114-Status: GOOD (  15.62  )
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



On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
> On 24/12/2024 04:07, Yijie Yang wrote:
>> The core version of EMAC on qcs615 has minor differences compared to that
>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>> and the Power-On Reset (POR) status of the registers isn't entirely
>> consistent with sm8150 either.
>> Therefore, it should be treated as a separate entity rather than a
>> fallback option.
> 
> ... and explanation of ABI impact? You were asked about this last time,
> so this is supposed to end up here.

I actually replied to this query last time, but maybe it wasn't clear. 
Firstly, no one is using Ethernet on this platform yet. Secondly, the 
previous fallback to sm8150 is incorrect and causes packet loss. 
Instead, it should fall back to qcs404.

> 
>>
>> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


