Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0E8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MpDAPW+ItdLitP9FsZLiKMmMSZR21m3qy431x/Ag3Q=; b=dgpGgotGeJzOgSBHPnKmzmgFLL
	vOMSyyI3e7OGisz0qrJhmJfPzsQWIORijZMzCzcOJpqljA12ezw4KTI3bfo8QUf7b6frRpZmSQJeN
	MmKgjJtyiOCSutB3+MxVKF0oykkVHwxjUlEuLA7EVsQ/2FRsj3mq6hdYSabX8HfSzRK0cAjz6ueBV
	NLX0F7alS1WcVBNUMP4cLOg8Kk//PlWKm8qcBboCt4t9xMbbIE/0dAF5VxxE4bdLljFguL/TX5jYk
	5bWZmOf4CGHVrEsTsXe3fwaqAEKXge+KjpsiTEZbReoan3EvMNs+Pp6GrdeWTq+Nv7ljsZVeDPNco
	Omau/qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCkz-00000001r7N-1Hl3;
	Fri, 08 Aug 2025 02:22:57 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCiS-00000001qu2-3MBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 02:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754619616;
	bh=3MpDAPW+ItdLitP9FsZLiKMmMSZR21m3qy431x/Ag3Q=;
	h=Date:From:To:Cc:Subject:From;
	b=nBMomf/n8dCykj5bhrvdZNgCip3J9t/KLK5/qPerOZ7B2pEm3mvqHJ3/tNA9S2pnH
	 esYBkHRb+bm6ihBj99q8I46nzOZnWFV1RBhSyMeMsGMjmzqYkEgG8r+B/QQ/66r65F
	 x5ALqJaPXm7eAWn0msZCRIg7PmDVeX6F6aj7VorPUM/uu1vMJWDweEI+tHLkj1PYMZ
	 Do+EPZN5ahQrXcF4dEMzDge1lQxyVGq4KWizZ9kcV+bQ3iOgpe9AWvwEJU5ahhdzdW
	 f3FJkEBuoZB3+/SUp+wtRU5SY1dHy2jsOlI89ul80a5Fyc6voERDGP/Q3DlIl4yOh2
	 XEk1b6U26Mvjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bynmw1wcQz4wbd;
	Fri,  8 Aug 2025 12:20:16 +1000 (AEST)
Date: Fri, 8 Aug 2025 12:20:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 arm-soc-fixes tree
Message-ID: <20250808122015.5bcf9b74@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rVsEOeK/njgez5tiE7gNRxS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_192021_191475_367D998D 
X-CRM114-Status: GOOD (  15.25  )
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

--Sig_/rVsEOeK/njgez5tiE7gNRxS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  arch/arm/mach-s3c/gpio-samsung.c

between commit:

  3dca3d51b933 ("ARM: s3c/gpio: complete the conversion to new GPIO value s=
etters")

from the arm-soc-fixes tree and commit:

  d9d87d90cc0b ("treewide: rename GPIO set callbacks back to their original=
 names")

from the gpio-brgl tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rVsEOeK/njgez5tiE7gNRxS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVXt8ACgkQAVBC80lX
0GySgwf/XD43Ih/TYW5mB1ihS0o7jrkJsFUtW526JtlAkBM2iLTeOxZZZLgyGGS+
35Kr/MZKfqNL6pTVc3D7wrac5z9XAME6KoDmQGKsHg651hSJt//IrpP4/9V4q5T1
QuqZouVsCWOVp3UqwDuk/VSOoCwHKZ1rqLn33m8R2bY2gNZ1zUMm2MzHFiAgaZpD
f+toMyGbyc8AerK/9+7v0kz0IoRKpR8eooTPJ+onn/V0NU6A3ohDWV3H7qAZ2d9G
n2apuet+5V/MA6Dlv1YMwpPzrIKirImjMnXE5U1U0/Vpqo6YgUfnGuC0AXXc0Bdj
ENLCnnf+UXLX5ufPZs1be3lrByxTqw==
=sLib
-----END PGP SIGNATURE-----

--Sig_/rVsEOeK/njgez5tiE7gNRxS--

