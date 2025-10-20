Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85ECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiFkPjpbRb4EvxWHzM2pnBZEEJZd3/pqX3IeZ6qKzeA=; b=e6wcTmV1BMVNBtTVhdNgTAkxY7
	TcQ3/Gs+eP0KuaAx5OsdsEPA3NYUSu33PFECDV2U6xQwB0kKW+hF1wNOzAoBUP52YzWEkITkOCvVf
	pmDL5jykblL1RAMvTLDQm8eL1k51ZiN+RFfOb4t9ZhKCl3xrGtogxsWunDP3G65ms5KQSQI/3xJts
	fJ7keyW0m62i/oakYYA+D/4IeTFGsZFZWd9D7cJ31pWfKMRR8VLwSqbfMaTPMVyrHOByTDC3kxQWs
	vQeJ+JFRMZ7fZqkyh1KZV9VaW6b93tXsJQWtn4OuOq9Bkgj4PS4O6cnTTuQxTz35RbNQaWdGUvhf2
	mLvGxkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtWQ-0000000ESqA-22Al;
	Mon, 20 Oct 2025 17:18:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtWP-0000000ESpz-22jZ;
	Mon, 20 Oct 2025 17:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 980276029A;
	Mon, 20 Oct 2025 17:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8D5C4CEFE;
	Mon, 20 Oct 2025 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980692;
	bh=XiFkPjpbRb4EvxWHzM2pnBZEEJZd3/pqX3IeZ6qKzeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gl5LTmHInpyxPFKLcyUsCYaiT0yTRN+G+x1IBw6hObRVmPn3hR8ZI3mddOUsa0MJ/
	 EfkhMjLRk5dPlCKaI0mJY/QoaOEk3/c2zrzBr9KjPzJPZjuF/FdI7BZNGlDoFVhgvq
	 2xQ3RNEUwc9Pc8MduggMdUO+Nc/eNn0zPPq9NLDAJmlyqdJKIkrSaE1R94vVCmWc/1
	 iP/xoUTk1geJluzVdSqbzIPIiNKFv+XqmdPTj3HJ1Qc2NAUgj3k4mMuHaIvTWAIxpu
	 GnV1nSGyD9I8cvJvmuKmESSfhFBw8hjlNYBB2Yuk6AR1PL6JSp5Q4lAY2y/d+lVKiy
	 0TPW3GLwSPQxw==
Date: Mon, 20 Oct 2025 18:18:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
Message-ID: <20251020-caring-aftermath-32ed83db9a7a@spud>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-15-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugH87F6woIwS5I8f"
Content-Disposition: inline
In-Reply-To: <20251020101311.256819-15-richard.genoud@bootlin.com>
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


--ugH87F6woIwS5I8f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ugH87F6woIwS5I8f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZuzgAKCRB4tDGHoIJi
0mWmAQCXkfmlRLPpkpogtOPLDai3zd1cQMUD4dehkb1qSH2wTwD/TyAWdD6k93SK
AeF6ryJefcHUqunzW+LtLTOwecmIFQQ=
=YaUV
-----END PGP SIGNATURE-----

--ugH87F6woIwS5I8f--

