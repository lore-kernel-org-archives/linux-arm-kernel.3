Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B023C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6kfTTUe2SJkB4ocesJpwtBEmUKPSMD3W1XeWivw2/I=; b=WSoWl3IQmv7fqF52rkaa7l/h3L
	f8bvnKW/7qMT5UcSCRbfKjcjPQovJD1a26Fm3hMmL2ix6IMFgD3F6YZuAGSzsnmMle8keanVyGBMh
	jGaymob9/d4enIoc/h23MgDxdAdz+0/3arw1zHBbafjW1KCvZUn+CpJvDwfClh1X3i1esU7DS5Itl
	gv8do1ZrArQG+Lw4u04BJTYM2Zrj4xsS/Fb2M6t2E4HLq9S88IB8A7cNxNBFD3DBT/Zc5R3dmLas+
	SgXRoHDqejeaSPP3BMp5quRxCnRXOGuXzgzbSYGI6gjOVfgDqbuZ42v3UBQ8HGaRpCengEsd1PU48
	kNaCemHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdO-0000000FXk3-0mst;
	Fri, 18 Apr 2025 07:59:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gA0-0000000FTPU-1klC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:29:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1f3mY001224;
	Fri, 18 Apr 2025 07:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6kfTTUe2SJkB4ocesJpwtBEmUKPSMD3W1XeWivw2/I=; b=nmF1F4xIxhQm0hyJ
	XbY1M3Sad6aol6BszePs/4QkBJCG9tNCfMhZcpEK8ffckihH00Vtb9Oz11HiWCm7
	YQSMP149nsPcu/6VMvQIXqz/a03PASFoVwIw6S4uHnfEBWNnDBBOwrvbhla7Ivca
	OFwpLbWJzhyn3hcXLD6cg9dRNqCzwl+PMFKvHEReioOsGq3nSY1RXJFj8ZFlcNwy
	Jm9T6XfaoEekrO6zP4m7d+m8pxT94037+Tk7kyp6DEm8lDW/j0YoNjNm8rtpkRBv
	e102n4bghR289babDy+ndzt/6nIjowoQDzW0tfx5eeYtUQfgZhUXnxBqlHAtePfC
	/LllWA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjhjth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 07:29:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I7T4e7024662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 07:29:04 GMT
Received: from [10.216.47.89] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 00:28:57 -0700
Message-ID: <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Date: Fri, 18 Apr 2025 12:58:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6801ff41 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7gLDDzRWUVhiidtGMTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NFa8SKs0Fzf1ME-yH9sPgRCfNjok_44g
X-Proofpoint-ORIG-GUID: NFa8SKs0Fzf1ME-yH9sPgRCfNjok_44g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=936
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_002916_472123_A7DDC35C 
X-CRM114-Status: GOOD (  10.21  )
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


On 4/14/2025 7:18 PM, Konrad Dybcio wrote:
> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SA8775P.
>>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> [...]
>
>> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> 760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

Hi Konrad,

We cross checked internal documents to confirm IRQ number for 
csid_lite2/3 and vfe_lite2/3
Calculation for IRQ number is done with respect to vector number as
irq_num = (vector - 32).
csid_lite2 vector -> 791
csid_lite3 vector -> 790
vfe_lite2  vector -> 793
vfe_lite3  vector -> 792

thus irqs are as
csid_lite2 -> 759
csid_lite3 -> 758
vfe_lite2  -> 761
vfe_lite3  -> 760

Please let me know if this looks fine to you?

>
> 759
>
>> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> 762
>
>> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> 761
>
> Konrad

Best Regards,

Vikram


