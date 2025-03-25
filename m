Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC1C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWmWtlj/ywJV6x0SVa10Ru5jBz9yI3s7yAlnn7HAP+A=; b=q82QMRn6K9txIsCFhHqYRIIw4j
	6A/V66du6qmb4CDh4krI1r/i99BlSEt1aCUeH9sHv5vXpV42vZ5ODIxJu/KFx6ChoAokO6pooi5dD
	fc4uMRdQmfdD0mVIWdituuxjVq2KEb0SfiCWrKtUSWgfAYatSJ6+RXwG7FNPmHlftTNdUhxkGMUko
	pKQJ19mzu30DQODIOOYg6jovuOiEczUlHf4zfcwOKFV/ZSPraYtNBMxoNZRoZW1nNqy9tKzlas0L5
	lL37baBly830lpr4EP0qZhQG/47rotTWmhyVZwtzHhikytUP1xJ1BRKff9B0yDKmz3rI0jqCsrqla
	BnT2Vbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4il-000000066CI-2H23;
	Tue, 25 Mar 2025 13:53:35 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3GF-00000005mr7-29Fu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:20:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAD1F102F66FF;
	Tue, 25 Mar 2025 13:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742905201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NWmWtlj/ywJV6x0SVa10Ru5jBz9yI3s7yAlnn7HAP+A=;
	b=iI10GOZxX1mHgyM2u8+7/hdsGhCCl9XeQNlR9159nd7Yrmp1M9EzyoQznOCNezfJNl+mJ9
	SugwMDIGDHQIt+JVt4gZ5jtXRMz5XkD7mYkyoH+3BBQsC6Wep4HQmwCEBLJguay3eUz7UO
	a++388I8tOOmPQB3cMRAuhPNSnW6ZWmqKY49V2c5IiK5nn5VJccHfnIESBHN9fzadsHgW9
	Xl3+WTEZKlPTP/gQXxOBNmcm+5pZf5nfRnW+HkKaqVdVO0M7unZEoNF4KEl9D0/hrc9Gqb
	jTvv2XpW46Zt70RZ+tso/GL43Wd/7AiEZ0vMVJoY64YbV5uAx1kHujfKwWVfZw==
Date: Tue, 25 Mar 2025 13:19:58 +0100
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
Subject: Re: [PATCH 3/5] arm: dts: Adjust the 'reg' range for imx287 L2
 switch description
Message-ID: <20250325131958.552fbd0b@wsk>
In-Reply-To: <93c9bc3d-7ad8-438e-966e-cd28a91540af@kernel.org>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-4-lukma@denx.de>
	<93c9bc3d-7ad8-438e-966e-cd28a91540af@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iHkkBmAY=t74XA_T2X_ZYbS";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052003_704572_7F61D1DE 
X-CRM114-Status: GOOD (  20.05  )
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

--Sig_/iHkkBmAY=t74XA_T2X_ZYbS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/03/2025 12:57, Lukasz Majewski wrote:
> > The current range of 'reg' property is too small to allow full
> > control of the L2 switch on imx287.
> >=20
> > As this IP block also uses ENET-MAC blocks for its operation, the
> > address range for it must be included as well.
> >  =20
>=20
> Please use subject prefixes matching the subsystem. You can get them
> for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
> directory your patch is touching. For bindings, the preferred
> subjects are explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>=20
> Missing nxp or mxs.

Ok. I will add it.

>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/iHkkBmAY=t74XA_T2X_ZYbS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfin24ACgkQAR8vZIA0
zr3N/gf8DYEFypnfPCvqTv0w1mjjvKAqlgERVYVIbxHIpd/6t5B0hhaY3vRUWPyJ
VUqi8YCx8uavVTRzDM59fSfmYcFzOe7rUv9fVvS4+W3AtxqTmtndRXZUrFAtXrPf
LwfMfvqJuoKPiLLcfPZQpNNY6iuzehkmrmcO+0MmOmsPNVHWsXUG/mmoefrSIy/Q
yUysj6v1UeS8nm2XOXYf7Pij0CFaCgMDE7zdzziTkkLtBYywTPxMfUbNv8DjFUSX
Xa6M/GMe39ehOU92VOjF0TRxyiDNXgRZ4kibznKZFpohskhQ1IugoT2tyXDspA6b
JauuHhBMQ/y+Om9HVWaZV3LjzVe05Q==
=TLOn
-----END PGP SIGNATURE-----

--Sig_/iHkkBmAY=t74XA_T2X_ZYbS--

