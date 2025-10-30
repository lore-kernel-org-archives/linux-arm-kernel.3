Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD0CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPOSS4Xvr2ZiLCE2TTrws+3Tl9nUc/vBnF2uUi2Fj0A=; b=bCb97bmnWbrA/ESp1mA13yWIuU
	6/Rzm1IRyXb72CJ+OhiTSA2k3AWwwvMBEq/AE/Yz2HKKHsp/uGQ2Z6330bennIg/XCtY9KFG5dw6e
	di9UaL3bdHBht0fBxwb1uArZFywCdyq2/P1hex7KIEPL7WzjKdYZIUk9LaA4NFHk+w/nQWuM1roCp
	0MUU8551F7n8Z16bY54pyKkVdBCjfJdS3MmWGFFR018m6DLVILPv7oBDAz10PRhvaGnPPXVYXbXZ7
	GzxRw+jNKuJPVofb7naBdct89AFvOlBleXmkgu/BbIbU9F/M6xO39zWLlMvoiNXrCgTz0XZGNK4Dz
	Z9D6USHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWDd-00000004WRy-1KkN;
	Thu, 30 Oct 2025 17:13:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWDb-00000004WRo-17e7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44A13602F4;
	Thu, 30 Oct 2025 17:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BBCC4CEF8;
	Thu, 30 Oct 2025 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761844424;
	bh=Ga2UaOapRGo+y9uUOsUqRMoBHpskEFYaGzTydEs8NIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pof1RBvX5cRsFJAezLFcWBGDW7rsV1c4M1J99/r3DGwmimwg3GbksGk7NgCOg0FBk
	 iIjzXjj2IJqkdeh2yPQXViNw4vKw3zw5lR44jG429gASfmNYXq+TSE5znGPRdwy0YY
	 ddmqdSyr+vgV/cyHD1fNoSjy59FI9zxVlYyKL5146W0qonhiNsUFCRLS9l/JiJTsdu
	 /d4rzHomrmqMJY85laR34wIR4qKUP2WJ444aShGkavHd2HyGHCPs9YzvnXD3qcoztv
	 Cq2vtvl4aFD2escxUpJ8WYFVlQC9MwZG2UmwTd5GRN6cftyQ6ufd71f2QyDXhZKD7B
	 2meEhwL/lg2eQ==
Date: Thu, 30 Oct 2025 18:13:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix IMX PWM period setting
Message-ID: <qsc5hl22l4bxs6jzqbc43r4wxvmbwz6rpcfsiv4hcp2uzrsscy@ogjzgesvy2wl>
References: <20251030114641.4109598-1-user@jenkins>
 <548dfa909f984868a62e04efc0c51bdf@emh-metering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34swrrw2zoqfjyya"
Content-Disposition: inline
In-Reply-To: <548dfa909f984868a62e04efc0c51bdf@emh-metering.com>
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


--34swrrw2zoqfjyya
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Fix IMX PWM period setting
MIME-Version: 1.0

Hello,

please version your patch revision, i.e. you should have put "v2" in the
subject. The easiest way to achieve that is by passing -v2 to `git
format-patch` (or `git send-email` if you use that directly). So for the
next revision use -v3.

On Thu, Oct 30, 2025 at 11:53:27AM +0000, Krebs, Olaf wrote:
> From: Olaf Krebs <okr@smgw.emh-meter.de>
>=20
> We use 3 PWM channels to control an RGB LED. Without this patch, an BUSY-=
error message is generated during initialization.
>=20
> [    7.395326] leds_pwm_multicolor led-controller: error -EBUSY: failed t=
o set led PWM value for (null)
> [    7.405167] leds_pwm_multicolor led-controller: probe with driver leds=
_pwm_multicolor failed with error -16
>=20
> Our DTS-Config for an imx93-Board:
> 	...
> 	led-controller {
> 		compatible =3D "pwm-leds-multicolor";
> 		multi-led {
> 			label =3D "RGBled";
> 			color =3D <LED_COLOR_ID_RGB>;
> 			function =3D LED_FUNCTION_INDICATOR;
> 			max-brightness =3D <255>;
> 			led-red {
> 				pwms =3D <&tpm5 0 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_RED>;
> 			};
> 			led-green {
> 				pwms =3D <&tpm6 2 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_GREEN>;
> 			};
> 			led-blue {
> 				pwms =3D <&tpm5 1 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_BLUE>;
> 			};
> 		};
> 	};
> 	...

I would prefer something like the following text here:

	If a second PWM is requested by a driver before the first is
	configured, trying to configure any of these results in
	.user_count > 1 and thus the configuration fails.=20
	Fix that by only erroring out by additionally checking if the
	period is actually configured.

> Signed-off-by: Olaf krebs <olaf.krebs@emh-metering.com>

S-o-b missmatch. Do you know checkpatch? That one also wails:
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit desc=
ription?)

> ---
>  drivers/pwm/pwm-imx-tpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c index =
5b399de16d60..411daa7711f1 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -190,7 +190,7 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>  		 * there are multiple channels in use with different
>  		 * period settings.
>  		 */
> -		if (tpm->user_count > 1)
> +		if ((tpm->user_count > 1) && (tpm->real_period !=3D 0))
>  			return -EBUSY;

Please drop the added parenthesis.

Thinking about the error here, I wonder if a saner check would involve
enable_count instead of user_count.

>  		val =3D readl(tpm->base + PWM_IMX_TPM_SC);

Best regards
Uwe

--34swrrw2zoqfjyya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkDnMMACgkQj4D7WH0S
/k75IwgApdc2XPIDEyp+ZQcUeA+W1RUlQqraSjno8l3UnToMwlCt+ChVq19ThmyM
EdsIvUZnM0/5QjS856KJzxLKsFHa+KCYEi2I8Y7El/rEUU1BZkH0/HXR/QZ/SLc5
+Sal0xhUXIfxtSPWVH2BU1BX/h4yXmuysgSqfgbyuhxjiLPd6BNq03rNVP0uQJd/
+DhPiRYWxtVJJf8uxLYFu55POjiLDzlHWaJLz6x+umtjlrX5I3wdvr7MxvYk4Gjp
dPkrAqdKCXHkc+cr9CceupLqqPShhTmd0njU2kdKkYsLccd1chdfTBS7UXF9Ydkb
JM68cr+6yiYfx/cbCPLXx+xsDk2idA==
=2+ej
-----END PGP SIGNATURE-----

--34swrrw2zoqfjyya--

