Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69894C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3atyXQrtEhC47307yYW/f61uT/JsB20neZSUJa0u2I=; b=IDD6LEamEb3+KPevtz1Pl4zEhy
	RZ1xm2ovKNq+83doMUdT4WuM0NmYgjdorXGh1U1IoJNJNSu6/9Sdys5Y6BM48nB2Ud+dUZOFVl+vN
	85pGJJ7IpeQ8ulXAFOW57dMwxYfpYjN5Dv2hWYn+bBNHZT/XX6cD6b47m+5Kke1Z6xMSMr40aqkZb
	wfi6UR/XUlgaHkfms+m9tjWz8p9SxhYwj42iCRzm9LiQEX550xeYzbOM+ypbDzrZBf15DcBdi0aOh
	IahPFnfZ56agjolMGO60Ytnzarb4DG29b+EAK4Pyvgq2y2KU9EfzdiZ8E7tkTAwvSQ856js65Bfli
	rozufrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgEQ-00000005IjC-1feA;
	Tue, 15 Jul 2025 14:02:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubf7l-000000057ea-0oEx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 311555C5F18;
	Tue, 15 Jul 2025 12:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F67C4CEE3;
	Tue, 15 Jul 2025 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583867;
	bh=SYqdH0nbo/soJyG407Y7VfgSiFhIAFxZHSCoScU9FK0=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=O9/iwWRge4o3xkYF0GIBAevq1B/CZpGE0WPXQr2yKNDytYayI51CvSw1FALWIDe/q
	 sfD6OGm6lZ3ClTA9ZS1MLIpHdn77PfGKzcYSbZUR1Dfuh5EMkwanZXYx7OR7F4SfCD
	 BdNdpJDdGjMkJo+41UhCEVencI0tcu5sViP2tcRIxbuGJahIkv+gsCzw9/VzgWUNAH
	 MU9ha3GNnKWSJlovwr5HHj9m3pM/gWbQwEdNH/0PmUWEwmusGbEmsUTDEPP11BG8Aq
	 OfIey3BylZsQ29U2ljtYbu8IjkfiraOl4EJeEHtW76TLp4AT/WtLab1FRpPYEy3jYd
	 PHYMwoDFdd3kQ==
Content-Type: multipart/signed;
 boundary=ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 15 Jul 2025 14:51:03 +0200
Message-Id: <DBCN4NYM5NF3.S9SFP077EKFK@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Lunn"
 <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo"
 <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
 <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
 <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
 <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
 <c4ff34jwaiyby52ambcxtu2mrjlkcv44scjsveb6s6pvaps33u@bvl3wz6mvsuo>
In-Reply-To: <c4ff34jwaiyby52ambcxtu2mrjlkcv44scjsveb6s6pvaps33u@bvl3wz6mvsuo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_055109_310739_FE9A8F70 
X-CRM114-Status: GOOD (  23.93  )
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

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > Then the core can use is_fixed_direction() together
> > > with gpio_get_direction() to check if it can do
> > > a certain set_direction().
> > >
> > > Pseudocode:
> > >
> > > mydir =3D get_direction(line)
> > > if (is_fixed_direction(line) && (mydir !=3D requested_dir)
> > >   return -ERROR;
> >=20
> > You don't need a .is_fixed_direction(). You can deduce that if only
> > .get_direction() is set in the gpio-regmap config.
> >=20
> > mydir =3D get_direction(line)
> > if (!config->set_direction && mydir !=3D requested_dir)
> >   return -ERROR;
>
> This implies that gpio_regmap_config gets two new callbacks
> .get_direction() and .set_direction() and that in case .set_direction()
> is set in gpio-regmap config, then its used directly from
> gpio_regmap_set_direction(), right?

Yes. Or just .get_direction() for now and assume that .set_direction
is NULL, i.e. it just covers your use case for the fixed direction.

.. Oh I just noticed that this will really limit the use to either
all or nothing. You cannot mix set user defined directions with
fixed directions. Linus' .is_fixed_direction() will allow that.

Though I wonder if we really want to let the user override
.get_direction() and .set_direction(). I still prefer the bitmap.

> > That or either Andrew's idea of setting a bitmap within the
> > gpio-regmap config which already tells the gpio-regmap core and then
> > amend gpio_regmap_get_direction() to return that fixed direction if
> > that bitmap is not NULL.
>
> Even though at first glance I was under the impression that the bitmap
> solution is cleaner, how big should the bitmap be knows only the final
> gpio driver. Without this information, we cannot know the bitmap size so
> that we can use the DECLARE_BITMAP macro in gpio-regmap config.

Actually, I had the same thought. But there is also bitmap_alloc()
and friends, no? And the gpio-regmap config contains the ngpios.

In gpio_regmap_get_direction():

if (gpio->fixed_direction_output && test_bit(offset, gpio->fixed_direction_=
output))
	return GPIO_LINE_DIRECTION_OUT;

Which implies that once .fixed_direction is set it will always be
checked. So if someone in the future wants to mix and match
.fixed_direction with .reg_dir_{in,out}_base we have to add a second
bitmap which tells you what pins are fixed.

You'd probably need to make sure offset is smaller than ngpio.

-michael

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHZOuBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jVpQF+NoJo814cmBH+vHHm8ckC5v4daX6Bw6ES
oRBk0K+1tCH3Dj4lZ2+8iHri4IjcdFZhAX9VG0PCxJXduNN2yFaXPrmuMHUuQp1w
LDLbANDZ8lC0qwzD9T/zhyjuqoiIMz/18Zo=
=yvBU
-----END PGP SIGNATURE-----

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6--

