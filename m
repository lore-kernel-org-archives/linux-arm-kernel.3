Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B1CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubTyn2ugoz2/Rq288NzNSXVDl2tAW+oxgRy2HaQbf9M=; b=ZzqpoonoDarWiUWP+GhSBH+19E
	D/+AOknsjl9Y/nOqKIROU9mh/NV+wPs0uqXyU+fox/6Ubjf1NFNpEPQD9KwLO8JFRgy8O9U8xfolN
	imtcZGWlSWD0O6ayQU60rfHHXP5mCBd65bqO+dbw16cqm6UAvrEvV0YoCVahDBlGpp2nBT1dJbLaE
	xTrxUe4a0uw1EaytiN1771dm6cLsoBvyfah6GXCOqMuiPKozW5DQfKfJYPyVYjpEWc6ADVvmanxTO
	eZz8ybubkT/Oa2VYYJlG60BjfzLnwXsr1u29HM8c/z3U8+Q89Hf03ChCYHnrv/tdIqATQ27msuky9
	sYDBiUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Mm-00000008UX0-2Z15;
	Mon, 18 Aug 2025 19:18:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4qO-00000008OIE-1gZm;
	Mon, 18 Aug 2025 18:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ubTyn2ugoz2/Rq288NzNSXVDl2tAW+oxgRy2HaQbf9M=; b=Kuhfz07MorWp4PpYWOL7VftqW3
	kPWgyELtaB1PJADPBexGvgKpFWJAjB9NSqmoY9lEjr/ulldNLSkZMDWbwN/ys/NhkWXtzctQYkM5d
	qi9dmeWfUm9UUfL8ZPKEWlrMl2MSIDqynWNMwVGU1ulHL+9zK4rP5/W2uGSEYipRh45UxzfSC2M3W
	P1WC6KTQln6tu8kKt9crOLps0HY4zkfBf53iO0c+RG12QWMwJo0JqIJHu62AQ5IGghbLxc3ZyjipZ
	E5SNbYPtwLeFrA73I+1N+f4+yBLvsafZaZidS1gPqyqJXSGblIgnQ0h5GeiQ/9zfq24JwH3xNtF+W
	5qymsxLQ==;
Received: from i53875ad4.versanet.de ([83.135.90.212] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uo4q8-0000eZ-KQ; Mon, 18 Aug 2025 20:44:16 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
Date: Mon, 18 Aug 2025 20:44:15 +0200
Message-ID: <8402789.eFmWaWnqpD@diego>
In-Reply-To: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_114432_461443_6725C284 
X-CRM114-Status: GOOD (  21.78  )
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

Hi Sebastian,

Am Montag, 18. August 2025, 19:26:15 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Sebastian Reichel:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

thanks a lot for tracking down the GRF usage for all the soc variants :-)

> ---
>  drivers/thermal/rockchip_thermal.c | 53 ++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 46 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index 3beff9b6fac3abe8948b56132b618ff1bed57217..1e8091cebd6673ab39fa0c4de=
e835c68aeb7e8b5 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
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

nit: I guess instead of adding an empty line, you could also just drop
the empty line above, to bring the "older" variants into the form
rk3576 and rk3588 use.


>  	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp =3D 95000,

[...]

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

[...]

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

I guess it might make it easier for people seeing the log, if we could
insert an "optional" into that message for the optional tier.

> +			else
> +				return dev_err_probe(dev, ret, "Missing rockchip,grf property\n");
> +		}
> +	}
> =20
>  	rockchip_get_trim_configuration(dev, np, thermal);

Overall, though

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Thanks
Heiko



