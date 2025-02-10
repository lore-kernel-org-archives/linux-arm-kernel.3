Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3122DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX94Y1DLftOcH76cc/D2dTQlv3D9/SsCUAFkAr8Sem8=; b=FsISxrOk5AnhrukyMgZn96CT/4
	pU3gnfHrR7Xk+orlX4FhgkHc08IoJisr2RFlZARY4aQuUWuHsMW+c6xp0iWoI3O3EKHS2+fhGjWe/
	wT91E242PS5u6ohXjHd4rQyAYY8yLEBAfWOW0Ud1RtUdRhcgEB8x7SigbkIgS6xOYHpZjqrotlUWw
	PWCEufliRMr4eiChZb1UkrHDAHtFearr0iLDEn7k5a57+gmreHdJY/WzlmIplVWl4FaqBXW1MaGys
	3G9RU5iw1H0xfPnYD8zXOS2CpShRLfIduvq6ZoAwIbm4zuNUN76wAx+2rdSBUE4ghPjpVE8cHEHEX
	9b/qGw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSCy-0000000HHMh-1Qn6;
	Mon, 10 Feb 2025 11:44:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thS0z-0000000HE70-1FNw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:31:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A75xOs010163;
	Mon, 10 Feb 2025 11:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX94Y1DLftOcH76cc/D2dTQlv3D9/SsCUAFkAr8Sem8=; b=I1nw7tqiz/kFxhle
	Holws7trVi6BbmPtbdZWtxDXO1BYTSZYNzA6vQX6lyPfjqpMGFS8TaxpIqaPB9pS
	r+F6220WPsqkv5A6PeAfjP8HaEjV16ol5TChfvLQXyuW9+0lbtncAgLwNes/Y8Yl
	L+LHCj5IoMnNPgMCNJza9rwcrPQ7MuwvlvruR13buTflMezkp90Bs1C4xEnHSsCs
	rn8dFMFO72BhMpf2fae4LYcQJ13YrcGnq4kGhOK70rxKYJxIgMUnml7Z2vCX/npH
	UBC0vUf0AyyGf935f+62qdKw6m+pbQLXZ59TWMeiIAHc0kP8wXSRHfUKf6j5+u4O
	4C9b7A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs58sem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:31:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ABVdQB028977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:31:39 GMT
Received: from [10.216.18.35] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 03:31:35 -0800
Message-ID: <6ddda82b-d90c-4f16-a1e5-1a63fca7aba2@quicinc.com>
Date: Mon, 10 Feb 2025 17:01:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg
 Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
 <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1FNwXa16gvd1MBf64JJ-2x1HySUAS9rq
X-Proofpoint-GUID: 1FNwXa16gvd1MBf64JJ-2x1HySUAS9rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_06,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=946 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_033149_467945_BAE2E286 
X-CRM114-Status: GOOD (  15.26  )
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


On 2/10/2025 4:31 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 11:17:02AM +0530, Pratyush Brahma wrote:
>> Add the device node for gfx smmu that is required for gpu
>> specific address translations.
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..7a8211bec139375b5aab939f123d88fca7aceff2 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>> +				     "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x3da0000 0x0 0x20000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <2>;
>> +
>> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
>> +
>> +			 clock-names = "gcc_gpu_memnoc_gfx_clk",
> Stray whitespace after the Tab symbol
>
>> +				       "gcc_gpu_snoc_dvm_gfx_clk",
>> +				       "gpu_cc_ahb_clk",
>> +				       "gpu_cc_hlos1_vote_gpu_smmu_clk",
>> +				       "gpu_cc_cx_gmu_clk",
>> +				       "gpu_cc_hub_cx_int_clk",
>> +				       "gpu_cc_hub_aon_clk";
> clocks and clock-names do not match.
>
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>> +			dma-coherent;
>> +		};
>> +
>>   		pmu@9091000 {
>>   			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>>   			reg = <0x0 0x9091000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>
Thanks for checking. Will address these in next version.

-- 
Thanks and Regards
Pratyush Brahma


