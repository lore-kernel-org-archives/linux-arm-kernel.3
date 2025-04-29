Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2348C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCz4gNNOJMOL9Ry6Flvs6eAOzrBxsQGCeyPmORxEByI=; b=dkLfZVlVs8VTFvYXavL1ijOKM9
	yIh33vsgcjEruK9CdWZ+24KPvkB6oQR2xRx0JnlQIzLK7FR+NA/6dfJDSajbku9MR6O9+ULSWra5x
	8cBNGKRs1ooERVj5wwKN1OHBianjyegYIKcZ7nhp+oueUdU9H30+CGmIHJPl4fNyaFLQMi7sdOTYw
	FB916J0smjYa2aA6CuGgHLK0TiiHxKDP/qLHVTyI2E/gYlsgVqNRp1Iij0ceqiLT2YPvxfXpmhlkX
	whr/lM1WdMpNmiHIZYSOt3XnYlznUYmrgxIUFzyNa1ENay9noNu2I5tj9zbr8t4+p8Ch+z66nptSv
	D2loPAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9f8I-00000008i09-1oOI;
	Tue, 29 Apr 2025 07:11:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9f6M-00000008hkf-44HX;
	Tue, 29 Apr 2025 07:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 079FA5C4D8E;
	Tue, 29 Apr 2025 07:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782F9C4CEE3;
	Tue, 29 Apr 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745910596;
	bh=XYz3g2B0rvs9Ov2YUd2o2zmJrspxC64MWa2M4SH/gUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLzBkn7vxR3ao/EIan1Ff3uh7sQpmsEwhTyvp5IWbiNtqN50Zz/Xyge++kELaJN0q
	 kMFpD/jygnIMW5irfCRHI1/OVghY9TyguwAoG6JGFRuLB12fPTTndhMsERnLtxJVI+
	 wrdDiskFcX7rprpqyAD5jb78XXPmEjOP4woZg3f8UV4ahjmC8sga4B3fg+JZGGbSsz
	 8VmTcfeSdQfDPyV/QYga3rL+W+deyMnR0DXK8PsAVfjFfbba+7pehYP3BREI1aPGXl
	 eLCkMiD9L+6FQVeWWGCGc7G102jR3mGdcoBf1JnDrEjP48Wz5un/kPBYmstcawhD9D
	 ln9Dj+vJkBQ6A==
Date: Tue, 29 Apr 2025 09:09:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: mediatek: airoha: use new GPIO line value
 setter callbacks
Message-ID: <aBB7QkazpVxlUCJc@lore-desk>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
 <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SzPC/w3b/xBP/t6u"
Content-Disposition: inline
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_000959_085312_92C0BFB4 
X-CRM114-Status: GOOD (  18.31  )
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


--SzPC/w3b/xBP/t6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 5d84a778683d..b97b28ebb37a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2247,15 +2247,16 @@ static int airoha_convert_pin_to_reg_offset(struc=
t pinctrl_dev *pctrl_dev,
>  }
> =20
>  /* gpio callbacks */
> -static void airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
> -			    int value)
> +static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
> +			   int value)
>  {
>  	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
>  	u32 offset =3D gpio % AIROHA_PIN_BANK_SIZE;
>  	u8 index =3D gpio / AIROHA_PIN_BANK_SIZE;
> =20
> -	regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.data[index],
> -			   BIT(offset), value ? BIT(offset) : 0);
> +	return regmap_update_bits(pinctrl->regmap,
> +				  pinctrl->gpiochip.data[index],
> +				  BIT(offset), value ? BIT(offset) : 0);
>  }
> =20
>  static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> @@ -2280,9 +2281,7 @@ static int airoha_gpio_direction_output(struct gpio=
_chip *chip,
>  	if (err)
>  		return err;
> =20
> -	airoha_gpio_set(chip, gpio, value);
> -
> -	return 0;
> +	return airoha_gpio_set(chip, gpio, value);
>  }
> =20
>  /* irq callbacks */
> @@ -2419,7 +2418,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->free =3D gpiochip_generic_free;
>  	gc->direction_input =3D pinctrl_gpio_direction_input;
>  	gc->direction_output =3D airoha_gpio_direction_output;
> -	gc->set =3D airoha_gpio_set;
> +	gc->set_rv =3D airoha_gpio_set;
>  	gc->get =3D airoha_gpio_get;
>  	gc->base =3D -1;
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> @@ -2715,9 +2714,7 @@ static int airoha_pinconf_set_pin_value(struct pinc=
trl_dev *pctrl_dev,
>  	if (pin < 0)
>  		return pin;
> =20
> -	airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
> -
> -	return 0;
> +	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
>  }
> =20
>  static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
>=20
> --=20
> 2.45.2
>=20

--SzPC/w3b/xBP/t6u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBB7QgAKCRA6cBh0uS2t
rH+7AP9aAxct76GnQDHEVxQpxzo251BHKc2c0P+HYX1/qSMfZQD/bQxwhnZGiu8p
hKaJ4RR5BS1SvzR7LL64CT3ArjhR5A4=
=KZkz
-----END PGP SIGNATURE-----

--SzPC/w3b/xBP/t6u--

