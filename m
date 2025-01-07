Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E11E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+AXlnrFNoWyO2z90/qLOVtTSdp1MAEQUzLX2bcgBic=; b=pwV4e+QB1W6m/XrvnWqdtjVdS1
	TiY5o+81oy31XSjIY1Fl0WgOMBPxZXqLm8BY1qqtpiNW/d1jIw2fxDqdkClJjtLdTaH1EWmqvAYH8
	SKmOI758kcqwc6R4jF4UveNQ/9FHWyKalCEklMT++J8YS254cxdQjveMmFKMEkhEeAcN1WsBXFRR7
	KjEARJfK8DVhFL2EkXIgnmYlkn/U/FV5nb/MnMgSS1/34U6GiwuVlwXaB3oFpcGu/OksAhkt9uBzM
	RJEK+BU3FCTIYbpoU9o6XWiug/vGc3XtAj/9vWblJC1Hs7Vy+YkCIqpsOs7rBn8WU/9jQxS9mA96L
	006o/3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJL8-00000006abM-3Gz6;
	Tue, 07 Jan 2025 23:50:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJJw-00000006aUB-0t4L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A47D0A41F1A;
	Tue,  7 Jan 2025 23:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E30C4CED6;
	Tue,  7 Jan 2025 23:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736293751;
	bh=LczHp8RpVOiFlyTZ3Oz4yPH8gsV6c5/fOmHG8eOWGdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfmIc5ecaMNktVJj7MSY6txtAGqBKAnuAgx4KWAx0bY7yG4pw/jBTbh3+WlDJGDwU
	 Rn4ti9DEZJdxN4BH7NZ0i5ZBIKcFCqnzGWoap7WKQsHSZejh15sgyUwguK/buJXceT
	 AndABK5ttVmmOWhA89+13CoGeyaH3fDI5va2lZ161RdJsuZeTEsR7qGlN8KLJHKSHP
	 qbO/4jW2toMHqtNGA+ySf/X9u2JGnFrrTUWhBknrzlr5VbCwPbsLFdPwVBjDJMfASM
	 aeZRANukpHHHYot/5/wTL3n0FNqmh1P1h9Rd38YBjANOZ/Nx9nPrFbE3oBG0coVIS5
	 Klq8SJ4JUw9nA==
Date: Tue, 7 Jan 2025 23:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
Message-ID: <ddbbc928-f199-44df-918f-9a87b489718c@sirena.org.uk>
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dbL+kc+XH+pXK2/U"
Content-Disposition: inline
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
X-Cookie: PIZZA!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_154912_315699_1DB8D1EB 
X-CRM114-Status: GOOD (  11.11  )
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


--dbL+kc+XH+pXK2/U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:22:05PM +0100, Bence Cs=C3=B3k=C3=A1s wrote:
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().

This breaks an allmodconfig build:

/build/stage/linux/sound/soc/sunxi/sun4i-codec.c: In function =E2=80=98sun4=
i_codec_remove=E2=80=99:
/build/stage/linux/sound/soc/sunxi/sun4i-codec.c:2380:29: error: unused var=
iable =E2=80=98scodec=E2=80=99 [-Werror=3Dunused-variable]
 2380 |         struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(car=
d);
      |                             ^~~~~~


--dbL+kc+XH+pXK2/U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd9vXEACgkQJNaLcl1U
h9A+Ewf9GH4JvV4Z1eko/2GDCGSQg7y9scEjSf913yOI+6KzSRt/ofI/NvOhR8QP
tBCqaxKJiFO1D6ceQstMjMBJ09kPgb08ObVGmMI1atakf/2bcPrIKPSblZ5BGYKt
nO50q018u+/KN/hJ8NbeyOLZyEsfN4YejJRgTd6JQJEJoTdSAjCQcFK+C2//QsX7
x9W7WecdOzxIRuN7g60uxH79ccb1Evtszgf9hB9QD+ApbAHU5Bh0fTVEaFbIYMRq
l2T6KIRNUKXjQdKAurJmz3n04OZM5GNxlmYLiKIxb6YhUT3m9Kse7ASM4zANtACV
ScrTP6HW3nfvnPLwHlz96PLTFlA7Rg==
=41hA
-----END PGP SIGNATURE-----

--dbL+kc+XH+pXK2/U--

