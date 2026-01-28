Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74501D46BF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGtarhClJemdMud8o9IH3HB8yjz32Ael8aaz7xAt8sw=; b=18Fe133O/N6DofhgdTB6qVCBzl
	t4Rjx0mgudyyLznByi2NGo4mZ/5lBGkzR4MOpTR/dCDbS/b8+3As53XxTNB3i92zDboDsZDG+puAP
	cbNiipfV/HCV17IBWkq0iiMP4m3bXXhOaxIcjbode059fNVoLdjGk8n4gpE3ey1cV9iJxWjCots/1
	qUHUO/ZEylShoxo8XW6Rd6pFHEgOW+UPd7nFhu3+U6KmgTX0EKPxrmDqUkNgQ5OPr+GBMOxoRieO2
	vvDGcVLFNixMvYFLsXioZbCbt+8rnlTuzZHcZe2a0/SiwdnGC95HGdXlgE+loBUcvRZU7AdrPTWaK
	oqzMGNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlByZ-0000000Gj60-0cs6;
	Wed, 28 Jan 2026 20:17:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlByW-0000000Gj5f-1BY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 898C8406C6;
	Wed, 28 Jan 2026 20:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B0DC4CEF1;
	Wed, 28 Jan 2026 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769631435;
	bh=7ty/l0/UHtbDkCTzrZ7qeMJvgWuD019xW5A1dHwPrFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3QNae9TqOju1dGY4tbkW1JSEYmTsNtQ9FGfC6hmGVwy30HrOORRtBIGD/LeAcuFI
	 fY/R9tTIfue/oqcjfNMtBko3TuNN1qmOcOM9U1QbuRu6O0y+9bRmJ9/lvDyxpg4yVx
	 HF9eC2BJpVgO30gdQsDkhzfJxV+BK/Ed5xjgNgJoYafFt5XO9kQTPrHVzwHyGvyKNe
	 YHls3uW3ej+wO0ATKHYGQjqoo8JRdX4yzK8GcxkqL7iQjH7JaIYEHUY0FZMGfz2Ew7
	 PKukNBSrw0TYWygqP/nAlG8CxuJq5/jGq/aRqoOK9pjMeg0XuiPwM+vPpGJrlwfdDE
	 vRcOeBhnd3xCg==
Date: Wed, 28 Jan 2026 20:17:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Fix a __clk_core_init parental issue
Message-ID: <a4f87b4b-efce-4c8c-a523-69949935a096@sirena.org.uk>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36IGtiXOT6JnWWxy"
Content-Disposition: inline
In-Reply-To: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
X-Cookie: APL hackers do it in the quad.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_121716_343411_2F2BDD99 
X-CRM114-Status: GOOD (  13.74  )
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


--36IGtiXOT6JnWWxy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 07:38:49PM +0100, Nicolas Frattaroli wrote:
> Mark and Alexander, please test to see if these patches resolve the
> issues on your boards.
>=20
> I expect the first patch to completely fix the problem on the Avenger96
> (STM32MP1) board.

This gets further but still fails on Avenger96, looks like we've got
more clocks need work:

[    0.513739] __clk_core_init: enabling parent pll3_q for spi1_k
[    0.519521] __clk_core_init: disabling parent pll3_q for spi1_k
[    0.525489] __clk_core_init: enabling parent pll3_q for spi2_k
[    0.531311] __clk_core_init: disabling parent pll3_q for spi2_k
[    0.537275] __clk_core_init: enabling parent pll3_q for spi3_k
[    0.543101] __clk_core_init: disabling parent pll3_q for spi3_k
[    0.549066] __clk_core_init: enabling parent ck_hsi for spi4_k
[    0.554894] __clk_core_init: disabling parent ck=EF=BF=BD
U-Boot SPL 2023.07.02-dh-stm32mp1-dhcor-avenger96-20230727.02 (Jul 11 2023 =
- 15:20:44 +0000)

   https://lava.sirena.org.uk/scheduler/job/2413747#L593

--36IGtiXOT6JnWWxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6bsQACgkQJNaLcl1U
h9CUOgf/dHiM/ZBZaiM1Q7Yl82GtKle+lZrbCDyNUDAv/Zex4jr9qaKCetQXiGuE
RPJ6HXcCUbrMsdlR/zKBmHIAx2K+S0TUoe1cNvJPf5KHDWhQz7+hVjhH6Or9HumM
597hfh7D/UO8Nf0CFaQy++oI6k5sFZS/0JCzq6bRZCDE/Jje55pll94c8KTieSIh
6Ca3Kq5OTXhRMR3x3u1mO0yrO0zCB8FMkkfYGf0XWNc1lJ+hQl7FRhn6CaeD74Yr
sW/lOLKvmLcElitnuP1ZS+MMQenFWkCJWwAXnNGWvrK6pNh+9RI2lDs0ifQMQU38
2l9E59sHeK3nujrF1cBySJ7KO0yuUg==
=P6BF
-----END PGP SIGNATURE-----

--36IGtiXOT6JnWWxy--

