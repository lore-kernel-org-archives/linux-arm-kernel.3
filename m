Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104E3FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 23:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeGMWQbLjZspQ8v1tlpfYlPx2YUAxwMS3yXl0onGmug=; b=gCgs+MlFO19CEokImzslVQxCa+
	7FT2um19/oJEM7+LUZkk/xmMiQzD1CMTk9yfKOlMePjiIR8on/Jv+IUqxH7rtjDgeg+BVi0G11Q51
	TADTdwK8JmZd+O4IC0wbRYjWTF79V8n+5wMxEhaO8WONG67iS9QhWjR6kxAfJOaUKxB3AE6QQemiK
	w3YzVoT1E/uWIlKSfE6tZ/A/fa2DXua5dCFrO9J0dUGW/Q2TG+mMWUjJZW1qRs8SfY6krzMzjR1pn
	IkJamfgHkjkXy8twDTKYxrj4hsYXxzEzo2eWKTPFgpLwjdQ8xYbiHqeTUNZYqwjjnfTCbiy5GrJm5
	0k2+6o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKPem-00000000Gb0-0qIY;
	Tue, 05 May 2026 23:58:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKPek-00000000GaP-2Myu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 23:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FD946024D;
	Tue,  5 May 2026 23:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95368C2BCB4;
	Tue,  5 May 2026 23:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025504;
	bh=oZi5mOLJO5tHaHGOBk0mIAUMjE6TaWnkHFAMBM6by+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsmR+I5H5ev8eTvCdYfQowrbT0G+qLlOffLa6uWw/PMCnR5YANoFysupz43z1cPV3
	 yygfJJWwCDheUdWDgoCBEM/PYXcP6bOICgdUTDCg1Ym7sB8ukKk+5POoeBuxS4MiPg
	 5Crk8mUZ/kMz/n5PwGij9h/Hot1o4HwTGePlMgZ1lVq0hhnc1YcsGfDb9H+CA2LJus
	 Hj/HYGg5IbzsJU6HJTeTMG9NqpFNOIYdNAl7iXo5QTIoY2t5k1olVcKiSDtujuFUP3
	 4Fehqr9TDWriaorqRQdmuUF+RHQWUcEJm9jwqsaPoHRo66yxbWNa8P0zAKWAjoE5AW
	 XXI5hzmYEtpbA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9B99D1AC5878; Wed, 06 May 2026 00:58:21 +0100 (BST)
Date: Wed, 6 May 2026 08:58:21 +0900
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afqEHZSUCASXPUze@sirena.co.uk>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0lcLZ48zRt5QpNpN"
Content-Disposition: inline
In-Reply-To: <20260505202426.3605262-2-arnd@kernel.org>
X-Cookie: Alex Haley was adopted!
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


--0lcLZ48zRt5QpNpN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

> index 7df78867db49..0d5eaf4b100c 100644
> --- a/include/linux/platform_data/asoc-pxa.h
> +++ b/include/linux/platform_data/asoc-pxa.h
> @@ -6,6 +6,6 @@
>  #include <sound/pcm.h>
>  #include <sound/ac97_codec.h>
> =20
> -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, boo=
l to_gpio);
> =20
>  #endif

You're adding a use of struct gpio_desc but not including the header for
it or declaring it.  Which won't really matter here but still.

--0lcLZ48zRt5QpNpN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6hBwACgkQJNaLcl1U
h9BV7wf+Jmw366XieA0d2MdbU3V0YXlDc+OCwyOPneDbRc8EVPKcVBtuGL3uDNrg
mcKj4o5Vz6xBqJTo601VF9QKjxP8m6GHMoBaqnTigLj2cpijXYk/P/IRg5R5++tZ
HUivwwyNM4Irp8wRyEn2+I+6cdRX/urSBzRNVPhyIC/VIKNSG4BjfMr7v2t26PMj
J1iCQ/psxlDDj8pxFHtBlgG9FTLDJFJUnbAGVSE3kMFFk9XAbnj2rTOqvtzfXt62
Z2aDCvNtzaCV/H0mN1uRyJGNdf2GCv8Qg30aT7ytbEB0PBUbozCbe4ZYQbLQ74N6
kITzSVhWFCoWqejbh9OCPiE1wKlwEw==
=yhzA
-----END PGP SIGNATURE-----

--0lcLZ48zRt5QpNpN--

