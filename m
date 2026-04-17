Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8674F8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYbv53LE8/LhMGLZZozxK2INqCGiYtH4XKtdiuLZJPQ=; b=0lGe9iw9f7SUw3HIIq6zRpnON+
	3N74+Z7QzrrTzWq+w0BaMX3cZYPVbuiVBbYIT5enIBn/bMpZAFNEJbj8982TL5lLKChDRzl5BL+x3
	LF71wRyQ2o6QYbTszlWH58UrRHivT5alclBl0LT+CRzoNqFGgIXC5GI1z/fdsBJdafOcc88q9N4eO
	MFP+JHDQi/51h8r21p4PQXArXTCx9qiMaIJFSlB9pYtCQe+tWCCMBzyE9TiZo02LH5N+K0++X3XSE
	UnQKPwqI+EUNQlxEQwz6d7vjfng8PYr5jAIaQKuOxUdTMyilTEemCnQV/R0MwGX95lQHtHQCfJSFm
	CtNuKYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdtq-00000003cP0-0OCd;
	Fri, 17 Apr 2026 07:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdto-00000003cOp-2It6;
	Fri, 17 Apr 2026 07:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BYbv53LE8/LhMGLZZozxK2INqCGiYtH4XKtdiuLZJPQ=; b=aMtoKTOWBvG1JEt0VIqvAvvtD6
	TC8t4rb9SL3vOjjnJqD7o8vg1que/Wx3qf7fUXW2cN6Y8LyN9fCk+dpYtD7vmYGavfS8YMXP331iO
	LPfPnDr76Oz0U0F3hJMl1s42pyCRpCyQYEk6bWw+p1saoHFSazzJ0tl8BKoQq0AHqOy2qbb+xDow+
	imi/3ew1mEeMA6NI6GHqG4KuuiSOSoeMi5HR0aS/UrXCZiKOngxEI+eTIlO0B+3KlGUuzdMOl23Gt
	HHcIkWBhOVs00sNqrTKPWDMbtttf1Gwa7nIBxOufyjJGagYQquBYOyq6GRhuDIsP2N1cSueu08JMA
	HLr1VFeg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdtl-00000004vGM-0DRM;
	Fri, 17 Apr 2026 07:45:59 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63H7jnV633464891, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776411949; bh=BYbv53LE8/LhMGLZZozxK2INqCGiYtH4XKtdiuLZJPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MMIifCz81wM57VwrsvswbuK0z/4MdMW/mw7DNEp9T+L5dk38xISJS5hD0CL1aievc
	 8B94pZDjoKLmi4nmG0xGJGA9izN5MFwSeTAd7xips7pS/fO+Eadf4FCF2D0cHnV/hK
	 NaUfAvZWTmR0w5gv4/d2T6oLP4o5hdm+WzRbvBXh8pBKm0v+hnQDHpZ/Sk5IcJLwmi
	 /uCL+Bj9i6yH98f0RYYrRo5kgFrF7ZiZvakzznHwzQjK8tZFl2Hr18vhQmtvky/ifT
	 dWYq2VeDlOViRvN1u2cxniZ0JdKfwhNVDTJ0P8sC1bmr0prn8Nnnp3Ru1xMvbI1li8
	 i5O9vgs08w9kQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63H7jnV633464891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:45:49 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:45:49 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:45:48 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 17 Apr 2026 15:45:48 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 08/10] clk: realtek: Add RTD1625-CRT clock controller driver
Date: Fri, 17 Apr 2026 15:45:48 +0800
Message-ID: <20260417074548.1605550-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_bsflBlSGf9M-h@redhat.com>
References: <ac_bsflBlSGf9M-h@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_084557_705011_D1883E43 
X-CRM114-Status: GOOD (  31.53  )
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

Hi Brian,

> Hi Yu-Chun,
> 

(snip)

