Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0979C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3h4Wq9WQJYYYEPwbk70jEgO+x7vy4tSco2GJpE6NQEM=; b=pF5qoGQnPyoM5DDKOSiHGFGjvI
	wZkWqW1cKtp+hdQmp5xOt2nm25zXVEJLiwuAkhWAIMTwcms4teIQ0d7jz5WF9R1x/21xzs0XHtInA
	V9BMsXTj9RPXIX7U5FPswTdYxuscayWscw7j7vSh5/dGP+W+LgXBvG0126Jju0Civ/gG0ngwUsZnl
	T52Q9mY5u7If0WCbXSdWG1Qq9o5PMVRkrt7VNIk72RzzXJIG32Q4hEe7ei6uLQMbMr+0u921otqJB
	0uZjMCPCgvtagmz7I5/6UmOLZGejpLrpzfepfVEavkPuGsmKkw6m12Cof4zR0kZwwA2ysRjKH6T/I
	aQVKV/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRKh-00000008dFy-1CdP;
	Wed, 26 Mar 2025 14:02:15 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR2U-00000008arT-2kq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:43:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B9CC1026C8B4;
	Wed, 26 Mar 2025 14:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742996602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=3h4Wq9WQJYYYEPwbk70jEgO+x7vy4tSco2GJpE6NQEM=;
	b=MHOQwHpiBpSfJOp1+TFl4lGaw2nxTj8fOT9IVNMcOVvh6ENcLyeCIzVV7qqg9l0ZVft3jc
	vDObYEXPYrZCh4w/zF3SwarxuHvqrOoiGrO2uVWWte1gmJkzFx6dM/g19UuBZPRLIEEZMx
	vH7zi0byyTafmd9BZOsMwcs/xw6DOKDfe4tXL/nvmfRiasLyDpD+3GWEpj47ofjbPjj8jO
	sZDUMfdMO7/kRU3tNCf7Kl5FN4zaVCR2/ZIgX24MQYHF0f99iHQB2G0ZtG00xFc7td0qPk
	IEYvCaJftTKslzcAuoXdysSbsw3boD+qS5D6CD2BtY+wLNgzbP1iM70Dfb6oLg==
Date: Wed, 26 Mar 2025 14:43:16 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 davem@davemloft.net, Andrew Lunn <andrew+netdev@lunn.ch>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, Maxime
 Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 2/5] dt-bindings: net: Add MTIP L2 switch description
 (fec,mtip-switch.yaml)
Message-ID: <20250326144316.2ca252f7@wsk>
In-Reply-To: <2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-3-lukma@denx.de>
	<2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hdQ30b6hV96Q+u6lViERlzE";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_064326_856469_27BAD041 
X-CRM114-Status: GOOD (  19.53  )
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

--Sig_/hdQ30b6hV96Q+u6lViERlzE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +  phy-reset-gpios:
> > +    deprecated: true
> > +    description:
> > +      Should specify the gpio for phy reset. =20
>=20
> It seem odd that a new binding has deprecated properties. Maybe add a
> comment in the commit message as to why they are there. I assume this
> is because you are re-using part of the FEC code as is, and it
> implements them?
>=20

In the case of MTIP L2 switch, the reset gpio line (in my case, but
also on e.g. imx28-evk, and vf610) is single for both PHYs.

I could move the reset to mdio child nodes, but this would be
problematic, as asserting reset on one PHY would reset the second one.

That is why there is a single 'phy-reset-gpios' property for the switch
driver.

I do believe that for FEC it may be deprecated, but for the HW
configurations I'm aware of it fits best.=20

> 	   Andrew
>=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/hdQ30b6hV96Q+u6lViERlzE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfkBHQACgkQAR8vZIA0
zr239QgA3MSVrlumXuhEjcoCf8W+hg3avvIWRw4daEsO50k/ugQTmv9/4bqbfj6k
BtxEPPhyiOephpxS8XHQF9E/202BBMl3f3llgZHLDlxi1ufU76syBEElHKoIe9RQ
I+5tNr/r4B7xTT1FB27AYmCGPzg1C157biYYyJQcqARQdHBIUp6yhNuNPEup4Jpx
2rcD0nNQtlgV/7jQJDToUyXCyIiZB/+vJ9saevLSPthW+l2QvraOVqWNdoQc9687
cWetCOL7cfuxTZ2Sp9BplA0w+rBi6wUvLEsYzaq96H91HAwrpGZ+prcT/eZQgfUk
o1FdUJU4MbTZK1uZV4BLgLOLFWDgbQ==
=SJGV
-----END PGP SIGNATURE-----

--Sig_/hdQ30b6hV96Q+u6lViERlzE--

