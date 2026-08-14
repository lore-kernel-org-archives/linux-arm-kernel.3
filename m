Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC11C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alS2YydTNEyTI30Jdjv6ERlLUUBMeqn6gyqXW1xiStI=; b=SjIexidP5DBZcVO6p4HFmPYTQ3
	kxMFkF4mf00pOFVhtLwL91S2z46N+TQ9nSNuX5OxdlJ9UOjcs+wiqjnc4Jds9cZI0pD49nU5dRuBS
	XS7MIEQ/ElxC/e1DhbJrge4WgvEb7ZdbyOiRZFXCH4vnK4t0Ow2ns07eAExmR6OMmZndg2UK2K01E
	Tcdyry+9Hx4CQ9+DrXhxylHLem15iTefmQf6p8bpEq90zHXW2yDQI7uLTgOX0f2N8kwZ+t08TiedJ
	qabPssJgXFHGbW8eJY4xqhZws0+eq+aF6ZmMvD9mSLcbOW8is15mcFinMLKXR6SBWkWFC6fqU1nuW
	TEhCZS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurSK-00000002gRP-4Arx;
	Fri, 14 Aug 2026 12:56:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurSJ-00000002gQs-2Yze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:56:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E49B7601E0;
	Fri, 14 Aug 2026 12:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E990E1F000E9;
	Fri, 14 Aug 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786712174;
	bh=alS2YydTNEyTI30Jdjv6ERlLUUBMeqn6gyqXW1xiStI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPabFxzkvoVOiIOPpefynquGg2E057KJapjJgd/6sQCiKOHFkIP6B9Myd4WxUpViH
	 b8mfjh5aBvI5WN4P9Pugivf0PFSrTdNoVWqzCoIpkIm7ZIutJEjUuB0BF6s7qMsnfC
	 Q4NoSX65zanATUzGfU+GlUPn5xYcWW+lMw/QrGG9ni8TYdJBKUZqOpIdKukVxoGdLb
	 62mURXFjZplls1+7e3NuMDybE7tKRtFvSoQ8PMuQEIQzhg3k+VD6axwblLYpvRvyY9
	 lW06Api4fFpX29/s5LVUvl+IkDxgb584/rRubdXfhSsusDMJcqGePoJaRj0snRLNeW
	 5gru6vQ1byINw==
Date: Fri, 14 Aug 2026 13:56:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] spi: ma35d1-qspi: Add DTR support
Message-ID: <34412d10-cea1-42ef-a53c-ef515b452793@sirena.org.uk>
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
 <20260813-perso-ma35d1-upstream-qspi-v1-4-b217b9870eb1@bootlin.com>
 <09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk>
 <87ik5ckh2j.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MaZfmoaBHarMF2m"
Content-Disposition: inline
In-Reply-To: <87ik5ckh2j.fsf@bootlin.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
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


--1MaZfmoaBHarMF2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 02:44:04PM +0200, Miquel Raynal wrote:

> > This needs ctlr->dtr_caps configuring, otherwise the validation will
> > block it - only the _mem_caps were updated.

> Ok, thanks!

I've queued the existing stuff for CI since it all looks good and we're
almost at the merge window - please send an incremental change for this.

--1MaZfmoaBHarMF2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/EGkACgkQJNaLcl1U
h9DimAf+N+eY2OkutKjODCreckb50OMMtInbw8eyFbrin7FL+EcAfU9TxMq0G3jG
0wd1MOhs8Jrnbs3G7g0R31rh0dxq6ygGv/M4mMbTP28D/gpU5G1fbSozEnbvAMIR
EA4qmz4ILhq7DXaWZGW7qqg5TRDmTRN5+cGOFIlQKo5Udq+RmhpXleoV69xnbf2W
v9Rd/R2kqR3vTyHdTydFSv/jXhAmW1HgCWiNDh498w49uRP42bRBir6gp12VeLKb
AtJR+yiqRLzqHt7u3xxfsikV5AFAE0O4pwU9fIN8HxKICL8Mz9xqCngDKR9+eK4E
hWaM/GdSlouGolgZbvyY/ShdibVZ3A==
=2jD8
-----END PGP SIGNATURE-----

--1MaZfmoaBHarMF2m--

