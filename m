Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CBEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRteZqX1GzZD63e0WZQkOLe8JTjQebQr5YPHcAOXdOk=; b=PG4vSZDrvIU/pAt6u3CnkmPjqF
	Vb98WTuHiuMQNHwIl2CvL0LuX7IrFH5W01gB5YYQnBWDY1OroXjcct3e3EKwj1JOGkuBCtU+tDgEf
	Iy+Ae4eEg9F57FTHS3/coXZhcE+2adTU0OLC6iGqepfbpawDvhr/g5iln6scPno3Nzo9axzEh9pKc
	SbjhpWYSuQ47sWbWomu0WoRIGL98P5/dGXER7Wg9arA73356UNIO5xo/Nn6vAHoZjs7gBqg7nZ6NF
	xTCqgRTpxHoZngp1PcaNftMNCPUY2BoCnryqFdO38LzwoIxCrvzLAKjGN9EFo7iI38U5rMT3VVQXF
	2DKWeu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymJs-0000000FrBs-0fdA;
	Sun, 30 Mar 2025 06:38:56 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymI7-0000000Fr1c-3qr5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 06:37:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B28F510290279;
	Sun, 30 Mar 2025 08:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743316625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BRteZqX1GzZD63e0WZQkOLe8JTjQebQr5YPHcAOXdOk=;
	b=FQKJ8Z2kGAokT6ywehaNtgo4kL74MSKFurMp3SWangcCUjXmAxle3cHYj0S2LnQdb2cCSJ
	hj0+HhGzOwvUKc1/AgP+oaeYhfa8e8CdeLsWGDLn11HEBfrpZMcCeEcx11qQ4qCscVaow4
	vBVMNsuLE0QblJKPng56DgnRAjIqSyNW7hPQTBX78IAMTDOBhcL11Qkq1ekIYjt+uS+zpo
	A/NU6/GHm07q9QmQUBWeX1xZ02itODBK8heUFv1pJi2OSmB2gC0B9hVk7FdS9cNMlhx2F5
	n6/+ykOhOLJED1PAOQLyZxfD4wrWhPFQLRYXRrqk0bgOMqMq0QGuueWmi3zbGQ==
Date: Sun, 30 Mar 2025 08:36:59 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250330083659.61c52d2b@wsk>
In-Reply-To: <45c6cb9d-b329-4b4c-a480-08110a546fb6@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<45c6cb9d-b329-4b4c-a480-08110a546fb6@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7c2ovTtNXoWn5CzXtf1gA5K";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_233708_110908_01899140 
X-CRM114-Status: GOOD (  15.48  )
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

--Sig_/7c2ovTtNXoWn5CzXtf1gA5K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +                ethphy0: ethernet-phy@0 {
> > +                        reg =3D <0>;
> > +                        smsc,disable-energy-detect;
> > +                        /* Both PHYs (i.e. 0,1) have the same,
> > single GPIO, */
> > +                        /* line to handle both, their interrupts
> > (AND'ed) */
> > +                        interrupt-parent =3D <&gpio4>;
> > +                        interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>; =20
>=20
> Shared interrupts cannot be edge. They are level, so that either can
> hold the interrupt active until it is cleared.
>=20
> Also, PHY interrupts in general are level, because there are multiple
> interrupt sources within the PHY, and you need to clear them all
> before the interrupt is released.

Good point, I will update it accordingly. Thanks.

>=20
> 	Andrew




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/7c2ovTtNXoWn5CzXtf1gA5K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfo5osACgkQAR8vZIA0
zr3SIwf9EV3MvkqdhVVWSD+ZO9I/1J4aB76//m6svQ5c9dxHZqk0fkXCLWGOilBb
sm8la7oyGMGoI83LQHg8dPcxjBdxDGA31xCHjuuFFd2DTCfNl4tCvJkarLjsrMmE
Inug1rJoApfOioU5j1tcNnzcoAmERGpfqOhKhVbPRs9izt6m5WvkuD053JjqK5sg
0XRWIlMl1WkVwZ37ju/Tb28U8MeUzDiTPMw06IW6HYP0bplP9lxDaV5RZ+2xaMAx
YQoxlMDe3+kvntv6UrlxGKMUwPwXaV6j3K+NBi9uU0zpIIf/DBa2sJ62LddytSv5
X0P5l5sMgq7Q5iYO1nCW/1AUuuLYBw==
=Epnz
-----END PGP SIGNATURE-----

--Sig_/7c2ovTtNXoWn5CzXtf1gA5K--

