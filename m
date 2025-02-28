Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF5C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwRV8WMfLDZGJOEdL/Os8KJlIUCcHfqN/CQfNqKMisw=; b=iEs1adNDrv50Val4ONufFg3XQb
	2hoNj24cWgBfsTl9wW/NV4xxAcBkOGmFVIUI9ar1m8OiU3JQ1QfPuI5yHnkfGcSNLMCFN11ACceJU
	6J8S1RLgdb2Qh8Uv3FaOGQ87ygEtfb6DxC6EYHwn8eCnEu2878zXn357XNHvgAIQqf1yV5qLiiQwy
	57lTpEefXzx9+caTj6+3kwGqlHycgyJyFZBYi0GlcYWhNiohU9DMf1wV3Q9700kBDwA/rd6twCmui
	l+qXjz3h0s4JSPZdrhbpHMeBFRVXdUDCbjyEsXXUU8ZJUwuXbLasngXSCEAq1jUi0Kz2TdJyzfJDR
	UefRjfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1ZU-0000000BJAx-2y7R;
	Fri, 28 Feb 2025 14:42:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1El-0000000BEuB-0Mxp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA84C1515;
	Fri, 28 Feb 2025 06:21:25 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF833F6A8;
	Fri, 28 Feb 2025 06:21:08 -0800 (PST)
Date: Fri, 28 Feb 2025 14:21:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] clk: sunxi-ng: a523: add reset lines
Message-ID: <20250228142105.3ce2f2df@donnerap.manchester.arm.com>
In-Reply-To: <15399016.tv2OnDr8pf@jernej-laptop>
References: <20250214125359.5204-1-andre.przywara@arm.com>
	<20250214125359.5204-14-andre.przywara@arm.com>
	<15399016.tv2OnDr8pf@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_062111_218195_5A35BD42 
X-CRM114-Status: GOOD (  29.29  )
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

