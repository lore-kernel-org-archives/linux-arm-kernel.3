Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90141D49209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggXBfg4okLKWMAgjg72jaDL3DCA1UF4GqsJy38hSKnY=; b=G3Ca0AyYbNCtU7LmJdQU7GIFo8
	hokvui1wviGs8ZQgULelaETW2m9H3+syeTIM79UGXxx7b4NVn4c47PuGBkKZCHoUShXUNg+JxlgsD
	okiENTHbUGj57gc0WKhqssI7bTYRib0TUpAQUDHa+hCLio3X5KLZOlVh0MZVyT3o0CedVcVvjZGaY
	vuKfzvz8MOCq/uVPnRlgLVMjOLAUjGvJVgvSi1KAzf8M5bLXnSglrRbut6uDk5BbXtGkXUCW8zMRI
	UhQhPTymuQaKST8GUxpNNPVcdp5RDyng4ERvFlBCDa29uaIbLzu0FTjCMTqA8MIsg+PEJ5mTvPaC0
	bt3Cf2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyxW-000000094oS-1BrN;
	Mon, 18 Nov 2024 10:26:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCywa-000000094f7-194t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99A00A4186A;
	Mon, 18 Nov 2024 10:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2136EC4CECC;
	Mon, 18 Nov 2024 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731925516;
	bh=ggXBfg4okLKWMAgjg72jaDL3DCA1UF4GqsJy38hSKnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJCCrg9bvID2IyZQEAeQeREC3tc+Lc7oWwX4q7GVqzfB7U2G0UxpqoKMwl6LYHt7D
	 0/LqX4mgHcylmECKoDG9/grRXGMeDTD3uL5Haf/Ou9cuO42a2U2Yvkl7/HRHonK/l3
	 cJ0MoOCJ+7GBMj9HHGFX5anGLRBmh4z0s2BGT2x98azXgcAWx/fYFgAi7Ys6FI5vn6
	 qJKiCWMw26fUyWrb1PmEmb+KI8/VCGGpl3Fb+TEnmVrJzyamH1l5ddbG4DUq99Csgw
	 w7jpdRqgpzHbTHJub4CEzXj/2veMUuSIUcFIUlQ4cqiH1n9n27a4Qr34D6ZbuTH3ZN
	 3L7+V/h9OwKDw==
Date: Mon, 18 Nov 2024 10:25:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Message-ID: <5b8e7658-85bd-4f08-b535-49dd228badd1@sirena.org.uk>
References: <20241115230555.2435004-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAxsM1bWuCAH5DLb"
Content-Disposition: inline
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
X-Cookie: Used staples are good with SOY SAUCE!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_022520_376729_50F7465C 
X-CRM114-Status: GOOD (  11.56  )
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


--QAxsM1bWuCAH5DLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 12:05:18AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:

Acked-by: Mark Brown <broonie@kernel.org>

--QAxsM1bWuCAH5DLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc7FgMACgkQJNaLcl1U
h9AHygf+I9zVvzEwmUe8hbkMAhNzupktcwow3B9jxslgerjTscA5tuygFib3caoG
anu+zdsOxBLh/pYdc/MrKXBEt5Avbe7rK+hXv7po0spzAX/Z45NyvuZ0wsQjm43E
0PbRY139l03Y93jWXC5YEupS9M9p7/Fh0JdTn+qSca1jT8P0B+/OZTHGghRLteLZ
1qTG77fhn4ru60+MADnLvYqw47eVOgcykhZJSCA3qSfkekSxypAvq13lvyBSiPgj
lVEjzhWsaaAzfI1q4u+TcsPbuuMoLk6uFX1HBwSAeD+DUePRPuoPg+jRVEjUf08/
66z5nRhBiYqT06/LiOjkjLecgy/K+g==
=Rp8x
-----END PGP SIGNATURE-----

--QAxsM1bWuCAH5DLb--

