Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82C8CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJeHngwTjx7iNIdwSm6fHexQ8q+sCx+IVxLkKopKarU=; b=v8itx7aGGCsFGXiqxMeVOxWJJT
	U93xbrDSgNoVEwItLWZLx/Vs7TDgqK843/SpIaqHtDPottCeYuQlL9SP1Pp865zq4m9nWn6Oi4NGt
	zdqlXmMOl5ic92Bm1mEXTjVHcq+1p6ZwBwKa13VvU+qUtXA3ZA6Uxii7/oYDYwAyl5mvR2i7fKwIQ
	lLHW/xEMY8g9qSdEiWvfhTzu4V7LWoYxdUtFHFv5dFqsoZqBU+FGB3X8rzK+Epac73TVfi4S9JFvX
	TYMkRaibuXZnSZDuX1n4QGw6iiY+Y575P+XpD3qYw8FrMAUL+2XPn9aLeu7YynM8pAk3ZiHT3Pmgx
	ySjK5utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0PM-00000007Q74-0u8C;
	Thu, 21 May 2026 10:13:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0PJ-00000007Q6W-3fnb;
	Thu, 21 May 2026 10:13:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6067743BE9;
	Thu, 21 May 2026 10:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFF71F000E9;
	Thu, 21 May 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358417;
	bh=yJeHngwTjx7iNIdwSm6fHexQ8q+sCx+IVxLkKopKarU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuVK0Q/qAfpjOGxYzuqJ3o6qbYhgM3EhNpWORTVle5w6GmwzVfh4LvX7F6KQFUlUa
	 lQ0kkLurG5uYLYCxgQMJOhc0Uk0J4Vf9F8YOh7x3IlMONQ5i+PQr2ml4lShMnUBtna
	 YDHaS2O67rBYSfIyj1DgDDjkMQuvH87vM+TdChh8juyQiDu2nXhpi/j3P8ixy3t60S
	 TPkW9MLExBAVxP+bQWB/WoumU6wpIJXvP5cewVqZrnBENKw/D27NEi8/OQQoB9E7c9
	 Tq3bT2kTqAdGKN5YP2IWi0PEwHbmz8y99w9Zu50FzDYZpqTmDDbfgUoWi6Qgnf1AZi
	 /ohoTqq5tQQGQ==
Date: Thu, 21 May 2026 12:13:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 4/5] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
Message-ID: <ag7azmxlWspK_iVS@lore-desk>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GwfGcxHJb0ERKyP"
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_031337_958016_3B9AFCAF 
X-CRM114-Status: GOOD (  30.09  )
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


