Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHxQNXN+6qa/z7VYSCw+qF0UhglNLq1b0kyxpmGnIt4=; b=qETTB/hEd2GXSkgt7X70vtzpyk
	Am6+CTKxTz+3hYl0O66BqYGxAQMOw444lWIwivwsVLj5Rf7+mSmsyoF74oQDhsnVHxJM1juHnHG4d
	mCWNOsX3qCy1+HILSkOSm4G9OdB/VuEK3R4qQj6DbB4pNc90uo4mBIWpRwg+uSQa0i8VN91KeFYvW
	2bhkOSLEUwvXZxhtVI0XdBsl3O7GFlvqMIn2BQ40+sqnJO/ptibiix2ptRksLHa+YBY3h6UX7z+vJ
	K/A3gwmbr5nvtITICc28fk7vtrDKezOplvgr0yEPoCyKfAVkyM0YEQ29KD0MTprMjLk2a8RALatG+
	DXCnWdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGSt-00000000BiX-33w2;
	Tue, 04 Feb 2025 10:47:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGRZ-00000000BY4-17Wn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 10:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IHxQ
	NXN+6qa/z7VYSCw+qF0UhglNLq1b0kyxpmGnIt4=; b=QGBn6oRhxPHzTLn/3RVO
	YSgBvjHUbMAi8v0uXE0tfmV7nxWUMrj1XA19slCdiBUTfRC4dsI46GLpkvz+5Ur7
	doSvWNNREhpuqsPwDrTLXcaVyzHUeloJINPIG6iOwmYewOrV5JvgPWmo3AZbDygq
	MMYxWzbPfVGIhrTjHCaoVCQeLL2th3hldtGR7enwrk6gW74y7CKuX5XNIAr1H2Ka
	16hpa4dCx84Nuxt4hv/qKcYODh/VG/qtXpUoTQoAuQp1CCRDRqHHOVApJh8u7CDW
	5Tu5KArOt8cqmksfTwu96sc0hBuE4UxByrNcv94S1x1fD9VEpbR5Bof0MZVQwhhC
	yQ==
Received: (qmail 3007007 invoked from network); 4 Feb 2025 11:46:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Feb 2025 11:46:11 +0100
X-UD-Smtp-Session: l3s3148p1@0Y+Tt04ttJ+5aIpF
Date: Tue, 4 Feb 2025 11:46:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: ARM: at91: add Calao USB boards
Message-ID: <Z6Hv8hdzYPzf9dvE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org
References: <20250131162713.33524-2-wsa+renesas@sang-engineering.com>
 <20250202-horned-singing-cormorant-afdc77@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cGWJoZ1M+YnyqTAo"
Content-Disposition: inline
In-Reply-To: <20250202-horned-singing-cormorant-afdc77@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_024613_580782_FAC7C2CB 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--cGWJoZ1M+YnyqTAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +              - calao,usb-a9260
> > +              - calao,usb-a9263
> > +              - calao,usb-a9g20
>=20
> I don't undertstand why calao,usb-a9g20 or existing olimex,sam9-l9260
> can be fitted with any SoC.  If that's expected, mention in commit msg.
> If not, then this needs to be fixed, not grew.

Can do the fixing.

Thanks for the review!


--cGWJoZ1M+YnyqTAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeh7/IACgkQFA3kzBSg
KbbDlg//SovnNVkRN/q/9WcjswDKGFTADyU0obch7RS6zqVrDHqDYOqAOOwLN3eV
8RRRFVr5ytHfK8pQg9IxCHdGjIKG+wmhr30cjKYNu5DHkZQN7Hr7JeJF5xB6P5rm
jfOalHQq0y8EvkpSxCivmo3OMkvRdCzzm5UeIfiXPgJc6TBsc77zbjT1Bo9UIyRB
0lWSQ8WAGewZCHGZ7lJINRRb2K6YRQSylnJnSnSdM73A6/lMpfWAvQCqFnUGjW/G
57PGIANrBdBKs2/LGsjk4kO1XfXFs80zoaMZXWVSWbsgBVsV88hMlC3BJg6wsgQD
CpHVonOS8Hh7hCkBVOaQB/MD82vZ6IPKuAhda7isBnbXb63tTp++A9snmPujTPjA
mGo5P1y8lpZi/RT7C4vV26MyzbJVq+iWA/lkwx6yOJNbhXVTIv53JxnCYStcaswL
JK9AVPpT+i3PO8z/CyN+9yAWgA2UOTUojDY0ioQTZWUgZqXpm2HgoEtiePfoj8xL
CYcDRgnW9z1W8ZOLTDutCxMiiukuXk0AtHnx8TlcyYOS8wuNOnpZJ9S+0WfbjzW/
E/AkRkJo1sSq8gFapVFIw8v0f+o8vjqWqqADFePRMbRKvcUU2uDVvNDQfAuYO1U2
Z5MPV3AfbesFp+yLYZ/CZWHe5HLTPniTKNO3Y75G3uXZOdtPKg4=
=Qgsv
-----END PGP SIGNATURE-----

--cGWJoZ1M+YnyqTAo--

