Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A9C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXCYnu9lQkfFUVZPWLXmxfPVjc+5rvAy8d0P0u627xU=; b=GTIwWIu8vo0ZyU6dekOYmAl4GO
	wxNjEDv11uFfBb7rFHUUyHd+hF63HY83d/NleTJco337rTCA9TEDuS5FJLvXWNnwMYTVBtj0d1dK0
	YTZEml4i3CNC7MbpEtUpQfBqHmhF3V/pUfl99S9ihDK+up7b18WAD4lvIaMTWHZ5PaoNz+3QZjHo4
	yetOCXjqIJV39gi7v5QutpP2XA7oxolTVgVkQ4iY0PSFaZ8dSGh2QjroOUii+CMVL9kV9z3twmX5A
	Il8a8xAxB7eYfSd5WBQx8IDq7jGc3II0QDcezBjgvU0NAeZPrrQIadpzgEruvTQ9RfF2v59m4/dmN
	NeTM2qYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iUq-0000000F3r2-2IUF;
	Thu, 10 Sep 2026 17:23:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iUo-0000000F3qg-2jQK;
	Thu, 10 Sep 2026 17:23:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 274E1418EF;
	Thu, 10 Sep 2026 17:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469241F000FF;
	Thu, 10 Sep 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061014;
	bh=QXCYnu9lQkfFUVZPWLXmxfPVjc+5rvAy8d0P0u627xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E7+Y6Ka6Nk57kLrhxFXEi4lqtDIj42F6cFLdquLIJHRU3BJwdIl5V0ZIEKxF78yuT
	 ygGgCU/Nf2GEDYamHUWHmWpPzd548bc7aOq2XIKfIgWuFgKCccHv2SFEKBOirMVB4J
	 kNITA2qnZ29pb9Ba6A1dVLvO61W8x9RQTPgG6Dq8LeBwIJ7qE/0OuzUpv2mrWU1zJ3
	 UcAdtUHCWQGw/gKu5YH7BdmnOIqNRBLqwiMMw2xSSORXDw0oggTagqKdfeVtwR+4RA
	 v3C/d4cOwwS3614QJ7tGn1/G5IkfibO/8ojeAOmqVzH4IPPlTlEEfm0Q+TsHbL1AxO
	 LQq2XCSthuphQ==
Date: Thu, 10 Sep 2026 18:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM
 errors
Message-ID: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FojIabTh4PEnaq7B"
Content-Disposition: inline
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
X-Cookie: Gravity brings me down.
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


--FojIabTh4PEnaq7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 06:43:37PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> mtk_afe_add_sub_dai_control() currently ignores errors from
> ASoC control and DAPM setup functions.
>=20
> Propagate these errors to the caller.

mt8365-afe-pcm.c has:

    {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},

missing a Switch from the control.  I suspect there's other errors; this
really needs to be tested before it can be applied.  Given the general
quality of the driver here and the lack of anything constructive we're
doing with the errors changes like this have high risk and low reward
unless we're actually running the code.

--FojIabTh4PEnaq7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi548ACgkQJNaLcl1U
h9ByLAf/YRDHKFMWDL4rpTtoEIQrI5nafwSGaOyH6yCyA57y9aVezzqFFkaQj7S8
+zrOPtx0U5/6ynt0fWoazqHxihGIJ7CswnlrQCYja9CC9YpsF7chr1d1rbWk6Np4
+MhIKL7+B44k4Tl1z5CHhjJwqvGMcgCIcPBYDWD3gQTIm3dMzTGyFTSUFmsgLAHK
uqBPjvRq/gshHEM5VdTMFiBekdkYTJ63uHOHYtj0rSBd4sLc+M7txiLeUfPPyBF/
rvqdMN6YVyWwG5Yn6aGyG3b2Y0W1r6nYaA62uSnIoeHvVdoTkpYaK0QiIEix0lls
GzAaBBQIrJgchPzqh+Och5hH+bFFIA==
=S+uQ
-----END PGP SIGNATURE-----

--FojIabTh4PEnaq7B--

