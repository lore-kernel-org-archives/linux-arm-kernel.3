Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19899C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IardE9mwTMTgNgf71nb7nB6u9W+250RspRf5bHw4Yv0=; b=ldz6g6H8dhJSitI1/YiJa9bqAV
	ysjG48f+AF4KrR3160W5S61QftlKyLdmGUaqYvYcu5soTKDpPiVy9qS0uS9/V+GRf91oLrRUs+ViI
	1pkYZdOGaDgGuORdFANGHxFhQ5qcHJCY1eMmCm11MnvON2jD+wtqptrs4VfYW7wfRQKNMy2z77T3P
	9qIZGnXRHhAwUD1o70jMtuvZp9Z/LdQmSNsbN7YohkD/N8rqTHgGF18kfUFhS70MewBjoE6566NdW
	EyhXNhjH6BFWj49mCwIUd1OXZZXhtjlJwnhHvyJ5L/kIQUEFkrGP7LuInQKyakm2nLsbMvjJiu7mT
	Aq5nizyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ldu-00000008AHY-37pI;
	Wed, 23 Sep 2026 12:00:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ldt-00000008AHQ-1G9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12F124165D;
	Wed, 23 Sep 2026 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B299B1F000FF;
	Wed, 23 Sep 2026 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164804;
	bh=IardE9mwTMTgNgf71nb7nB6u9W+250RspRf5bHw4Yv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jbe4/N+a414ufitw6R7WJKMNaOyEGFvwEYUM5QNWgcRccrbow9rAmiIxcHBz3Apnj
	 Q/0/bl16q5Ipl/ntYMweZW2ADvs29vrE94M0Bjc+Gb93v0vMt0mLp41+Tza5Gwxe8W
	 bqb4f66yqdRZYd4ETNohR1bMYKXhqA+j5Hi6z1kn8Os9pTaoxTD7xBhuhQ5/gq/cGe
	 AYNOjpQRRuWsuWaMyLYOgmb8leXZG5iKKXWO5jLFf5c0cof/q3aR/koyMNN01Va5ff
	 /dzRO1F9wA2w5LH0gRPGki82iYQNaKUU5N5G645lRlrgd8GMBWQ/dS8iwgptSShAtE
	 iPnUDLY3S1scQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 189721AC5739; Wed, 23 Sep 2026 12:59:59 +0100 (BST)
Date: Wed, 23 Sep 2026 13:59:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
Message-ID: <arO_P5imHln19iV-@sirena.co.uk>
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUqdv2tH/WyvS8Pm"
Content-Disposition: inline
In-Reply-To: <20260923041926.425551-2-cwweng.linux@gmail.com>
X-Cookie: Too clever is dumb.
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


--sUqdv2tH/WyvS8Pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:19:25PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> Add a Devicetree binding for the SPI controller found in the
> Nuvoton MA35D1 SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--sUqdv2tH/WyvS8Pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzvz4ACgkQJNaLcl1U
h9Dz1gf+NYCOhOIpeWAVJRB3QbcSmYNASO/6KLefUI3xl8grpvex8RMm/fte8r0i
7CmPqopVussH3GKXPFZKYebJtOFCNMyKaMf71hFgoRi+HqRnWtYLvsepk6amqgZN
mQXHo75rJbduC8/3Fhd3MZJBwZHDt51qlqRlh1OKHvEIvaVgcEMkFaGqEq1ehEPA
RKE377KGTvEC2ksHXE/GIt6ewtKVjy7kvALLNogL4l5j/CewNIq4J7nifbjz3Z2t
A5pyOcQVq4PvzbJB7qDR8TTezPlDwm7nFlCmEgwpCyvy6Mdi/2HFT0l/oXW2hHsi
hUVqrqk4mqri4Lxcn07S3DIrcN+NQQ==
=tlAB
-----END PGP SIGNATURE-----

--sUqdv2tH/WyvS8Pm--

