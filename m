Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB896CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrJc7oXNNs7XpVs5V0pk82jzYIs19MQnk8BCVdhU5PU=; b=Snntq5dL4zdkQZbXFlut/HpE/n
	rOX8D6O3mMXZ3gJ7p27n7ItQKD2BYblTo/HS8tIvQkISQYGsMh+Aj9+45BTxsdsVchALLaLwGZpGT
	wS0uu5UGSxFQTDczfR/6cwTAKxK/Qa4HzJYSWq05HsPvgzNGi8WSR+ftLzve084FRTvkOuD8SzQJb
	LhS57Tmc23XfvvBUFq4wTgksTlNpLGbOBBQqxroSN9cBUdawqSwG+iYrrFughxIzc7ry5hGrydOPZ
	kCYDgRX90JPmSj/BgaeBY8a9g1AeDSE2LjlM/AoOnDAsm1QErjoYqWQx0LlA9yie4F+eE+Dflslbq
	Q/0T5rzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOf2j-0000000D58J-3RBg;
	Sun, 17 May 2026 17:12:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOf2h-0000000D57k-1Wje;
	Sun, 17 May 2026 17:12:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 996F340DC1;
	Sun, 17 May 2026 17:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0632C2BCB8;
	Sun, 17 May 2026 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779037962;
	bh=rZTvaM2qqzZ0+ZHapysXVlkiReT0C0YfxuSAed7oo4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUrmpOI5z3LGWD8/mdNkUlYbcEA4ysfIOvjNwFRxSxquanwD9ZR3iTnB+zT95QL4s
	 BmgZ3CpZXgSsU25OUFfr+ynh/HdoGAP6IPd2DjvkMbRwg0jthmTYzrzjIbZk1paajv
	 U7tO/7oaP4A5gHOcBuSm+xDyKJHnJpvgpb3KP41K0n9NhdnMiGcfdqvyUqVK2B08ZY
	 lrpWt9CBYbSMa16NE3SOPUm3Q3zFNuwKaKAzflJMaP7qMamAdeFVNa1GV8b8ictQD+
	 YqCjNxbWwokvEf0AaTrKrRm23D86U0T8KhMuk5dD8Qx7BZNO7SReEPlyoX35YncqkF
	 mPGdwlJrpqUUA==
Date: Sun, 17 May 2026 19:12:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pwm: meson: Add support for Amlogic S7
Message-ID: <agn2Yp3mzI7DcsyN@monoceros>
References: <20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com>
 <20260402-s6-s7-pwm-v2-2-657dce040956@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eenroa65e3lftv6j"
Content-Disposition: inline
In-Reply-To: <20260402-s6-s7-pwm-v2-2-657dce040956@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_101243_451655_EA11619D 
X-CRM114-Status: GOOD (  22.23  )
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


--eenroa65e3lftv6j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] pwm: meson: Add support for Amlogic S7
MIME-Version: 1.0

Hello,

On Thu, Apr 02, 2026 at 02:40:16AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add support for Amlogic S7 PWM. Amlogic S7 different from the
> previous SoCs, a controller includes one pwm, at the same time,
> the controller has only one input clock source.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pwm/pwm-meson.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..7a43c42ef3d6 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -113,6 +113,7 @@ struct meson_pwm_data {
>  	int (*channels_init)(struct pwm_chip *chip);
>  	bool has_constant;
>  	bool has_polarity;
> +	bool single_pwm;

Conceptually I'd prefer a `npwm` field here. That doesn't take more
space in memory and simplifies the logic a bit. (At the cost of having
to adapt all already existing meson_pwm_data instances, but that's fine
in my book.)

>  };
> =20
>  struct meson_pwm {
> @@ -503,6 +504,18 @@ static void meson_pwm_s4_put_clk(void *data)
>  	clk_put(clk);
>  }
> =20
> +static int meson_pwm_init_channels_s7(struct pwm_chip *chip)
> +{
> +	struct device *dev =3D pwmchip_parent(chip);
> +	struct meson_pwm *meson =3D to_meson_pwm(chip);
> +
> +	meson->channels[0].clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(meson->channels[0].clk))
> +		return dev_err_probe(dev, PTR_ERR(meson->channels[0].clk),
> +				     "Failed to get clk\n");
> +	return 0;
> +}
> +
>  static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
>  {
>  	struct device *dev =3D pwmchip_parent(chip);
> @@ -592,6 +605,13 @@ static const struct meson_pwm_data pwm_s4_data =3D {
>  	.has_polarity =3D true,
>  };
> =20
> +static const struct meson_pwm_data pwm_s7_data =3D {
> +	.channels_init =3D meson_pwm_init_channels_s7,
> +	.has_constant =3D true,
> +	.has_polarity =3D true,
> +	.single_pwm =3D true,
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] =3D {
>  	{
>  		.compatible =3D "amlogic,meson8-pwm-v2",
> @@ -642,6 +662,10 @@ static const struct of_device_id meson_pwm_matches[]=
 =3D {
>  		.compatible =3D "amlogic,meson-s4-pwm",
>  		.data =3D &pwm_s4_data
>  	},
> +	{
> +		.compatible =3D "amlogic,s7-pwm",
> +		.data =3D &pwm_s7_data
> +	},
>  	{},

If you touch that array in the next revision, please make this line:

	{ }

(I.e. add a space and drop the comma.)

Best regards
Uwe

--eenroa65e3lftv6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoJ9wUACgkQj4D7WH0S
/k6z4gf8CDKq+whV8je2O5ohJtU1A9GFL80VjHGqWPlp1Vzj64QRpZCZCbBwA/Mr
VhA7vIcUm2o6m3dGLNdz5Y6CXusEk+afjTh3eQOMgyOXCbK6gL69QQ3TU/RCGuIX
AGorWZzjsaV9UveLX4vc2VcZHEfxNb2AWNjvOgRfWrVb82Tw9cmg5Ago9dTFaSmz
LKS03jU9jzuo4qge4VeKniPvSp+a/5YyTGgPOpFcR8RP8/orcE5EhCSI9J4QE+Ad
Ynysyz8gr+delAF0En9fx190Psp2HsJvaEHO8C5xDfNXWkLw0tEiWD3QZVPY5TFH
MgfGGtsEIzVFRLKzVpfLkWRtc6Dr7Q==
=fPc/
-----END PGP SIGNATURE-----

--eenroa65e3lftv6j--

