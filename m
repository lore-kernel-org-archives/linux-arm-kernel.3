Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EADC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paKREfFwbHcqbZjvwNKBMo99QStMmHRBvEVzzuo6WgI=; b=D8AelLnj3UreW6NF2Ak0rtPSNy
	iih96KmlGGUlRo/DppFAoO1F4U23/dQ/FMwvVHluOcftHd7Zc92/gG7bYuNfy0UjT5K9sGeK6EmwT
	7K85Dpt+Kv9RZCvvyhgSJB1UA1/bcABmLrOIhoP5hVppXTpRt1xiG9oFMuwBN8xPUU6M2xJd0F/1m
	XcH+5b5xZM9vlWVijHh0yQEJIqGawgKBaZarSkPGnEPKeXaxMC06YLLUgHmjF0J0mWB0qaLXoXIc0
	kEIZB7gFm8hZw9c0PMP7UVc7XqF/k7QElrrakKGmU9/KT9OzZqJ6DyaOSH5kn2SSTupuH9eCOge6H
	0GcwSveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNy7-00000005KUv-0ynk;
	Wed, 26 Feb 2025 20:25:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNwZ-00000005KA2-09Sj;
	Wed, 26 Feb 2025 20:23:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QK58ud015362;
	Wed, 26 Feb 2025 20:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paKREfFwbHcqbZjvwNKBMo99QStMmHRBvEVzzuo6WgI=; b=XSaxc3cdzmzdP5Fi
	SKm722C1Er0lXPLTpmtRyIkFXAH9iF1oj3iIjI++A8KX9BTAvVl6tXEVZLdVqOdY
	jF5NHV2QkO/F5h31DdggNAif9laaArjkAG21mzVu7C6v/AE1nSWtBXRdexFSXRKG
	EH0V88n5WYSCdjrTeOx2GvHW4KcukFFFcVH0ZnkhlCfyG12xYu8k6qZXAdkq+7vZ
	n/StJIrfELoEl9RmmXhtE9vGeQEyu9W6I1G7YdMk/hmg3PEx93j3A/J6oDNHZdF3
	VChXX5PWe7/LxRiM0h834N1TG6Quedd8W1xLrEqymqR7al7zX6nnM5XwGMsNJq32
	5PuqGQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnk7u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 20:23:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QKNa6k023169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 20:23:36 GMT
Received: from [10.110.48.1] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 12:23:34 -0800
Message-ID: <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
Date: Wed, 26 Feb 2025 12:23:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
 <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0QGtOvo9xVU4Chq5LxxVUDyTndPOpUeC
X-Proofpoint-ORIG-GUID: 0QGtOvo9xVU4Chq5LxxVUDyTndPOpUeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122347_221784_B3D2110F 
X-CRM114-Status: GOOD (  26.06  )
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



On 1/14/2025 2:34 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
>> sequences to bring it out of reset, and to initialize the associated eUSB2
>> repeater as well.
> 
> What does M31 mean? What is the relationship between the eUSB and USB
> M31 PHYs?
> 

M31 is the vendor.  I'll reword this to make it a bit clearer.  There's no
relationship between eUSB2 and USB2 PHY drivers, as the eUSB2 based driver
would require some additional components such as a USB repeater.

>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  drivers/phy/qualcomm/Kconfig              |  12 +-
>>  drivers/phy/qualcomm/Makefile             |   1 +
>>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>>  3 files changed, 281 insertions(+), 1 deletion(-)
> 
> Please run the patch through checkpatch.pl --strict
> 
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> @@ -0,0 +1,269 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#define USB_PHY_UTMI_CTRL0		(0x3c)
>> +
>> +#define USB_PHY_UTMI_CTRL5		(0x50)
>> +
>> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>> +#define FSEL				(0x7 << 4)
> 
> GENMASK()
> 
>> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)
> 
> FIELD_PREP
> 
>> +
>> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
>> +
>> +#define USB_PHY_CFG0			(0x94)
>> +#define USB_PHY_CFG1			(0x154)
>> +
>> +#define USB_PHY_FSEL_SEL		(0xb8)
>> +
>> +#define USB_PHY_XCFGI_39_32		(0x16c)
>> +#define USB_PHY_XCFGI_71_64		(0x17c)
>> +#define USB_PHY_XCFGI_31_24		(0x168)
>> +#define USB_PHY_XCFGI_7_0		(0x15c)
>> +
>> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
>> +{				\
>> +	.off = o,		\
>> +	.mask = b,		\
>> +	.val = v,		\
>> +}
>> +
>> +struct m31_phy_tbl_entry {
>> +	u32 off;
>> +	u32 mask;
>> +	u32 val;
>> +};
>> +
>> +struct m31_eusb2_priv_data {
>> +	const struct m31_phy_tbl_entry	*setup_seq;
>> +	unsigned int			setup_seq_nregs;
>> +	const struct m31_phy_tbl_entry	*override_seq;
>> +	unsigned int			override_seq_nregs;
>> +	const struct m31_phy_tbl_entry	*reset_seq;
>> +	unsigned int			reset_seq_nregs;
>> +	unsigned int			fsel;
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
>> +};
>> +
>> +struct m31eusb2_phy {
>> +	struct phy			*phy;
>> +	void __iomem			*base;
>> +	const struct m31_eusb2_priv_data	*data;
>> +
>> +	struct regulator		*vreg;
>> +	struct clk			*clk;
>> +	struct reset_control		*reset;
>> +
>> +	struct phy *repeater;
>> +};
>> +
>> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
>> +					const u32 mask, u32 val)
>> +{
>> +	u32 write_val, tmp = readl_relaxed(base + offset);
>> +
>> +	tmp &= ~mask;
>> +	write_val = tmp | val;
>> +
>> +	writel_relaxed(write_val, base + offset);
>> +
>> +	tmp = readl_relaxed(base + offset);
>> +	tmp &= mask;
>> +
>> +	if (tmp != val)
>> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
>> +}
>> +
>> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
>> +					const struct m31_phy_tbl_entry *tbl,
>> +					int num)
>> +{
>> +	int i;
>> +
>> +	for (i = 0 ; i < num; i++, tbl++) {
>> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
>> +					tbl->off, tbl->mask, tbl->val);
>> +
>> +		msm_m31_eusb2_write_readback(phy->base,
>> +					tbl->off, tbl->mask,
>> +					tbl->val << __ffs(tbl->mask));
> 
> could you please check, what actually gets written? I suspect there
> should be a -1 here.
> 

The __ffs  uses the ctz/ctzl built in, which counts leading zeros, so the
-1 should already be accounted for.  FIELD_PREP uses the ffs builtin
directly, which would require the -1.  Confirmed that the writes are being
done as expected from the programming tables above.

Thanks
Wesley Cheng

