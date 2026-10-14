Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3540CCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMbRbbBiIgkyYJWVgnEuLvQGMAKrsAL3AoruOMfe5IM=; b=NNvMZ0jR2BJGeU5qGLI8nStIIq
	93BtIzmgk0InLNRgbeUhlBdK/1CBPT7OzaC2ndQa7CkWnepWmdFxTmSQIoO6/k0SOJeNFhnCzG258
	Vii7G8br1+HU636J9Skb0i0OjjlmnHYz608n7+pE09G6CURm0+jPb3VReowXZDamczrxcfdeX033O
	ftcFWvg2IeUjPFc9ilTHZJOSo/TsW1BgdEFFO873U5rdyH26AxPe1/ULKdGwifhgRuSWeqrFLQxLw
	34LV7HwuukVMDBbVhuyTNxuqLaS7sPAFOKNJqv6OzhXRJnJXpd/cWfGGllT5nMJHCOSENQmepFHvG
	u2UtCDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyv7-0000000FZbt-2TMU;
	Wed, 14 Oct 2026 13:21:25 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyuv-0000000FZZn-1Jo3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:21:24 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 655C22018A0;
	Wed, 14 Oct 2026 15:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791984071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMbRbbBiIgkyYJWVgnEuLvQGMAKrsAL3AoruOMfe5IM=;
	b=Nf2ez91k0+kTT2KhxIUDmy2YIb3zpI0Kd7A22Xr1J1tgFs6NZRtew/7I1zXoKMZHD6lCW1
	aywkuTHpojj2FA0Mwe94LC4ECn2cHqCuUVGZt6E/s/ZSsOzTaCiyuHN2RWPNLZGXZ1NsYg
	fV1CCQEO7Qd3LRgLkgVjYYhEYjgajXvt9CjAG0M2ANuDTBXBkPbg1h4XTnGgNCmXhIuLNs
	cOpaRGa/lulshw0Heiw+Q28BoScA1QTq8aGcs3TUX9eg4ZZIWY4o+RlZ/lj8s7l1ga9bNe
	e3duEO9JFuQNXFlQ79ciPDR5X2K+CMxe96dJqZfqrYdWHme2HSevGYZOqbct1w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791984071; a=rsa-sha256;
	cv=none;
	b=OgyHEsg5ElH3Xe3to8fF0mReUPsYPdIeMdxV6uD6XKYvgOj5hFvbs9QH1K35qXURGK12qf
	5hR//PWpWJXCgVVpbosz1CLqASkvM9huHusT2La9WZAA71IJsIvlfy1gEU9TpA1N5qfIIC
	zq1XNMl64FUtEs+q0WpKqTdnE7gQkysNDrk8kLjR7oBdIytQDCbCKJRLFsONJeScdUf8gK
	MqNfvQChBRP2vXk9N4K2Qx1assRJmGwhi4C6kpSo/b57AFvlLMz9U5U/FO7RJrj+6Slcyt
	QZ8fxJxSYK1yg+CwdRfbGwvcl7uUVxLwZs7CdYAFrgrBoWUEGHcq678KkFCWsw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791984071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMbRbbBiIgkyYJWVgnEuLvQGMAKrsAL3AoruOMfe5IM=;
	b=TBZ1cyIi2Eqd0TjbvLJ3B2n6DhTx6YTKOVeFimuVc3wbPhYsULTxccMfs3jaiDTyXaZfVg
	qa+5Mwwd6/HoSdmlr7GgOQpqcub6Zn6b8uCbizmA9d9XOsfRNOCjGR6KfaTCOt73tSAQm3
	sKNxvbSgOGw6nLE431DR6tJuraw26FPD4LncXxbAjDhrlto/USFId5GxvGE6WD9qhaeO1F
	RgZxp0ZjgMlNHedgLF75T35YUUSZQlbh3h0w+pbn9w34zPhYa9jozGs0DDT5VSwkPjIBx6
	OHF6jlIeief9Mor8i6rEApDNaBKBzRqPNq+5YjlddM09LRgCgFdZ8YPMW69N6g==
Message-ID: <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Navid Ghahremani <ghahramani.navid@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de, stefandoesinger@gmail.com, krzk@kernel.org, Stephen Boyd
	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	 <jbrunet+clk@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Date: Wed, 14 Oct 2026 15:21:11 +0200
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
	 <20261014072109.1759502-7-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_062118_117898_E714D399 
