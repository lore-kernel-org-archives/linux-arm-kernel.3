Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2924BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VIRW8LodQHYJc1txja2sDsdcbnQij1n5PaWsrKr1eU=; b=Ab5o0nAEwrEjD0OpvcZZTDIaH7
	vyH8SPni90Lz8ZFRXAl++S67tkWdeGq77ViYxogGx94+MkMbeLMJtBi23RS6+0CwMobsAIJe1n1Fb
	1EcKLbgAn7qoTx5W2AYxNBbIQJ6cGZhTr5+/EqtcSKJPbidbWtuudkWCR8rsm09iO54a4nAWlQD/F
	O2EOott1AvdF0UxeK/LJgKTNKEvke3h2N15sy38LTWEdmRn8l/Ddsy/q3WgoLItK3lOWvdsaKeeqC
	DUSWXaPT6O/TbTQ8KuYXKI73novqBkF7kmsFJR4LUWn2f7YveZiHL+rrz3QFLj0R0cCtJSenkOG0J
	9rgX/F4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2xX-00000003Qex-1tkJ;
	Fri, 13 Dec 2024 10:31:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2wS-00000003QQ8-1dJ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:30:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD2g9OZ000485;
	Fri, 13 Dec 2024 10:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4VIRW8LodQHYJc1txja2sDsdcbnQij1n5PaWsrKr1eU=; b=GuERsYeUwzdQYiJn
	aVBOvEN6uTErzoGB2/cAhTMICJNxThfAb2csGrlQUYh8bwrf27u2v3r1k3j6ZJPK
	Yn6fvph0h9xoditgLBhldd2u54qz+nSrKBiXiTWmbOPXEqIfxpc8pA67Sat0MTZJ
	MDF618+BEfbzC6AYbq1PtWMsu7yZ6UsVNkvXlhhvOBEonSy6y6f8Hy8QBEaqkHUJ
	MT+9SKBRTkwOFm6uzXdYxqEhpFNNWJS8f+s+TQBE2I3g5Pw4maBfA2SrlvCq73Ea
	EIToljQqRBLvCqa1On92RkgnLln4jAwYtB/b1qYaWfBH2wU654GNWax4c0/8ccUi
	UM8T6g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4gdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:30:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAUXKA018370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:30:33 GMT
Received: from [10.235.8.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:30:28 -0800
Message-ID: <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
Date: Fri, 13 Dec 2024 18:30:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9lpEAO-uMRk-C7HonLcevXvPHCozICKQ
X-Proofpoint-ORIG-GUID: 9lpEAO-uMRk-C7HonLcevXvPHCozICKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_023040_553277_53B9B695 
X-CRM114-Status: GOOD (  16.06  )
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



On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
> On 7.11.2024 10:50 AM, Luo Jie wrote:
>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>> block routing channel.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index 78f6a2e053d5..9a8692377176 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>   	clock-mult = <1>;
>>   };
>>   
>> +/*
>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>> + * from WiFi output clock 48 MHZ divided by 2.
>> + */
>>   &xo_board_clk {
>> -	clock-frequency = <24000000>;
>> +	clock-div = <2>;
>> +	clock-mult = <1>;
>>   };
>>   
>>   &xo_clk {
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 8246a00a3e3e..25aed33e9358 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>   		};
>>   
>>   		xo_board_clk: xo-board-clk {
>> -			compatible = "fixed-clock";
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&ref_48mhz_clk>;
> 
> This must be squashed with the previous patch, you can't introduce
> code and replace it immediately afterwards.
> 
> Konrad

Ok, I will update the patch series with this patch dislodged, and push
this single patch in next update. Thanks.


