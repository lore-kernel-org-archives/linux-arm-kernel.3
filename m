Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C02CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXhoT+leVZI4/Qk+p2/PqLCrckwgEEZ0sHMv/uivWco=; b=xopFTnj4vLJ4Xam6fw5ZcNwUfq
	ssX08+TnZeK7wcCvGD51iVJROzJSsEk8WFNaaAGcESwFxlMOaAomoI3tTWF22KWv71+iEW45r0sK/
	YlkyKETLaCsP29t39IKOEJgaTPosSCKUZETnf5+m3y/zUyj/qYI2TXLUm4PZlzZxNoCC6HWLqtucx
	QVWNgkuq73gZbnm24qeqFcy0nSFmGr+0amAAAgvpOloSWk61ooQZg1vYNnHWP3fFTv8NVrxiDly/c
	Lf2mG6vRWf6LA133yKixlo64/wpVi3ALtKeCt6/08t5Gz7BmR00biAS3/0iuKGTm1gFQR+Qc39cxx
	d0M5n1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRAt-00000000Rfz-0ivK;
	Fri, 05 Jun 2026 09:49:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRAr-00000000RfM-1pID;
	Fri, 05 Jun 2026 09:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F5EC601F1;
	Fri,  5 Jun 2026 09:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9BB1F00893;
	Fri,  5 Jun 2026 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780652947;
	bh=gXhoT+leVZI4/Qk+p2/PqLCrckwgEEZ0sHMv/uivWco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CW2B9+X+lFeJtyK7dxmKS6/9ORWHnsrNM8oAf2l//Jd9wPtMy8fPexwyMJeWgh7oZ
	 qdbPb6OmRTZi4i/Aj+NTw65n9Ku7NSTTSvS7WBWzyJhp2nrY7u8REEeM9BmX1nbrfg
	 deC9NLM6ZgWSXLidGNkHTaqWpuVMO+PhHJFhu+GPl2ryXx5Syym3mX7t581VX5zUyV
	 iFM8xpCoXE9ROHFWXuhThEbnbQFtfeCH/qm72VnZbspIwzJqwI7j3JGKXpR2tmpbzd
	 sleeG+lEE46waKVkgtC7+0GTnFlsT8zvDQv9xTnTzZt2qoYPZEVrrOaJkZguaSlm5L
	 qZXmL4T3jnafA==
Date: Fri, 5 Jun 2026 11:49:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
Message-ID: <aiKbkVvJ9-GDqZqY@lore-desk>
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1A43My8ot58uOeO"
Content-Disposition: inline
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
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


--q1A43My8ot58uOeO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>=20
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>=20
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/pinctrl/Kconfig                       |  1 +
>  drivers/pinctrl/Makefile                      |  1 +
>  drivers/pinctrl/airoha/Kconfig                | 20 +++++++++++++++++++
>  drivers/pinctrl/airoha/Makefile               |  3 +++
>  .../{mediatek =3D> airoha}/pinctrl-airoha.c     |  0
>  drivers/pinctrl/mediatek/Kconfig              | 17 +---------------
>  drivers/pinctrl/mediatek/Makefile             |  1 -
>  8 files changed, 27 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/pinctrl/airoha/Kconfig
>  create mode 100644 drivers/pinctrl/airoha/Makefile
>  rename drivers/pinctrl/{mediatek =3D> airoha}/pinctrl-airoha.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21c0ef0b9ce5..38bf92149a15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21024,7 +21024,7 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> -F:	drivers/pinctrl/mediatek/pinctrl-airoha.c
> +F:	drivers/pinctrl/airoha/pinctrl-airoha.c
> =20
>  PIN CONTROLLER - AMD
>  M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 03f2e3ee065f..e0babad31445 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -679,6 +679,7 @@ config PINCTRL_RP1
>  	  multi function device.
> =20
>  source "drivers/pinctrl/actions/Kconfig"
> +source "drivers/pinctrl/airoha/Kconfig"
>  source "drivers/pinctrl/aspeed/Kconfig"
>  source "drivers/pinctrl/bcm/Kconfig"
>  source "drivers/pinctrl/berlin/Kconfig"
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index f7d5d5f76d0c..36c55858801f 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+=3D pinctrl-zynqmp.o
>  obj-$(CONFIG_PINCTRL_ZYNQ)	+=3D pinctrl-zynq.o
> =20
>  obj-y				+=3D actions/
> +obj-y				+=3D airoha/
>  obj-$(CONFIG_ARCH_ASPEED)	+=3D aspeed/
>  obj-y				+=3D bcm/
>  obj-$(CONFIG_PINCTRL_BERLIN)	+=3D berlin/
> diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kcon=
fig
> new file mode 100644
> index 000000000000..03adaeae8fc3
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Airoha pinctrl drivers"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +
> +config PINCTRL_AIROHA
> +	tristate "Airoha EN7581 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
> +	select REGMAP_MMIO
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on Airoha EN7581 SoC.
> +
> +endmenu
> diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Mak=
efile
> new file mode 100644
> index 000000000000..a25b744dd7a8
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PINCTRL_AIROHA)		+=3D pinctrl-airoha.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
airoha/pinctrl-airoha.c
> similarity index 100%
> rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
> rename to drivers/pinctrl/airoha/pinctrl-airoha.c
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> index 4819617d9368..97980cc28b9c 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menu "MediaTek pinctrl drivers"
> -	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
> +	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
> =20
>  config EINT_MTK
>  	tristate "MediaTek External Interrupt Support"
> @@ -126,21 +126,6 @@ config PINCTRL_MT8127
>  	select PINCTRL_MTK
> =20
>  # For ARMv8 SoCs
> -config PINCTRL_AIROHA
> -	tristate "Airoha EN7581 pin control"
> -	depends on OF
> -	depends on ARM64 || COMPILE_TEST
> -	select PINMUX
> -	select GENERIC_PINCONF
> -	select GENERIC_PINCTRL_GROUPS
> -	select GENERIC_PINMUX_FUNCTIONS
> -	select GPIOLIB
> -	select GPIOLIB_IRQCHIP
> -	select REGMAP_MMIO
> -	help
> -	  Say yes here to support pin controller and gpio driver
> -	  on Airoha EN7581 SoC.
> -
>  config PINCTRL_MT2712
>  	bool "MediaTek MT2712 pin control"
>  	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek=
/Makefile
> index ae765bd99965..6dc17b0c23f9 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+=3D pinctrl-moore.o
>  obj-$(CONFIG_PINCTRL_MTK_PARIS)		+=3D pinctrl-paris.o
> =20
>  # SoC Drivers
> -obj-$(CONFIG_PINCTRL_AIROHA)		+=3D pinctrl-airoha.o
>  obj-$(CONFIG_PINCTRL_MT7620)		+=3D pinctrl-mt7620.o
>  obj-$(CONFIG_PINCTRL_MT7621)		+=3D pinctrl-mt7621.o
>  obj-$(CONFIG_PINCTRL_MT76X8)		+=3D pinctrl-mt76x8.o
> --=20
> 2.53.0
>=20

--q1A43My8ot58uOeO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiKbkQAKCRA6cBh0uS2t
rD8RAQCTqvwpjOmFdqe/mEXBddI5QVje6dYvxn4UEeu5m/9ffQD+NC30clolCJqz
Y7UYWFyqWHg0ayUEETtXdvzZphkMHAQ=
=7riA
-----END PGP SIGNATURE-----

--q1A43My8ot58uOeO--

