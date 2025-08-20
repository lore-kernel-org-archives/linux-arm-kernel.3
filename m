Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C535CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=up1RSHC3bmjFdtojDRArO6p3YgGDPNjjN84qZWu2NY8=; b=L/CpSapruEXobLpYOf6J4uak6P
	LdMTlPUDiyQbKTM0JPvd7prxBRtspzxewDyjrOvH7hp2rDqv4vHaG73IsEixFyk0s5eKPyP173wdj
	bl/sNE+fC+KYghziygBUD4X97TcmChzZK2b5gT/mu9awydpOcMVYdCB6aKQu9iwGLNV4cijBabHJr
	eibsMoKsBtGX0wGBIEJzwFsXEWyfy8BIGuoSNX1yOnU5Gl/SUez+vhDrwM7bpi/VAiLNniOOfqfy9
	j/cTqDy5eHnOVFka1nMTYUXsgxiLLgzx6L/kX5gZsPwGaIJRixaZ0lVVN67AvzYxObHIss9Di6Fy1
	LVyq4Bzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolMk-0000000ELll-1Uq3;
	Wed, 20 Aug 2025 16:08:46 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojir-0000000E1ow-3GfT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:23:31 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755699797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=up1RSHC3bmjFdtojDRArO6p3YgGDPNjjN84qZWu2NY8=;
	b=YxTp5PJawb9k0Hw6LVfv5aAhiNilnjc+DPn0rsU0/xrtQ3oMZLFm3T/eqyHbhwaquns2sB
	HjDlw1zgpsHhqG9TGoTjN97n6XIIQ65WLIK32Oe9d9dT7Co27Rq+c3qUspGPgX8HmHPdn3
	rFA5NhDKnJDiu6Gl1OVSiQ7yPwn6F5gtI47PHi/UpG8FrbqOOaZ5/YUhXUvJSZ/PKn0D31
	W3zBWOpSZzolrvjDCzfWdwRPPUXihkT2xlbME9Fydx+UTTGnRpTljcoh9SQV4/StuEgsyU
	LT2j+EdTzZxQOshziUzXx0An7kHYyuUbDLr2IIGBrhxLcpvBx8hpOQ3kwTsHqA==
Content-Type: multipart/signed;
 boundary=698049d7621a3f79bb424488419fcc815111d0a5c6d83ffbae678ca86f50;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 20 Aug 2025 16:23:06 +0200
Message-Id: <DC7BMRFU4CZP.1R3PY4OJVGJHE@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Heiko Stuebner" <heiko@sntech.de>
Cc: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
In-Reply-To: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_072329_961039_C7905058 
X-CRM114-Status: GOOD (  23.45  )
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

--698049d7621a3f79bb424488419fcc815111d0a5c6d83ffbae678ca86f50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Sebastian,

On Mon Aug 18, 2025 at 7:26 PM CEST, Sebastian Reichel wrote:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.

