Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF95D78310
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W5zDxuutiJ3jDWaXq8HAXUOVLNLaySkH1Afki67he4=; b=TYHPkd/JW3X+Ow65xHUVh7kvEv
	2qlw72UeQyINV2X26qBY5qFjNx/JkDi5a680fw8c/NJ5/Y1inaWtxoVnB09VjO5vm+oQURnvN6POU
	Bqq5SPVv+DdGnA/6GG/TAZbPKSG3M4w3PLJL4x02XmN6ovM/yErRuZWqHUZLv3KbBlkwbgfzhi7E2
	sSbZ0ww4wxdPItZqOg8bRtI402rIFhJ4OZHbYevLNRKBNxv56+YLyDzB7mweePe84OOPpJ/LCqX5h
	VJOxD5uGyojnxqxNgAZK8lTzej35IsItfoGA+y/dX/CkFbOd3HRPL1nhT/sNKK5EP62S2xGMcQOpI
	S4AZeiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5GR-000000061hc-3Til;
	Mon, 02 Dec 2024 12:10:55 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5FQ-000000061Le-2aD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:09:53 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6460F1C00C4; Mon,  2 Dec 2024 13:09:51 +0100 (CET)
Date: Mon, 2 Dec 2024 13:09:50 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 6/6] USB: gadget: pxa27x_udc: Avoid using
 GPIOF_ACTIVE_LOW
Message-ID: <Z02jjnoqlvRw8YV0@duo.ucw.cz>
References: <20241124125742.3341086-1-sashal@kernel.org>
 <20241124125742.3341086-6-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CahKicY9gksnAilV"
Content-Disposition: inline
In-Reply-To: <20241124125742.3341086-6-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_040952_844070_BE5250BE 
X-CRM114-Status: GOOD (  16.54  )
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


--CahKicY9gksnAilV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> [ Upstream commit 62d2a940f29e6aa5a1d844a90820ca6240a99b34 ]
>=20
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Well, we won't be removing it in -stable, so we don't need this.

Best regards,
								Pavel
							=09
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -2356,18 +2356,19 @@ static int pxa_udc_probe(struct platform_device *=
pdev)
>  	struct pxa_udc *udc =3D &memory;
>  	int retval =3D 0, gpio;
>  	struct pxa2xx_udc_mach_info *mach =3D dev_get_platdata(&pdev->dev);
> -	unsigned long gpio_flags;
> =20
>  	if (mach) {
> -		gpio_flags =3D mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
>  		gpio =3D mach->gpio_pullup;
>  		if (gpio_is_valid(gpio)) {
>  			retval =3D devm_gpio_request_one(&pdev->dev, gpio,
> -						       gpio_flags,
> +						       GPIOF_OUT_INIT_LOW,
>  						       "USB D+ pullup");
>  			if (retval)
>  				return retval;
>  			udc->gpiod =3D gpio_to_desc(mach->gpio_pullup);
> +
> +			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
> +				gpiod_toggle_active_low(udc->gpiod);
>  		}
>  		udc->udc_command =3D mach->udc_command;
>  	} else {

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--CahKicY9gksnAilV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02jjgAKCRAw5/Bqldv6
8uBpAKCEIhs4qSybrSo2Osfg6mGdAgaRpQCfQwkrTwJnuhR5kifD55c/wiNXd0s=
=8Pn9
-----END PGP SIGNATURE-----

--CahKicY9gksnAilV--

