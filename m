Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4177C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0LBvn6AryDEujPKvVZ6pcn6cMwbLiULsW+TgtgfRaI=; b=t3/jKvvuSyWF4wx60s+osioPQX
	I6/b8aP6jaFOHeP0b4FrXhs13dYRzoCf4J3GlXJ5nRSf+cg8X8GF5vsDu4CB4PHQpsPW0yjn5/iTJ
	Puq1hrtPKIosRru3Q+/bwJQaa8Uz0smfe8FTddJzxDmCG6jW1BQdh8kEoXAGXe0UbqlNRofDvD/CP
	x5Qp31HXDTzg1OPpLfq2tB2mJ5poIH9xK2gojsm5jNJQ2j6K7UdN3pwkJD8/77IlgOUINOFZgOUlV
	5MGrfBoYpyugbrr94zfx2kagtVemYbnqqRKRjsLnpqFX45HCpbj/Zm8JKm4apgvPHsq4lci+WyXOH
	EFZyfrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOGO-00000009czu-0Yk5;
	Fri, 07 Feb 2025 13:19:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOF1-00000009cr2-0uUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB134A43338;
	Fri,  7 Feb 2025 13:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA9DC4CED1;
	Fri,  7 Feb 2025 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934273;
	bh=IkN+91g2ry7/izxkr090QMoaPLLE7yTdLaQvubsVUeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXRnylWyhvFxk5XU/P0YRWezrAu+XaZzF4i5/Ca9GakNTqAStcaxowAAxrbLYxslV
	 UwnunStOpd9y9+OwHqyqBNmM+yFZhlPaUOBPBMVSeU40ALmkhGG7Am2DmuWt2C2X4f
	 2tp4C4hKc4ReBB2uAN0HPEk78oLh825TtTTtTBDEqUXFKrHA423xvVPqG1BY2cYxN7
	 x3PD2BlNBL1EnTipjMxPMo8sEUKB4e4G3miCoowJbaUD4iaB+pWnY0rv96K7MJC3Rw
	 l8UQYRPKIL2lDJQn3q/JARtbLiX7qPaq7FCZhSz6/Grxc5xQ+8QeK6EBoJWk9qjpo7
	 Y+utI/Ogi0oGQ==
Date: Fri, 7 Feb 2025 13:17:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH resubmit2] spi: atmel-quadspi: remove references to
 runtime PM on error path
Message-ID: <6aaa852e-9a7b-45c4-a5d2-20ebd8f848f9@sirena.org.uk>
References: <20250207122145.162183-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N8auyasM2SC+L5Gh"
Content-Disposition: inline
In-Reply-To: <20250207122145.162183-2-csokas.bence@prolan.hu>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_051755_319675_5F4D640B 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexander Dahl <ada@thorsis.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Durai Manickam KR <durai.manickamkr@microchip.com>, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--N8auyasM2SC+L5Gh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 01:21:45PM +0100, Bence Cs=F3k=E1s wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>=20
> There is no need to call runtime PM put APIs on error path of
> `atmel_qspi_sama7g5_transfer()` as the caller (`atmel_qspi_exec_op()`)
> of it will take care of this if needed.

Please stop sending this out so often, this is the second resend in just
a couple of weeks.  Allow some time for review, having multiple copies
on the list makes it harder to keep track of any reviews that do happen.

--N8auyasM2SC+L5Gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemB/sACgkQJNaLcl1U
h9D7Wwf+M4ufdPA1DyzrOM/eDkbJJwzeNBiT4EENEGbaWFN3iNZZDY0apuK38f65
ATrs1UHVLOyubSTpifTtz5he9gGCtr5QxN5fwYWH4nSo6PmmoV4twtadyjUTsGt1
2D8Qa4tRD6Xwrda28O5tNjdouFD93jfMvhKlbOwucFGbjRXeL9ntYMV4hNqofixi
t9wrmuekt3pEASBcfr9gI86Ff5jQ6/BvOzIhpmr0RWk5F2jKQt+V6tM2AvtKnxzO
/oyV7gQAOSEhKMHGwWjW4bBrjaCEXQg9VIUOzGKXBqjaLChgX1s89T8dUcqhQtdY
rk1bz3zqBTYoiMHBeMGyfJRL4PH7RQ==
=QtKZ
-----END PGP SIGNATURE-----

--N8auyasM2SC+L5Gh--

