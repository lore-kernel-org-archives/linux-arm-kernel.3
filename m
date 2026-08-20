Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odJWFvSgn+KXHaxCW8IvbQmBY3gj6jGkAqHSJNkE3wU=; b=AcJYtabZE1ztd1rpv7YM993N+a
	LiRHJ5ZzMulI2PDF4EQHQBzH8I8sdr3zNgbD70ocOcC6a4Kmd38bQvFIinVx+dvEDN5/eVoNZ/GXq
	lGAYL7Y39B09HN3szXqUD6HXO3DR784kmxN5WRblomMcxGpsFI8G7v9vp7DBxL+wtwd2HpEecEicf
	2shLiXk6Lgnbsf2qO70meyL/bvJhafBpL+d6XK3G5uAjyUt7Lr6GN3wwHT+cJWjj7P/visUZZTqJd
	/gtsoa6CANgY+0S4hiR8kk2tk/8mQtrmHZsCBV4xV024+EzO/BelZrg9cbyC2jHqd6xh8NQl+j4yH
	12xevZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4vz-0000000Bq3e-0uWn;
	Thu, 20 Aug 2026 15:44:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4vy-0000000Bq3T-1k1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:44:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E69F60008;
	Thu, 20 Aug 2026 15:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE4C1F0155D;
	Thu, 20 Aug 2026 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787240640;
	bh=odJWFvSgn+KXHaxCW8IvbQmBY3gj6jGkAqHSJNkE3wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l11FHm9cCzy74FV08pM1SJv/nep8+oScM68U0SKAsjAPRfp55KzyZelt7TZxRGUrj
	 OQfrAkd4BXZmckHd0qUSzKmr9/DRseIZk7he1jNGb4i/3qQg4DuzASqZwwztebAn34
	 U/bnNigWCCzXFuqi4zCq3VnnZPHTP9jO2FNS3SA/m0swkmqJXwujFiWZGhPGuPiLBn
	 ZH/zC3FcSCFyXEFSn5j6p8vt1GvvlAvNRudaTUngUuwxDM9/yzS7BIIVmgI6s01l8n
	 G6bD4Uu334ghP3RsN12F/FBqocDiX23vHSV9EKN0Bt0fQE//j+fEoj8KX7YSQHaW3W
	 uRYfEoHcFXaOQ==
Date: Thu, 20 Aug 2026 16:43:55 +0100
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
Subject: Re: [PATCH 1/4] selftest/arm64: Print TAP header
Message-ID: <39de9ea6-6963-4373-a87d-3a39a45ba4ba@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-2-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Y3vnbzQu9pMdS1o"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-2-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.
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


--1Y3vnbzQu9pMdS1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 04:33:23PM +0100, Muhammad Usama Anjum wrote:
> The test sets a TAP plan and emits a result but does not print the TAP
> version header. Direct execution therefore starts with:
>=20
>   1..1
>=20
> instead of "TAP version 13", leaving the output malformed for TAP
> consumers.
>=20
> Print the kselftest header before the plan, matching the other arm64 MTE
> tests.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1Y3vnbzQu9pMdS1o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHILoACgkQJNaLcl1U
h9Dn6gf+OEjhg5b2xlq7bMYMtV4zEEjB542k3UTiZQkBj2wPob5Ge6LT8pG7JWhS
yWzw4oHCN5Jg4MQRKxcIwOx/38uTnT9WkZW4eg9701noOyRDE/1nBVB2hBdCEld6
ZglQGi3+qGtmcJqmh92BORnlLRjBmT2rjgmz6Ax2dmJLabBmGM/nxrjJmOoSLW0h
1RcXrBkd8GtkmrCJLoj8XogC+ijxyGX9JvSBRxFcy6s6pPtX1IjMw6voiIQAehj2
h8bxnko8Yf+k1wuBoKf3bf3VA87GqNpTfWeKa4XdnpxA+mFlTfDtUrLUzVABrXV8
x8YKVcbles8XJ6qO0vvxjXeoIqZM2g==
=frCq
-----END PGP SIGNATURE-----

--1Y3vnbzQu9pMdS1o--

