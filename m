Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH41RNED5+clJ8bDU3yrsPjDBxC2yWIilI8EOLE574U=; b=22PKFfgMyb7T670Vf0t+qFq30Q
	EbnQlRAdI5NOKy9RxO04tmEyr0X52H71TmalqhkS10hDXic0Ylj3AxV6BeYAorzLcJXMHDYGZ7QA7
	6NBAurjrpNCVgeHf/tZb2OXhyY/6dF5b8F3X5+Dvy/oTlLSgZtHNrGl+h9ApeI7R7hx6IXoHP7yzI
	ZmRDC1XLk03K9wDJfDiBqP/2D9D2fRjKlN2Aeic1675ZVBV8wv7JYJCgPxWB6+JnflJk1wTJBJGaa
	TPThBqZn4ZmWK3x/YJrPQjIjOFwyAwnxLa6jOFGVEZ9Dw1wSQuqOQWclq1r7E3W/HAM2sAumW0hBy
	KI6qzhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheJE-00000000oDe-1gvo;
	Thu, 09 Jul 2026 02:16:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheJC-00000000oCh-0HN9;
	Thu, 09 Jul 2026 02:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1783563355;
	bh=tH41RNED5+clJ8bDU3yrsPjDBxC2yWIilI8EOLE574U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftms0R3l1Hxi9KJ9589VO97Frg6kN7OeNXibsjqRd65pV+OUowKvaK4G4y+TYgTcP
	 uB8ZX8+0DdAGA9lY46OHDqUkT6OKe9E+U6Qv3eAvvB2EFuX83vJgLY32mW9W7R2I3G
	 +bdp1eQu07nsN0ZxcHvRxL+ScRsJuX6dFWeI1ii/hsUmk6FVy6+KDGykQo2oHiHIm9
	 4FEHkiIC5/XDz69xWmYZ9N8Ig7zcnjVc4pCi+OBHq3yDJBRjbDDph0P556SoViAXfd
	 92Bij0zFycrY5a3rYKvMIzMD5MaGxwK7jNQEI3u5uDKgKDeiaeMte/jhozACIZDuW1
	 4PMwao+akqDRQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4823960288;
	Thu,  9 Jul 2026 10:15:53 +0800 (AWST)
Message-ID: <ddb133ca1a3be605ee776b2276c1907c9ad32491.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Jul 2026 11:45:52 +0930
In-Reply-To: <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
References: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
	 <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_191614_309527_23CFB811 
X-CRM114-Status: GOOD (  19.19  )
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

Hi Ryan,

On Fri, 2026-01-16 at 10:53 +0800, Ryan Chen wrote:


...

> diff --git a/drivers/phy/aspeed/phy-aspeed-usb3.c b/drivers/phy/aspeed/ph=
y-aspeed-usb3.c
> new file mode 100644
> index 000000000000..872d2163fcf5
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-usb3.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#define PHY3S00		0x00
> +#define PHY3S00_INIT_DONE		BIT(15)
> +#define PHY3S00_SRAM_BYPASS		BIT(7)
> +#define PHY3S00_SRAM_EXT_LOAD	BIT(6)
>=20

...

> +
> +static int aspeed_usb3_phy_init(struct phy *phy)
> +{
> +	struct aspeed_usb3_phy *aspeed_phy =3D phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(aspeed_phy->clk);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "Failed to enable clock %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(aspeed_phy->rst);
> +	if (ret) {
> +		clk_disable_unprepare(aspeed_phy->clk);
> +		return ret;

Nit: Given we have to do this below if the reset_control_deassert()
succeeds, perhaps add a label below and use goto here?

> +	}
> +
> +	/* Wait for USB3 PHY internal SRAM initialization done */
> +	ret =3D readl_poll_timeout(aspeed_phy->regs + PHY3S00, val,
> +				 val & PHY3S00_INIT_DONE,
> +				 USEC_PER_MSEC, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "SRAM init timeout\n");
> +		goto err_assert_reset;
> +	}
> +
> +	val =3D readl(aspeed_phy->regs + PHY3S00);
> +	val |=3D PHY3S00_SRAM_BYPASS;
> +	writel(val, aspeed_phy->regs + PHY3S00);

According to the datasheet PHY3S00[15] (PHY3S00_INIT_DONE above)
indicates that the PHY internal SRAM initialisation is complete. The
datasheet reports the SRAM is used for configuration of calibration
among other things. PHY3S00[6] instructs the PHY that software has
completed loading the configuration data into SRAM, however
PHY3S00_SRAM_BYPASS (PHY3S00[7]) tells the PHY to load configuration
from "hard wired" values.

Is it necessary to wait for SRAM initialisation to complete if we're
bypassing it? Or are there other side-effects involved in the setting
of PHY3S00[15]?

> +
> +	/* Set protocol1_ext signals as default PHY3 settings based on SNPS doc=
uments.
> +	 * Including PCFGI[54]: protocol1_ext_rx_los_lfps_en for better compati=
bility
> +	 */
> +	writel(PHY3P00_DEFAULT, aspeed_phy->regs + PHY3P00);
> +	writel(PHY3P04_DEFAULT, aspeed_phy->regs + PHY3P04);
> +	writel(PHY3P08_DEFAULT, aspeed_phy->regs + PHY3P08);
> +	writel(PHY3P0C_DEFAULT, aspeed_phy->regs + PHY3P0C);
> +
> +	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(aspeed_phy->rst);
> +	clk_disable_unprepare(aspeed_phy->clk);
> +	return ret;
> +}
>=20

...

>=20
> +static struct platform_driver aspeed_usb3_phy_driver =3D {
> +	.probe		=3D aspeed_usb3_phy_probe,
> +	.driver		=3D {
> +		.name	=3D KBUILD_MODNAME,
> +		.of_match_table	=3D aspeed_usb3_phy_match_table,
> +	},
> +};
> +module_platform_driver(aspeed_usb3_phy_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("ASPEED USB3.0 PHY Driver");

MODULE_AUTHOR()?

Andrew