> > +
> > +static const struct reg_sequence pll_acpu_seq_power_off[] = {
> > +	{RTD1625_REG_PLL_ACPU2,         0x4},
> > +};
> > +
> > +static const struct reg_sequence pll_acpu_seq_pre_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
> > +};
> > +
> > +static const struct reg_sequence pll_acpu_seq_post_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5},
> > +};
> > +
> > +static struct clk_pll pll_acpu = {
>
> static const?
>

The clock object should not be declared as const.

> > +	.clkr.hw.init = CLK_HW_INIT("pll_acpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> > +	.seq_power_on          = pll_acpu_seq_power_on,
> > +	.num_seq_power_on      = ARRAY_SIZE(pll_acpu_seq_power_on),
> > +	.seq_power_off         = pll_acpu_seq_power_off,
> > +	.num_seq_power_off     = ARRAY_SIZE(pll_acpu_seq_power_off),
> > +	.seq_pre_set_freq      = pll_acpu_seq_pre_set_freq,
> > +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_acpu_seq_pre_set_freq),
> > +	.seq_post_set_freq     = pll_acpu_seq_post_set_freq,
> > +	.num_seq_post_set_freq = ARRAY_SIZE(pll_acpu_seq_post_set_freq),
> > +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_ACPU1,
> > +	.freq_tbl              = acpu_tbl,
> > +	.freq_mask             = FREQ_NF_MASK,
> > +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2,
> > +	.freq_ready_mask       = BIT(20),
> > +	.freq_ready_val        = BIT(20),
> > +	.power_reg             = RTD1625_REG_PLL_ACPU2,
> > +	.power_mask            = 0x7,
> > +	.power_val_on          = 0x3,
> > +};

(snip)

