Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3504C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6DUI8NYRE2hBceBFhoRKQYaZh341vHeop9l2vwycKs=; b=lV6Rt0xfC5SfWmQLfrrVWxH3iW
	G7r5vf8fqJENN4yZW0AxC/pPE+XW0wgZDai3B69Ai5jLvnQ10Z7fTUQfGEK6Gkr6Wq9szHiaQhKk3
	QNo9amajk609MXKeC7ag1iH/bqVPHLJXRNAV+hpsmdMcSnI2OtfOZzMe2ikRYNbGgcmoQK8m/tXqP
	WEn6v9yLTI9mY7ItSZ7wpx9ry4obj81/mlGB8VOvstZpdcbzGpLdSjBh/zF4/IcX/b+ejDhQTjwem
	3cDmcRnbq5B6dV0aKmrWx2ngvDi0FlCJNho72LjU7kVRC/wRBAcE3R0rWTOd4ebtKF5CC4uQYFp8y
	yOCcBwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0gS-0000000B7GK-3yNx;
	Fri, 28 Feb 2025 13:45:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0ek-0000000B6uA-3yV0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:44:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB0621515;
	Fri, 28 Feb 2025 05:44:13 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 966F73F5A1;
	Fri, 28 Feb 2025 05:43:56 -0800 (PST)
Date: Fri, 28 Feb 2025 13:43:53 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <20250228134353.6fa9e01d@donnerap.manchester.arm.com>
In-Reply-To: <2013031.usQuhbGJ8B@jernej-laptop>
References: <20250214125359.5204-1-andre.przywara@arm.com>
	<20250214125359.5204-9-andre.przywara@arm.com>
	<2013031.usQuhbGJ8B@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_054359_069890_19236BB9 
X-CRM114-Status: GOOD (  18.64  )
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

On Tue, 18 Feb 2025 20:34:27 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 14. februar 2025 ob 13:53:52 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > Add the clocks driving some core system related subsystems of the SoC:
> > the "CE" crypto engine, the high speed timers, the DRAM and the associa=
ted
> > MBUS clock, and the PCIe clock.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 119 +++++++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523.c
> > index 0ef1fd71a1ca5..b68c44bce825f 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > @@ -423,6 +423,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu"=
, gpu_parents, 0x670,
> >  				    BIT(31),	/* gate */
> >  				    0);
> > =20
> > +static const struct clk_parent_data ce_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .hw =3D &pll_periph0_480M_clk.common.hw },
> > +	{ .hw =3D &pll_periph0_400M_clk.hw },
> > +	{ .hw =3D &pll_periph0_300M_clk.hw },
> > +};
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ce_clk, "ce", ce_parents, 0x680,
> > +				       0, 5,	/* M */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       0);
> > +
> >  static const struct clk_hw *ve_parents[] =3D {
> >  	&pll_ve_clk.common.hw,
> >  	&pll_periph0_480M_clk.common.hw,
> > @@ -435,6 +447,65 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", =
ve_parents, 0x690,
> >  				    BIT(31),	/* gate */
> >  				    CLK_SET_RATE_PARENT);
> > =20
> > +static const struct clk_parent_data hstimer_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .fw_name =3D "iosc" },
> > +	{ .fw_name =3D "losc" },
> > +	{ .hw =3D &pll_periph0_200M_clk.hw },
> > +};
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > +				       hstimer_parents, 0x730,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT); =20
>=20
> CLK_SET_RATE_PARENT doesn't make much sense for fixed clocks.

That's a very good point ;-)
Removed.