On Tue, 18 Feb 2025 21:29:37 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 14. februar 2025 ob 13:53:57 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > Allwinner SoCs do not contain a separate reset controller, instead the
> > reset lines for the various devices are integrated into the "BGR" (Bus
> > Gate / Reset) registers, for each device group: one for all UARTs, one
> > for all SPI interfaces, and so on.
> > The Allwinner CCU driver also doubles as a reset provider, and since the
> > reset lines are indeed just single bits in those BGR register, we can
> > represent them easily in an array of structs, just containing the
> > register offset and the bit number.
> >=20
> > Add the location of the reset bits for all devices in the A523/T527
> > SoCs, using the existing sunxi CCU infrastructure.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 83 ++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523.c
> > index fbed9b2b3b2f9..d57565f07a112 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > @@ -1475,11 +1475,94 @@ static struct clk_hw_onecell_data sun55i_a523_h=
w_clks =3D {
> >  	},
> >  };
> > =20
> > +static struct ccu_reset_map sun55i_a523_ccu_resets[] =3D {
> > +	[RST_MBUS]		=3D { 0x540, BIT(30) },
> > +	[RST_BUS_NSI]		=3D { 0x54c, BIT(16) },
> > +	[RST_BUS_DE]		=3D { 0x60c, BIT(16) },
> > +	[RST_BUS_DI]		=3D { 0x62c, BIT(16) },
> > +	[RST_BUS_G2D]		=3D { 0x63c, BIT(16) },
> > +	[RST_BUS_SYS]		=3D { 0x64c, BIT(16) },
> > +	[RST_BUS_GPU]		=3D { 0x67c, BIT(16) },
> > +	[RST_BUS_CE]		=3D { 0x68c, BIT(16) },
> > +	[RST_BUS_SYS_CE]	=3D { 0x68c, BIT(17) },
> > +	[RST_BUS_VE]		=3D { 0x69c, BIT(16) },
> > +	[RST_BUS_DMA]		=3D { 0x70c, BIT(16) },
> > +	[RST_BUS_MSGBOX]	=3D { 0x71c, BIT(16) },
> > +	[RST_BUS_SPINLOCK]	=3D { 0x72c, BIT(16) },
> > +	[RST_BUS_CPUXTIMER]	=3D { 0x74c, BIT(16) },
> > +	[RST_BUS_DBG]		=3D { 0x78c, BIT(16) },
> > +	[RST_BUS_PWM0]		=3D { 0x7ac, BIT(16) },
> > +	[RST_BUS_PWM1]		=3D { 0x7ac, BIT(17) },
> > +	[RST_BUS_DRAM]		=3D { 0x80c, BIT(16) },
> > +	[RST_BUS_NAND]		=3D { 0x82c, BIT(16) },
> > +	[RST_BUS_MMC0]		=3D { 0x84c, BIT(16) },
> > +	[RST_BUS_MMC1]		=3D { 0x84c, BIT(17) },
> > +	[RST_BUS_MMC2]		=3D { 0x84c, BIT(18) },
> > +	[RST_BUS_SYSDAP]	=3D { 0x88c, BIT(16) },
> > +	[RST_BUS_UART0]		=3D { 0x90c, BIT(16) },
> > +	[RST_BUS_UART1]		=3D { 0x90c, BIT(17) },
> > +	[RST_BUS_UART2]		=3D { 0x90c, BIT(18) },
> > +	[RST_BUS_UART3]		=3D { 0x90c, BIT(19) },
> > +	[RST_BUS_UART4]		=3D { 0x90c, BIT(20) },
> > +	[RST_BUS_UART5]		=3D { 0x90c, BIT(21) },
> > +	[RST_BUS_UART6]		=3D { 0x90c, BIT(22) },
> > +	[RST_BUS_UART7]		=3D { 0x90c, BIT(23) },
> > +	[RST_BUS_I2C0]		=3D { 0x91c, BIT(16) },
> > +	[RST_BUS_I2C1]		=3D { 0x91c, BIT(17) },
> > +	[RST_BUS_I2C2]		=3D { 0x91c, BIT(18) },
> > +	[RST_BUS_I2C3]		=3D { 0x91c, BIT(19) },
> > +	[RST_BUS_I2C4]		=3D { 0x91c, BIT(20) },
> > +	[RST_BUS_I2C5]		=3D { 0x91c, BIT(21) },
> > +	[RST_BUS_CAN]		=3D { 0x92c, BIT(16) },
> > +	[RST_BUS_SPI0]		=3D { 0x96c, BIT(16) },
> > +	[RST_BUS_SPI1]		=3D { 0x96c, BIT(17) },
> > +	[RST_BUS_SPI2]		=3D { 0x96c, BIT(18) },
> > +	[RST_BUS_SPIFC]		=3D { 0x96c, BIT(19) },
> > +	[RST_BUS_EMAC0]		=3D { 0x97c, BIT(16) },
> > +	[RST_BUS_EMAC1]		=3D { 0x98c, BIT(16) | BIT(17) },	/* GMAC1-AXI */ =20
>=20
> GMAC AXI reset should be separate.

I see where you are coming from, but what would be the advantage,
really? At the moment the generic STMMAC code and binding only knows
about one reset line, so we would need to add support for a second line
first, potentially even in generic code, but without any real win, I think.

On the other hand the reset struct supports a bit mask already, so
toggling both bits at the same time seems perfectly fine.
So to make things easier, I thought we should take advantage of that,
and having one line covering both bits. There is only one clock gate
bit for GMAC1 as well.

And I know this isn't a good argument, but the BSP does it like this as wel=
l ;-)

