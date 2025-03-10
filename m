Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 02:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEoCZTviZ2GCsxW2OdhKOgQUL5/J0NoI75VbggP73rw=; b=Ltt+qTG3aMzt1kboFDJZu/G+N+
	44wZRH7JX+1K99Wlqw9NUCOloU2rwmRw3G0OY3nJ4w1vEbMLtV9nI8Y2KbeQYNwYgSve2U3U5C4SH
	v7HeOX2hQ1tMKzzca3sC5FzPuBxkA9x02v1dNoMoBmlPA8lmte5Wmz81meWHh6ECVuGXoNd22Xr+q
	Q5HKeJuvxR89gMfjBbBXB0nbbiByShFWRvX0hX+VaeuvOYbTl1zeWPb1H5JgsvfxVJXszmdGrVmpy
	xbql8zwcATRMxlGnQkMCtR8hrkp0D9sgxebPJnnD87RksulHiq9+Grz5MqzEPb9ciDe9n73f+9wFD
	uuK12N1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trTMh-00000001TNF-03qJ;
	Mon, 10 Mar 2025 02:59:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trTL4-00000001TEj-18LU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 02:57:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529MtPYX012672;
	Mon, 10 Mar 2025 02:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEoCZTviZ2GCsxW2OdhKOgQUL5/J0NoI75VbggP73rw=; b=IY6XfO+cyEyKgtTh
	VvwZBcAkKx5ZDHo5iFWZd+3zeGNlVAgcUYEEjtGnGFtOHHMr2/7LDIs9+q4PZhnJ
	zAAl8pQmpSgsxI+jW41MyxCrevjIYKmkwN/Sl1SFPRw9TesoT8SHJxiWXF8zc+1K
	qeiRCdQQjin5WNF2j21k4fTy9qSnubuDlxM3MPZlx3sbeAfNxSTvaLNyie2Pp8yl
	U+fXFQp3m642p+ST9DzaYpGTgAfzez4rhzyaZZzyWANZxlDBHE54EMnBNN6FrSEf
	ACw29qurRz8qqyc7RUorX8y9J4Uc4VZEzS1WBR5EtKwsrv/8sy9QipcWJ2tZV+j7
	i+7bXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0uath-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:57:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A2vi3f005518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:57:44 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Mar 2025
 19:57:38 -0700
Message-ID: <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Date: Mon, 10 Mar 2025 10:57:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR
 nodes
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-11-quic_jiegan@quicinc.com>
 <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tFJVOVLCoCIHttOaOYSCI63izxriGM9H
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67ce5529 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=wwPabD9cbYV0bnQw2J4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: tFJVOVLCoCIHttOaOYSCI63izxriGM9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_195758_434964_E288A623 
X-CRM114-Status: GOOD (  13.13  )
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



On 3/4/2025 8:28 PM, Suzuki K Poulose wrote:
> On 03/03/2025 03:29, Jie Gan wrote:
>> Add CTCU and ETR nodes in DT to enable related functionalities.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> Assuming this goes via the soc tree,
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Bjorn, Konrad

Gentle ping.

The driver part has applied. BTW, I found this patch has a conflict on 
tag next-20250307, do you need me to send a new rebased patch?

Thanks,
Jie

> 
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 153 ++++++++++++++++++++++++++
>>   1 file changed, 153 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sa8775p.dtsi
>> index 3394ae2d1300..31aa94d2a043 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -2429,6 +2429,35 @@ crypto: crypto@1dfa000 {
>>               interconnect-names = "memory";
>>           };
>> +        ctcu@4001000 {
>> +            compatible = "qcom,sa8775p-ctcu";
>> +            reg = <0x0 0x04001000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    ctcu_in0: endpoint {
>> +                        remote-endpoint = <&etr0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    ctcu_in1: endpoint {
>> +                        remote-endpoint = <&etr1_out>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>>           stm: stm@4002000 {
>>               compatible = "arm,coresight-stm", "arm,primecell";
>>               reg = <0x0 0x4002000 0x0 0x1000>,
>> @@ -2633,6 +2662,122 @@ qdss_funnel_in1: endpoint {
>>               };
>>           };
>> +        replicator@4046000 {
>> +            compatible = "arm,coresight-dynamic-replicator", 
>> "arm,primecell";
>> +            reg = <0x0 0x04046000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    qdss_rep_in: endpoint {
>> +                        remote-endpoint = <&swao_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    qdss_rep_out0: endpoint {
>> +                        remote-endpoint = <&etr_rep_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc_etr: tmc@4048000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x0 0x04048000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +            iommus = <&apps_smmu 0x04c0 0x00>;
>> +
>> +            arm,scatter-gather;
>> +
>> +            in-ports {
>> +                port {
>> +                    etr0_in: endpoint {
>> +                        remote-endpoint = <&etr_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    etr0_out: endpoint {
>> +                        remote-endpoint = <&ctcu_in0>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        replicator@404e000 {
>> +            compatible = "arm,coresight-dynamic-replicator", 
>> "arm,primecell";
>> +            reg = <0x0 0x0404e000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    etr_rep_in: endpoint {
>> +                        remote-endpoint = <&qdss_rep_out0>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    etr_rep_out0: endpoint {
>> +                        remote-endpoint = <&etr0_in>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    etr_rep_out1: endpoint {
>> +                        remote-endpoint = <&etr1_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc_etr1: tmc@404f000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x0 0x0404f000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +            iommus = <&apps_smmu 0x04a0 0x40>;
>> +
>> +            arm,scatter-gather;
>> +            arm,buffer-size = <0x400000>;
>> +
>> +            in-ports {
>> +                port {
>> +                    etr1_in: endpoint {
>> +                        remote-endpoint = <&etr_rep_out1>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    etr1_out: endpoint {
>> +                        remote-endpoint = <&ctcu_in1>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>>           funnel@4b04000 {
>>               compatible = "arm,coresight-dynamic-funnel", 
>> "arm,primecell";
>>               reg = <0x0 0x4b04000 0x0 0x1000>;
>> @@ -2708,6 +2853,14 @@ out-ports {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    swao_rep_out0: endpoint {
>> +                        remote-endpoint = <&qdss_rep_in>;
>> +                    };
>> +                };
>> +
>>                   port@1 {
>>                       reg = <1>;
>>                       swao_rep_out1: endpoint {
> 


