Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Upffkr9Yy13DmAWHLsmplXaonISPjC+YsZOOcmdckk=; b=hu8mn4/V/3KtbHCXf4sJJycai4
	cAyuIaRuf/SUlW535Nz7gvPZb6T8r/qCgZBNWCoYUTdqDNfoHPZdZrYYxiylNBe+EJ75nek6kEnTp
	RKKOCVdj2f2NltZmfcXpwZw7cRCIyLVZQ4IXdlxaSD9K3k8mxdtYVEeMQgXx1yoi1eTeEdYiz5T4l
	qU0jCZ4UgP2NeWXmJXDUbgdHnWzYzad0Ncs4QjVMpKR1ORdW05NlsVxdbTXmMkHElRBPS31ohWZX0
	5dwVC5JvaUEy51RyRKWdzeeywkXL57sqyqZWPw9fxwgfuuVQLxYVuQ9PDoYAD5fKdt07hdVLp4PQl
	jdqv/zzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GcL-0000000EHr0-2jdO;
	Fri, 11 Apr 2025 15:48:33 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GZU-0000000EHTO-1qdM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 15:45:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A915103B92D7;
	Fri, 11 Apr 2025 17:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744386333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+Upffkr9Yy13DmAWHLsmplXaonISPjC+YsZOOcmdckk=;
	b=PKfuqoTBF8hjxW1TDHptk6vQF1Na4fKu97/graZ1upeWhnoUHjsLEoWYFxyC8VPu6oyC99
	9Uto9JRbj8FkfXTq/K2/OC0pPMDnatJ/j0bxpB7riTgd/Jqke49Bgzflc6fdFcHFOanZJn
	IiVZ+p8nvpYIH3+z3iY0V2MWcYw78Xee0+ek4V462morBil0Sys8qMkL8eyjcbd+psxghK
	gzS33Lz3HveHbzpPwh1qjeHaGodlFLGGQlBO99IBW//nRUwfcn4Ljj+OZ9ZMAweKB4HhLx
	qzgbqyXNiZ/XBU8hl79FMd3XYTtb3Se3FpwE2iOyV9P099yoH20PPiJxKrHfKQ==
Date: Fri, 11 Apr 2025 17:45:27 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>
Subject: Re: [net-next v4 3/5] ARM: dts: nxp: mxs: Adjust XEA board's DTS to
 support L2 switch
Message-ID: <20250411174527.14a175d1@wsk>
In-Reply-To: <CAOMZO5B6q06nvk3+hzbioGpcW8_JXPZGEebApTU5JZbKvMLzxA@mail.gmail.com>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-4-lukma@denx.de>
	<CAOMZO5B6q06nvk3+hzbioGpcW8_JXPZGEebApTU5JZbKvMLzxA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RjsyxtHSE6bgRB8ADC.4s63";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_084536_632030_6223FFDA 
X-CRM114-Status: GOOD (  14.56  )
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

--Sig_/RjsyxtHSE6bgRB8ADC.4s63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Apr 7, 2025 at 11:52=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > +               ethphy0: ethernet-phy@0 {
> > +                       reg =3D <0>;
> > +                       smsc,disable-energy-detect;
> > +                       /* Both PHYs (i.e. 0,1) have the same,
> > single GPIO, */
> > +                       /* line to handle both, their interrupts
> > (OR'ed) */ =20
>=20
> Please fix the multi-line comment style.

Ok, I will fix it.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/RjsyxtHSE6bgRB8ADC.4s63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf5ORcACgkQAR8vZIA0
zr2oJwf8Ck6aJmjSk5FB00W4YTIEgy2n/BJVaK1BTJCll5U54B+Hlrwra2iixLwh
jvZqm01bg4Qncx7bYbcHaUeyiW7B7SBc/ikaBi56eDthprdbKS0r3s5wFHTEW8vg
V2JzJjT6jeGJT+nMW7wRouLuZ5EQvi2rrUWbbi8gCKaztEHwEVqbc8BOJ4Kbhinz
gB1OakDJzWZPtgadY8QOUYQMdLx68vBOG9tsttGiiKQG0+s0a4Tih0jqbQCfBgwJ
CQAYHWX11CLdPW7yNvJFKO7nTdw3fNRmFQf3+fk5LbkeLKt7IWNHBPoiB3m3bUZh
YFEUvNsexJb+gquBquCl/bIpp/AVCQ==
=OHjq
-----END PGP SIGNATURE-----

--Sig_/RjsyxtHSE6bgRB8ADC.4s63--

