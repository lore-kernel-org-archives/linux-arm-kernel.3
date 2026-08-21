Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7304C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quCDSpU6BUwBXwCDVKaB8dpg8Fz9dYPX75IFlT5fHZQ=; b=tnP0V+Pt7BPdxgNFiYODDjnNT9
	ibWyJnemnqZEs+6Z1GEW78Aqvu9QfGl+CvAZniL2AAehc9BZ59b7iEz0ZURFsK3fyzHO2R9G2XNvg
	v+dRJsDcMQhROJgxHVpHpwR+lvvxhUBwU1/E5Y1Mt7ouwuLVtqBN7Wrv2hYboL7/ztEd+e4F+X3DG
	Ry7ckmW0gmSGLj47dQosQkevP9TIbqY5dXD7xj3NMJv6LHk4gaFg+89ZDZ9Dc1OWzwcEfbRnrXm9H
	jka48EgLisYydbgRReUsBGyGhAaBvvmJb2Q4Wdk1RbTQ+woFJF4Zmnz9vli3VX0H0iEI4R4Fgc5Ul
	g2eZckkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRmn-0000000Dkf8-1YTa;
	Fri, 21 Aug 2026 16:08:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRmm-0000000Dker-1qNO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:08:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B8E9600E2;
	Fri, 21 Aug 2026 16:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D851F000E9;
	Fri, 21 Aug 2026 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787328483;
	bh=quCDSpU6BUwBXwCDVKaB8dpg8Fz9dYPX75IFlT5fHZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VoRsmmw7Qyq8ye80DdDzNVQWPev2x6gZhwCwmujCXOLMOk6XK67XTqMb3vHNGE0yy
	 fMQ4obri3qndrvzJDfZqlxubSoUwwd91U08FYVE/7hy1XMuUum4WivvVXk1JQp1bIk
	 V7+V0+UjCBDD6i99FLk4pqBAX0ZrNgwZcofRBlAu38TFhvVsS3Hcw/lBScave0XNGX
	 7f++itfKpoc2vbapYG6HXdFu+eAW952R7xAJonEvPsn+dcFyXmZ7fWSzaFv9UYuwrp
	 n+DlcHaPoIXL2GtotjzL0Bk6aYUWAdalHFZYlrKmGJom32z0AgZlYGC046tUYh9jnM
	 Shuv5XOlNphWg==
Date: Fri, 21 Aug 2026 17:07:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] selftests/arm64: Add MTE test config fragment
Message-ID: <7304e0e2-70a7-4953-93b1-dcf73b879a86@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-6-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6R45SNmXiGQnf5lN"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-6-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.
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


--6R45SNmXiGQnf5lN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 03:15:53PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by these tests.
>=20
> Add a fragment covering all tests in arm64.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6R45SNmXiGQnf5lN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqId90ACgkQJNaLcl1U
h9Dcmgf/QyTxw+YDeMZ55aWJgzR6bZ5u7TsuxAsv3Sg0nrV6C75YitWwJRgx7yVP
RJ+8u2KmnwIKAavwNmziiyhVYMT6ysITLZo9fdoQF70xy3mVD+wQ/lBDcl7PCPS+
Krc3IE1IvKRKSXv7OsLZ8hXQbgQeGBGtJa4EFKoQIr+yqPIVUIqoahBsbMNQHapm
FM3t0c6QErfbXjEJBuMxQoHNRLiJxn2ANMpa8S0UZCQ6vmsbeMPLY0R79eevpvca
DPEwy7IeDexNeXsHiW54C4dwPg548kQtO+sl4DvGy6v9ih9it5t4z70roj0Jf/ew
nmg9/INV62xV0Ke1oKGo2mlUZ/nUYw==
=TwVb
-----END PGP SIGNATURE-----

--6R45SNmXiGQnf5lN--