--+GwfGcxHJb0ERKyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
>=20
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
>=20
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
>=20
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  MAINTAINERS                                         |  4 ++--
>  drivers/phy/Kconfig                                 | 11 +----------
>  drivers/phy/Makefile                                |  4 ++--
>  drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
>  drivers/phy/airoha/Makefile                         |  3 +++
>  .../phy-an7581-pcie-regs.h}                         |  2 +-
>  .../{phy-airoha-pcie.c =3D> airoha/phy-an7581-pcie.c} |  6 +++---
>  7 files changed, 25 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h =3D> airoha/phy-an7581-pcie-r=
egs.h} (99%)
>  rename drivers/phy/{phy-airoha-pcie.c =3D> airoha/phy-an7581-pcie.c} (99=
%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 932044785a39..7bea8c620da8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -759,8 +759,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> -F:	drivers/phy/phy-airoha-pcie-regs.h
> -F:	drivers/phy/phy-airoha-pcie.c
> +F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
> +F:	drivers/phy/airoha/phy-an7581-pcie.c
> =20
>  AIROHA SPI SNFI DRIVER
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 227b9a4c612e..f9cd765a3ccc 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
>  	  Provides a number of helpers a core functions for MIPI D-PHY
>  	  drivers to us.
> =20
> -config PHY_AIROHA_PCIE
> -	tristate "Airoha PCIe-PHY Driver"
> -	depends on ARCH_AIROHA || COMPILE_TEST
> -	depends on OF
> -	select GENERIC_PHY
> -	help
> -	  Say Y here to add support for Airoha PCIe PHY driver.
> -	  This driver create the basic PHY instance and provides initialize
> -	  callback for PCIe GEN3 port.
> -
>  config PHY_CAN_TRANSCEIVER
>  	tristate "CAN transceiver PHY"
>  	select GENERIC_PHY
> @@ -133,6 +123,7 @@ config PHY_XGENE
>  	help
>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
> =20
> +source "drivers/phy/airoha/Kconfig"
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f49d83f00a3d..84062279fa63 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+=3D phy-common-props.o
>  obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+=3D phy-common-props-test.o
>  obj-$(CONFIG_GENERIC_PHY)		+=3D phy-core.o
>  obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+=3D phy-core-mipi-dphy.o
> -obj-$(CONFIG_PHY_AIROHA_PCIE)		+=3D phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+=3D phy-can-transceiver.o
>  obj-$(CONFIG_PHY_GOOGLE_USB)		+=3D phy-google-usb.o
>  obj-$(CONFIG_USB_LGM_PHY)		+=3D phy-lgm-usb.o
> @@ -17,7 +16,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb=
=2Eo
>  obj-$(CONFIG_PHY_SNPS_EUSB2)		+=3D phy-snps-eusb2.o
>  obj-$(CONFIG_PHY_XGENE)			+=3D phy-xgene.o
> =20
> -obj-$(CONFIG_GENERIC_PHY)		+=3D allwinner/	\
> +obj-$(CONFIG_GENERIC_PHY)		+=3D airoha/	\
> +					   allwinner/	\
>  					   amlogic/	\
>  					   apple/	\
>  					   broadcom/	\
> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> new file mode 100644
> index 000000000000..9a1b625a7701
> --- /dev/null
> +++ b/drivers/phy/airoha/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Airoha devices
> +#
> +config PHY_AIROHA_AN7581_PCIE
> +	tristate "Airoha AN7581 PCIe-PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for PCIe GEN3 port.
> diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
> new file mode 100644
> index 000000000000..912f3e11a061
> --- /dev/null
> +++ b/drivers/phy/airoha/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+=3D phy-an7581-pcie.o
> diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-=
an7581-pcie-regs.h
> similarity index 99%
> rename from drivers/phy/phy-airoha-pcie-regs.h
> rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
> index 58572c793722..b938a7b468fe 100644
> --- a/drivers/phy/phy-airoha-pcie-regs.h
> +++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2024 AIROHA Inc
>   * Author: Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-an758=
1-pcie.c
> similarity index 99%
> rename from drivers/phy/phy-airoha-pcie.c
> rename to drivers/phy/airoha/phy-an7581-pcie.c
> index 56e9ade8a9fd..81ddf0e7638b 100644
> --- a/drivers/phy/phy-airoha-pcie.c
> +++ b/drivers/phy/airoha/phy-an7581-pcie.c
> @@ -13,7 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> =20
> -#include "phy-airoha-pcie-regs.h"
> +#include "phy-an7581-pcie-regs.h"
> =20
>  #define LEQ_LEN_CTRL_MAX_VAL	7
>  #define FREQ_LOCK_MAX_ATTEMPT	10
> @@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
>  static struct platform_driver airoha_pcie_phy_driver =3D {
>  	.probe	=3D airoha_pcie_phy_probe,
>  	.driver	=3D {
> -		.name =3D "airoha-pcie-phy",
> +		.name =3D "airoha-an7581-pcie-phy",
>  		.of_match_table =3D airoha_pcie_phy_of_match,
>  	},
>  };
>  module_platform_driver(airoha_pcie_phy_driver);
> =20
> -MODULE_DESCRIPTION("Airoha PCIe PHY driver");
> +MODULE_DESCRIPTION("Airoha AN7581 PCIe PHY driver");
>  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
>  MODULE_LICENSE("GPL");
> --=20
> 2.53.0
>=20

--+GwfGcxHJb0ERKyP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCag7azgAKCRA6cBh0uS2t
rFl9AP9jI7aQgapV/BhGPwx6KIRaUVocpOpElFOYjVyAYUrVWAEAlzn1Hem7Kfsm
7AaS1RgEi0GfQMSjQgzQ81hdjLzT8Ag=
=O8tV
-----END PGP SIGNATURE-----

--+GwfGcxHJb0ERKyP--

