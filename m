Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E627F34C64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QADaldWzVdBLNMBh/opLfV5k5VlQBSQpSDIcFE/fCsY=; b=P+0oaU2q2TGcHSdrAlCh3kWKB1
	1kc+Uca4Iubn665m/CYAgiyJLL0+9Ycm26HYZNoxA2k+6WEtPDi0NyRWnRnCHk0gAi6rjs+XKpVHA
	dS1lfkZdnH82cvpbywFUscUNFtMe7ejxlamUixYqp+I48KmHkYS+0T4o9rUB2yT3iEWkh9hCFwV/t
	7nYE2G2wMlQ3kpajhOGJCD2ZYULfcaCkirryo9zLy+YM2vbUJfbepb4wf/HmrAe09gCg7CYegKkSG
	nxX9jd6wquoQcmm2gt/YD2oGHizJphQ3ak6NUcgh8eMzunIM59ErLdOpXtPRyr1hr2Efc2hIsbJhA
	pWlKy8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJgg-0000000G0p4-0Gj3;
	Mon, 13 Apr 2026 15:58:58 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJgc-0000000G0oa-0x4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:58:56 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 13DB11F8004F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 15:58:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AC87BB40243; Mon, 13 Apr 2026 15:58:38 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2C560B4023E;
	Mon, 13 Apr 2026 15:58:36 +0000 (UTC)
Date: Mon, 13 Apr 2026 17:58:33 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: bigunclemax@gmail.com
Cc: richard.genoud@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
	joao@schimsalabim.eu, jstultz@google.com, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-sunxi@lists.linux.dev,
	p.zabel@pengutronix.de, robh@kernel.org, samuel@sholland.org,
	thomas.petazzoni@bootlin.com, u.kleine-koenig@baylibre.com,
	wens@csie.org
Subject: Re: [PATCH v4 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <ad0SqUpDM8zMohiO@shepard>
References: <20260305091959.2530374-3-richard.genoud@bootlin.com>
 <20260413123920.2459916-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KjdOk9ztcaXoT/r5"
Content-Disposition: inline
In-Reply-To: <20260413123920.2459916-1-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_085854_434006_9E27ABA5 
X-CRM114-Status: GOOD (  15.96  )
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


--KjdOk9ztcaXoT/r5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maksim,

On Mon 13 Apr 26, 15:39, bigunclemax@gmail.com wrote:
> > +
> > +/* PWM Capture Fall Lock Register */
> > +#define H616_PWM_CFLR(x)		(0x74 + (x) * 0x20)
> > +
> > +#define H616_PWM_PAIR_IDX(chan)		((chan) >> 2)
> > +
>=20
> It looks like there's a typo or a mistake in the PAIR_IDX calculation.
> It should be like ((chan) >> 1).
> For example, for the 5th channel the result will be 1, but it should be 2.

Had a quick look at it too and I agree with you. A right shift by 2 essenti=
ally
groups pwms by 4, not 2. So pwms 2 and 3 would also be reported as part of
index 0.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--KjdOk9ztcaXoT/r5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmndEqkACgkQhP3B6o/u
lQwl7Q//c5ZYca06QsQsNVHqbgpCYsqTnwlucLEA4OExFbJt9tywkeVUHdtpA2sH
zv5Z2dAjzcYN4QuivrhALcenlce5kApSmeDDK/xXa7HpUzMWIeig09tFnBJ6HO/P
/dSWijfg7I50NjbKH+3FBaag2W6c8NWI9b7Omtmpu6HjJHBla6uPZXHfys7HDe3v
4Lrf5M9oWQyMJf70ywvN4P0IlQyzWfMvvdQ4Lh0ph1mj5RzoALos8oGMLxTDvLNP
v8pbzKkSsl+GGUMm9zvk1FOjM0Ew30T+1XnKTJe44GI6gY6Z0oVhD3Wjxlto3vip
d2w3BS8ey79VVRR0Dtq1RiGIx+7nBAFEa4FwGYNYJBIHcI3HV3ofQbL3KK28HDSC
QH94CsvX1BA5rvU2ROIhroJmHNmsvRI6sHKYT/Luo5Q+tDillPOHd/5jd1DL5IMO
ye59Vc7lIPoIp/dX1EFFhAyDj3Gb2U/okfmsFyvcLz+WAukrcFK4hKAq9V8cc+8y
qe9YO7KWDfC/9y0v4dJI6elt3uBjexfH7hK6qm9HNkg4h9MaTyT/nimVyn64vr0V
QwFR2bZLVPI3mPQXANdCp3TipXWObPyHwdF1LKUOXL6IXz0w7GFyAuGyma6Pc0FR
IZq9Tu0X0K3ZHHZ6lT6UGcm2ze76psGicFt/ZR48GidaJevu9Mg=
=Ml0a
-----END PGP SIGNATURE-----

--KjdOk9ztcaXoT/r5--

