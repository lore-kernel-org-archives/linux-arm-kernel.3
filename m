Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E38C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aFrSRyUeb/75jdUmrqfqndWIf0rk5Wfmjw+p/zHH9g=; b=AseXHnmVCMvKP8v65VceWdnkOg
	DFbuSRXOgxeQJViy4drGY60naYxWOf0jwYDBbNoMpKxklndJX4/H7NsJnzdRwAZ720uyNi3sTD1WU
	IjsiNLnmFtOJYMhIJIlKM8SW5Cg7bvxW8Mf/EqdrYO3QymyQyWbbqUNlEgf34E0UnsTzCbQx5KjZz
	ukDLFENfCN9D3Qr609NEOKr0kpQDBB6uNJ32GnxKqgDHKpyxXNEtEh/G+HSHESeQSEHXBd2dNWUnO
	00TH5hQfjWFAJ8B8yTrIFvZERs3fiCHtS2vBMfMUNY8C0bDaFnbF+wwIZZ9a9cZqtdKUcuv+76+R9
	DZto8cRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRVu-00000006ZZw-2DlJ;
	Tue, 17 Jun 2025 08:17:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRT5-00000006ZCI-090W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 966F242B92;
	Tue, 17 Jun 2025 08:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B63C4CEED;
	Tue, 17 Jun 2025 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148094;
	bh=jWaMeV6lumqYjKja81bLRDGauLViAHSmy9zCTQ+CdzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aiebFnPt5mNFmtfZPVPr3tv89nAL3Z60/172Cv8w6KcCbQmGha03+sQUGpCuQ7Ay4
	 nuLzFvtw96yTUsk0rvyyrzOWJbQ/oj85LbmUvfw3/m2u1/xPombwmTmUgyjs1Iv3f/
	 0jCBehmywpaAfhoJnA6dJijINmu5zhijtCIk39W4xp2pUzHroqJOexa1Kcwy9pGYcQ
	 HLL93RzJOZ4HgC2V8ctmssdoonuGz4qHyb5k8eES4I4WbI4jF/a+CDWPpvqwuHDoH1
	 3UcrA/N01WaO45sxaOImTjdTfUNV5MlvpZyadWA5z6E7h4JCbjv1uFqqCa1KHCjeDs
	 7bQUcca6RczqA==
Date: Tue, 17 Jun 2025 10:14:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
Message-ID: <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
References: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iymm4l7lewpewlx2"
Content-Disposition: inline
In-Reply-To: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_011455_115620_60128C9F 
X-CRM114-Status: GOOD (  25.68  )
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


--iymm4l7lewpewlx2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
MIME-Version: 1.0

Hello Marek,

[Cc: +=3D linux-pwm@vger.kernel.org]

On Tue, Jun 17, 2025 at 02:50:25AM +0200, Marek Vasut wrote:
> Convert the driver from legacy PWM apply ops to modern waveform ops.
> There is no functional change.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Uwe Kleine-K=F6nig" <ukleinek@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/regulator/rpi-panel-v2-regulator.c | 50 +++++++++++++++++-----
>  1 file changed, 39 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulat=
or/rpi-panel-v2-regulator.c
> index 30b78aa75ee3..be42afc81d72 100644
> --- a/drivers/regulator/rpi-panel-v2-regulator.c
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c
> @@ -35,24 +35,52 @@ static const struct regmap_config rpi_panel_regmap_co=
nfig =3D {
>  	.can_sleep =3D true,
>  };
> =20
> -static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -				  const struct pwm_state *state)
> +static int rpi_panel_v2_pwm_round_waveform_tohw(struct pwm_chip *chip,
> +						struct pwm_device *pwm,
> +						const struct pwm_waveform *wf,
> +						void *_wfhw)
>  {
> -	struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> -	unsigned int duty;
> +	u8 *wfhw =3D _wfhw;
> +
> +	*wfhw =3D DIV_ROUND_CLOSEST_ULL(wf->duty_length_ns * PWM_BL_MASK, wf->p=
eriod_length_ns);

To have this consistent with rpi_panel_v2_pwm_round_waveform_fromhw()
and not suffer from potential overflow this should be:

/* The actual value isn't known, so this is made up. */
#define RPI_PANEL_V2_FIXED_PERIOD_NS 100000


static int rpi_panel_v2_pwm_round_waveform_tohw(...)
{
	...

	if (wf->duty_length_ns > RPI_PANEL_V2_FIXED_PERIOD_NS)
		*wfhw =3D 100;
	else
		*wfhw =3D mul_u64_u64_div_u64(wf->duty_length_ns * 100, RPI_PANEL_V2_FIXE=
D_PERIOD_NS);

	return 0;
}

> +
> +	return 0;
> +}
> =20
> -	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> -		return -EINVAL;
> +static int rpi_panel_v2_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +						  struct pwm_device *pwm,
> +						  const void *_wfhw,
> +						  struct pwm_waveform *wf)
> +{
> +	const u8 *wfhw =3D _wfhw;
> +
> +	/*
> +	 * These numbers here are utter fabrications, the device is sealed
> +	 * in metal casing and difficult to take apart and measure, so we
> +	 * pick some arbitrary values here, values which fit nicely.
> +	 */
> +	wf->period_length_ns =3D 100 * 1000;	/* 100 us ~=3D 10 kHz */
> +	wf->duty_length_ns =3D *wfhw * 1000;	/* 0..100us */
> +	wf->duty_offset_ns =3D 0;
> +
> +	return 0;
> +}
> =20
> -	if (!state->enabled)
> -		return regmap_write(regmap, REG_PWM, 0);
> +static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
> +					   struct pwm_device *pwm,
> +					   const void *_wfhw)
> +{
> +	struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> +	const u8 *wfhw =3D _wfhw;
> =20
> -	duty =3D pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
> -	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
> +	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE : 0=
));

How does the PWM behave without PWM_BL_ENABLE set?

>  }
> =20
>  static const struct pwm_ops rpi_panel_v2_pwm_ops =3D {
> -	.apply =3D rpi_panel_v2_pwm_apply,
> +	.sizeof_wfhw		=3D sizeof(u8),
> +	.round_waveform_fromhw	=3D rpi_panel_v2_pwm_round_waveform_fromhw,
> +	.round_waveform_tohw	=3D rpi_panel_v2_pwm_round_waveform_tohw,
> +	.write_waveform		=3D rpi_panel_v2_pwm_write_waveform,

Personally I don't like aligning the =3D. If this was a driver in
drivers/pwm I'd ask you to use a single space before the =3D.

Best regards
Uwe

--iymm4l7lewpewlx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhRI/kACgkQj4D7WH0S
/k5KGwgAq3zbHE241ePsg/glbAEk6En81ieCwymmjsOuPNS25XRL8cSrRR7UNklH
zeVLeFTyS2gfXTg/QDGynx8PmGDJ3TW/1uG9gu7RHSXtnPdZ8gjs6n3Lj+mFFarV
cSxBB1JT1jjBTI+f9rnL5MBu1bVQK9lifCU07eyxUpivCvLIkNxx0OvBQa3KBEW5
a9tIWMUWMb1aiDya9YFaOGWC05t9BFV3tPYJQ1PGgM+NYiuHYOEM2klstfpFkONP
3EYh9sHpRWzddiLCH+WxIqraDCZusBU9I2ikAxTXV+U6dMZ9S6dE95bbnP3QUCmT
g+JfWsbLAZHzC/lGvoakrbJQc9/G9g==
=SHh+
-----END PGP SIGNATURE-----

--iymm4l7lewpewlx2--

