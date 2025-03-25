Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E699CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCuZIdUEm0QWQuqdvQk8bF8aibatk8qGzYP76myy1Xo=; b=scobtlogPNv7mIvpwhsxk4BwXF
	8BYxpI40V59SjoceABroGQsmwldX3wvWkkWZ9vziFScbdX79GxrZExX9GyAIuHhoE1Br5K6wKGmw1
	myilrH51L1E74UoxDfbgMaNDX4ZeKHM7sachrlQ52ZLX5ChqddQSn/4uF/zAJuFTav/Ge2AJ6BS5/
	6jdSkgyyuI+MTG4/6IO9Tw5c69QNpz6VqA4Qs2dHhhhBZIa2hU8qFekpswM/+AI5w3AJktiVTMlUJ
	DVmfZErIurfdLR2ye2K8mhOnonD97gJBkVOIN4thsurCpoeLiqpioRz7yV0R0c4xVJRL41AyhGSou
	46pRuVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx72I-00000006T2R-2gqp;
	Tue, 25 Mar 2025 16:21:54 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6t4-00000006RiS-21FK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:12:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 564B5102F66E4;
	Tue, 25 Mar 2025 17:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742919139; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OCuZIdUEm0QWQuqdvQk8bF8aibatk8qGzYP76myy1Xo=;
	b=aq0uJpy6Wp06yKfxV/hPNUiV24cd6mrnOWV4CE+8kfJBqN4oGmgoSUAcXMxOFAu5K8uoPq
	aOOJI7VMVVHpQssTy9rh+Zxg+zWIJfrKhPErtAqbMYR1HxyWQ1fYv1i8SJbbOPP+jtWK+I
	2w1/G0d9pKzC7lrHR+odcAgZqSkBD+uDrQnr9cIejI7sLvvN8PfA7/+HwmHP0ss0U5amVA
	9uM1StWAo9+ovfCtq9IGG68B3G38MB40YR5IWv+mWqBtE7QZ/JEyCyuG80xA88fZyRURoC
	scOhKT7Y5tgY+UlS0wn/6+bOVsFLoHR69E+bSx8QssbDMQUuBu3c/Mc/ZHJ3iQ==
Date: Tue, 25 Mar 2025 17:12:13 +0100
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
Message-ID: <20250325171213.61de8d6b@wsk>
In-Reply-To: <2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-3-lukma@denx.de>
	<2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BTpJUUNgSsmMxe6X4ageVFE";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_091222_675083_7C1B6079 
X-CRM114-Status: GOOD (  16.34  )
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

--Sig_/BTpJUUNgSsmMxe6X4ageVFE
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

+1

>=20
> 	   Andrew
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/BTpJUUNgSsmMxe6X4ageVFE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfi1d0ACgkQAR8vZIA0
zr2V+gf+JAQoDZbvVcOrU8Xf5yrlKENSX8KVhYJexfgs+qiD+wvn+CS8kUCphBCk
rDQbqUh8g3qjogX3/PH1NWqIlXvz7EO55+P39PQExyszRX3HpW7ibOaTWMgnnWa4
Ik2qLNREr7mWs83euMDjk21zx0+SacLsJ9I8A0k60wY720aUaxwAFm7p/uhTIvTo
TdCeHqeaKWV/2ui8a2fnR5TNaM9LuCF2a+xxbv9OiqYdHlPVLQyFMtm7AZ4RWT+A
AGnhGvNGIX87TACwdl5FRb85sSxbUbd2jLMzT04w268IgsXKhqMRmXyAxmktKSMx
Z4U/nFhivYUqaXt05MM8Id9eAZ20/g==
=vard
-----END PGP SIGNATURE-----

--Sig_/BTpJUUNgSsmMxe6X4ageVFE--

