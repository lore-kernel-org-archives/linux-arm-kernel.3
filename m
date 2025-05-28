Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94DEC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7937tg3rY6PcR/6DrdYumyyAmxUeuQ/FNJhYLoAwg5c=; b=BUOS5CojZajZOv9vaDclPNg5+1
	0RByaYBtxcvxi/oujCfQIa7kWmWRunk3WO/P/S9g1BAuRUbThZuuC0CzMNdR3Br7ee6aipB120w8q
	S6T+kvPT9w8Y5Ciokf7EljZsrdQP8zmZeKepxq4LG4EYBbGF6deRpowrff4qOM1OWUXHnPRthI/vU
	r6ja5dL3DCqrX0f81ce7aXSTqbutcJdb8DOUVcsgehXLy00/2Aksmo60c2sQ4rG79OJNiN+C+V3s8
	4GFA7BlNb2mWL7GnLcFrETAp+omuwoKX0PdUjwowKi97Opyn3Wjz79RU5wUNPsn3HjP9mzmyWr0Vc
	BjQCw5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKC4G-0000000CZHp-048w;
	Wed, 28 May 2025 08:23:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKC27-0000000CYlv-25Fa;
	Wed, 28 May 2025 08:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C995F614B8;
	Wed, 28 May 2025 08:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD26C4CEE7;
	Wed, 28 May 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748420466;
	bh=/Gne2VTfI+xQQ5m1d2vLN8pRlBpucC8Gc7xkCOfzMBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlwWHoM0qknnmD95VX6gM87GKsdV1HlNJCv3nffKAzcXJZ7ioTjmxxnYtKGN+H/yK
	 f8ue9TIU/OBOL7s/XsDYDoo6shMAef/oEytMD5GImMOevUURw96+EtAst4LXMNNTRj
	 TlPT9JQyoVbjtrcZvQTZq3YaXWZeFRfB87HyhSrh4solFZN+2P7KcVGlbS1K8att+X
	 HJv2f1z5bFXYRVRTlFibQGV8OxB/M/hr2MmlfHP7S/7B2F7VNOj1ROe4kuWjBT2rU1
	 r+vTjtXGwYliGiMTjQV/p3vNNvsaEV9j1OGrBtTGxp7wp6DeOQT5UHSmwsYciqHuOx
	 wa3leWEWH0+Mw==
Date: Wed, 28 May 2025 10:21:03 +0200
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] pinctrl: airoha: convert PHY LED GPIO to macro
Message-ID: <aDbHb4q44BWwHQpE@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uHLHnWQWrDq34LLB"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-4-ansuelsmth@gmail.com>
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


--uHLHnWQWrDq34LLB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> PHY LED GPIO pinctrl struct definition is very similar across the
> different 4 PHY and 2 LED and it can be generelized to a macro.
>=20
> To reduce code size, convert them to a common macro.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 570 ++++------------------
>  1 file changed, 82 insertions(+), 488 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 8af9109db992..2b532334d759 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -1475,516 +1475,110 @@ static const struct airoha_pinctrl_func_group p=
wm_func_group[] =3D {
>  	},
>  };
> =20
> +#define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
> +	{								\
> +		.name =3D (gpio),						\
> +		.regmap[0] =3D {						\
> +			AIROHA_FUNC_MUX,				\
> +			REG_GPIO_2ND_I2C_MODE,				\
> +			(mux_val),					\
> +			(mux_val),					\
> +		},							\
> +		.regmap[1] =3D {						\
> +			AIROHA_FUNC_MUX,				\
> +			REG_LAN_LED0_MAPPING,				\
> +			(map_mask),					\
> +			(map_val),					\
> +		},							\
> +		.regmap_size =3D 2,					\
> +	}
> +
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] =3D {
> --=20
> 2.48.1
>=20

--uHLHnWQWrDq34LLB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDbHbwAKCRA6cBh0uS2t
rPDhAP9JrT1Z/SFeEmV1XY6nhsWgx267nYFw+Nz/SI76T5BqTQEA/EWsQKh5VR+t
PatEzhmW8pegCWvsjTFOtVdpj4pifwk=
=VXYP
-----END PGP SIGNATURE-----

--uHLHnWQWrDq34LLB--

