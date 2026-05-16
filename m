Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E825DCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOEl5xXvJOtKixpf5iEnZM4m30+I4WRFWzEoTJgtBlA=; b=bynGFj6j54rQTR2zx9xjodRTo+
	JsgGlbBs1ju2fbTlBy1AF321KgHyVXqzznR96Q1P70mJGPoGBHfDc9CwBnFtbmOVKWMeVRFa4DEUd
	IDtkvFki++si8MsdwHXseAuYozepuASfDNbxX0T8H2bb9na3DimOltgJkLrqn+z35f5K/fIrvWcSB
	GVNnsHd3YmY1BoSRq0LOAHElrifju2o4IijgdLRmf1HAQKYopRm+tvbJoo9HrF4ZbRBG/SoKQphUd
	nQqxe4rGiOhYnNOfZcnmQuarT1GvFqlljt2HHnPSiiRjMABgmHw1Zwq2wTtZX+tWMGA/iKr9gmbBL
	BByHdZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8dd-0000000AHZl-1kyY;
	Sat, 16 May 2026 06:36:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8db-0000000AHZZ-3fZP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 06:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF5F860138;
	Sat, 16 May 2026 06:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5023BC19425;
	Sat, 16 May 2026 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778913398;
	bh=wj3pvJUXnApN9duS4ENA6UUuY+zxbbcfEjF+pPbJNq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PR6K8Jo7kQyk4nm/tJBIcb+sod/FCvmuK/WpuaxIJN6Pna+qZ8sTNkxBOuYgcp+jz
	 j8vv0D0T8fG9SznD3FVM7msFz9n4Nq64CTmzLIv0aI83qTm0du5opM8ifkMsKG31ge
	 X8cRBFtSWEp2wk21xLed0CeRTXz2OkAwNfM0XIWIQyggOUKj8+/REoE1khynnM6wxf
	 TMgLZ0Bp3m/Y7yndl+ifFr+/PMxxXlXuXLDbp7iqjmN+GpdI+3vZ8ACMm6ueaYsefv
	 BY5K6cwbK3s4QuZFCJuu0GRcut/P5srokXf4HrYXF9JugcIYe/MXqVCBSqEEt0iFLw
	 GWrt1Hg/KlO7g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 01C031AC5A48; Sat, 16 May 2026 07:36:34 +0100 (BST)
Date: Sat, 16 May 2026 15:36:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu.pirea@microchip.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Wenyou Yang <wenyou.yang@atmel.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] spi: atmel: two fixes
Message-ID: <aggQctV06BI6Sobw@sirena.co.uk>
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
 <agfXl-FiZ-PN_cGT@sirena.co.uk>
 <CAN4SLj3H3Sc_N42KnYMzgpe8LcFE-6EHeNxnBY2o35jP74_BkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZzu6U2uZ2p9oVsc"
Content-Disposition: inline
In-Reply-To: <CAN4SLj3H3Sc_N42KnYMzgpe8LcFE-6EHeNxnBY2o35jP74_BkQ@mail.gmail.com>
X-Cookie: Truckers welcome.
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


--fZzu6U2uZ2p9oVsc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 12:41:56PM +0800, Felix Gu wrote:

> The two commits are already based on Johan=E2=80=99s fixes:
> commit ebf99aebc458391893c598f1caddd42bfcc97fc5
> Author: Johan Hovold johan@kernel.org
> Date: Wed Apr 29 11:13:16 2026 +0200
> spi: atmel: switch to managed controller allocation
>=20
> There should not be any conflicts.

Those are on my for-7.2 branch, we're currently in v7.1-rcN...  I guess
it's probably not urgent either way.

--fZzu6U2uZ2p9oVsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoIEHIACgkQJNaLcl1U
h9C60gf+NE7mLfYR56Bap6PoYwJj4+q/vXyZotuV8Ir17kP//GySWSh4yCqoJMWf
XgovPBxdODLmX6xWZBqyMhmLwrLvKNfu+Mipw9FtdRlwP7abOlJcKn4dslJs033x
noLnCFz+sAPm8/B43xcgg+ahqhvS7rELeqbEGSD0FXqaGWdkZkVqBOaZFn0rXqnn
vq9tex4y4UzdCAvrtg/7GTJzgcgYO8alyO1NDRI6TWRJ31gydfCsOdegmFwsgSVx
8ny+NhM+EDimsOjEIzIEF0X3/cgxJ8NpNp1wzy1QDbo6hm4ukxow6283a/O+wjHM
vpkf0B/AjDnHHLzUJWEEF0G+WVOHGQ==
=kr9H
-----END PGP SIGNATURE-----

--fZzu6U2uZ2p9oVsc--

