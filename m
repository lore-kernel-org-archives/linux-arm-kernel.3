Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E05CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne5NblxnXMQF8yPQxOSuFHig/XO1ZCxwk3uYECriioU=; b=1wItz/B35dQCpBNuNLmtRJ1slr
	fJxsgLIIW3EcCqbWYqayWf92Xz06S2pwIMdo7WjxtSHQXMBByOkS0w7rE2DeQmDp6GvLwDxKh3Bgc
	2ugw53QqceTdxYV3IncxZyv8HCTloYRqVhq5oDABE6q/rs8mYDqI02Dd/uBp7pa1VmEV1NUb0ed6K
	OdlzcpuDhSvDgk1Q5JB35GJDMFgT7lX42hW6PMJ4DK3j+8MFJIFDctrYy6DoKRReFM8OXiJg2PEwM
	/wPyvZ9bbkFxlXqJrm9pc78GM2zaK1WQqkIrgyStB/OHQTdW+g8x2QiKbpI8ecO+DOkCoR7Vt8FHH
	mWqRma/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeGS-000000064N5-10l8;
	Thu, 28 May 2026 17:11:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeGM-000000064LG-120B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9049140A8E;
	Thu, 28 May 2026 17:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0871F00A3A;
	Thu, 28 May 2026 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988277;
	bh=ne5NblxnXMQF8yPQxOSuFHig/XO1ZCxwk3uYECriioU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b/FC5NrdWC9MLl/ASS2+MzfpKvX1AqwxI3c5dpfglMleMzAv/TXM1dAj75EWMdR5R
	 Qvp+Um/0Jew3XNaVRU1dUHtm8ZuRqNXN0BY7McgL3Ib83/HoOwR8Ti9QFJ6gy0r4Ki
	 iI9gGaOOPISdMTgXipgfWWuzrqxhpkA1slv7uWiR37kVgq8xc1pTacgm7Lw/oScKmE
	 2HLxgt3MHOxYALOk87hn6wSGExp18CSf4J2A38/sZP8Au46Nkw3saE/0puK/1z6ArA
	 HwCqp01dDW2gJw/oVe8Aq2RzCxu2RMnbLOULCfIYyzEO8elkUA5xxi8deVYguGRM58
	 uoYqGFNQ+OLGg==
Date: Thu, 28 May 2026 18:11:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, vladimir.murzin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2 10/18] arm64: sysreg: Add FPCR and FPSR
Message-ID: <aada8195-de39-485a-94bc-648afbfb4931@sirena.org.uk>
References: <20260528165446.701944-1-mark.rutland@arm.com>
 <20260528165446.701944-11-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yRfI9XPzratqbfwV"
Content-Disposition: inline
In-Reply-To: <20260528165446.701944-11-mark.rutland@arm.com>
X-Cookie: Someone is speaking well of you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_101118_307999_9EBF9936 
X-CRM114-Status: GOOD (  11.60  )
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


--yRfI9XPzratqbfwV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 05:54:38PM +0100, Mark Rutland wrote:
> Add sysreg definitions for FPCR and FPSR.
>=20
> Some versions of LLVM will refuse to assemble accesses to FPCR and FPSR
> unless the "fp" arch extension is enabled, which we don't currently do
> for read_sysreg() and write_sysreg(). In general, handling feature
> dependencies would complicate read_sysreg() and write_sysreg(), and it's
> simpler to use read_sysreg_s() and write_sysreg_s() instead, requiring
> sysreg definitions.

> The values used can be found in ARM ARM issue M.b:

>   https://developer.arm.com/documentation/ddi0487/mb/

> ... in sections:

> * C5.2.8 ("FPCR, Floating-point Control Register")
> * C5.2.10 ("FPSR, Floating-point Status Register")

Reviewed-by: Mark Brown <broonie@kernel.org>

Cross checked against DDI0601 2026-03.

--yRfI9XPzratqbfwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYdzAACgkQJNaLcl1U
h9COEQf/eRwk0q4UjwVJrb1mp6Y3QxTFbvULmcWoihp8EiU7fDNRCgGYHyUEVnYg
lrBErvxKaWGQwTAYuG/BDno22J3KN3dI4UKxa/j6A1zfWNl22oFzI9vwFQN4h6J6
472Bh8hanustZc2osrYnFRW15IGKWjoWbjfmPp5vnm688hI4XHxssT0sSC7W1SIw
TaL0CQziQ9xMyYH2CoGIbMfVvY15srg8qaLLxGi87Qc3sztbZnV44/FCn2P+cjTe
w9rVY09/7nJumbTWAVzgfTzSeeOmwrn7LFYya3GZ0TpWvfoxZ3zQCD8gwLHJyM8p
lnEQdiTJknn3wKzoSLU9iG7kKUW/cQ==
=Pbbn
-----END PGP SIGNATURE-----

--yRfI9XPzratqbfwV--

