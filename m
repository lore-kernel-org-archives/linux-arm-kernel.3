Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9224C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7+pvAFSvvanLwS7l5sRnj9Mftk7WZRmmADsTuNBmIQ=; b=mrFDivMN2dyyX2falBLxp0NpKE
	FSYJUlmUBR087GHk/e6V34psjsK6lieuCi03uXS5tNBKb8uZkZ/ww1O9RPw640gThHeCDNXmRMFTM
	IutrKQRd3/VqMDjcqXBnxcHd6y1OpeczB8k813xasKkmjUKQmWQNxzcpiexzFIqgel090K08I+2Pv
	s3vDswQIOtWANOzmd1vxbkYm5aqtlgT7gqvj0oZ2wpU8P3eCzJ/ArODF3ta1YKsI8q7Ex5vaxHoJf
	nA4G38Aeca5sFYf6fs0MhE+YV5vjzC0KWNlWkXCLxivXdiHhMnHbcyOhCxaoxkHRhYBxGVV5z9iqK
	08papamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzc7u-00000003WHf-1hK2;
	Tue, 01 Apr 2025 13:58:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzc63-00000003Vwg-3AZv;
	Tue, 01 Apr 2025 13:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68368A44B85;
	Tue,  1 Apr 2025 13:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA44C4CEE4;
	Tue,  1 Apr 2025 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743515765;
	bh=vOJVAGJTEuAy1vm3ddszdLsD3QriX/nzRc5+pSlCs8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7vdGmO5begJnV+11RKXwxfNoFckttAv6bpYAXo6O7e0SIal3YfNWFJx1zL7arTDI
	 GGLFdXXBuxCbnOhN3RJJsMEOf6y+mvz4WFuPK86w8PAoN27ZkFEXD+qCQuBBnMaDBL
	 rLLD/is2izh7sREvpuBdMFEvQ3Nf8xWGIXt6h8KbgpH9J1QNmpT0BflvJcFLJ8LI/9
	 3R7v9iRyt9JQ0rRQOslh57IgWE1WSboFb/+vuf0yjrB38RHGQHoN0SVtheXma09cSd
	 GgbE+ouoZ1v1luADVo+lkIumppiAn/OD6Aup93HVQpPtfKgJH+s06ThxLefnTVfexy
	 +3pICuc63w+Cg==
Date: Tue, 1 Apr 2025 15:56:03 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2
 LED defines
Message-ID: <Z-vwczLnmAkswNeD@lore-desk>
References: <20250401135026.18018-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRYz62PYEOHq01AT"
Content-Disposition: inline
In-Reply-To: <20250401135026.18018-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_065607_936140_8FA76112 
X-CRM114-Status: GOOD (  19.87  )
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


--nRYz62PYEOHq01AT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>=20
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes v2:
> - Add Reviewed-by tag
> - Use more symbolic macro
>=20
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 159 ++++++++++------------
>  1 file changed, 70 insertions(+), 89 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 547a798b71c8..5d84a778683d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <dt-bindings/pinctrl/mt65xx.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/gpio/driver.h>
> @@ -112,39 +113,19 @@
>  #define REG_LAN_LED1_MAPPING			0x0280
> =20
>  #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
> -#define LAN4_PHY4_LED_MAP			BIT(18)
> -#define LAN4_PHY2_LED_MAP			BIT(17)
> -#define LAN4_PHY1_LED_MAP			BIT(16)
> -#define LAN4_PHY0_LED_MAP			0
> -#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
> +#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
> -#define LAN3_PHY4_LED_MAP			BIT(14)
> -#define LAN3_PHY2_LED_MAP			BIT(13)
> -#define LAN3_PHY1_LED_MAP			BIT(12)
> -#define LAN3_PHY0_LED_MAP			0
> -#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
> +#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
> -#define LAN2_PHY4_LED_MAP			BIT(12)
> -#define LAN2_PHY2_LED_MAP			BIT(11)
> -#define LAN2_PHY1_LED_MAP			BIT(10)
> -#define LAN2_PHY0_LED_MAP			0
> -#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
> +#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
> -#define LAN1_PHY4_LED_MAP			BIT(6)
> -#define LAN1_PHY2_LED_MAP			BIT(5)
> -#define LAN1_PHY1_LED_MAP			BIT(4)
> -#define LAN1_PHY0_LED_MAP			0
> -#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
> +#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
> -#define LAN0_PHY4_LED_MAP			BIT(3)
> -#define LAN0_PHY2_LED_MAP			BIT(2)
> -#define LAN0_PHY1_LED_MAP			BIT(1)
> -#define LAN0_PHY0_LED_MAP			0
> -#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
> +#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (=
_n))
> =20
>  /* CONF */
>  #define REG_I2C_SDA_E2				0x001c
> @@ -1476,8 +1457,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1491,8 +1472,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1506,8 +1487,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1521,8 +1502,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1540,8 +1521,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1555,8 +1536,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1570,8 +1551,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1585,8 +1566,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1604,8 +1585,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1619,8 +1600,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1634,8 +1615,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1649,8 +1630,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1668,8 +1649,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1683,8 +1664,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1698,8 +1679,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1713,8 +1694,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1732,8 +1713,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1747,8 +1728,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1762,8 +1743,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1777,8 +1758,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1796,8 +1777,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1811,8 +1792,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1826,8 +1807,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1841,8 +1822,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1860,8 +1841,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1875,8 +1856,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1890,8 +1871,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1905,8 +1886,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1924,8 +1905,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1939,8 +1920,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1954,8 +1935,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1969,8 +1950,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	},
> --=20
> 2.48.1
>=20

--nRYz62PYEOHq01AT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+vwcwAKCRA6cBh0uS2t
rNMvAQCC3qXkUGBbmTKpqXtmDpcfFfy2GUHnM7lnNIMj6NxI0QD+PpG0H5XNZ3VI
kk0XQB0c2gUlQ6n+H1HB33xvyJTafAE=
=u1TQ
-----END PGP SIGNATURE-----

--nRYz62PYEOHq01AT--