X-CRM114-Status: GOOD (  29.58  )
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

On Mi, 2026-10-14 at 08:20 +0100, Navid Ghahremani wrote:
> Support the top CRM and low-speed peripheral clock controllers of the
> ZTE ZX279128S SoC. Implement custom reset controller ops mapping
> logical reset IDs to internal hardware register offsets, and provide
> CRM2 clock gating and reset controller support for PCIe.
>
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  drivers/clk/Kconfig             |   1 +
>  drivers/clk/Makefile            |   1 +
>  drivers/clk/zte/Kconfig         |  14 +
>  drivers/clk/zte/Makefile        |   2 +
>  drivers/clk/zte/clk-zx279128s.c | 758 ++++++++++++++++++++++++++++++++
>  5 files changed, 776 insertions(+)
>  create mode 100644 drivers/clk/zte/Kconfig
>  create mode 100644 drivers/clk/zte/Makefile
>  create mode 100644 drivers/clk/zte/clk-zx279128s.c
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index f9592fd9ec..5200de26c0 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -547,6 +547,7 @@ source "drivers/clk/uniphier/Kconfig"
>  source "drivers/clk/visconti/Kconfig"
>  source "drivers/clk/x86/Kconfig"
>  source "drivers/clk/xilinx/Kconfig"
> +source "drivers/clk/zte/Kconfig"
>  source "drivers/clk/zynqmp/Kconfig"
> =20
>  # Kunit test cases
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b18af485d7..07393019c3 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -181,5 +181,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_X86)			+=3D x86/
>  endif
>  obj-y					+=3D xilinx/
> +obj-y					+=3D zte/
>  obj-$(CONFIG_ARCH_ZYNQ)			+=3D zynq/
>  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         +=3D zynqmp/
> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> new file mode 100644
> index 0000000000..92fd27ea42
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config CLK_ZX279128S
> +	bool "ZTE zx279128s clock driver"
> +	depends on SOC_ZX279128S || COMPILE_TEST
> +	depends on OF
> +	default SOC_ZX279128S
> +	select RESET_CONTROLLER
> +	select RESET_SIMPLE

Don't select RESET_SIMPLE without using it.

> +	help
> +	  This driver supports the clocks of the ZTE zx279128s SoC: the
> +	  top clock and reset module (CRM) with the PLLs, the CPU, bus and
> +	  peripheral group clocks, and the CRPMs of the two groups of low
> +	  speed peripherals (UARTs, SPI flash controller, GPIO, MDIO).
> +	  Say Y if you build a kernel for a board with this SoC.
> diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> new file mode 100644
> index 0000000000..a55ffbfaf1
> --- /dev/null
> +++ b/drivers/clk/zte/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_CLK_ZX279128S)	+=3D clk-zx279128s.o
> diff --git a/drivers/clk/zte/clk-zx279128s.c b/drivers/clk/zte/clk-zx2791=
28s.c
> new file mode 100644
> index 0000000000..892e0c22e5
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx279128s.c
> @@ -0,0 +1,758 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ZTE zx279128s clocks: the top CRM and the CRPMs of the two groups of =
low
> + * speed peripherals
> + *
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + *
> + * The boot loader sets up the PLLs and the CPU and bus clocks, and the =
driver
> + * leaves them as they are: it reads them once and registers their rates=
. The
> + * gates, and the muxes and dividers of the peripherals, are under its
> + * control.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset-controller.h>
> +
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/clock/zte,zx279128s-crm.h>
> +#include <dt-bindings/reset/zte,zx279128s-reset.h>
> +
> +/* Top CRM */
> +#define TOP_CLK_SEL		0x0c
> +#define  TOP_MATRIX_SEL_SHIFT	15
> +#define  TOP_CPU_SEL_SHIFT	13
> +#define TOP_CLK_EN		0x14
> +#define TOP_PLL_A9		0x18
> +#define TOP_PLL_AUDIO		0x28
> +#define TOP_USB_EN		0x48
> +
> +#define TOP_NUM_CLKS		(ZX279128S_TOP_USB_REF + 1)
> +
> +struct zx_reset_line {
> +	u16 reg;
> +	u8 bit;
> +};
> +
> +static const struct zx_reset_line zx279128s_top_resets[] =3D {
> +	[ZX279128S_RESET_USB_B9]  =3D { 0x4c, 9 },
> +	[ZX279128S_RESET_USB_B10] =3D { 0x4c, 10 },
> +	[ZX279128S_RESET_USB_B11] =3D { 0x4c, 11 },
> +	[ZX279128S_RESET_USB_B14] =3D { 0x4c, 14 },

Why store reg in zx_reset_line when it's all the same value?

On the other hand, keeping reg and adding a bool active_low field would
allow to share ops between the two reset controllers.

> +};
> +
> +static DEFINE_SPINLOCK(zx_top_lock);