> > +
> > +static const struct reg_sequence pll_ve1_seq_post_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5},
> > +};
> > +
> > +static struct clk_pll pll_ve1 = {
> 
> Same here about static const, plus some others below?
>

No. The clock object cannot be const.

(snip)

> > +static const struct of_device_id rtd1625_crt_match[] = {
> > +	{.compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc,},
> > +	{/* sentinel */}
>
> Add a space around the comment like so:
>
> { /* sentinel */ }
>

Ack.

>
> > +};
> > +
> > +static struct platform_driver rtd1625_crt_driver = {
> > +	.probe = rtd1625_crt_probe,
> > +	.driver = {
> > +		.name = "rtk-rtd1625-crt-clk",
> > +		.of_match_table = rtd1625_crt_match,
> > +	},
> > +};
> > +
> > +static int __init rtd1625_crt_init(void)
> > +{
> > +	return platform_driver_register(&rtd1625_crt_driver);
> > +}
> > +subsys_initcall(rtd1625_crt_init);
> > +
> > +MODULE_DESCRIPTION("Reatek RTD1625 CRT Controller Driver");
>
>s/Reatek/Realtex/
>

Will fix it.

> > +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("REALTEK_CLK");
> > diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
> > index 99a14d355803..a44c7834191c 100644
> > --- a/drivers/reset/realtek/Kconfig
> > +++ b/drivers/reset/realtek/Kconfig
> > @@ -1,3 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config RESET_RTK_COMMON
> >  	bool
> > +	select AUXILIARY_BUS
> > +	default COMMON_CLK_RTD1625
> > diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
> > index b59a3f7f2453..8ca1fa939f10 100644
> > --- a/drivers/reset/realtek/Makefile
> > +++ b/drivers/reset/realtek/Makefile
> > @@ -1,2 +1,2 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-$(CONFIG_RESET_RTK_COMMON) += common.o
> > +obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o
>
>CONFIG_RESET_RTK_COMMON is supposed to be common, right? If so, the
> SoC-specific driver shouldn't be included here.
>

This Makefile will change to

obj-$(CONFIG_RESET_RTK_COMMON) += common.o
obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o

> > diff --git a/drivers/reset/realtek/reset-rtd1625-crt.c b/drivers/reset/realtek/reset-rtd1625-crt.c
> > new file mode 100644
> > index 000000000000..ebb15bb68885
> > --- /dev/null
> > +++ b/drivers/reset/realtek/reset-rtd1625-crt.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Realtek Semiconductor Corporation
> > + */
> > +
> > +#include <dt-bindings/reset/realtek,rtd1625.h>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/slab.h>
> > +#include "common.h"
> > +
> > +#define RTD1625_CRT_RSTN_MAX	123
> > +
> > +static struct rtk_reset_desc rtd1625_crt_reset_descs[] = {
> > +	/* Bank 0: offset 0x0 */
> > +	[RTD1625_CRT_RSTN_MISC]         = { .ofs = 0x0, .bit = 0,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DIP]          = { .ofs = 0x0, .bit = 2,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_GSPI]         = { .ofs = 0x0, .bit = 4,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS]          = { .ofs = 0x0, .bit = 6,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS_REG]      = { .ofs = 0x0, .bit = 8,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS_PHY]      = { .ofs = 0x0, .bit = 10, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_GPU2D]        = { .ofs = 0x0, .bit = 12, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DC_PHY]       = { .ofs = 0x0, .bit = 22, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DCPHY_CRT]    = { .ofs = 0x0, .bit = 24, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_LSADC]        = { .ofs = 0x0, .bit = 26, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SE]           = { .ofs = 0x0, .bit = 28, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DLA]          = { .ofs = 0x0, .bit = 30, .write_en = 1 },
>
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
>    Can this cause undefined behavior during reset mask computation?
>    
>    Several reset array entries set .bit = 30 and .write_en = 1. In
>    rtk_reset_assert() and rtk_reset_deassert(), if the bitmask is computed as
>    0x3 << desc->bit, 0x3 is a signed 32-bit integer literal. Left-shifting it by
>    30 results in 0xC0000000, which exceeds the maximum positive value for a
>    signed 32-bit integer.
>
>    Modifying the sign bit via left-shift on a signed type invokes undefined
>    behavior in C. Would an unsigned literal (e.g., 0x3U << desc->bit) be needed
>    to safely construct the mask?

Agreed, Will make it 0x3U.

(snip)

> > +
> > +static int rtd1625_crt_reset_probe(struct auxiliary_device *adev,
> > +				   const struct auxiliary_device_id *id)
> > +{
> > +	struct device *dev = &adev->dev;
> > +	struct rtk_reset_data *data;
> > +
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->descs           = rtd1625_crt_reset_descs;
> > +	data->rcdev.nr_resets = RTD1625_CRT_RSTN_MAX;
> > +	return rtk_reset_controller_add(dev, data);
>
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
>    Will the reset controller driver unconditionally fail to probe with -ENODEV
>    due to an incompatible regmap acquisition method?
>
>    The rtk_reset_controller_add() helper attempts to retrieve the shared regmap
>    from the parent clock device using dev_get_regmap(parent, NULL). However, the
>    parent clock driver (rtk_clk_probe()) acquires its regmap via
>    device_node_to_regmap().
>
>    This syscon helper creates the regmap but does not associate it with the
>    parent struct device via devres. Because the regmap is absent from the
>    parent's devres list, dev_get_regmap() will always return NULL, causing the
>    reset driver probe to fail unconditionally and leaving dependent peripherals
>    without reset control.
>
> Brian
>

Thanks for identifying this issue. I've fixed the regmap passing mechanism:

Changes:
1. 'rtk_reset_controller_register()' in clk/realtek/common.c passes the
regmap as platform data via 'devm_auxiliary_device_create()'
2. 'rtk_reset_controller_add()' in reset/realtek/common.c retrieves it
using 'dev_get_platdata()' instead of 'dev_get_regmap()'

This ensures the reset controller can access the shared regmap regardless
of how the parent clock driver acquired it

Best Regards,
Yu-Chun

