Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADA4C36013
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vw2aTZfKC8jL612WLeYf7YLLLB/WaqDvcUQ/QnVchBI=; b=cDtIoHmtB3XwfnQqLczWYp0kZi
	S+ybPhSUyaqc5SNOcrRmEhpCQtLQ56SjzPJbd6CfsoEOQpyRz+mXpaA7OUTSLhCHZih6JgwcoHDGR
	CViinXGex1eVyTWeG4HlHlMXN4XLCnNoaBws/y+wQMw4h6k+pos18/gejVoknDg/L9ZDmkXeH+VVg
	52GQMfmzXvjwZOQcNRqvL7Fisi+eEYrauCPxcO2MWU4Lnv0rdYrKrk8D8J8YlrtqutuEHSrnQOC57
	DXIcY57kGk61JsWN7xpfJj1Q5GDHphCc/1zfbyTfA2ORrztdcPBJjS7Uf1/6IXGr113/Gv2aLG/kG
	/3T/OrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YL-00000005rF8-2ROo;
	Tue, 25 Mar 2025 12:38:45 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3CL-00000005llK-2Lgo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:16:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33CA1102EBA49;
	Tue, 25 Mar 2025 13:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742904959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Vw2aTZfKC8jL612WLeYf7YLLLB/WaqDvcUQ/QnVchBI=;
	b=QLKfZA5hesyp7HKxl4wfAMJm/Eqm1iLloGyqwHdqYMYlU7JKUzljQH8FAvHiekj/fZ6IR6
	nWKratYium4fr/hJiKgEkRw1BgDOPWdBf1mO7j/4sAsa2hiyK/Xx/axqfzxis7vnBd/H5S
	5y8AiWj2Y+HsXX9uAAvp9KOSh4kka192Y9gxL/WN7nEJuwjRk2VgYYHTRHbFYSldPxP+2z
	mvAZ1uGOg9Q2J+ddFJwrtxvLss3h17U1pd4acNFApe8ZIguAvv299V6369chRQffdhDxD2
	Y9jN1ZDdRTvPJFGOhfnFIarSWpqVyc038v5zuXHEGRL+L8mO3lp7l43jL+F7kw==
Date: Tue, 25 Mar 2025 13:15:57 +0100
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
Subject: Re: [PATCH 1/5] MAINTAINERS: Add myself as the MTIP L2 switch
 maintainer (IMX SoCs: imx287)
Message-ID: <20250325131557.275f7c5c@wsk>
In-Reply-To: <e7d3f22f-4576-448a-a77e-644cd21c9a16@kernel.org>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-2-lukma@denx.de>
	<e7d3f22f-4576-448a-a77e-644cd21c9a16@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/24q=A/Ak_cTLWFZ0Fb5BUSM";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051601_743674_F9EEE1BC 
X-CRM114-Status: GOOD (  21.11  )
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

--Sig_/24q=A/Ak_cTLWFZ0Fb5BUSM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/03/2025 12:57, Lukasz Majewski wrote:
> > Add myself as a maintainer for this particular network driver.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5959513a7359..255edd825fa1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9270,6 +9270,13 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >  F:	drivers/i2c/busses/i2c-mpc.c
> > =20
> > +FREESCALE MTIP ETHERNET SWITCH DRIVER
> > +M:	Lukasz Majewski <lukma@denx.de>
> > +L:	netdev@vger.kernel.org
> > +S:	Maintained
> > +F:
> > Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
> > +F:	drivers/net/ethernet/freescale/mtipsw/* =20
>=20
> You need to re-order the patches, there are no such files yet, so this
> causes warnings.

This shall be probably squashed with the patch adding mtipl2sw* files.

>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/24q=A/Ak_cTLWFZ0Fb5BUSM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfinn0ACgkQAR8vZIA0
zr1emQf/fXhcxk4JMbU6x8ViPUfMGnNtieJNZbqixCSsbi5ttFkxRK5g2HwuGSNG
wRfDDxs+yMejO2q2ZRPnboRHMmp0cPs7BBdLsw0cs81BEMqTQN5/IvymAf7sjUST
JXRupMGgghbwq8fkESm2wYzRQE43AvpLM1bbykl+akDt7AVLhqJwHKWk9/NZYcPz
+64fDpsM2Il0oUU2oe5B4SHry4OE33So1s0VyUanuWZxANZnBRvTeh9RA42bviuK
ehdZQVGt2Hi3ZAi5l7WP3GRwzNAzDAK297M4koxXXNKY7JsIGrUTRsLw4ha63gX9
3hia1jZ/itQzBJ+iqsKLdzEN7qHZUg==
=rHL2
-----END PGP SIGNATURE-----

--Sig_/24q=A/Ak_cTLWFZ0Fb5BUSM--