Why share the lock? Each reset controller has its own register.

> +
> +struct zx_reset_data {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t *lock;
> +};
> +
> +static inline struct zx_reset_data *to_zx_reset_data(struct reset_contro=
ller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct zx_reset_data, rcdev);
> +}
> +
> +static int zx_reset_assert(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zx_reset_data *data =3D to_zx_reset_data(rcdev);
> +	const struct zx_reset_line *line;
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (id >=3D ARRAY_SIZE(zx279128s_top_resets))
> +		return -EINVAL;

This check is unnecessary, fwnode_reset_simple_xlate() already checked
this before the reset control was created.

> +	line =3D &zx279128s_top_resets[id];
> +	spin_lock_irqsave(data->lock, flags);
> +	val =3D readl(data->base + line->reg);
> +	val &=3D ~BIT(line->bit);
> +	writel(val, data->base + line->reg);
> +	spin_unlock_irqrestore(data->lock, flags);

Consider sharing a read-modify-write helper between implementations.

> +	return 0;
> +}
> +
> +static int zx_reset_deassert(struct reset_controller_dev *rcdev, unsigne=
d long id)
> +{
> +	struct zx_reset_data *data =3D to_zx_reset_data(rcdev);
> +	const struct zx_reset_line *line;
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (id >=3D ARRAY_SIZE(zx279128s_top_resets))
> +		return -EINVAL;
> +
> +	line =3D &zx279128s_top_resets[id];
> +	spin_lock_irqsave(data->lock, flags);
> +	val =3D readl(data->base + line->reg);
> +	val |=3D BIT(line->bit);
> +	writel(val, data->base + line->reg);
> +	spin_unlock_irqrestore(data->lock, flags);
> +	return 0;
> +}
> +
> +static int zx_reset_status(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zx_reset_data *data =3D to_zx_reset_data(rcdev);
> +	const struct zx_reset_line *line;
> +	u32 val;
> +
> +	if (id >=3D ARRAY_SIZE(zx279128s_top_resets))
> +		return -EINVAL;
> +
> +	line =3D &zx279128s_top_resets[id];
> +	val =3D readl(data->base + line->reg);
> +	return !(val & BIT(line->bit));
> +}
> +
> +static const struct reset_control_ops zx_reset_ops =3D {
> +	.assert =3D zx_reset_assert,
> +	.deassert =3D zx_reset_deassert,
> +	.status =3D zx_reset_status,
> +};
> +
> +/*
> + * Reset bits are cleared to hold the reset. The registers also hold oth=
er
> + * controls, but no other driver writes the reset registers.
> + */
> +static int __init zx_top_reset_init(struct device_node *np,
> +				    void __iomem *base)

Why is this initialized from CLK_OF_DECLARE_DRIVER()?
Surely USB resets are not required early?

> +{
> +	struct zx_reset_data *rst;
> +	int ret;
> +
> +	rst =3D kzalloc_obj(*rst, GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->lock =3D &zx_top_lock;
> +	rst->base =3D base;
> +	rst->rcdev.ops =3D &zx_reset_ops;
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.nr_resets =3D ARRAY_SIZE(zx279128s_top_resets);
> +	rst->rcdev.of_node =3D np;
> +
> +	ret =3D reset_controller_register(&rst->rcdev);
> +	if (ret)
> +		kfree(rst);
> +
> +	return ret;
> +}
[...]
> +static void __init zx279128s_topcrm_init(struct device_node *np)
> +{
[...]
> +}
> +
> +CLK_OF_DECLARE_DRIVER(zx279128s_topcrm, "zte,zx279128s-topcrm",
> +	       zx279128s_topcrm_init);
[...]
> +struct zx_crm2_reset_data {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t *lock;
> +};

This is exactly the same as zx_reset_data, why duplicate it?
Same comments as above apply here.

regards
Philipp

