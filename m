Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBAED6D232
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B99Q4TuUQCBVDCulwhs5KeOYu87zTkzwgednVKDrSFM=; b=eAaPYxB/qmWNhB7D2VRLPViwuf
	Cr6A7NaYxUAWxQSTEpPyCv1MAqYupx3xyVYjPHixr1H504kvkE/I6F6ARjsY57BzV/TU/Cs9wtm8o
	0OiLOwxiW3RAG+fAgYk2MCF4MkhITXImVxHbtBdHt1ythA2JpaK/BlC17Y4svayiIRf5BDtgqLVEA
	Svxf8lKQAGom9FCC94/h371twQ7+7oSwd2qVh0xSddyM2rlaMsXceZ8K10QYsiIE473f+G0qkFYiR
	4QQWQVhlMLen8xcvYFeuzn7DBzF+pNyrAqKMT8EcXDkWh2J/Ccadm3w9vA96okfvYwAmVHr4zgJMl
	76c7+Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNyS-0000000Dybf-18bz;
	Wed, 27 Nov 2024 19:45:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNxT-0000000DyL2-0ZRV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00F85A439EC;
	Wed, 27 Nov 2024 19:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3346DC4CECC;
	Wed, 27 Nov 2024 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732736657;
	bh=B99Q4TuUQCBVDCulwhs5KeOYu87zTkzwgednVKDrSFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wg3x8J70uo0NcNGP02BmgzmvsBbJ39XPNvBLS8JnMLm2wWqH4dSkJjM09EB/oHwzV
	 tQh2lCSwwL5bf7exd5labZ+zW/Mm66DUrk2jst8i8nJz+h9ex6bnAJjzgabu9OUO7i
	 n2kOALJbi/W8q3nGvCbMcJrh5zyvtBBrZZXkldeyc/bC5lRaCUGkT6+brSFD1210D1
	 5oZDttkjRuPp7/ctAC+K+fbjrqTo1DsGD/BUmvLZFWiMdlKm1DYX07xi2it7nRKXey
	 ERu5VUXglBg2Yn939r6Y/cppVsmBg9RjtwGsRdWrQWV4gPvAierVVE2QFOaGQ8I9EH
	 tDgc56u4qjiqw==
Date: Wed, 27 Nov 2024 19:44:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx_*_defconfig: Fix i.MX pinctrl enablement
Message-ID: <23adf02f-68b5-4927-96a9-0793b9a80608@sirena.org.uk>
References: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
 <CAOMZO5CbgmGpJvurf0Ctomj5dDOt=dC5X8XvwaqsM9Ce_uXhUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tpxTvM+AVXAWYvlF"
Content-Disposition: inline
In-Reply-To: <CAOMZO5CbgmGpJvurf0Ctomj5dDOt=dC5X8XvwaqsM9Ce_uXhUQ@mail.gmail.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_114419_238852_E980D77A 
X-CRM114-Status: GOOD (  11.31  )
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


--tpxTvM+AVXAWYvlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2024 at 04:36:12PM -0300, Fabio Estevam wrote:

> It will also cause regressions for people that have their own
> defconfigs (where PINCTRL is not selected).

AFACIT we generally just tolerate those.

> Then I came up with a v2 that simply re-select PINCTRL as a minimal
> fix for the regressions:

> https://lore.kernel.org/linux-arm-kernel/f65d65b3-b60c-4c5c-a002-81370821ee1f@app.fastmail.com/T/#u

That also works of course - whatever way we do this it'd be good to get
this fixed for -rc1.

--tpxTvM+AVXAWYvlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdHdosACgkQJNaLcl1U
h9DB0Af/fCc7aDc37iy2DwGKzHqlYm4tYaWEMqyvw+cPSN7QDQXrDZecDrqy2FXQ
bHpjvVOMR023AVHmuvqSCnaAzctb+zacIWAHs/M/0sRDN28wpYVhjUN3cpDc1Ewl
VzoqQ6f3sRR72WzjOp+++zbYLXaKS8DLv3jrwRVBDa70xGVSFPkz0r5m1qxuiYwU
JaN3lBS2yyxPTtcaMsMRAmzC1vR536dtl/eFF75ZTycXG0akP8VKLD1T5GAcdTq1
5VhFY/mv2A7OLqOrScQ/poOuOe7UFLkisFAEGnlVhjNlLJGJTpytPeEAQkS4NN9F
hcnSSDrPCwljg1Agog5RsZObnbjCpw==
=Jw5l
-----END PGP SIGNATURE-----

--tpxTvM+AVXAWYvlF--

