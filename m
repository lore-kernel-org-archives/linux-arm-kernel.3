Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F12C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odrTGFsDo9/VOm3I9CYUC31p3sv7iM21LI1z9mPgrow=; b=bN2zjAx+7AkZy9VDDks75U/+Hb
	r/EjnQiXaPQH72f0mUckTI29DRPgOsC3k+jpOv6vdOa5gxQqR7gAvruJxf/usqq5ZZde46uTdXvwe
	Y9/FC9/kfWGiJ0wzVMzYLHq/Usq1DC8AUsN6u0QWM3tphtMAqDkkVGgf1I+TGaUmGRG+U5Q3rKckZ
	Z/N8ECFdV5NlG8gp++26OHcimmFr7lbIP4a9xATPpXbLSLQuCWzgM0ZAZ6gSyL1x/D+vIdHi9iSXT
	5mOvpbWrskZRCGS9U59+tcVIHnNN+EYEJZtzcZ4cCyXSeuPrB1Cp/KN4P7e0th/v4oSYKNqxOFiCz
	ZhgxRhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pNI-0000000C3wm-0s3A;
	Thu, 24 Sep 2026 19:44:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pNF-0000000C3ve-1YQz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790279090;
	bh=odrTGFsDo9/VOm3I9CYUC31p3sv7iM21LI1z9mPgrow=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aATvn3V3gYX6FXQyrgZVlZUH0yNhVXxUANYpfa74kW5BOYGMlicj6Q0JZEvLqX/Zt
	 ULBWHIMYfIVadIbf+5gt+yM8b0N6T4iAtOpNFMGmBLPhJ6r+spJgRFm369hUrCdE01
	 TuqCpwm76CdolivLQgJKJMNW5KLihdJ2t5hVW7Eif6xRv0uuPZ8a0vecAeGeFilmsj
	 syMqlLQCKdrrj8d5bdXQwfKYFIDdYvgJ9L1kfOCgUkg/bhtVqEaEquMJpFvORqbkNQ
	 lJtfvxMWM6g/i0g23lul8GeT4i8J8YtvyJ36r665j6xhSn/m00l1JqmgEq7RIe6OPS
	 9GY5Bv1Jnt8Sw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B46017E01C5;
	Thu, 24 Sep 2026 21:44:48 +0200 (CEST)
Message-ID: <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and
 VC8000E support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Paul
 Kocialkowski <paulk@sys-base.io>
Cc: devicetree <devicetree@vger.kernel.org>, "open list:FREESCALE IMX / MXC
 FEC DRIVER" <imx@lists.linux.dev>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML	
 <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Thu, 24 Sep 2026 15:44:46 -0400
In-Reply-To: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
	 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
	 <arQxC3DmDyVIGdqq@collins>
	 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
	 <arVnQmik-CveaAkY@collins>
	 <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HPi1wb249tHXCTcm2PII"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_124453_595166_69AEFA7D 
X-CRM114-Status: GOOD (  10.68  )
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


--=-HPi1wb249tHXCTcm2PII
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 24 septembre 2026 =C3=A0 21:38 +0200, Michael Nazzareno Trimarchi =
a =C3=A9crit=C2=A0:
> I would like to ask about the status of the entire proposal and uapi chan=
ge.

=46rom my perspective, the main part missing the the V4L2 m2m stateless encod=
er
spec. We made one for stateful decoder/encoder and stateless decoder, and t=
hat
made a huge different in interoperability.

A second implementation, not just a variant of the same brand would also be
nice.

Nicolas

--=-HPi1wb249tHXCTcm2PII
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarV9rgAKCRDZQZRRKWBy
9AJKAQDAVOKci/P7Qr2Z5IgnO7OXHieb8eGjiKKZ534/8y/l7wEAh6xDOGHKCKdz
yxN04vRWtC/cp79kBk1S7uuDCQofSwY=
=1fmE
-----END PGP SIGNATURE-----

--=-HPi1wb249tHXCTcm2PII--

