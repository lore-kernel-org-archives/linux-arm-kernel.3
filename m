Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26328C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3h7DMExfh+U0TMckAVZZKzDajntYDOjiuBla0KhdVw=; b=LiQ2rRzmAwpqN6Ef44dJ0/rGa4
	D15k1VbXBYAmQXly0ae0nRzIQyBtnoWQpXiXbMwPT4Rfzd4StjPJMgRsxv98vUznZ9+irMeeA3dkh
	XniNAlJPoI5AjqF0ogicGZVLX+bcdoHzKTPYbC7cdjKSAZmPGRDGCoAHVLGa5iwHz858cd2yey20+
	0N51B6zF3kxoHl2GHK6RgwvP+CuAmw9jqm1PuW6zHGNwJ6Wl6PwtJmw4KKsaMsTqiTU+QJewAuygo
	MLJJcQXL8ohipmYSfentcwSX+1Lj6QYBBY0/5V3NNVw3ZRTmnrvYgfDgt5ite44PfptYSRUtJpTqZ
	+g4z5XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0ik-0000000B80n-0Jn9;
	Fri, 28 Feb 2025 13:48:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0hA-0000000B7ZG-3Rf6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Feb 2025 13:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U3h7DMExfh+U0TMckAVZZKzDajntYDOjiuBla0KhdVw=; b=oYcFOP+lGbb/Tl9IkvTP7XprpC
	E/iXzWdy9E4qft7Y1zlbwF0aE+mtkeHtRK/9Pzx606/g5XzG9tS/QAUer1u/k/9W8U/Sf1qu1Lnx9
	w8iZKsLrOS75Np9vl9yayLRfTh1b79Kk6Dy5tMmeMeT+4ngOuuoQoH4SvIXMB28SoruDKUGDsa/lC
	q+bvUAqpyJYEuKB9DhG4E3jybmKB4y1IxisyH7mJQvwONnpwFlmFEs3etPLLa5l67F6Qi3CQQO/7q
	HQRv0NvWMmYnyLQ38+ZRtGJNaFxWvF9Bv6UsB64FNGDgS9PB4+i4yTZIDoWmf2JpFsQ0qgaZuZruB
	BTx25qSA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0h7-00000003zBQ-0osM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:46:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96C931515;
	Fri, 28 Feb 2025 05:46:37 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9627F3F5A1;
	Fri, 28 Feb 2025 05:46:20 -0800 (PST)
Date: Fri, 28 Feb 2025 13:46:18 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] clk: sunxi-ng: a523: add interface mod clocks
Message-ID: <20250228134618.71644cda@donnerap.manchester.arm.com>
In-Reply-To: <2641802.Lt9SDvczpP@jernej-laptop>
References: <20250214125359.5204-1-andre.przywara@arm.com>
	<20250214125359.5204-10-andre.przywara@arm.com>
	<2641802.Lt9SDvczpP@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134625_646718_D2FB7A96 
X-CRM114-Status: GOOD (  18.33  )
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

On Tue, 18 Feb 2025 20:42:48 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

many thanks for staying on this and digging into the details!

