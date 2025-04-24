Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1FFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEwcveSMr05G49mJTq32jJbxq00tOstvui7brwnp6pg=; b=ih/l7ns+FFXgbkgbKFGohre6k9
	U7Z+hOSlzXdmRs+Au2TCIZJjs49wBwG8Gx9yBankRfFh5qpOBQr/4TiZ6rywjNcZANZR5JVfLdDZT
	tUVEiQnboWYahoJQY7y/H/+cSXZPfuy6vRVjDaeBvEM/4ItrYx8iE8JHSqEI5MjAi1f2YI6Egefq1
	0r2Ytl/suQB86o7+JxLAHvM9mUxSd2sH4W5mFzTFdAtuZ5NW71wbs+Umtny9Qk6AakVMTB3wo905i
	yCebMVKIYYp3/2r+slNfQzNWeIoQTrFtWeUPmW7PONl49H/65dN8KYlyhaqzQTHoLgRtG81RNC8oa
	6SC5BWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tnM-0000000Dfsz-06Q8;
	Thu, 24 Apr 2025 10:27:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7szP-0000000DWN1-3Fbn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:35:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6ue028353;
	Thu, 24 Apr 2025 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEwcveSMr05G49mJTq32jJbxq00tOstvui7brwnp6pg=; b=CC7WMzFE080IGvpP
	lKGNP8i2bZOPFz8wCroaIEwmdxtnSnPwvlSmvZH1VXqwI0f9YHlRIthpOTevwR33
	tyz7I1a+D/+ulW6Qm2y8mzo0ojahK0amDCsRkrtWRgxosSNqdTmpOk/CA+HDlldt
	PppDU47S2KsIAGLpERFuBLl6HcMsos0/ilOH4bv7ZZc79lJuv/lhC/3tgxBLGgdq
	jw9kkS5j0lqfhYrv3KJIxJ1Ghr5N3qXVgDIklomma2mLKt+wEmfMhJxTDq1g++/W
	Z3j351UMa3bvZCSOftOhUeRf417kt8HB2am88KWbJj+269q5FBfIfx4A0Bh/wz9y
	nK7/VA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy50j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:35:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9ZLXo019249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:35:21 GMT
Received: from [10.218.40.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 02:35:15 -0700
Message-ID: <8586e84c-4a2c-4aca-831a-6fde0cd39a45@quicinc.com>
Date: Thu, 24 Apr 2025 15:05:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
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
        <linux-arm-kernel@lists.infradead.org>
References: <20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com>
 <20250414-qcs615-mm-v7-clock-controllers-v7-4-ebab8e3a96e9@quicinc.com>
 <ac5f2ada-1561-45f4-91c6-f6b403f65e20@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ac5f2ada-1561-45f4-91c6-f6b403f65e20@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXyuR1Lxg74svK 33n28murralb5y4gblr1FWcfULI0c+2Z9GuAaCXZFcuj2OldJjEC5BMiKqx4KHK+QilDYJJLoQy 6rFcTcAyxhkXyEhEN+kwEWBFgaPCYZTGuq+HCWr6zLWmGHBpVlaQh4lvmPoKeloDLzorvZdC6O7
 1pm9UVCJhiYAVxJFrrwkikSiH1avdV3Cz/CTUc1a5FuqsO3Zn+PvicIty9BMNBA+YJpqjJV2kmv KJ+cvLNv0+NFnHSguoQYxQqRp2/kTfYPdZiIBRtGdLptTS+N2b/QMEVM2+yNbTREnwftWm1zP9a 1519iE923udFlz0hgNcBI61gv8UYP5Eow91MrifXg1sBNQ60m85WV4fAS5rj68fkULTSvmZcNwr
 GpVs8EOnNYzgbD32S0RXtbTDF1zvC7PRDq+CTqAH8m3mIeXdHLfNhJN0A3WORzF140u2QJ/N
X-Proofpoint-GUID: 9Nr0r2JWEqMjrqaMfrlbyKSl6fpN3vms
X-Proofpoint-ORIG-GUID: 9Nr0r2JWEqMjrqaMfrlbyKSl6fpN3vms
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a05da cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=xQW9tI0NYmVP74NBxscA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023527_942557_65A0C2D4 
X-CRM114-Status: GOOD (  11.76  )
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



On 4/15/2025 10:55 AM, Krzysztof Kozlowski wrote:
> On 14/04/2025 10:42, Taniya Das wrote:
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Drop
> 
>> +  - clocks
>> +  - '#clock-cells'
> 
> Drop
> 
>> +  - '#reset-cells'
> 
> Drop
> 
> Please look at other bindings when writing yours.

Unfortunately I picked the wrong example. But fixed it in the next patch.

> 
>> +  - '#power-domain-cells'
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    clock-controller@af00000 {
>> +      compatible = "qcom,qcs615-dispcc";
>> +      reg = <0x0af00000 0x20000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +               <&mdss_dsi0_phy 0>,
>> +               <&mdss_dsi0_phy 1>,
>> +               <&mdss_dsi1_phy 0>,
>> +               <&mdss_dp_phy   0>,
>> +               <&mdss_dp_vco   0>;
> 
> 
> Drop excessive spaces before '0'.
> 
Fixed in the latest patch.
> 
> Best regards,
> Krzysztof
> 


