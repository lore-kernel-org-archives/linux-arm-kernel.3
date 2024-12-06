Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fXlyu23uzCV1zvNU4ik8S0jFn//AXqMi8qLmT+ntI0=; b=z2dtBpll9gasV/waYQDR78+iAk
	h6d+FTh5fyZcLgYtJZa+MI7h3Mc6v6BkGkynrbEEkni+0r0GdBp7T/YnLxx3bWbhwEbNGyN3paV3y
	Kxi35l8ArTzkVmwt1RrhhD3QYhDE5sCQg0pOnXFq845qOTzkcL1OqOdyoHXN1sYwCrj1CvqToptao
	IeZF+yNnfkemaCNI73quYmP8P/KUKmg86ZP2avkcogiJn+nUvyRXn49bFRXsEsV0J+uSYwYAW7JrT
	lXamxhzVgAhI28hH+Do1rC28VqBqph3QwT+utbcsjuYWvl3qy4d89kvRwUEumyUAx/EHr+g2dPkW9
	YMkobutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJe15-00000002YT0-1sjC;
	Fri, 06 Dec 2024 19:29:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdzn-00000002YFz-0IPc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:28:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69bsAG026476;
	Fri, 6 Dec 2024 19:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fXlyu23uzCV1zvNU4ik8S0jFn//AXqMi8qLmT+ntI0=; b=PowscZaj37khuu0s
	62HBbUIBT0ODKF3uddT5hn/mzNSqKQgiHT5KCrjXcQ4hCsOdSDZCMTRcPr08Vh9V
	0P0Lwy6hi6ULdU2hMf1IfW0bG6LRvs7J1gbH2j17MGa+kMHFDULyEl8HB6+fy0sP
	mYqZdAaEi0QM9w056bu4FzYF7N8DuUa9bwm5I1IjWyguEz7lhiaAQI1rxAbNmJav
	YJxrE1+0YK/sodIsbmTTD/x2NiEXnouP3AD2fFN7NhoRMAWQpHzUAjZaA25FTTgB
	qblC4kV175VvMmVqz4sgk0lBVCO5BZLjAhV/65QUxVhjPQydkAVGv8uvV+zAgDKN
	HwL9lQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc9h4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 19:28:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6JS24q028092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 19:28:03 GMT
Received: from [10.50.60.239] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 11:27:54 -0800
Message-ID: <106b1945-e288-4522-8567-90cadcbc9148@quicinc.com>
Date: Sat, 7 Dec 2024 00:57:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
 <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wNoMre80uxiPQiEvO5v_7Teu6WAOSpeU
X-Proofpoint-ORIG-GUID: wNoMre80uxiPQiEvO5v_7Teu6WAOSpeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_112811_236797_C4CC5369 
X-CRM114-Status: GOOD (  11.03  )
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


On 12/5/2024 9:58 PM, Konrad Dybcio wrote:
> On 4.12.2024 11:00 AM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> [...]
>
> (isp@ as mentioned)
Hi Konrad,

Thanks for your review and comments.
I have posted V8 addressing these comments.

Best Regards,
Vikram

>
>> +			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> QCOM_ICC_TAG_ACTIVE_ONLY
>
>> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
> QCOM_ICC_TAG_ALWAYS
>
>> +			interconnect-names = "ahb", "hf_0";
>> +
>> +			iommus = <&apps_smmu 0x800 0x4e0>;
>> +
>> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
>> +					<&camcc CAM_CC_IFE_1_GDSC>,
>> +					<&camcc CAM_CC_IFE_2_GDSC>,
>> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +			power-domain-names = "ife0", "ife1", "ife2", "top";
> vertical list, please
>
> Konrad

