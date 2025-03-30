Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C63AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k+Y5ReIOa8H47u79tGR1AW/2+R+LuYfBtErRCizLOk=; b=VIVbWjokN+K8gILfBz89gTaS9E
	gxdkDj5uPWLxPvcnB/Ets7iPuS1k79Kb2HmTbweulD+/yjWhYZZ98e12oWPY8bcuV4qh72e6SGVk5
	qXr+NfApuT0Phwno5Ar5uwXhKxYpigBVHsfGavbA8B8EJ1CLpC2rp2MEZTY65c5E05x0JUuMD84kx
	+GpVAnfcXzmK0LAaQW///wdXxl82pp3s++AUop94jJTX3KECyHEImufm0miEpD1Nv+uG5D+KDZGjc
	u1I1JAdjY1paYFAYTHITrhPCzoeizIdlbRBL9NAcCXnooe4n9FbTBAVYUSJinY86miPMK6aOthtxE
	a+URFhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymLZ-0000000FrJL-3P5o;
	Sun, 30 Mar 2025 06:40:41 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymJ6-0000000Fr6s-0mNz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 06:38:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B283010290279;
	Sun, 30 Mar 2025 08:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743316686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9k+Y5ReIOa8H47u79tGR1AW/2+R+LuYfBtErRCizLOk=;
	b=HuDg6KNZrF0KM1dFLTYi0XMA4mnXwPf214AlrNGhJ8eDezOa7d+fSBnrRE/g5yBfefQvvG
	Ox1n3XV+3vRLJwlsuninZZnf0YeEnxKvE2ryuljHLCnRnxXgIOZwLyFdL2kLfnQ+dg1zvg
	A+kFdr9e0qLTYc7vl1GWnZIcwmDPZdqFIqFmekrO7rehjJUCtgiUHDFBjCywRnw5a9IEXX
	mpSNCC33/y+Me9DX66o0hU6CfrypvtDjycEm8IfFuvbHsakGYLWNIwNhmdapNccePS884e
	qMWSjrSYRoVq5mkMTXFyz8aSDLhYlKZympEMFxH2ztikYpxIPKvxNUAkUFx+Ew==
Date: Sun, 30 Mar 2025 08:38:03 +0200
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
Message-ID: <20250330083803.75a8b53e@wsk>
In-Reply-To: <b187dd05-2d9d-45d0-81d4-fc619dbba1d9@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<b187dd05-2d9d-45d0-81d4-fc619dbba1d9@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fBDXOrwfi.DnGuoT/zlieFq";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_233808_365893_FE8BD572 
X-CRM114-Status: GOOD (  16.01  )
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

--Sig_/fBDXOrwfi.DnGuoT/zlieFq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +                        /* Both PHYs (i.e. 0,1) have the same,
> > single GPIO, */
> > +                        /* line to handle both, their interrupts
> > (AND'ed) */ =20
>=20
> ORed, not ANDed.
>=20

Yes, correct.

> Often, the interrupt line has a weak pullup resistor, so by default it
> is high. Either PHY can then pull it low, using an open collector,
> which is HI-Z when not driving.

Yes, correct - this is how it works.

>=20
> 	Andrew

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/fBDXOrwfi.DnGuoT/zlieFq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfo5ssACgkQAR8vZIA0
zr3WEQf9GrsZedlkoBqYc0+xKBgj8WPrMwiNSBqHy0trL7PSVtE9pN7ZQrFpRfdi
c2HPrZPNA8+zH5vnWWhdRzMBqywa7rtDLbBDaudDut+lqrwG8I5wRQAHfxZ++DH3
0dvq29opUYpQ6tJeZtack8i9RwdMEQ3jzvrQ9aEmao+PXfhsyqnUy4+7z1KcdCkc
1CvGBuNdbluE99D+ZO2/HC/aKnWAq+ugj4blbCsvuRTSKGoczBdOoZYLfcbkrfwf
BXoE140i5YytrVmWUEl8st58W1PFKTICFz+gSwS8L1JLHhBupi/Lbjzuy6GXHGql
q+llzRrl4kd2MdIr2q4LP+JbQ9/+mQ==
=NIIL
-----END PGP SIGNATURE-----

--Sig_/fBDXOrwfi.DnGuoT/zlieFq--

