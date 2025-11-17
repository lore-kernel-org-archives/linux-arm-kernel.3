Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0192CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVgQbhEJa8OfSfgEbYAFV9/H30xMs0sqrQVDxqY/o4w=; b=JIdelNEoq3fxBZ5NgZWxsnmd/y
	uM8JWx/0Dsr/zS1ctsmOSuFV7WvYcuDvf7PbTOlOYr8j4h9ApgnpTcjgPjfwN6428r/hbbuW9AkJC
	UOOvoihGYlcwYvxUahE6ac2FNs6FAtCjAQEg0fmxQnC8T0pGVtQf2cgeObwoTGGjhJnLa0oOw2kLE
	MqYFALd/k14RbqKAd7g9oleDM78a4K3QFg0uP0DkC1Y+m0vH5bwOzkJsBUMsQuDUlVhMY6mHCT3NZ
	v6DjZWwNJX+CegFxi/69IaM7tc1UWtWb27n8nXJYlfEA5TChHl86oCtUG8mT9WBny1T+JwwwGob00
	8BQduQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0Vp-0000000GHD4-0CV5;
	Mon, 17 Nov 2025 14:47:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0Vm-0000000GHCc-0Fwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:47:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0Vb-0007Me-CO; Mon, 17 Nov 2025 15:47:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0Va-000vdp-2P;
	Mon, 17 Nov 2025 15:47:10 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6C0A74A1634;
	Mon, 17 Nov 2025 14:47:10 +0000 (UTC)
Date: Mon, 17 Nov 2025 15:47:10 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] spi: add driver for NXP XSPI controller
Message-ID: <20251117-curvy-sincere-muskox-8960cf-mkl@pengutronix.de>
References: <20251117-xspi-v2-0-e651323993fe@nxp.com>
 <20251117-xspi-v2-2-e651323993fe@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pfxpr3flx5wcz4sf"
Content-Disposition: inline
In-Reply-To: <20251117-xspi-v2-2-e651323993fe@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_064722_259290_592F6AE4 
X-CRM114-Status: GOOD (  41.38  )
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


--pfxpr3flx5wcz4sf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] spi: add driver for NXP XSPI controller
MIME-Version: 1.0

On 17.11.2025 19:04:25, Haibo Chen wrote:
> Add driver support for NXP XSPI controller.
>
> XSPI is a flexsible SPI host controller which supports up to
                ^
typo: flexible

> 2 external devices (2 CS). It support Single/Dual/Quad/Octal
> mode data transfer.
>
> The difference between XSPI and Flexspi:
> 1.the register layout is total different.
> 2.XSPI support multiple independent execution environments
> (EENVs) for HW virtualization with some limitations. Each EENV
> has its own interrupt and its own set of programming registers
> that exists in a specific offset range in the XSPI memory map.
> The main environment (EENV0) address space contains all of the
> registers for controlling EENV0 plus all of the general XSPI
> control and programming registers. The register mnemonics for
> the user environments (EENV1 to EENV4) have "_SUB_n" appended
> to the mnemonic for the corresponding main-environment register.
>
> Current driver based on EENV0, which means system already give
> EENV0 right to linux.
>
> This driver use SPI memory interface of the SPI framework to issue
> flash memory operations. Tested this driver with mtd_debug and
> UBIFS on NXP i.MX943 EVK board which has one MT35XU512ABA spi nor
> flash. NOw this driver has the following key features:
> - Support up to OCT DDR mode
> - Support AHB read
> - Support IP read and IP write
> - Support two CS
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  MAINTAINERS                |    1 +
>  drivers/spi/Kconfig        |   10 +
>  drivers/spi/Makefile       |    1 +
>  drivers/spi/spi-nxp-xspi.c | 1365 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 1377 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a6ce2fdd6e46e94f8a1631cd0bf8b12980a64ed..bd54eb903a71db2fb4c6f7980=
79cb04bbd9eb7bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18708,6 +18708,7 @@ L:	linux-spi@vger.kernel.org
>  L:	imx@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> +F:	drivers/spi/spi-nxp-xspi.c
>
>  NXP FXAS21002C DRIVER
>  M:	Rui Miguel Silva <rmfrfs@gmail.com>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 592d46c9998bbb8bef2b25d828b7f25c5c0ce180..db3dd4f0fb60142477799a169=
8387ae7dced638c 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -481,6 +481,16 @@ config SPI_NXP_FLEXSPI
>  	  This controller does not support generic SPI messages and only
>  	  supports the high-level SPI memory interface.
>
> +config SPI_NXP_XSPI
> +        tristate "NXP xSPI controller"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  This enables support for the xSPI controller. Up to two devices
> +	  can be connected to one host.
> +	  This controller does not support generic SPI messages and only
> +	  supports the high-level SPI memory interface.
> +
>  config SPI_GPIO
>  	tristate "GPIO-based bitbanging SPI Master"
>  	depends on GPIOLIB || COMPILE_TEST
> diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> index 8ff74a13faaa88399723f9e944f9198076c3e543..9323ba633780daadcce2b04f5=
492ae0647259211 100644
> --- a/drivers/spi/Makefile
> +++ b/drivers/spi/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_SPI_WPCM_FIU)		+=3D spi-wpcm-fiu.o
>  obj-$(CONFIG_SPI_NPCM_FIU)		+=3D spi-npcm-fiu.o
>  obj-$(CONFIG_SPI_NPCM_PSPI)		+=3D spi-npcm-pspi.o
>  obj-$(CONFIG_SPI_NXP_FLEXSPI)		+=3D spi-nxp-fspi.o
> +obj-$(CONFIG_SPI_NXP_XSPI)		+=3D spi-nxp-xspi.o
>  obj-$(CONFIG_SPI_OC_TINY)		+=3D spi-oc-tiny.o
>  spi-octeon-objs				:=3D spi-cavium.o spi-cavium-octeon.o
>  obj-$(CONFIG_SPI_OCTEON)		+=3D spi-octeon.o
> diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7352e5e27b76d23c24ea766b=
9a616d8293bceac
> --- /dev/null
> +++ b/drivers/spi/spi-nxp-xspi.c
> @@ -0,0 +1,1365 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * NXP xSPI controller driver.
> + *
> + * Copyright 2025 NXP
> + *
> + * xSPI is a flexsible SPI host controller which supports single
                    ^

