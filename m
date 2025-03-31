Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F5C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHC+RUrju8uKC19QVlEvi9qbZzniETFM7Cs0X8sau98=; b=Je0mIkuFngpY7vvIYEUxYYXh4U
	hILeD4HDIN8TPrPdbVpnS0sviM2KuKHXJRIJ0nrfeFYcket3AEeniOKEH9jZruCBGX6LZrdi6aTX7
	jZCQPb/D13ODaT/FIsG9l/iEXkQKd1WPAFkKvbfkbh0TzTh5Ib5HuTOm8GVTTcVBrrqlTPCGQ+QYC
	08/xvnCYSZqWCVauncRsJ1Ny+m5b3c0vbtoHM9ack2DhqaCWxc3xnJVf5TyQzECKHBPKQCjFVMS+J
	S343yYBHe0i/t2zPv3n6coX9wXTPipxdEb/xT56TP0XU8++MrtDcs9F7dmRdk1ud6H1mqDEuBBfjs
	kKhAPHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9T3-0000000HBkV-3vfC;
	Mon, 31 Mar 2025 07:21:57 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Qu-0000000HBUL-1UB5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:19:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E28310252BE4;
	Mon, 31 Mar 2025 09:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743405581; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zHC+RUrju8uKC19QVlEvi9qbZzniETFM7Cs0X8sau98=;
	b=bkhLB0umV2e81WF2Xl3qKpOmUa/m+lCyAO1SLB+J/DjY3URF5h4HBKASO1E764K59F16w1
	9FXE1LwUK4wbsmZVn0NuYH/B03EWeD59CgoypJrleWWvnlpnNxtwVilL00I1zIo02gHV+n
	CHXyvOzfTgsA2Lqk444swNg+4KYlHhqM/vjf4XZ/FhwxNz8nB2azqF+0hlN1iqMNXb9kTU
	BoaLgH9lJMl0iQTZ8jY0nkjDBeZSDTTvkRJwPZ0MKuDVJVB/R1SeYehzf+kpeGyzSeLLxL
	+gh9/Wn1qrBHUuGBjqYH36qE3cxTegWmzsu1q4/eLg9h0f/fchMFOfoNZSH71A==
Date: Mon, 31 Mar 2025 09:19:26 +0200
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
Message-ID: <20250331091926.6f3dba38@wsk>
In-Reply-To: <d4c8de9b-e52c-480b-a3bf-e82979602477@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<e6f3e50f-8d97-4dbc-9de3-1d9a137ae09c@kernel.org>
	<20250329231004.4432831b@wsk>
	<564768c3-56f0-4236-86e6-00cacb7b6e7d@kernel.org>
	<20250330223630.4a0b23cc@wsk>
	<d4c8de9b-e52c-480b-a3bf-e82979602477@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_S/Kbz_Yl3YhS+ddHATqFlD";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_001944_539314_6EF4B5D1 
X-CRM114-Status: GOOD (  26.19  )
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

--Sig_/_S/Kbz_Yl3YhS+ddHATqFlD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 30/03/2025 23:04, Lukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 29/03/2025 23:10, Lukasz Majewski wrote: =20
> >>>>> +     =20
> >>>>
> >>>> If this is ethernet switch, why it does not reference
> >>>> ethernet-switch schema? or dsa.yaml or dsa/ethernet-ports? I am
> >>>> not sure which one should go here, but surprising to see none.
> >>>> =20
> >>>
> >>> It uses:
> >>> $ref:=C2=B7ethernet-controller.yaml#
> >>>
> >>> for "ports".
> >>>
> >>> Other crucial node is "mdio", which references $ref: mdio.yaml#
> >>> =20
> >>
> >> These are children, I am speaking about this device node. =20
> >=20
> > It looks like there is no such reference.
> >=20
> > I've checked the aforementioned ti,cpsw-switch.yaml,
> > microchip,lan966x-switch.yaml and
> > renesas,r8a779f0-ether-switch.yaml.
> >=20
> > Those only have $ref: for ethernet-port children node.
> >=20
> > The "outer" one doesn't have it.
> >=20
> >=20
> > Or am I missing something? =20
>=20
> There is ethernet-switch.yaml for non-DSA switches and there is DSA
> (using ethernet switch, btw). I don't know why these devices do not
> use it, I guess no one converted them after we split ethernet-switch
> out of DSA.

In net next there is:
Documentation/devicetree/bindings/net/dsa/dsa.yaml
Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml

which uses
$ref: ethernet-switch.yaml#

I will add it in a similar way as it is in dsa.yaml.

>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/_S/Kbz_Yl3YhS+ddHATqFlD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfqQf4ACgkQAR8vZIA0
zr3YwAf/W+aAijdBzs/ijQ5WOVZ40ggbPOSDQyVVgE911O2jLoMAf5iA1mI+/PA5
y0NhWmAIJajXD/3tu6T2jL+/KGfOPptU0BfJ3W1J5jmGj/rO0VAcESegy115wfBq
Po6x6ouWXbUymQDWpnAQWp7iABOdYLcYZx1R8vsoGiqpmRbTSVg0gil/+XjcyPH7
v0B07w8aV4RD3iBnKqM6n0Y+nRWzSUR0ckDEy4bJAz0jJ5Dmf7XS/hlY5UCBVAAv
2J7dgIMLiAzgLub3niwGAtW2isR30sQC165/6f15tr8int/cM2w9Lhe05nr2EbJ5
aqmbze9vgtfJAKTyDqq51IBHO8SyDA==
=zeoN
-----END PGP SIGNATURE-----

--Sig_/_S/Kbz_Yl3YhS+ddHATqFlD--

