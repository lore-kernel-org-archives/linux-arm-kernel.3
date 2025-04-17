Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305EFC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWQQRs0tNulqLLtU6X0X0rTBDfrE7GYWj3CFIceXYpw=; b=Jp0/pnEYiFfx1ceWkPMEbtmpog
	Vl47gIWLDg5FAaUA8NkC50axrNUh5XGECveVVIKWOx1kLTcUaAl8N4elE5XQtxHoH0Wf5z+/9VOJI
	dtDhJPofidcUh3nZ1y5w0rjH6WhmXtuGt1oOujMpl1CmFkWgkCT/dWP6sd5tY3XW3dOK4jYI9rOLh
	d7l9a6NmSGU6eK/SnxKhl01PLvAHsf4MxoJ/tKxsZ+IV1NYv2BfN/HCLmCDQODi9KWZxIziK+v9+G
	VQEYTwOfiOxyP9MxffACXFC+1q7hGonnXcgLwQGwHj1WOMNEoIFCZHJomKcPe03gnba0GHgDnv9TU
	ODTR/Z3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IqZ-0000000Bv9Q-3QQc;
	Thu, 17 Apr 2025 06:35:39 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ioj-0000000Buyg-4B10
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:33:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C5E1039EF2C;
	Thu, 17 Apr 2025 08:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744871623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=pWQQRs0tNulqLLtU6X0X0rTBDfrE7GYWj3CFIceXYpw=;
	b=afXSZzFLb1a2k7ibreW8JrPnIz18s/tOxCEP8LPHLrvqzy7iC3k+Sb54OJvH8lETFgRDws
	34fOPk2HzF0pgqCpoaZj4GK/KcG+B8/i7PjxYjji8r94LTopk9GdDHreJXLjlNFKYgX++X
	ftVu6jWGAkW5Ijbq8gyaGCeCeGFVMQQHgF0ZS8pH0TN4/CUecPt1GPR38DhPVmTC75+xA2
	Xm+sQEE3XkfYb7055LhVq397AIuuz2aha661U55f2VUaUn2YhENdEu+uIWDpBEBMbD+az8
	sjOiiHPy/sWtJ1noGDjo0NJWR0kMBfLSSq2SbhO92Qmzx1Z3CuCZ/YmJRlufoQ==
Date: Thu, 17 Apr 2025 08:33:34 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [net-next v5 2/6] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2
 switch description
Message-ID: <20250417083334.69b565b0@wsk>
In-Reply-To: <2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
References: <20250414140128.390400-1-lukma@denx.de>
	<20250414140128.390400-3-lukma@denx.de>
	<06c21281-565a-4a2e-a209-9f811409fbaf@gmx.net>
	<2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4vV2OQm1rnprx1JCFrQMEAC";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233346_191984_9EC9AF63 
X-CRM114-Status: GOOD (  25.02  )
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

--Sig_/4vV2OQm1rnprx1JCFrQMEAC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > > -		eth_switch: switch@800f8000 {
> > > -			reg =3D <0x800f8000 0x8000>;
> > > +		eth_switch: switch@800f0000 {
> > > +			compatible =3D "nxp,imx28-mtip-switch";
> > > +			reg =3D <0x800f0000 0x20000>;
> > > +			interrupts =3D <100>, <101>, <102>;
> > > +			clocks =3D <&clks 57>, <&clks 57>, <&clks
> > > 64>, <&clks 35>;
> > > +			clock-names =3D "ipg", "ahb", "enet_out",
> > > "ptp"; status =3D "disabled"; =20
> > from my understanding of device tree this file should describe the
> > hardware, not the software implementation. After this change the
> > switch memory region overlaps the existing mac0 and mac1 nodes.
> >=20
> > Definition in the i.MX28 reference manual:
> > ENET MAC0 ENET 0x800F0000 - 0x800F3FFF 16KB
> > ENET MAC1 ENET 0x800F4000 - 0x800F7FFF 16KB
> > ENT Switch SWITCH 0x800F8000 - 0x800FFFFF 32KB
> >=20
> > I'm not the expert how to solve this properly. Maybe two node
> > references to mac0 and mac1 under eth_switch in order to allocate
> > the memory regions separately. =20
>=20
> I get what you are saying about describing the hardware, but...
>=20
> The hardware can be used in two different ways.
>=20
> 1) Two FEC devices, and the switch it left unused.
>=20
> For this, it makes sense that each FEC has its own memory range, there
> are two entries, and each has a compatible, since there are two
> devices.
>=20
> 2) A switch and MAC conglomerate device, which makes use of all three
>    blocks in a single driver.
>=20
> The three hardware blocks have to be used as one consistent whole, by
> a single driver. There is one compatible for the whole. Given the
> ranges are contiguous, it makes little sense to map them individually,
> it would just make the driver needlessly more complex.
>=20
> It should also be noted that 1) and 2) are mutually exclusive, so i
> don't think it matters the address ranges overlap. Bad things are
> going to happen independent of this if you enable both at once.
>=20

+1

>       Andrew


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/4vV2OQm1rnprx1JCFrQMEAC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgAoL8ACgkQAR8vZIA0
zr1dXAf+KoIdy7wyBtKjBP15Tbe4F8OveobBmbcJKV0P6JQ5JNNxIFEwSKWjtTuk
BY6L/6XG6JF1r/k/kHMe6/RemX45J3eVx0YJlUDNo/ESLK6Eez9YZIkgcfuNom3w
XwkUNjydQLSEbB+tkY1fizdyBqIGBRiTLq0A2ZHuvklpu9TsgHoLZ7ebuvJaFANd
9ov3lp9/PRK7+0fQ13XMFoPoDv0Svu4LN0yXwR4d8uhYCxmy8bQbs2Ec40Cb2puN
DZcrSwXFw9GCgTMXW5NgoAR9Gx/SaOSmS9lBBqR1wIeu0QrPZ6bTsf/zIj8LO8HC
uiEW59nmY3d05Emg0PG7Wa9MIou19A==
=SqyS
-----END PGP SIGNATURE-----

--Sig_/4vV2OQm1rnprx1JCFrQMEAC--