typo: flexible

> + * external devices. This device can have up to eight bidirectional
> + * data lines, this means xSPI support Single/Dual/Quad/Octal mode
> + * data transfer (1/2/4/8 bidirectional data lines).
> + *
> + * xSPI controller is driven by the LUT(Look-up Table) registers
> + * LUT registers are a look-up-table for sequences of instructions.
> + * A valid sequence consists of five LUT registers.
> + * Maximum 16 LUT sequences can be programmed simultaneously.
> + *
> + * LUTs are being created at run-time based on the commands passed
> + * from the spi-mem framework, thus using single LUT index.
> + *
> + * Software triggered Flash read/write access by IP Bus.
> + *
> + * Memory mapped read access by AHB Bus.
> + *
> + * Based on SPI MEM interface and spi-nxp-fspi.c driver.
> + *
> + * Author:
> + *     Haibo Chen <haibo.chen@nxp.com>
> + * Co-author:
> + *     Han Xu <han.xu@nxp.com>
> + */
> +

[...]

> +static int nxp_xspi_exec_op(struct spi_mem *mem, const struct spi_mem_op=
 *op)
> +{
> +	struct nxp_xspi *xspi =3D spi_controller_get_devdata(mem->spi->controll=
er);
> +	void __iomem *base =3D xspi->iobase;
> +	u32 reg;
> +	int err;
> +
> +	guard(mutex)(&xspi->lock);
> +
> +	err =3D pm_runtime_get_sync(xspi->dev);
> +	if (err < 0) {
> +		dev_err(xspi->dev, "Failed to enable clock %d\n", __LINE__);
> +		return err;
> +	}
> +
> +	/* Wait for controller being ready. */
> +	err =3D readl_poll_timeout(base + XSPI_SR, reg,
> +			      !(reg & XSPI_SR_BUSY), 1, POLL_TOUT);
> +	if (err) {
> +		dev_err(xspi->dev, "SR keeps in BUSY!");
> +		return err;
> +	}
> +
> +	nxp_xspi_select_mem(xspi, mem->spi, op);
> +
> +	nxp_xspi_prepare_lut(xspi, op);
> +
> +	/*
> +	 * For read:
> +	 *     the address in AHB mapped range will use AHB read.
> +	 *     the address out of AHB maped range will use IP read.
                                      ^^^^^

typo: mapped

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pfxpr3flx5wcz4sf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkbNWoACgkQDHRl3/mQ
kZysCwf/brA1yOA1hG8+FFScnwrH/OCitXTM/muL9nM2LYHDL+VMD4JZxbpUPAms
Y+nR49TM1KEfRyGFmLDZBja6Mlu+UeT4UuyFrPS4UKptsDQqycAVAdpDU/qQhGhK
5Wfg3uBX+lCzAUkqM5g1P6+PX7QQ3w4C+XhFagj5Y9ELvJaws/px+EX1Cg5OKSuq
oTI9jnb1IE4J/RpZom3a9LiFCWDvqkmnLJetnm7EUYe1gDbWbmaQDy/XWiqenL2a
m1JvgXW4S4S9JmYEg/5BNiIbcuFUDc9FLqOJHbW4LP8V8QIvw1FijHL6HANVCHqE
nmYdlASORqt4c4IJXVebhmifgD3AFA==
=eyBW
-----END PGP SIGNATURE-----

--pfxpr3flx5wcz4sf--

