Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3959E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMfoICr25vJULHXEU9DptywfEfHQ/EWd11ZFFXA3TZ4=; b=XAggOnX5CCTfaVWBFysv2DiCtr
	XKSgBsablrDVchcTsI07BkK34m4ui4DvhFuaO/2CxAu2uJtvcSDq/KIhd57pXhu7YM4aP3BjzSEwr
	O9Aua0eTjlDQl2h8T9GmVkKkhdoBUdCQUTsHWmrAhry+6C+RQxstA9AWW4r5ghbe6Kz6qg2dptJN6
	ORuunKgo8H76UGZojqgsm5PFWZNhIi4Jl/jLy24Pq17HUUdSCgRxUIS3GapJZfAM3G3LG8iCQ8iAk
	Kd4jlQKtDds/4ZUFGdmLoGeEp0Wn8t5GMZmRWzftdbGXN8YG+oyu/q33laRGgPF+KkYGywb43USrv
	Ah5D4I5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgT7-00000009lV6-2pRj;
	Wed, 18 Feb 2026 12:15:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgT4-00000009lUQ-42w9;
	Wed, 18 Feb 2026 12:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF13C407E7;
	Wed, 18 Feb 2026 12:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31118C19421;
	Wed, 18 Feb 2026 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771416945;
	bh=CMfoICr25vJULHXEU9DptywfEfHQ/EWd11ZFFXA3TZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CS2hMCuaN/8Ioi7cWg7F/BI7xAIrCVt7pqw22ip7EXsHh2HkOngNgTItqKBdBKSZN
	 PuvEUOGJhMDa7zf4Szyar2n3kXf+EDRiK8cLNWFEln3rI5tN11fW/5VxvYJoUQzU6K
	 ULN1P75IFUJw1hpYwA3c0+v8mhYWR6iZ5/h/GEWoWkHLkDx07oXM6YVmOH9DyX4/EC
	 pPaX3vwMTxii9k1A5s0KXFEB0pD8G9ZmG0nW3FC1VHuhujA/PHXqC/qtxJ8EfVm4ip
	 lSM7LyG7bEUuuhPmjSh+ucBzjSSncoLAwMDchIVoNtjzUnRJ4yxSGHCwEZpY4CZTuv
	 8xiRO/BnZ5Acg==
Date: Wed, 18 Feb 2026 12:15:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ASoC: rockchip: i2s_tdm: Re-add the set_sysclk
 callback"
Message-ID: <6ffc8939-147f-4b2f-a8cb-63a388d3dad4@sirena.org.uk>
References: <20260218-snd-rk3308-i2s-revert-set_sysclk-v1-1-79ab787f88ac@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tN0IzqP3xmtYQ7S/"
Content-Disposition: inline
In-Reply-To: <20260218-snd-rk3308-i2s-revert-set_sysclk-v1-1-79ab787f88ac@bootlin.com>
X-Cookie: They just buzzed and buzzed...buzzed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_041547_022073_7386AAC1 
X-CRM114-Status: GOOD (  12.41  )
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


--tN0IzqP3xmtYQ7S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 01:11:24PM +0100, Luca Ceresoli wrote:

> This reverts commit 5323186e2e8d33c073fad51e24f18e2d6dbae2da.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--tN0IzqP3xmtYQ7S/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVrWsACgkQJNaLcl1U
h9CiRwf/b/PyM6sh+/IY6KcTy577bNhqdqaZ3r+FuOqbpZngqzuc09sJKu284k1Q
vuU3JJ3he28hEUSwkazGVpEiLAWvGxNP3MPFuCgDGqtKb5fYCXORj8EX4ilVBiTE
dYC9oAab3VILGDf3lHQlPG3B/ZunIYQGdITIdmgHHsJ2Uet9TLEGEm7uhUZQybCp
jXzXTlRRh4Vx5oArEOWKIZdUw4IxtGQD7iLwG+N6Pt3L13d/8WG+XVgIdTzpMU78
SqviGJyfrH05JA4w3vlg1IXf/K9UYQ361nHhkCI2YQVlI6IokGh7eqr3LAzwQx/3
bkKavE7823h5HkFxYwH0lviYWdSTUA==
=y9au
-----END PGP SIGNATURE-----

--tN0IzqP3xmtYQ7S/--

