Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE56CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur1sWRUAidpm/ZEjn1xdq4CloKH85fbSgxpB+jt40W0=; b=Njr8OKUP1VQDK/XdbiMgdtz+Ak
	ZIFQ0lou1UKSvvrtDErdD7/7+OHp1TZKLS+Or9rgteG5B0DvISu5lmbiEG1aseS3SpCU1prHr2JXE
	5/99fO+efV5aSTPR7BgqjWfdr1isWojcr4NmwMIoHCH2BrrEV3jxNdgdILmf6ZH0tbV5Pwth86cRw
	pXIZ33lJLkuZjc6BH9aO5un85OdXdw4ODqtaNCwCmKZqub+UIKPq5FcHjDJ+B7sOBd7md3Eee7fmV
	hL3Tfe6gcYz27r2c5YwQb5I9zmueAGvkHR/jlIypiKo0CsyoWDi3nNPom1oxXhrSVESBBDkJVtaik
	I8ltVL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P42-000000000TP-3l2q;
	Wed, 24 Sep 2025 12:57:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P41-000000000SD-1SB5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E25A60007;
	Wed, 24 Sep 2025 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79037C4CEE7;
	Wed, 24 Sep 2025 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758718659;
	bh=VG20TPc0vSAmEbBXOQRn+cY5clUm9F5ItXR7KZk0Ww8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMtq/SByQ6iK2UkBgv5/kmBi40RN4P0XYKTALZjywJ3uaN/kHmmnmE/qudSKEbSSg
	 HaV3hbD281tfodz7aUI6qkbjfaBwy7pSwigmgVx1aNUFLFZQ9qwH8lZvyEYrV2ewCI
	 dKMOW6ZMBHIVTzcfk+pcjhQ13/exrBYe0Um+yR+IPIEGdleZIwJDTDaEmAeh00/zoW
	 sQGjUOGtYspA1P3J7pHhgG73mhfHDNpwhQEaDERWiIPLjnZqynN2HvwiuoScOqcpwT
	 XoLflD011vfmzP7dbQiDHTYMZy99mtY5l27KEiAoFY9wsuSIVvi6TrrEHCXo0IKx0R
	 Q2mmxMbsGmyvw==
Date: Wed, 24 Sep 2025 14:57:35 +0200
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: mxs-saif: support usage with simple-audio-card
Message-ID: <aNPqv15dnLCw3qew@finisterre.sirena.org.uk>
References: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnrHIRL6ihxwJiWv"
Content-Disposition: inline
In-Reply-To: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
X-Cookie: Filmed before a live audience.
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


--MnrHIRL6ihxwJiWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2025 at 12:16:25PM +0200, Dario Binacchi wrote:
> Add support for enabling MCLK output when using the simple-audio-card
> driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
> handles MCLK enable/disable by calling mxs_saif_get_mclk() and
> mxs_saif_put_mclk() at probe/remove. This does not happen when the
> simple-audio-card driver is used. Extend the mxs-saif driver to enable
> MCLK output in that scenario.

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--MnrHIRL6ihxwJiWv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjT6r4ACgkQJNaLcl1U
h9DVqwgAhP2iqSkJ01DCJkMcimnnaPqL1BoYPz9SUVVCg24PgJgprD+E+gepAHr1
qgKvrq9lNgkRC8rbqU2oSB0sXcc1Pyymo85CERMqZLhF2ZriRI+W1iN85si8e9Iw
Oa4He4aXvw0UacsqQb+bj7w9JNjqGdB0iGbleQdzPBn2Iyl1aiuLCap98CPK8lLI
TCZoEaTSLOOHpBOlqYLTaqoJfeDjEDhToR4TI1bYuFbNz2d6ai6OgQoa78W69nWO
c9DOFsbll0dx+W+blKCNwwvLzQNt0QmCvK+STQwLqzTYOOMQXn4XCBNZY1sbO0Wk
F37ZIQT/6j7xA8l8k5YNDLGXw2opYA==
=2GTo
-----END PGP SIGNATURE-----

--MnrHIRL6ihxwJiWv--

