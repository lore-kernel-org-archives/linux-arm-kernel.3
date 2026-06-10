Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5681FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfdWJVUy1kU0Nhcuk2I/MmIfNfdAKh+0EByci0W5Szg=; b=1mYvR+EJ+JaSMTkZEO6biw7+La
	zaZSn2bis7qrsirnlM4UKWswfiGiDx6YO/TJ4S9CMLJZiK7/dpzOB9r99uKTBq2eD29h5UwKpLE/j
	CnKuv/kETERn9+Eb0J8MmmpNYnLv0Rfcl/AMj5wAxVTdMmoiINQBRlWq12hEVL9wHrrgOlDpg/Mlh
	cBLKMzB26RlgPzPvUC+bKxFigKoZF3owEm/vlDD+eYb2cXIhjqK3TLMCfc5D57j7xq9YOm7bWbZCY
	s6zMRKPEWHiqiLfcf4Beq3tO6YhIFGX6Q4+3Jfysk/ba0heAUQMySsxp5n53d5bMvWwHdybLEL7pu
	AGnS9BYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXL8c-000000083dp-3wet;
	Wed, 10 Jun 2026 15:46:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXL8c-000000083dV-0Lgi;
	Wed, 10 Jun 2026 15:46:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 339B460172;
	Wed, 10 Jun 2026 15:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2411F00893;
	Wed, 10 Jun 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106400;
	bh=KfdWJVUy1kU0Nhcuk2I/MmIfNfdAKh+0EByci0W5Szg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flSmuyQVfR6Qzzj4264uL/3WKO4fpcjjZ4Jpe9LCYf8w3yyzBkv8J82QVqjrkmzVT
	 f3l9nEUh+vtSycuEhKgKkyJbWjprL/xSDxyAFXi6dOjZfQ0rcmCcqRFBm2BgjCSU21
	 txjRwsPP3m5KjRCREpBfcg+aHnfP7JKdtnE3YdXLBfg1oC117BM6h+1l4eBsdCO2RV
	 JLA/NvN/HDKG9Kq6SdG9LDOVGP3RRZ4W7tN2KyW6lAf4sQWIIzKpXPsQywVQjX/X7V
	 9ie4s2b02YYvDDh0WtIhos8Dror3uQHv1HNL0PZ2xdXYrduO2nJ4MSmPBzBybB56Ec
	 DmWapuh2XIRzA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5CE5E1AC56C5; Wed, 10 Jun 2026 16:46:38 +0100 (BST)
Date: Wed, 10 Jun 2026 16:46:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
Message-ID: <aimG3hIK6HUWyc2Q@sirena.co.uk>
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
 <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PxyZ8U/rEKlTlGqo"
Content-Disposition: inline
In-Reply-To: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Leave no stone unturned.
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


--PxyZ8U/rEKlTlGqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 02:54:08PM +0200, Jerome Brunet wrote:
> On mer. 10 juin 2026 at 17:21, phucduc.bui@gmail.com wrote:

> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.

> I suppose it is OK but it does not seem to really clean anything and
> make the code easier to follow in that instance, from my perspective at
> least.

> If there is policy to systematically use guard() whenever
> possible then OK, otherwise it seems unnecessary.

I don't know about policy but there's definitely people who are keen on
converting things to this pattern.

--PxyZ8U/rEKlTlGqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopht0ACgkQJNaLcl1U
h9CzRwgAgDswQDXFyzP5z4rETNyEf3MQAZYJYQ3LTNsRsjBW0i3YBsbEwiJoeDF5
jfTgd6UguAKKbHKzgkWe6qbYY2bUjMVI3xANcR4Uyd6SbyS92RpWyDH729+mDbLK
bP3l4yAWtiGfSsDqDASxflSVpkWJmSFcImDX9QxoEc8L94Xynh4V6Ju3g4U5mo1t
Z1sZmpt5uktyvYaTqt8KISlILUGBNzd3XGsmCZYLD+BhPprmyuPKpvDLPho+zXkP
+Uop8nWZpZGNNo2iJN5szX8ZEO3XVKsaXLcsbc4PeKNhqf02cu2S5aZm1N9az+Rq
1L7IGgsO7TnmOy1C6O6pK/6Hd9d31Q==
=eN3r
-----END PGP SIGNATURE-----

--PxyZ8U/rEKlTlGqo--