> Dne petek, 14. februar 2025 ob 13:53:53 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > Add the clocks driving what the user manual summarises under "interface"
> > devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
> > general purpose analogue/digital converter.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 160 +++++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523.c
> > index b68c44bce825f..14d13fb16dfbb 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > @@ -113,6 +113,9 @@ static CLK_FIXED_FACTOR_HWS(pll_periph0_150M_clk, "=
pll-periph0-150M",
> >  			    pll_periph0_2x_hws, 8, 1, 0);
> >  static CLK_FIXED_FACTOR_HWS(pll_periph0_160M_clk, "pll-periph0-160M",
> >  			    pll_periph0_480M_hws, 3, 1, 0);
> > +static const struct clk_hw *pll_periph0_150M_hws[] =3D {
> > +	&pll_periph0_150M_clk.hw
> > +};
> > =20
> >  #define SUN55I_A523_PLL_PERIPH1_REG	0x028
> >  static struct ccu_nm pll_periph1_4x_clk =3D {
> > @@ -537,6 +540,133 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dr=
am", dram_parents, 0x800,
> >  static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
> >  			   &dram_clk.common.hw, 4, 1, 0);
> > =20
> > +static const struct clk_parent_data nand_mmc_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .hw =3D &pll_periph0_400M_clk.hw },
> > +	{ .hw =3D &pll_periph0_300M_clk.hw },
> > +	{ .hw =3D &pll_periph1_400M_clk.hw },
> > +	{ .hw =3D &pll_periph1_300M_clk.hw },
> > +};
> > +
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand0_clk, "nand0", nand_mmc_par=
ents,
> > +				    0x810,
> > +				    0, 5,	/* M */
> > +				    24, 3,	/* mux */
> > +				    BIT(31),	/* gate */
> > +				    0);
> > +
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand1_clk, "nand1", nand_mmc_par=
ents,
> > +				    0x814,
> > +				    0, 5,	/* M */
> > +				    24, 3,	/* mux */
> > +				    BIT(31),	/* gate */
> > +				    0);
> > +
> > +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc0_clk, "mmc0", nand_mmc_p=
arents,
> > +					   0x830,
> > +					   0, 5,	/* M */
> > +					   8, 5,	/* P */
> > +					   24, 3,	/* mux */
> > +					   BIT(31),	/* gate */
> > +					   2,		/* post div */
> > +					   0, CCU_FEATURE_DUAL_DIV);
> > +
> > +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc1_clk, "mmc1", nand_mmc_p=
arents,
> > +					   0x834,
> > +					   0, 5,	/* M */
> > +					   8, 5,	/* P */
> > +					   24, 3,	/* mux */
> > +					   BIT(31),	/* gate */
> > +					   2,		/* post div */
> > +					   0, CCU_FEATURE_DUAL_DIV);
> > +
> > +static const struct clk_parent_data mmc2_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .hw =3D &pll_periph0_800M_clk.common.hw },
> > +	{ .hw =3D &pll_periph0_600M_clk.hw },
> > +	{ .hw =3D &pll_periph1_800M_clk.common.hw },
> > +	{ .hw =3D &pll_periph1_600M_clk.hw },
> > +};
> > +
> > +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc2_clk, "mmc2", mmc2_paren=
ts,
> > +					   0x838,
> > +					   0, 5,	/* M */
> > +					   8, 5,	/* P */
> > +					   24, 3,	/* mux */
> > +					   BIT(31),	/* gate */
> > +					   2,		/* post div */
> > +					   0, CCU_FEATURE_DUAL_DIV);
> > +
> > +static const struct clk_parent_data spi_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .hw =3D &pll_periph0_300M_clk.hw },
> > +	{ .hw =3D &pll_periph0_200M_clk.hw },
> > +	{ .hw =3D &pll_periph1_300M_clk.hw },
> > +	{ .hw =3D &pll_periph1_200M_clk.hw },
> > +};
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi0_clk, "spi0", spi_parents, =
0x940,
> > +				       0, 5,	/* M */
> > +				       8, 5,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       0);
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi1_clk, "spi1", spi_parents, =
0x944,
> > +				       0, 5,	/* M */
> > +				       8, 5,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       0);
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi2_clk, "spi2", spi_parents, =
0x948,
> > +				       0, 5,	/* M */
> > +				       8, 5,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       0);
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spifc_clk, "spifc", nand_mmc_pa=
rents,
> > +				       0x950,
> > +				       0, 5,	/* M */
> > +				       8, 5,	/* P */
> > +				       24, 3,	/* mux */
> > +				       BIT(31),	/* gate */
> > +				       0); =20
>=20
> Missing CCU_FEATURE_DUAL_DIV flag.

Oh, indeed, for all SPI clocks, nice catch!  I introduced a new macro
for this type of clocks now: SUNXI_CCU_DUALDIV_MUX_GATE.

Cheers,
Andre