> > +
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
> > +				       hstimer_parents,
> > +				       0x734,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT);
> > +
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
> > +				       hstimer_parents,
> > +				       0x738,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT);
> > +
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
> > +				       hstimer_parents,
> > +				       0x73c,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT);
> > +
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
> > +				       hstimer_parents,
> > +				       0x740,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT);
> > +
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
> > +				       hstimer_parents,
> > +				       0x744,
> > +				       0, 0,	/* M */
> > +				       0, 3,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       CLK_SET_RATE_PARENT);
> > +
> >  static const struct clk_parent_data iommu_parents[] =3D {
> >  	{ .hw =3D &pll_periph0_600M_clk.hw },
> >  	{ .hw =3D &pll_ddr0_clk.common.hw },
> > @@ -450,6 +521,34 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(iommu_clk, "=
iommu", iommu_parents, 0x7b0,
> >  				      BIT(31),	/* gate */
> >  				      CLK_SET_RATE_PARENT);
> > =20
> > +static const struct clk_hw *dram_parents[] =3D {
> > +	&pll_ddr0_clk.common.hw,
> > +	&pll_periph0_600M_clk.hw,
> > +	&pll_periph0_480M_clk.common.hw,
> > +	&pll_periph0_400M_clk.hw,
> > +	&pll_periph0_150M_clk.hw,
> > +};
> > +static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dram", dram_parents, 0x=
800,
> > +				    0, 5,	/* M */
> > +				    24, 3,	/* mux */
> > +				    BIT(31),	/* gate */
> > +				    CLK_IS_CRITICAL); =20
>=20
> Same comment as for IOMMU clock. Update bit is needed to actually apply c=
onfiguration.

Fixed now.

Thanks!
Andre

>=20
> Best regards,
> Jernej
>=20
> > +
> > +static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
> > +			   &dram_clk.common.hw, 4, 1, 0);
> > +
> > +static const struct clk_parent_data losc_hosc_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .fw_name =3D "losc" },
> > +};
> > +
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(pcie_aux_clk, "pcie-aux",
> > +				      losc_hosc_parents, 0xaa0,
> > +				      0, 5,	/* M */
> > +				      24, 1,	/* mux */
> > +				      BIT(31),	/* gate */
> > +				      0);
> > +
> >  static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M, 0xb04, BI=
T(31), 0);
> > =20
> >  /* TODO: add mux between 32kOSC and PERIPH0/18750 */
> > @@ -584,8 +683,17 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
> >  	&di_clk.common,
> >  	&g2d_clk.common,
> >  	&gpu_clk.common,
> > +	&ce_clk.common,
> >  	&ve_clk.common,
> > +	&hstimer0_clk.common,
> > +	&hstimer1_clk.common,
> > +	&hstimer2_clk.common,
> > +	&hstimer3_clk.common,
> > +	&hstimer4_clk.common,
> > +	&hstimer5_clk.common,
> >  	&iommu_clk.common,
> > +	&dram_clk.common,
> > +	&pcie_aux_clk.common,
> >  	&hdmi_24M_clk.common,
> >  	&hdmi_cec_32k_clk.common,
> >  	&hdmi_cec_clk.common,
> > @@ -644,11 +752,22 @@ static struct clk_hw_onecell_data sun55i_a523_hw_=
clks =3D {
> >  		[CLK_AHB]		=3D &ahb_clk.common.hw,
> >  		[CLK_APB0]		=3D &apb0_clk.common.hw,
> >  		[CLK_APB1]		=3D &apb1_clk.common.hw,
> > +		[CLK_MBUS]		=3D &mbus_clk.hw,
> >  		[CLK_DE]		=3D &de_clk.common.hw,
> >  		[CLK_DI]		=3D &di_clk.common.hw,
> >  		[CLK_G2D]		=3D &g2d_clk.common.hw,
> >  		[CLK_GPU]		=3D &gpu_clk.common.hw,
> > +		[CLK_CE]		=3D &ce_clk.common.hw,
> >  		[CLK_VE]		=3D &ve_clk.common.hw,
> > +		[CLK_HSTIMER0]		=3D &hstimer0_clk.common.hw,
> > +		[CLK_HSTIMER1]		=3D &hstimer1_clk.common.hw,
> > +		[CLK_HSTIMER2]		=3D &hstimer2_clk.common.hw,
> > +		[CLK_HSTIMER3]		=3D &hstimer3_clk.common.hw,
> > +		[CLK_HSTIMER4]		=3D &hstimer4_clk.common.hw,
> > +		[CLK_HSTIMER5]		=3D &hstimer5_clk.common.hw,
> > +		[CLK_IOMMU]		=3D &iommu_clk.common.hw,
> > +		[CLK_DRAM]		=3D &dram_clk.common.hw,
> > +		[CLK_PCIE_AUX]		=3D &pcie_aux_clk.common.hw,
> >  		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
> >  		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
> >  		[CLK_HDMI_CEC]		=3D &hdmi_cec_clk.common.hw,
> >  =20
>=20
>=20
>=20
>=20


