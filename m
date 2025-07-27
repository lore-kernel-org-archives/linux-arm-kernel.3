Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7187C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkBrq8EwJtKrLLyc89nHWZVNStBBKpPPsVnWhREsJ3M=; b=SOhm0NF4KtpZryjIKS2tVcrbHP
	D7el7FC/hVhgPpxWkKVC8dXciwK4+ALx9OMUhPbNVq5GA0woQQNECQBHScuRI8PdzwuJ6IXAwCMQ0
	94k9+E8B5RM80tlOjYbyHTb583FDQrX4ABMriEXIyPjIymbkEn3jnlGe3/xbVuFVBKJhGIk0WlL8k
	Y+Z5lww9kX/an3VgHn/A4AszUKSWsKn8teM4EWqDab2nZVNjlOi+iOiv5VZmaqckP7hckFv/3BW2v
	Zx73Gq9noucPzc9ag3gr1lw7lJFp/dLpZoGMzSatC7MHqo5qLLtWEmPEp/+jegU70UthkMaipCoql
	Qnog39dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufwQj-0000000CTtc-0wkz;
	Sun, 27 Jul 2025 08:08:25 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufwOC-0000000CTXq-0bOL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 08:05:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 335AC1038C126;
	Sun, 27 Jul 2025 10:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753603545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=RkBrq8EwJtKrLLyc89nHWZVNStBBKpPPsVnWhREsJ3M=;
	b=QiNliuiOiHMjVLrreXLPVMtdb6modtyn9YS0LJimse60TjPW5KL5jdyhUQZDOY0BJv6vC1
	QmtyZEOevEZTYA8m6jqbfaSVYXBgqvsZR5E2aR97uWQuTuifRl+698ko3S6iiGtHpKLFNe
	yWEyEguBDDn1mGpPhlu9LbqolnulGLNkJiZNQrF8qGy6n+isjMCBKOxr62Ll1SUBoTHz4P
	xkRalhn9K9xq/3l8AhS2ydZJsbY+TPWDUm6YcCY3nXF9/ilaZrewuDzrXnrMtfFD/G8MSS
	2ZqOD584dzQgbM+HYAc1wjEuastuPoEVRDpORsPcjxGHBfbGC0svhTytmYE0XQ==
Date: Sun, 27 Jul 2025 10:05:37 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v16 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250727100537.4abf90fd@wsk>
In-Reply-To: <20250726133835.6e28a717@kernel.org>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-5-lukma@denx.de>
	<20250725151829.40bd5f4e@kernel.org>
	<20250726221323.0754f3cd@wsk>
	<20250726133835.6e28a717@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0V+L.IMPpnGggWz/bxwq32Y";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_010548_335252_64D55E4C 
X-CRM114-Status: GOOD (  17.33  )
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

--Sig_/0V+L.IMPpnGggWz/bxwq32Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Sat, 26 Jul 2025 22:13:23 +0200 Lukasz Majewski wrote:
> > > > +		ret =3D register_netdev(fep->ndev[i]);
> > > > +		if (ret) {
> > > > +			dev_err(&fep->ndev[i]->dev,
> > > > +				"%s: ndev %s register err:
> > > > %d\n", __func__,
> > > > +				fep->ndev[i]->name, ret);
> > > > +			break;
> > > > +		}     =20
> > >=20
> > > Error handling in case of register_netdev() still buggy, AFAICT.
> > >  =20
> >=20
> > I've added the code to set fep->ndev[i] =3D NULL to
> > mtip_ndev_cleanup(). IMHO this is the correct place to add it. =20
>=20
> If register_netdev() fails you will try to unregister it and hit=20
> a BUG_ON().

Ach.... right. Thanks for explanation.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0V+L.IMPpnGggWz/bxwq32Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmiF3dEACgkQAR8vZIA0
zr3XqAgA2sXocPAdmK/F5WB7kLsc6cqCUe6c3iGLjKWISsBkLMNQpfTzN8u3AMt+
SE64cZAf1HmhN+dCrW+M+/xlKliLHwlkMF6E+Xpd+GhfIeNRijyPXBrcAB2c+Npd
5yqu9q6rVYD+icUz8AuRiWJQQhKHxrj35cdP7rKD0iyL/NjetQJwRRnlBIF1Asb6
Y8qLJY52pRfXxgr2pdlmkE2onr9sEnM4VsZrnWy0yuyb0ufMy8NEuRy+mh6TYeqk
O1TmsdbbUMAcXaGk3XYR6btXXu5bkgn3hGdEJnORLtq1I+W9RH13kbHiKqm7w5Jb
gZuhF67G07ueQCFJDxAjLMjVflKSOQ==
=Tm9v
-----END PGP SIGNATURE-----

--Sig_/0V+L.IMPpnGggWz/bxwq32Y--

