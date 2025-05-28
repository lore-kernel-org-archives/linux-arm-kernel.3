Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B6EC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6f331hY1dKklTJC3M7r5PSvsoBF2GanNNKIO4y/o6PU=; b=GdgSAQGU0Dk1wxTDIdjqov9sl5
	xKDRMvCB/a976fG5MC0DWbHwMYEz9LX23ovywJsW6XvzR1yA/Cb1WRnm9TLIRzcR3FMdrznse/AzA
	mjitX8GYZI00Mjnz10fECIEUYl483Ezf8bHK4ZkffAIVhf8hWxdhX0xb9zM3co4kr8lKwYH0fQn6z
	ovgN+WtD8TAmrph9Hrsx1PtLxU+OnrV2Tl+cWgvQy427OFC6TU54s6FPeEDVRC453HnFGcKvUiczE
	vzhHUO0+PGfwW9DEBKpojCXe5zDyIeybuQZBwJ1h1zcstJhTqJNayfAUHfoQHN9COR1TuThy2NlRd
	n/aUrXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKB5W-0000000CPuW-16SR;
	Wed, 28 May 2025 07:20:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKB1E-0000000CPJg-1u6k;
	Wed, 28 May 2025 07:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFB58614B7;
	Wed, 28 May 2025 07:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC15C4CEE7;
	Wed, 28 May 2025 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748416567;
	bh=K9xLFL3YjxEg/yT53Mbd2sI0G3a9mzJ1vSU6/nzZZGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrJmZD+eu3rGOkhdZyxN4JM0eL8FuhebF+ryNOrcZ3k1MneHJ1X5+eEXS7NrupIye
	 wA5u5eQFtYyQuPWcieS+EjiAS5elaLKloPDwlUe9b6vJBmF1sWotJ45tquAxoX47KP
	 ao5OXqAWHI+6evaZxj0jDiKgTEEPTST6erF+kpU7erw3SKEuo7IU48OTDJW2u/3lng
	 u2P/FTign5MUZqI4L/xBu9AqdJBd86+DU0xYw0yu6xeGuoC6ONgeweeRJk6PcHWB+p
	 ROe0CE/Xk8BE0qKGzovhVkhfKPVBhYf2Oq5fXfqZDBdNXudraKMyoJEco5YK1XljO8
	 xw2DClFYdtBRg==
Date: Wed, 28 May 2025 09:16:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: airoha: fix wrong PHY LED mux value for
 LED1 GPIO46
Message-ID: <aDa4NCTzyzw0mnfE@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CoT/qmCue5gfNYHx"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-2-ansuelsmth@gmail.com>
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


--CoT/qmCue5gfNYHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
> the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.
>=20
> This wasn't notice as there were no board that made use of the
> secondary PHY LED but looking at the internal Documentation the actual
> value should be LED1_MODE_MASK similar to the other GPIO entry.
>=20
> Fix the wrong value to apply the correct MUX configuration.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index b97b28ebb37a..8ef7f88477aa 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -1752,8 +1752,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1816,8 +1816,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1880,8 +1880,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1944,8 +1944,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> --=20
> 2.48.1
>=20

--CoT/qmCue5gfNYHx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDa4NAAKCRA6cBh0uS2t
rOCOAQDIlVEn3j31KLCPSoLJ6jFOUiwWCNqW5qOv7UtW1mOCagEAh6LZiTafRxQs
HXf7z9JkF4bcnAu1w5WH7iDwvjnpNw0=
=lKi2
-----END PGP SIGNATURE-----

--CoT/qmCue5gfNYHx--

