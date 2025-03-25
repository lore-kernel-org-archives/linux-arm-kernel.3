Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3DAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSvf9PO2tqFZJOjUKNihe05fihUTdxiKCVGVrwqCb5M=; b=xjigxfNyySpYs1HQUh/OQmeVuh
	9RK6bPTECwV/ZZX09wPnqfxJ6x9+l5E5ZjAaZBzSJNat3+VyFX6Sws1OcjLrzNf4/da17xrNhrEyM
	wxvknreK6rMP5Imz7rSRNNmqvtql8H7gMVFbMWFpnm3ETXEK7N/HcSq1ZwaWD5Eq2VDxCBptyPGzp
	9B6oT4+Rd/WSyS+Qkg34bTt1SQ+ORQ2sdMCNID7PiTzpXp287mGgPags4pt10gXzKa4Oep2R2jPvu
	bmL9sMi7w3CGV10T/sPj4q14fcvyVLhfg3sJt2tlZ11XXfKuH03Bajnqf/RwDvZQSQmVF4OBt6xcG
	nkNV1WIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Io-00000006CUq-22dY;
	Tue, 25 Mar 2025 14:30:50 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5FX-00000006CC1-2HwM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:27:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5B811029027E;
	Tue, 25 Mar 2025 15:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742912846; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gSvf9PO2tqFZJOjUKNihe05fihUTdxiKCVGVrwqCb5M=;
	b=RDBIDrIm9ENcVGoDsRYP7G8NhrGNiZndKT7QocmSB7YMCPMHnr5kq9ESBuGGZOJkK8IBiH
	E8vQJNj+haMjKM8uMz8f1EaHszQ5qd7vajeem8EwUGnrbgLI1qr6se1Rwzamz8Ebr7f2pC
	qBYhog+vHqI+jmkXw8byuk1fF0zKXl1sKz5yQo0eprQB+H8ty9T8vx34oomS210b0ldtE4
	wYrBp2G1xSZUVNUctLdxhhmJLS5vAE72mDMvTfIPKQkQHT3T9iJZfzk3oKRdbLHaYWMuKR
	CH28TPU68Q3V8qZvaOy6syttfnkDCR0ohZeKR66koiT77+TjuparqLJcB8mqrw==
Date: Tue, 25 Mar 2025 15:27:21 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <20250325152721.4aeb3761@wsk>
In-Reply-To: <7d3fbe0b-f566-4615-a5df-a8f3b4544c3b@kernel.org>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-3-lukma@denx.de>
	<2bf73cc2-c79a-4a06-9c5f-174e3b846f1d@kernel.org>
	<20250325131507.692804cd@wsk>
	<bf6d066c-f0dd-471a-bb61-9132476b515a@kernel.org>
	<20250325133949.7782a8a5@wsk>
	<7d3fbe0b-f566-4615-a5df-a8f3b4544c3b@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6lSmEnGq9ohM/ZV9=THLOqf";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_072727_728144_FD533ECF 
X-CRM114-Status: GOOD (  24.89  )
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

--Sig_/6lSmEnGq9ohM/ZV9=THLOqf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/03/2025 13:39, Lukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 25/03/2025 13:15, Lukasz Majewski wrote: =20
> >>> Hi Krzysztof,
> >>>    =20
> >>>> On 25/03/2025 12:57, Lukasz Majewski wrote:   =20
> >>>>> This patch provides description of the MTIP L2 switch available
> >>>>> in some NXP's SOCs - imx287, vf610.
> >>>>>
> >>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>>>> ---
> >>>>>  .../bindings/net/fec,mtip-switch.yaml         | 160
> >>>>> ++++++++++++++++++     =20
> >>>>
> >>>> Use compatible as filename.   =20
> >>>
> >>> I've followed the fsl,fec.yaml as an example. This file has
> >>> description for all the device tree sources from fec_main.c   =20
> >>
> >>
> >> That's a 14 year old binding, so clear antipattern. =20
> >=20
> > For some reason it is still there... =20
>=20
> And it will be there for very long time. Bindings are not removed just
> because they are old, because they are an ABI. That's still not a
> reason to use something old as starting point.

It was unintentional - if I would know that fsl,fec.yaml is so old, I
would use another one as a starting point.

I will use more recent one to provide proper bindings for this driver.

>=20
> It's the same with drivers, although driver can be easier changed and
> old pattern can be dropped. You cannot easily drop old, anti-patterns
> from the binding.

Yes, I'm fully aware of the problem.

>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/6lSmEnGq9ohM/ZV9=THLOqf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfivUkACgkQAR8vZIA0
zr2Tqwf/SGk7rTkRbhWp18Uj5U62OiHZ4Z5IG6yCm/VVMS5W+g3WAdCQAmLkeIGF
XYksXNPNlSjajTtdymcLx3k6HtMaLAbwTcyRjveRkTIaj2qYZP/svvbnTaEsekE1
azzE5nMLIe4frACfzbht3MZ5jRGxM2g7n4tcs39tk8p+O7/trcg9Wv2YYy69zfFU
jeXjlAMkKuh2Sz0oyadV/K7OWB3CcLqxwcjYfUueEyk/iB7iuTl9Sq7kfS5R7sEb
1kMqu+9tNt8b2+ShhNycPDmwOI4juRWaT3pBvlZHrYAO5SISQ051HJv0H2jYARo1
Vv8/qfE4zOTZseWUfTp3GKXhZFDBAg==
=Loga
-----END PGP SIGNATURE-----

--Sig_/6lSmEnGq9ohM/ZV9=THLOqf--

