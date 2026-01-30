Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA139E6BF3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neuysoUB2WtESX79CSr0WTAeTmxLbDhtprioYnx2y0I=; b=osJLZIWEsgWgd6i7po7+tuBivr
	//32YuHcWgEwgFjSsoL/1JlZd1XJHZ5GwwPyuvde6HJFNZZaEXs0/QxehUQ9GiFTUy82s4bryW4YE
	bzNDe6J3tNWUA+F+Xbis9zkcOeyJJiBbQLImd+DCKbZWAP0JjBVjL8Rs15dCpZemtSaK1dLKavOsb
	vOmRYuqPi36QMigPKcKuNXvCGY/ZM/gbV74aHcPLVLPJjlr1LwZZN/zirmohS7Eps9ZDboiLl2AOw
	OFYL9qnnhIqMn5Z6TQgl7NUHyYNIz4OfYNEEPox4mQnDUpQy60s7Tw8u+Dv8SzO+q0S7Vlg6mfemy
	+R1E9+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxTD-0000000253h-1p4l;
	Fri, 30 Jan 2026 23:00:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxTC-0000000253S-1CxZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 23:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EE1160008;
	Fri, 30 Jan 2026 23:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7EBC4CEF7;
	Fri, 30 Jan 2026 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769814005;
	bh=GBzpXsnsK2Cyxpu5Z14dtX7F4paagl1xkilH19uLH+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyXhbl4VXI1lm1QPv0+uz/7kz0F7sLvf7W5tMuWj/CH/lcUlXBOoGgoiKI/aV3vbw
	 rRwtbiud1B17Rg5m7GwSHMqBCPAmm7GPl6iL2QFt+qarYysv0ktSXfIbXC1mimMdhu
	 NuuhgHVfUNAYpxjU3VqkyYQmBWqchZIJAk5RXefKDjjPEsX63Uw8ITRZbdrUvecXJ7
	 8pmjBROil7CQtTIrhOEd6LxF9eOlDBjVcMaHQxLgZZ7GNnr5unNIAVpE+fyulFkrvU
	 u4dwz6HexOHK/SmRIvlQKL48sa8YKl//9jnjE8Rt9mzLDcqMMeWIxvxAi+E0VrRCU4
	 UDkyrvMKiuhYg==
Date: Sat, 31 Jan 2026 00:00:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: imx-tpm: keep channel state instead of counting
Message-ID: <sqpcohdky6m2kz5o7izoclr7k4wi2s72mi4ojrdhr2kbogtfbt@v6y5raizg2n5>
References: <20260130143720.778514-1-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7xvp3kdixsnpt4an"
Content-Disposition: inline
In-Reply-To: <20260130143720.778514-1-viorel.suman@oss.nxp.com>
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


--7xvp3kdixsnpt4an
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: imx-tpm: keep channel state instead of counting
MIME-Version: 1.0

Hello,

On Fri, Jan 30, 2026 at 04:37:20PM +0200, Viorel Suman (OSS) wrote:
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 5b399de16d60..0f8643f4a70b 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -62,7 +62,7 @@ struct imx_tpm_pwm_chip {
>  	void __iomem *base;
>  	struct mutex lock;
>  	u32 user_count;
> -	u32 enable_count;
> +	u32 enabled_channels;
>  	u32 real_period;
>  };
> =20
> @@ -166,6 +166,10 @@ static int pwm_imx_tpm_get_state(struct pwm_chip *ch=
ip,
> =20
>  	/* get channel status */
>  	state->enabled =3D FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val) ? true : false;
> +	if (state->enabled)
> +		tpm->enabled_channels |=3D BIT(pwm->hwpwm);
> +	else
> +		tpm->enabled_channels &=3D ~BIT(pwm->hwpwm);

I'm not sure about this being the right approach, feels like the driver
sells the pwm core down the river resulting in something the might work
now but isn't robust.

If I understand it right, keeping the enable count balanced depends on
=2Eget_state() being called.

The usual and robust approach is that .probe() checks the device state
and initializes enable counts and the like accordingly.
=20
>  	return 0;
>  }
> @@ -282,15 +286,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *ch=
ip,
>  	}
>  	writel(val, tpm->base + PWM_IMX_TPM_CnSC(pwm->hwpwm));
> =20
> -	/* control the counter status */
> +	/* control the channel state */
>  	if (state->enabled !=3D c.enabled) {
>  		val =3D readl(tpm->base + PWM_IMX_TPM_SC);
>  		if (state->enabled) {
> -			if (++tpm->enable_count =3D=3D 1)
> +			if (tpm->enabled_channels =3D=3D 0) {
>  				val |=3D PWM_IMX_TPM_SC_CMOD_INC_EVERY_CLK;
> +			}

No { } for one line blocks please.

> +			tpm->enabled_channels |=3D BIT(pwm->hwpwm);
>  		} else {
> -			if (--tpm->enable_count =3D=3D 0)
> +			tpm->enabled_channels &=3D ~BIT(pwm->hwpwm);
> +			if (tpm->enabled_channels =3D=3D 0) {
>  				val &=3D ~PWM_IMX_TPM_SC_CMOD;
> +			}
>  		}
>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
>  	}

Best regards
Uwe

--7xvp3kdixsnpt4an
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml9N+8ACgkQj4D7WH0S
/k76nAgAn8xLKTNmCc/Rl13FIw2HubBJdNbWuOQ7ASbK49bL/CHl69Q6rhlTDiHH
7XQD0ngk8c4+NRVnTx7uetLD71ZmWh8daSGg1n80MlRjlQxU1oR/II01FwMGj9tt
P1tobD+As9HklTNatNg0cKyLKFsCEpB30Lew/KcsBcyu1nchbxUnGJJ9Gp5hP659
wH4icYh4Y828hfuw8ckuoAXZkGe3wYiS8WFel0xEKmEhIex/EuJAyQuzIAJez+Qe
LtIL2XTiCQd+DhctVGqo5/aRi+Rd9X0xXEymrh0RwTPIn9CMbbFoxhthLC30/8Er
OOpYm6Vo+WNti3tgEx3Xx5VuwFNUUQ==
=eAkP
-----END PGP SIGNATURE-----

--7xvp3kdixsnpt4an--

