Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10489CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAcF6jLXR/Jiy63rF57V9WH4vmzG0s4+DUKWIu7ddAw=; b=1daD9xJIT14Z48eiqguovyjvSy
	hwTg6mxAEnNBwIkPZ7TUN1QDYqhvITytXWIXQHStoc7VQi2+w5eOnJjX5TX3o65eYu5CvWwfuOmCa
	Pa1VpDDg05aCMBhNauh/waveg8VciZAPFS9QOPI4spQ+LaXkiUcqggLTn0Usrql+XsTHzb2pU9t1O
	YiHbONWbV6xaIuwa6PBO4B4uxSxUJYLEjfG3xXsXtcqvFrG+E/NksgjDRX+F6mNZWpWaE9EYZvl4F
	BIKusA8v0FtM8HaMh8OeRJavwEczGb2+j/C8zkHiFL7f/QOtRUPyvnjx7W0lJyLTKWP6NfVI2gWUR
	PKvPNDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAdC-0000000H2Uk-2bJE;
	Thu, 04 Jun 2026 16:09:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAdA-0000000H2UY-45C2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:09:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EDF741AE7;
	Thu,  4 Jun 2026 16:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8266E1F00893;
	Thu,  4 Jun 2026 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780589356;
	bh=PAcF6jLXR/Jiy63rF57V9WH4vmzG0s4+DUKWIu7ddAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQFKtRa0F3W5n8yUwq9eYLegMY3TLZXmOg6/ur5niepgT+d5BSmkwJzIW92NAk+pc
	 cd0Re8I/XbJiZSeWL2S20BgsFCLuUmgYofPNz94YUM3lk42Fxc9AZu8rFxrV6qoWov
	 JmCvC0Oh3GSjvXdo+UY/1m+A/4dQF+GeX3VbCs4E2awLLo6RK+eG/LwupMohVw3HFd
	 jI5UTX8Aeb4+DAeFst3VZLULSC9Dq3gEIxPfR975D6NqUj4ZNxk1lpocz6vhto4LQQ
	 0xq9pBgKE0wF6CQrKn5gGABDcORfkXM8tpK/KDycDtoMTvjusfkg//tZf1WsUkJEv+
	 ayIQxBW4514aQ==
Date: Thu, 4 Jun 2026 17:09:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/5] arm64: Rename page table BSS section to
 .bss..pgtbl
Message-ID: <e2e03f66-2762-470b-94b6-31d27747dee9@sirena.org.uk>
References: <20260604151151.150377-7-ardb+git@google.com>
 <20260604151151.150377-8-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dKYHKI5I8N8LB/Xa"
Content-Disposition: inline
In-Reply-To: <20260604151151.150377-8-ardb+git@google.com>
X-Cookie: Q:	Are we not men?
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


--dKYHKI5I8N8LB/Xa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 05:11:53PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> Rename the .pgdir.bss section to .bss..pgtbl so that the compiler will
> notice the leading ".bss" and mark it as NOBITS by default (rather than
> PROGBITS, which would take up space in Image binary, forcing all of the
> preceding BSS to be emitted into the image as well). This supersedes the
> NOLOAD linker directive, which achieves the same thing, and can be
> therefore be dropped.
>=20
> Also, rename .pgdir to .pgtbl to be more generic, as page tables of
> various levels will reside here.

This addresses the boot failure, I'm still seeing KUnit failures due to
an unrelated bug that was fixed post -rc1 but we get into actually
trying to run KUnit tests which was the relevant thing:

Tested-by: Mark Brown <broonie@kernel.org>

--dKYHKI5I8N8LB/Xa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohoyYACgkQJNaLcl1U
h9Anlwf/bZDkgGksQzltW7Kg6UeXY6amML38SSQiXMuDxyKNnBgC74yAE5EZbJbV
u86KWtUM8jviS8nfbfhepUD6aeMfldoR/SvzW2sAlVR8AkEOZToVuv4AdSNRhMx3
FXQi0ow627BQ7IsqAoTvcIqlacIzt/oukJM88xaeEh9rVGlqqtDYxruDlJ/X1iz2
i8EYiwL6GcMdr6ezWCsFRTMY1GmbwahyFpKMi+8UyfWk9TIGTJhBEM0xa0oNvyss
NtlyhheGC21I+kz4Zpnur0gE+9LrMqzMAlItJRH1MBnPrnxn6ftzeokvkFZVmT8x
WbB2sxLVuN4L+q5WXgWjq9g6bY+G/w==
=L2NZ
-----END PGP SIGNATURE-----

--dKYHKI5I8N8LB/Xa--