> Best regards,
> Jernej
>=20
> > +
> > +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac0_25M_clk, "emac0-25M",
> > +				      pll_periph0_150M_hws,
> > +				      0x970, BIT(31) | BIT(30), 6, 0);
> > +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac1_25M_clk, "emac1-25M",
> > +				      pll_periph0_150M_hws,
> > +				      0x974, BIT(31) | BIT(30), 6, 0);
> > +
> > +static const struct clk_parent_data ir_rx_parents[] =3D {
> > +	{ .fw_name =3D "losc" },
> > +	{ .fw_name =3D "hosc" },
> > +};
> > +
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_rx_clk, "ir-rx", ir_rx_parent=
s, 0x990,
> > +				      0, 5,	/* M */
> > +				      24, 1,	/* mux */
> > +				      BIT(31),	/* gate */
> > +				      0);
> > +static const struct clk_parent_data ir_tx_ledc_parents[] =3D {
> > +	{ .fw_name =3D "hosc" },
> > +	{ .hw =3D &pll_periph1_600M_clk.hw },
> > +};
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_tx_clk, "ir-tx", ir_tx_ledc_p=
arents,
> > +				      0x9c0,
> > +				      0, 5,	/* M */
> > +				      24, 1,	/* mux */
> > +				      BIT(31),	/* gate */
> > +				      0);
> > +
> > +static SUNXI_CCU_M_WITH_GATE(gpadc0_clk, "gpadc0", "hosc", 0x9e0,
> > +				 0, 5,		/* M */
> > +				 BIT(31),	/* gate */
> > +				 0);
> > +static SUNXI_CCU_M_WITH_GATE(gpadc1_clk, "gpadc1", "hosc", 0x9e4,
> > +				 0, 5,		/* M */
> > +				 BIT(31),	/* gate */
> > +				 0);
> > +
> >  static const struct clk_parent_data losc_hosc_parents[] =3D {
> >  	{ .fw_name =3D "hosc" },
> >  	{ .fw_name =3D "losc" },
> > @@ -693,6 +823,21 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
> >  	&hstimer5_clk.common,
> >  	&iommu_clk.common,
> >  	&dram_clk.common,
> > +	&nand0_clk.common,
> > +	&nand1_clk.common,
> > +	&mmc0_clk.common,
> > +	&mmc1_clk.common,
> > +	&mmc2_clk.common,
> > +	&spi0_clk.common,
> > +	&spi1_clk.common,
> > +	&spi2_clk.common,
> > +	&spifc_clk.common,
> > +	&emac0_25M_clk.common,
> > +	&emac1_25M_clk.common,
> > +	&ir_rx_clk.common,
> > +	&ir_tx_clk.common,
> > +	&gpadc0_clk.common,
> > +	&gpadc1_clk.common,
> >  	&pcie_aux_clk.common,
> >  	&hdmi_24M_clk.common,
> >  	&hdmi_cec_32k_clk.common,
> > @@ -767,6 +912,21 @@ static struct clk_hw_onecell_data sun55i_a523_hw_c=
lks =3D {
> >  		[CLK_HSTIMER5]		=3D &hstimer5_clk.common.hw,
> >  		[CLK_IOMMU]		=3D &iommu_clk.common.hw,
> >  		[CLK_DRAM]		=3D &dram_clk.common.hw,
> > +		[CLK_NAND0]		=3D &nand0_clk.common.hw,
> > +		[CLK_NAND1]		=3D &nand1_clk.common.hw,
> > +		[CLK_MMC0]		=3D &mmc0_clk.common.hw,
> > +		[CLK_MMC1]		=3D &mmc1_clk.common.hw,
> > +		[CLK_MMC2]		=3D &mmc2_clk.common.hw,
> > +		[CLK_SPI0]		=3D &spi0_clk.common.hw,
> > +		[CLK_SPI1]		=3D &spi1_clk.common.hw,
> > +		[CLK_SPI2]		=3D &spi2_clk.common.hw,
> > +		[CLK_SPIFC]		=3D &spifc_clk.common.hw,
> > +		[CLK_EMAC0_25M]		=3D &emac0_25M_clk.common.hw,
> > +		[CLK_EMAC1_25M]		=3D &emac1_25M_clk.common.hw,
> > +		[CLK_IR_RX]		=3D &ir_rx_clk.common.hw,
> > +		[CLK_IR_TX]		=3D &ir_tx_clk.common.hw,
> > +		[CLK_GPADC0]		=3D &gpadc0_clk.common.hw,
> > +		[CLK_GPADC1]		=3D &gpadc1_clk.common.hw,
> >  		[CLK_PCIE_AUX]		=3D &pcie_aux_clk.common.hw,
> >  		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
> >  		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
> >  =20
>=20
>=20
>=20
>=20