>=20
> > +	[RST_BUS_IR_RX]		=3D { 0x99c, BIT(16) },
> > +	[RST_BUS_IR_TX]		=3D { 0x9cc, BIT(16) },
> > +	[RST_BUS_GPADC0]	=3D { 0x9ec, BIT(16) },
> > +	[RST_BUS_GPADC1]	=3D { 0x9ec, BIT(17) },
> > +	[RST_BUS_THS]		=3D { 0x9fc, BIT(16) },
> > +	[RST_USB_PHY0]		=3D { 0xa70, BIT(30) },
> > +	[RST_USB_PHY1]		=3D { 0xa74, BIT(30) },
> > +	[RST_BUS_OHCI0]		=3D { 0xa8c, BIT(16) },
> > +	[RST_BUS_OHCI1]		=3D { 0xa8c, BIT(17) },
> > +	[RST_BUS_EHCI0]		=3D { 0xa8c, BIT(20) },
> > +	[RST_BUS_EHCI1]		=3D { 0xa8c, BIT(21) },
> > +	[RST_BUS_OTG]		=3D { 0xa8c, BIT(24) },
> > +	[RST_BUS_3]		=3D { 0xa8c, BIT(25) },	/* BSP + register */
> > +	[RST_BUS_LRADC]		=3D { 0xa9c, BIT(16) },
> > +	[RST_BUS_PCIE_USB3]	=3D { 0xaac, BIT(16) },
> > +	[RST_BUS_DPSS_TOP]	=3D { 0xabc, BIT(16) }, =20
>=20
> Docs say that there is extra display top reset at 0xacc.

Right, also the name is better there: RST_BUS_DISPLAY[01]. Fixed that.

Cheers,
Andre

>=20
> > +	[RST_BUS_HDMI_MAIN]	=3D { 0xb1c, BIT(16) },
> > +	[RST_BUS_HDMI_SUB]	=3D { 0xb1c, BIT(17) },
> > +	[RST_BUS_MIPI_DSI0]	=3D { 0xb4c, BIT(16) },
> > +	[RST_BUS_MIPI_DSI1]	=3D { 0xb4c, BIT(17) },
> > +	[RST_BUS_TCON_LCD0]	=3D { 0xb7c, BIT(16) },
> > +	[RST_BUS_TCON_LCD1]	=3D { 0xb7c, BIT(17) },
> > +	[RST_BUS_TCON_LCD2]	=3D { 0xb7c, BIT(18) },
> > +	[RST_BUS_TCON_TV0]	=3D { 0xb9c, BIT(16) },
> > +	[RST_BUS_TCON_TV1]	=3D { 0xb9c, BIT(17) },
> > +	[RST_BUS_LVDS0]		=3D { 0xbac, BIT(16) },
> > +	[RST_BUS_LVDS1]		=3D { 0xbac, BIT(17) },
> > +	[RST_BUS_EDP]		=3D { 0xbbc, BIT(16) },
> > +	[RST_BUS_VIDEO_OUT0]	=3D { 0xbcc, BIT(16) },
> > +	[RST_BUS_VIDEO_OUT1]	=3D { 0xbcc, BIT(17) },
> > +	[RST_BUS_LEDC]		=3D { 0xbfc, BIT(16) },
> > +	[RST_BUS_CSI]		=3D { 0xc1c, BIT(16) },
> > +	[RST_BUS_ISP]		=3D { 0xc2c, BIT(16) },	/* BSP + register */
> > +};
> > +
> >  static const struct sunxi_ccu_desc sun55i_a523_ccu_desc =3D {
> >  	.ccu_clks	=3D sun55i_a523_ccu_clks,
> >  	.num_ccu_clks	=3D ARRAY_SIZE(sun55i_a523_ccu_clks),
> > =20
> >  	.hw_clks	=3D &sun55i_a523_hw_clks,
> > +
> > +	.resets		=3D sun55i_a523_ccu_resets,
> > +	.num_resets	=3D ARRAY_SIZE(sun55i_a523_ccu_resets),
> >  };
> > =20
> >  static const u32 pll_regs[] =3D {
> >  =20
>=20
>=20
>=20
>=20


