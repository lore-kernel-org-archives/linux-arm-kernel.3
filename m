Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8011FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+RLuKCPgbk66xBwKo0bHakN65cbNdQ5/VO/8/oew2w=; b=QsmeffKnGf3ePTC9M31j21zkul
	jA45lowfFF6rIwG0k+GEw4N0ZdYMKw7EMAo9f5ADCLFmHIxanWyxZ47wy8Ei6sdLSsw2VTsaiEaVp
	txY8ywRnQEZYhj0qCba6gfwaCnBhzrKmYNmkgNLX+ETVvWSf/dIoqjVO1m2Yd2GCuMHae73ya22Je
	5jkpB0zpbsOTHtRasCcqtbk7IC2VOL2pm9lkGX//TF6A3SbCEcvx8eAnNZTcI5XBeLgzHG5dNflqO
	49mL2cM+qgaEHbxH7ujzqXUEew3Ls5fwZ7d4+nvTWegoAp9qxw9ifhC5ljWeh2D5flhc8xzbLbvy5
	uxPpetzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8e4-00000006i1X-21Cq;
	Wed, 12 Feb 2025 09:03:00 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8U0-00000006gIG-3XUp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:52:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3537F103718DE;
	Wed, 12 Feb 2025 09:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1739350352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+RLuKCPgbk66xBwKo0bHakN65cbNdQ5/VO/8/oew2w=;
	b=U8SEPOdi01GyjnbRegQ5WMTYC5uwO8C9/23SgBVfiWI7fSIXfi5wqT5MFIR9uP9mKwa/md
	LbpwQPjvP/5N/AyQiSUENllQ6jxifVfo5GWaN/vSEfkq9VF6wiMl+lu6dn8WX3HJHrEuBN
	aMvHEMawFnIJ7Kwq1HUY2NEb5H2dOYjEGQL0pBSI15gjBpjMZUnoAss5hHMpOfjRGKsfU6
	Q51FUIJlcbawZ380T0gWGtKVagBKWQPzaVr8aajuSwCTdJbLzrAA1IjinIWDkRw5geG8W7
	aaYEWFU5SqIzsWhXVyjw1qcHEqvLLkcTGvjJpmoap04vav7sVVBuJb23vtVGUQ==
Date: Wed, 12 Feb 2025 09:52:25 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20250212095225.52479de4@wsk>
In-Reply-To: <20250206102732.0b44ba8f@wsk>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241107085705.490940-3-lukma@denx.de>
	<20241119165236.69438f75@wsk>
	<Z1aucR3ueKIxOjSX@dragon>
	<20250206102732.0b44ba8f@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VFMFU2XxV.3onaK0LW06GAk";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_005237_028744_16B59DD3 
X-CRM114-Status: GOOD (  25.12  )
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

--Sig_/VFMFU2XxV.3onaK0LW06GAk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Hi Shawn,
>=20
> > On Tue, Nov 19, 2024 at 04:52:36PM +0100, Lukasz Majewski wrote: =20
> > > Dear Community,
> > >    =20
> > > > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are
> > > > to some extend similar to already upstreamed XEA devices, hence
> > > > are using common imx28-lwe.dtsi file.
> > > >=20
> > > > New, imx28-btt3.dtsi has been added to embrace common DTS
> > > > properties for different HW revisions for this device.
> > > >=20
> > > > As a result - changes introduced in imx28-btt3-[012].dts are
> > > > minimal.
> > > >    =20
> > >=20
> > > Are there any more comments / suggestions for this patch set?   =20
> >=20
> > Patch #2 and #3 look good to me.  That said, I'm waiting #1 to be
> > applied first.
> >  =20
>=20
> Patch #1 has just been applied by Rob :-)
>=20
> Could you apply #2 and #3 then?
>=20

Can anybody pull those DTS changes?

Thanks in advance.

> Thanks in advance.
>=20
> > Shawn
> >  =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/VFMFU2XxV.3onaK0LW06GAk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmesYUoACgkQAR8vZIA0
zr2XFAf+P9Nhc1UqqZv502pM9by1vXiZIEPVm2lPBXAPQca5fKVy1u/ftLNXfFis
w9dGzKFNVAqNc736vwTqO/X81nA7KhA5y/uR/qwDCMfJfeT0wNZTKqwzsaUelNZ1
JSQJgrZVWgNlARw8ezu9E2URHi1KZk/PZ1+b0gnvRtE1K8HXCKi6zzNQrpvrDjXw
j6AGUunaBXbIcigV9Yr3PQZbjsL53kO0UeVQsksKKnuYgvz20U6hr0KPPIcfOevC
aCLjybN4gIY4FCGa2dh3WUNHq9o4QyQhVyPArgS744F51uS2yLusDUHZgxDZHVc8
eYPW6Yq+TKKFTaNqB3sSnPIbp2/8/Q==
=u75r
-----END PGP SIGNATURE-----

--Sig_/VFMFU2XxV.3onaK0LW06GAk--

