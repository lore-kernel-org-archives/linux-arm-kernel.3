Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C6C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaBVwUV7aElBCII+pwox4x6oSohZUw70T7BmwRHYa7Y=; b=IU5f+DXIKZVD+FN4qNVObukKRP
	L2J2coae9G3e1aO6AGMcSDbkxcpfQyGvaon59SJlDt0/V67YoBhFkqB7ee+80Kyk28BD9adxO12g0
	BRXobrAcEfeaH4asoWfPGLKJWObGKirMpcLOpSVhvuSvx4PPck1zrBgC8RtrMarL0FvdpvaFgpgLx
	ukVNbkHErhmEgp+55SeH1mmxoWif6274DNgPmwCI8Xf5CVJj4wSs0PSXuH/wI2UVSu/nXcpJ7G8iP
	dgHh96YQI68JCtBjRpMcYBmQLKV4Q9/hGl3KKlT32pG2oyPtprOS4wDgzR1E1XJV1ZHmcgltbIan9
	uGE853bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzHp-0000000961R-1Va6;
	Mon, 19 May 2025 12:08:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzFB-000000095cA-48Pw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B8755C1025;
	Mon, 19 May 2025 12:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AB0C4CEE4;
	Mon, 19 May 2025 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656320;
	bh=uaBVwUV7aElBCII+pwox4x6oSohZUw70T7BmwRHYa7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll/nAuUjNrOyw8j2ZkTdy2sagqzkbs1Prucq/UAr/aTQL658hbos9KEspxJJnQb+J
	 zD3GHS564rMkVJmZl/Rm0enKRTfyCOEU2TwazlDhPahb8hisgBip9BtNm4ww68llte
	 l1N89ijETKpKJ/OBKTVhdIY5VXe1vhVDQ7gT2Qrdhh0xPHdZBn35WRxJXObcEX+5e3
	 pha845Cjb6Bm9LwuHHefAJxX694ZkKlRVoTNNbdRhzbjxs2kknGOHx2M23ip/2NVjg
	 Giw8VfnIjmuNt8LlG2/yXVZg1fFAzAkw0RmSZlY2abGtBzRFC8XNB0FFgHT7WRwIpD
	 V1r1gdk9dU91g==
Date: Mon, 19 May 2025 13:05:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Message-ID: <64488c18-d86d-490d-828f-7c82f654876e@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AmBTndPcfU5+JRsO"
Content-Disposition: inline
In-Reply-To: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_050522_080137_DE69BCE9 
X-CRM114-Status: GOOD (  14.11  )
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


--AmBTndPcfU5+JRsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 03:49:27PM +0200, Dario Binacchi wrote:
> Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
> driver") breaks boot on i.MX8M{P,N} platforms.

=2E..

> In the imx8mp.dtsi device tree, the anatop compatible string is:
>=20
> compatible =3D "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
>=20
> So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
> CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
> for the i.MX8MM anatop is incorrectly loaded.
>=20
> The patch fixes the regression by ensuring that the i.MX8MM anatop
> driver only probes on i.MX8MM platforms.

This *works* so=20

Tested-by: Mark Brown <broonie@kernel.org>

and we probably need it for existing built DTs, but shouldn't there also
be a patch to the DT source since the two blocks clearly don't seem to
be compatible.

--AmBTndPcfU5+JRsO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrHncACgkQJNaLcl1U
h9CqPwf6AnDPQlXq5+ODftAO94GVICXfG0CkD34290bl/C//PcNtkKwFLwEi08Ny
hv5H6y1Y2VNYHSE7dtfY1W8hzHczRKcnWqzVhN8Qqp2rpqA5GR4Cl6llJGMwkMFS
T0whNbLSVTJrrzHluALbF629AnThigYlhGGMGoCsgNEZsVtnwnBzv8jsFKP38EWS
4r2onOssrGcIDte2DdWzkOSJnm7xIwOTU10zBz4rVZwi2DpuFyivispFSJugv5j3
cl7zgoT9UrdntwYvZRktpd6Nhq0gq0C6ABaSMuX4WPvshOqfjRyb9t++FLg3v1YH
IKj/y81cV70tRM6qd4PID7u9fbsxmA==
=9WUQ
-----END PGP SIGNATURE-----

--AmBTndPcfU5+JRsO--

