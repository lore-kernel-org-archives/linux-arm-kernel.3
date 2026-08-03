Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBAAC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwxqF12EdtFJ1hgKVE6whS2NwIy/fDvPhGCr1gt49gs=; b=uZIXKvJQfBQFGEH22OrmOxz5tF
	n5V/Xgj6CQhEicFkrjEm9J/OUmvavStBlYxLm0kFpgk54zbCs3Qv15L9ClUI/CXb2HqDOOQYB+7AC
	IwxwYEfdTl3mqCSBrk2YaSR7a/Bk5oQuh5sSsdEV4NSamJztSxwHmrRW0PK3FFBJHphCuXXmKLacg
	Rb5W4uKVrDtZKZenLgbq9zyYQlObV6NRwwdNVh7gf64X3zmRFmO9GnoVv1JCfWFsDPiQxfAVsUwG0
	2YNuBLLgY8ckrvp4ramvLpSKIUayIB/BWnJrXWlUx3HM7Xmvq0UioHvgU0vxx5+1cr0nXFdxz8va4
	mCGWyTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsgm-0000000H9t5-1MBw;
	Mon, 03 Aug 2026 13:26:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsgl-0000000H9so-0JtD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:26:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E6B960AA3;
	Mon,  3 Aug 2026 13:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7FB1F000E9;
	Mon,  3 Aug 2026 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785763601;
	bh=rwxqF12EdtFJ1hgKVE6whS2NwIy/fDvPhGCr1gt49gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KkQ1Qzs36sE4gOoPHlllE0w4+vJcEBreSC5U279VHES97zsTmWS8S3fAotOTfZtCR
	 1HslMw2C+3asb5utyAwdwq0J7zeJBvvITVuAYgQyIKWiy1AtzzBEOL1dFXSLETDHLx
	 L5ou0/JMDAbZ7aYIr/lMXxTqrUqOx2mP3Wb44TCgmmI9VXxbgx2oHbP4r3rKgd1sW5
	 NC2b7YU9gV+cr6QGtF6aMe6IIpPKOKn6DvmtZZCKJLyhFEJWH6QviCfNMY8AxMbP2g
	 YZIQ6TQec7oUXSvjxsdnC6mrThyi3GltC/YjuBSU6haBk3a6/aZZERwief4g2PRsTR
	 3MR1twifq00ug==
Date: Mon, 3 Aug 2026 14:26:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO
 chip selects
Message-ID: <060af0c2-c3bf-45d4-9f73-8f761fe1d88c@sirena.org.uk>
References: <20260803024048.1641756-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SnYGXlnakQ0g76Up"
Content-Disposition: inline
In-Reply-To: <20260803024048.1641756-1-cwweng.linux@gmail.com>
X-Cookie: Natural laws have no pity.
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


--SnYGXlnakQ0g76Up
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2026 at 10:40:48AM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> The generic SPI controller binding allows GPIO-based chip selects, but
> the MA35D1 QSPI driver currently supports only the controller's native
> chip selects.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--SnYGXlnakQ0g76Up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwlwwACgkQJNaLcl1U
h9Ay0Qf+PpX3MDUJS5bXRe5CiOhf9NSZgwwEgG6RR35x6m67C42l32HNHAk9gMzB
RbVVXLQZnA4Oqa7VOQ49FKHRQHDQ40OAkHEG6Jy2LUu7aqm5TSlExqMsYd+BCcR/
vGFgpbqKO4mfUgOTqGsajAvH2ADC0ySXU+l83QkCwb6h+zBJ9cmmZF1kwbcBI07y
rS6zMg96apTi8qmMY+jGj4mLndk2Nwmw9Xwa5qWkRLKTb4/4esir7+Ln9qAzcgJK
oQZiGccEiEmvBMzOypgPpnZuDod/pNfcWWJcnMTyTgqvlMisP0Y8hW3doGCe6cCM
Po4S35plWtE7bDNzNDLmzkFzlCvOUQ==
=2Bqe
-----END PGP SIGNATURE-----

--SnYGXlnakQ0g76Up--

