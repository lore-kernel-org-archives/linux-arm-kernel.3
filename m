Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DBECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 01:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orUs2/nYGmuIZffKa3ygk24Xcz/f3v8T/gGJABvohnY=; b=va4tRbBqjUfoz2QlL7BF4icx1M
	fGC2HZlRVwx7kS7cDdVlRMK3pdt/RSxEYY2e3paQg8bVsdBmBorLbXm2KF4j9hq0TZTZK6QHxoEgd
	I1C63RPO4dvIK/ETzfSPnVl0zHRK7rQISqh90qAn8/tyC9HadYF42R6r8rzQn85rZABH1nNz6379W
	2oljtS7XkgYBc5Lb1fQHsbKRQGol5DNtS09QA8tkGV0HnPxhwjOoGfgUFcRG3LpymqduQD+eehnSa
	SMDGH1MWhc30tOd28OwWPtMdScA8qZOMFGFWL9SKltpsGSwc2JW6Nnk5BR5ztHVGARDxlS24XYWFY
	A4Mp6c/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotgr-0000000FMff-1c3V;
	Thu, 21 Aug 2025 01:02:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopCl-0000000Eog0-3tzH;
	Wed, 20 Aug 2025 20:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=orUs2/nYGmuIZffKa3ygk24Xcz/f3v8T/gGJABvohnY=; b=uNgAee0ATx8Curr1iJ4NFAI4xP
	V6hJDPmKw1k5DmUmChKESsDxLzimZtB1ym8LdJnC2HEtbOBuNIoN9hbK15/hY9h14JTxLKoYyTDKT
	ljcWP7X9X2kvmm+gtL814jx6IyGy+Pkv/C1mRby+92thh1a4NaTDbDd4az+xVq1cCRt3kibUji2g9
	PaV7NVNh7guLYUhnl8lbM8DMcq/fhymiDf1QGFADgpNZGIVGHgQFAFtKWNJMj2ZRA3ZKelN+WMXEr
	2ftqAAEtddgzGkJCf1SdHp2ENYG+3IUHsGsgTdm84+nnTDUA2hM405YxEv8IU9KyqX5eDeYlFzmdR
	yRwnOk/w==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uopCQ-0001tM-EZ; Wed, 20 Aug 2025 22:14:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 2/3] thermal: rockchip: shut up GRF warning
Date: Wed, 20 Aug 2025 22:14:21 +0200
Message-ID: <3452417.9LS3J3VOpE@diego>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_131444_107461_481BEA9C 
X-CRM114-Status: GOOD (  21.99  )
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

Am Mittwoch, 20. August 2025, 19:40:48 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

As we talked about in v1, the variants now having grf_required set,
had it set in their devicetree nodes all the time - the grf handle
was added _with_ the tsadc node.

So this does not cause any regression and just makes the
warning go away for platforms that do not use any GRF registers.


Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  drivers/thermal/rockchip_thermal.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index 7b18a705dfade6fa7318b28c2b57544a4446c1cc..c49ddf70f86e7beaf0190b1b3=
e93f5e6b2f72b2c 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -74,6 +74,7 @@ struct chip_tsadc_table {
>   * @tshut_temp: the hardware-controlled shutdown temperature value, with=
 no trim
>   * @tshut_mode: the hardware-controlled shutdown mode (0:CRU 1:GPIO)
>   * @tshut_polarity: the hardware-controlled active polarity (0:LOW 1:HIG=
H)
> + * @grf_required: true, if a GRF is required for proper functionality
>   * @initialize: SoC special initialize tsadc controller method
>   * @irq_ack: clear the interrupt
>   * @control: enable/disable method for the tsadc controller
> @@ -97,6 +98,9 @@ struct rockchip_tsadc_chip {
>  	enum tshut_mode tshut_mode;
>  	enum tshut_polarity tshut_polarity;
> =20
> +	/* GRF availability */
> +	bool grf_required;
> +
>  	/* Chip-wide methods */
>  	void (*initialize)(struct regmap *grf,
>  			   void __iomem *reg, enum tshut_polarity p);
> @@ -1098,6 +1102,7 @@ static const struct rockchip_tsadc_chip px30_tsadc_=
data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* 2 channels for tsadc */
> +	.grf_required =3D true,
>  	.tshut_mode =3D TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp =3D 95000,
>  	.initialize =3D rk_tsadcv4_initialize,
> @@ -1119,6 +1124,7 @@ static const struct rockchip_tsadc_chip rv1108_tsad=
c_data =3D {
>  	/* cpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channel for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1141,6 +1147,7 @@ static const struct rockchip_tsadc_chip rk3228_tsad=
c_data =3D {
>  	/* cpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channel for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1163,6 +1170,7 @@ static const struct rockchip_tsadc_chip rk3288_tsad=
c_data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 1,
>  	.chn_num =3D 2, /* two channels for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1185,6 +1193,7 @@ static const struct rockchip_tsadc_chip rk3328_tsad=
c_data =3D {
>  	/* cpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channels for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp =3D 95000,
>  	.initialize =3D rk_tsadcv2_initialize,
> @@ -1206,6 +1215,7 @@ static const struct rockchip_tsadc_chip rk3366_tsad=
c_data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> +	.grf_required =3D true,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1228,6 +1238,7 @@ static const struct rockchip_tsadc_chip rk3368_tsad=
c_data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1250,6 +1261,7 @@ static const struct rockchip_tsadc_chip rk3399_tsad=
c_data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> +	.grf_required =3D true,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1272,6 +1284,7 @@ static const struct rockchip_tsadc_chip rk3568_tsad=
c_data =3D {
>  	/* cpu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> +	.grf_required =3D true,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1294,6 +1307,7 @@ static const struct rockchip_tsadc_chip rk3576_tsad=
c_data =3D {
>  	/* top, big_core, little_core, ddr, npu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 6, /* six channels for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1318,6 +1332,7 @@ static const struct rockchip_tsadc_chip rk3588_tsad=
c_data =3D {
>  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 7, /* seven channels for tsadc */
> +	.grf_required =3D false,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1594,12 +1609,10 @@ static int rockchip_configure_from_dt(struct devi=
ce *dev,
>  		return -EINVAL;
>  	}
> =20
> -	/* The tsadc wont to handle the error in here since some SoCs didn't
> -	 * need this property.
> -	 */
>  	thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> -	if (IS_ERR(thermal->grf))
> -		dev_warn(dev, "Missing rockchip,grf property\n");
> +	if (IS_ERR(thermal->grf) && thermal->chip->grf_required)
> +		return dev_err_probe(dev, PTR_ERR(thermal->grf),
> +				     "Missing rockchip,grf property\n");
> =20
>  	rockchip_get_trim_configuration(dev, np, thermal);
> =20
>=20
>=20