Thanks for this patch :-)

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 53 ++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index 3beff9b6fac3abe8948b56132b618ff1bed57217..1e8091cebd6673ab39fa0c4de=
e835c68aeb7e8b5 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -50,6 +50,18 @@ enum adc_sort_mode {
>  	ADC_INCREMENT,
>  };
> =20
> +/*
> + * The GRF availability depends on the specific SoC
> + * GRF_NONE: the SoC does not have a GRF associated with the tsadc
> + * GRF_OPTIONAL: the SoC has a GRF, but the driver can work without it
> + * GRF_MANDATORY: the SoC has a GRF and it is required for proper operat=
ion
> + */
> +enum tsadc_grf_mode {
> +	GRF_NONE,
> +	GRF_OPTIONAL,
> +	GRF_MANDATORY,
> +};
> +
>  #include "thermal_hwmon.h"
> =20
>  /**
> @@ -97,6 +109,9 @@ struct rockchip_tsadc_chip {
>  	enum tshut_mode tshut_mode;
>  	enum tshut_polarity tshut_polarity;
> =20
> +	/* GRF availability */
> +	enum tsadc_grf_mode grf_mode;
> +
>  	/* Chip-wide methods */
>  	void (*initialize)(struct regmap *grf,
>  			   void __iomem *reg, enum tshut_polarity p);
> @@ -1099,6 +1114,8 @@ static const struct rockchip_tsadc_chip px30_tsadc_=
data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* 2 channels for tsadc */
> =20
> +	.grf_mode =3D GRF_MANDATORY,
> +
>  	.tshut_mode =3D TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp =3D 95000,
> =20
> @@ -1123,6 +1140,8 @@ static const struct rockchip_tsadc_chip rv1108_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channel for tsadc */
> =20
> +	.grf_mode =3D GRF_NONE,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1148,6 +1167,8 @@ static const struct rockchip_tsadc_chip rk3228_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channel for tsadc */
> =20
> +	.grf_mode =3D GRF_NONE,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1173,6 +1194,8 @@ static const struct rockchip_tsadc_chip rk3288_tsad=
c_data =3D {
>  	.chn_offset =3D 1,
>  	.chn_num =3D 2, /* two channels for tsadc */
> =20
> +	.grf_mode =3D GRF_NONE,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1198,6 +1221,8 @@ static const struct rockchip_tsadc_chip rk3328_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 1, /* one channels for tsadc */
> =20
> +	.grf_mode =3D GRF_NONE,
> +
>  	.tshut_mode =3D TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp =3D 95000,
> =20
> @@ -1222,6 +1247,8 @@ static const struct rockchip_tsadc_chip rk3366_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> =20
> +	.grf_mode =3D GRF_OPTIONAL,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1247,6 +1274,8 @@ static const struct rockchip_tsadc_chip rk3368_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> =20
> +	.grf_mode =3D GRF_NONE,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1272,6 +1301,8 @@ static const struct rockchip_tsadc_chip rk3399_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> =20
> +	.grf_mode =3D GRF_OPTIONAL,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1297,6 +1328,8 @@ static const struct rockchip_tsadc_chip rk3568_tsad=
c_data =3D {
>  	.chn_offset =3D 0,
>  	.chn_num =3D 2, /* two channels for tsadc */
> =20
> +	.grf_mode =3D GRF_OPTIONAL,
> +
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1321,6 +1354,7 @@ static const struct rockchip_tsadc_chip rk3576_tsad=
c_data =3D {
>  	/* top, big_core, little_core, ddr, npu, gpu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 6, /* six channels for tsadc */
> +	.grf_mode =3D GRF_NONE,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1345,6 +1379,7 @@ static const struct rockchip_tsadc_chip rk3588_tsad=
c_data =3D {
>  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>  	.chn_offset =3D 0,
>  	.chn_num =3D 7, /* seven channels for tsadc */
> +	.grf_mode =3D GRF_NONE,
>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,
> @@ -1572,7 +1607,7 @@ static int rockchip_configure_from_dt(struct device=
 *dev,
>  				      struct device_node *np,
>  				      struct rockchip_thermal_data *thermal)
>  {
> -	u32 shut_temp, tshut_mode, tshut_polarity;
> +	u32 shut_temp, tshut_mode, tshut_polarity, ret;
> =20
>  	if (of_property_read_u32(np, "rockchip,hw-tshut-temp", &shut_temp)) {
>  		dev_warn(dev,
> @@ -1621,12 +1656,16 @@ static int rockchip_configure_from_dt(struct devi=
ce *dev,
>  		return -EINVAL;
>  	}
> =20
> -	/* The tsadc wont to handle the error in here since some SoCs didn't
> -	 * need this property.
> -	 */
> -	thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> -	if (IS_ERR(thermal->grf))
> -		dev_warn(dev, "Missing rockchip,grf property\n");
> +	if (thermal->chip->grf_mode !=3D GRF_NONE) {
> +		thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> +		if (IS_ERR(thermal->grf)) {
> +			ret =3D PTR_ERR(thermal->grf);
> +			if (thermal->chip->grf_mode =3D=3D GRF_OPTIONAL)
> +				dev_warn(dev, "Missing rockchip,grf property\n");
> +			else
> +				return dev_err_probe(dev, ret, "Missing rockchip,grf property\n");
> +		}
> +	}
> =20
>  	rockchip_get_trim_configuration(dev, np, thermal);

I tested this patch on the following devices and found no regressions:
- Rock64 (rk3328)
- RockPro64 (rk3399)
- Quartz64 Model B (rk3566)
- NanoPi R5S (rk3568)

When tested on my Rock 5B (rk3588), I no longer saw this warning:
 =20
  rockchip-thermal fec00000.tsadc: Missing rockchip,grf property

And found no regressions, so

Tested-by: Diederik de Haas <didi.debian@cknow.org>

Cheers,
  Diederik


--698049d7621a3f79bb424488419fcc815111d0a5c6d83ffbae678ca86f50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaKXaTgAKCRDXblvOeH7b
bqblAP4jPqaWdIPCDRsvkAv1AAHlOf1IltDXJI2S5FepeV2a9QD/fty5wxSUpUMf
gIvJ32RXC5nU6+id1xZfkx099JFU0As=
=74NQ
-----END PGP SIGNATURE-----

--698049d7621a3f79bb424488419fcc815111d0a5c6d83ffbae678ca86f50--

