Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMPAh37KwybGZcR5RFOuI4DyOQCzHhSpxnlzwI6uDGY=; b=thgkLPyMXpxitPpp5sWEX0Ho88
	XixwwEoyZXDKMI8ho1LGtAZfOuw01Mjq8t71XoIP5HqABTi4GyeUXttQFV/5iWPwyldUTIsPrhSQz
	rYQt30C2w9HAIC1cCik9VxnMppFJI4yXaQLh0GkaYqTD3i+vkwuiGsoJNhGqWUhXR38Ch/+oNNXlX
	+pXl32U6QikSHjxmDiV0Ih9kfXXVDs8G1TbmEDtQ7PIoM8AdhyhnaWs3gYKhMeHDQEU+ao3Ir3zxK
	Bm4V0VAHgt0SjpvyrCIVB9hT0xGW52TnJnNBpeTsIZRnYd0NrP57l9R0fB+UYfry1k+y/0JIcD2p4
	n6L+4F6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9zD-0000000EPKW-2Uzx;
	Mon, 29 Jun 2026 11:17:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9zB-0000000EPKF-3vMR;
	Mon, 29 Jun 2026 11:17:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4754B41E4F;
	Mon, 29 Jun 2026 11:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99751F000E9;
	Mon, 29 Jun 2026 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731829;
	bh=oMPAh37KwybGZcR5RFOuI4DyOQCzHhSpxnlzwI6uDGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWNxJPpi04a5yzN1p35HYelJNO089ZpIMQ9NN7m9LIHZdMdvCiJgi/K632pTjK/fG
	 9TplplIDVgaz8liV7ldeUTuBncNSZqfeh4aUkkeDDOLzG8fZNxT8DE5QJupw1r0Jsb
	 ZhahLK/5zphSJaYkLBbHiGG2WR3jG54mkJjsJsgAfYewjaarJSQD3Aq+rmJmbEG9O9
	 RHKN/fY+SJ0sIdoEoQstCFp38R79bs8OuwWfAnaZavXAV5kROh+Hhsv/Tcrwu8OU4H
	 jbOfxeJ54ENcIB6pnp0HAFq7S1nYY3LHDXXij62zt/Zb7sNdk3SeVYj7V12U0gNt5q
	 v0sjnBoByrxbA==
Date: Mon, 29 Jun 2026 12:17:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-ID: <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJyhBMaH9dnz+AzZ"
Content-Disposition: inline
In-Reply-To: <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
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


--HJyhBMaH9dnz+AzZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 08:00:22PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Currently that header is only included via:
>=20
> 	<sound/dmaengine_pcm.h> ->
> 	<sound/soc.h> ->
> 	<linux/platform_device.h>

Acked-by: Mark Brown <broonie@kernel.org>

--HJyhBMaH9dnz+AzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVC8ACgkQJNaLcl1U
h9BEaQf+LJKVjBR3CzfB5LfeTicF2UG1SITyPebmdLt+bwwJIPIgmCv6j8lpadLr
/LqHY5ijaBG9wrx97zfqolLd1p2JS6aXEjUZrpyd2Qmwuee4p1g/h4xG1g7l5x04
RMAOa/z8PmmYZEgZ/ASTyQ8Wm8AUOtvM+2ArPr0bxhLcnSLQhpSneG8cw6Swm8dd
Jb2uCXxGvffL9jt422oyK6rJGxCg/vuTAJjFoi1FMOiSsp4XeVCOSCtJD6wgfsLj
M5LmMJJ88yAJanf4SnBEed464Jfbx+V1cL4ZN2kOu17o5OKBdUy58sGXnZtdUdph
uT+DGfzAzsR20BYjYjyxsQLiaoLFhg==
=7V8g
-----END PGP SIGNATURE-----

--HJyhBMaH9dnz+AzZ--

