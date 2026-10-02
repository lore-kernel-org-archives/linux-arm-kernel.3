Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv3pWyeRRUFoRvp0Ps4itJ1XAqYSWp88xwFqSuNXeiM=; b=uonPMlnFawEvx9QvnvyzAUyTFn
	/t1LeZAZ2i0an10d0NHTyj16HN6ICqP0J+HoJxiofFKW62ryM2yAL1e4+tgMRhqf1Wd7+8Qa8rP9f
	MQiU2q4lzOnvpjXTRncWy3hxVypgYoJGQ/TgjeCFQgMD2olzOT7CZ6hqHMKs3Hnr8pi57JhDMUQDM
	96/63nAA8jNvk99EDSLZz9WMuOeQ72sPFWKr/30+pUWMz+hBKDG39U9KzgH4S7mvCCvdLdU4j57bS
	mHcyfwm973jl/KrhBF3ESV8X63TIDlgnR/LEBuMLq5S8GFYhpLuvR6A4F9NMOn263oRNios+uowz8
	hg1yfiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHj-0000000B4oH-3gTL;
	Fri, 02 Oct 2026 09:10:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHd-0000000B4jZ-3NTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E2A641662;
	Fri,  2 Oct 2026 09:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76591F000FF;
	Fri,  2 Oct 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932225;
	bh=xv3pWyeRRUFoRvp0Ps4itJ1XAqYSWp88xwFqSuNXeiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tac8bcu8UpJqVyV+6QauKiRTO/qPA2SZax/Oq93s1CxGryBRG9pPtFssaJOsPJ5vT
	 /YdEhDRImnbiHcrdTZW0i+TZ+OYGfSVX+VKBUwujc9/2BZdkx6FL5BBgn61eesmBS7
	 VV1ysUOOxaH+rAPCSJozKtBsw84U9yEBxRmGNFcB+7y/Jel13tb+wCalBvzrN1MMNC
	 UBY73LWaWYdtJYK+Mp5fNThuSzWIp3ZlFnm8Bs7itpsSrE9KmAlVzwnIf/t7Mxz8kz
	 4IbaBD6TkCxBoRN/VMOBf4inkNQJuLfX8mE6QZtarUevACoTwkr8Tr/qfj/TvhKzI/
	 HJoPTke3y4i4A==
Date: Fri, 2 Oct 2026 11:10:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM: fix typos in comments
Message-ID: <ar900Vgb1Uil-A0a@orome>
References: <20260907064849.23086-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5tp3jaaty7hry4a"
Content-Disposition: inline
In-Reply-To: <20260907064849.23086-1-hemanth.selam@gmail.com>
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


--m5tp3jaaty7hry4a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: fix typos in comments
MIME-Version: 1.0

On Mon, Sep 07, 2026 at 12:18:49PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  arch/arm/mach-imx/suspend-imx6.S           | 2 +-
>  arch/arm/mach-omap2/omap4-common.c         | 2 +-
>  arch/arm/mach-omap2/omap_hwmod.c           | 6 +++---
>  arch/arm/mach-omap2/powerdomains7xx_data.c | 2 +-
>  arch/arm/mach-tegra/pm.c                   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

This needs to be split up, otherwise it's very unclear who should pick
this up.

Thierry

--m5tp3jaaty7hry4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/dP4ACgkQ3SOs138+
s6Gyjg//Snni+P2gN8G0V2Id4wNCmsaFFJIE2m4t6AEeKDISQJSR5XkZ3sSq+kuI
BYKXs4jiZ+4Jrha0HNMPMWtfa94rVv0KtLJ7E99JGP8EcR+Gs0IZ3uCLXa0MbEiG
T4F+o/JpFWOMMZnG3tpkAyBquOY2XAKv+cSOCICe188kO1sVzDer1DJLENkhUkQ7
BG9ZNNnnyiYDrdL6dq2a04pFG6a5TrvGKO9zHv0VT/O2Yambm16Oj5l0Y+M0vtGR
9D7qloVAKwy5GhjMk/IIiQiK5ItfnTYCm/fU0cI8oxCUPV3bQYjTJe4ZjM9jJSS+
z5ETzCZv8Qi7QCCIjQGpvRgSLADOYLEpFDmfHzYEUrKYCvT7EJofZ7vAgnFiAiMN
uIdv35HZ+G8FLViLjVZGL0+I4xQeSYlCsW4N/q6JWr+j2SuDtphUwTcMomOoZvQT
/SXQkh3pUYaEme+YcR3AYnU0lfXx7R4freR4yI1fGRELxlXpIiTOMQ+ASXqfTfKf
1bFn2KTHD21W+DzAJ0f5C7nOg5jxnVEaSzflTVMFJb11RKJbO/qdLa/AVsMU/CsK
26usjIndk1A9GuaKyNbBVvipIxL8J1yljVUq78E4I6MUeahGWnv4lQeMAgRXAwbh
lLKbR5DagwKOUruPvF98fjOr0FcGybMmMEw8bNZCOXuiDngifqM=
=3/Oa
-----END PGP SIGNATURE-----

--m5tp3jaaty7hry4a--

