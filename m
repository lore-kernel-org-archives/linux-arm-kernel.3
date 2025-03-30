Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8435DC36011
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=901Bq3gxJ4OzVl6RNicUF10kt/4QX89li+J+N6jGrBA=; b=42sroIRI7d83N2vepEnjAShNr1
	Jg2b7/DcOX2sbN6FjiEUxLgCD5Lfll0zTz85Zlip39qbwxSnrD1DSnDNOWgCBiy0Oqf6yO9Cmic6U
	V70yI/BVeQ7Pey/pO/JQlyjKCoL2YT3YBW9fJEQsSD0srJjaJk1Igv61Um6wc29Fj98TInsNiifIV
	zJxyufA2UJT6EO52hNE6ynefrUfcihtKD/nZdDQXS9/DZ8hx2ECPPw7T4g8UFJt7w/UkG0L5YNTOR
	ZmfuG3P+OusVK8NzaM0A6rARdRkeoxo7RW5EemUTWzlSEPPxHcM2OB5+k24CXgI5K5FGLx4B5GXBQ
	qtwN/+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzrI-0000000GglL-0kVt;
	Sun, 30 Mar 2025 21:06:20 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzpZ-0000000GgPY-0ZVm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 21:04:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7552102F66E1;
	Sun, 30 Mar 2025 23:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743368670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=901Bq3gxJ4OzVl6RNicUF10kt/4QX89li+J+N6jGrBA=;
	b=Mx7Umlj5Dy67EVKrXk5rs0zN0m01GfK9PxcRu6h4Ck4cYNEAiDqg7YEbMpOyVpdVRt+jne
	UCUpfNJnGxNJRGxRDCMcUMSgrvUxAsWiZLacqZsJTHjYuDs6DfzT3VWx8s51nmjaW2K8JD
	fNEwacAMRdWupC0W8RVpuApWWR6KTpLZ/M/oFYrLcftzMp7JJd5A0hwH83DRI1xJgWR1y0
	20nQNobttE5U4qB71Hied1LhQLJGxQ3KDvotNIuRQsnyJMbuA8h1HH2FFUcUl0LQ2wqVhS
	kc74lmL8lGDGHPQBkKX+TUZn2VBWyenSsCXYNodai5WKeeAt82HIHHfELv0pew==
Date: Sun, 30 Mar 2025 23:04:25 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <20250330223630.4a0b23cc@wsk>
In-Reply-To: <564768c3-56f0-4236-86e6-00cacb7b6e7d@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<e6f3e50f-8d97-4dbc-9de3-1d9a137ae09c@kernel.org>
	<20250329231004.4432831b@wsk>
	<564768c3-56f0-4236-86e6-00cacb7b6e7d@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E2PoMMoC/cTLiz_ZN0ugdQX";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_140433_328736_FA9B7DBD 
X-CRM114-Status: GOOD (  24.34  )
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

--Sig_/E2PoMMoC/cTLiz_ZN0ugdQX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 29/03/2025 23:10, Lukasz Majewski wrote:
> >>> +   =20
> >>
> >> If this is ethernet switch, why it does not reference
> >> ethernet-switch schema? or dsa.yaml or dsa/ethernet-ports? I am
> >> not sure which one should go here, but surprising to see none. =20
> >=20
> > It uses:
> > $ref:=C2=B7ethernet-controller.yaml#
> >=20
> > for "ports".
> >=20
> > Other crucial node is "mdio", which references $ref: mdio.yaml# =20
>=20
> These are children, I am speaking about this device node.

It looks like there is no such reference.

I've checked the aforementioned ti,cpsw-switch.yaml,
microchip,lan966x-switch.yaml and renesas,r8a779f0-ether-switch.yaml.

Those only have $ref: for ethernet-port children node.

The "outer" one doesn't have it.


Or am I missing something?

>=20
> >  =20
> >> =20
> >>> +properties:
> >>> +  compatible:
> >>> +    const: nxp,imx287-mtip--switch   =20
> >>
> >> Just one -.
> >> =20
> >=20
> > Ok.
> >  =20
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      The physical base address and size of the MTIP L2 SW module
> >>> IO range   =20
> >>
> >> Wasn't here, drop.
> >> =20
> >=20
> > The 'reg' property (reg =3D <0x800f0000 0x20000>;) is defined in
> > imx28.dtsi, where the SoC generic properties (as suggested by
> > Andrew - like clocks, interrupts, clock-names) are moved. =20
>=20
> Drop description, not the reg. Reg was in the previous version. You
> added random changes here, not coming from the previous review.
>=20

Ach... You mean the "description" in the:

	reg:
	  maxItems: 1
	  description:
	    XX YY

Ok, I will remove it.

> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/E2PoMMoC/cTLiz_ZN0ugdQX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfpsdkACgkQAR8vZIA0
zr2OOwf8D0o3VBKQo0wzlGRUM/T2N281OQjJWLHyJkh73CTqHrX2rUeLf9n4uJBu
pQbWZbpX7HOxC/3XTUZi5m56dARLhcV2px0RPiMkjRikv/G84Ol530tpvCkWL6xo
yFtrnA9AhHL/2UBUcBu3tymPQ5BWj5uBQN83AZskGaaRu1aZ8U+DGDa+2cPDEM00
5IfBke7cGgUZGS6RPSE6Pdbl3eHRQrY3Kw1tB5UxwhTAePDEMPQ9lR34aOAJ7EJS
6QudhKxb9AeI/FixnJxhtE0HVyyb/NfSYtm4OtqDTRgHe5UXdNVL6MheoTGhyfrh
o2PPkKI+Gp1erjBY7OGhV8Qv1Su5nw==
=Ch8l
-----END PGP SIGNATURE-----

--Sig_/E2PoMMoC/cTLiz_ZN0ugdQX--

