Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12AFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3ykSlCT5tj5/TnkTVOTV8IqCcc/Vc8+/vK64ZNmSl8=; b=SdsmORyEIBIiVtW5V8PzWsmDKe
	KtBQ0GL3obNCNuv9YY6PiH3HnyYKz6/0emF37X6OWPRlZa2SrwKcT9LQG3glcCbrS1lHqRyVpcP9p
	WasDDIvN4UerwZf9qTYm+NataZTiuBFExdwNoZVrPtIghwO2jAWjxXyuTLrjJpBtI81oilNfAP5LM
	BPPHCcqCKgH7mYi3E/2ExMk8L5waklbskH2fhvfNWox51pXhQGZdr23bxXO+EQdp85NtihMFaLVeD
	2n2U9qGS0NtVwZCmZ6laK3aGP1TdXfAThMIRHuVL1OeA9o7KZK172pRhAKy4rRkrrf+Us0epxZgOl
	IabP7zMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFF7-00000004LKl-361y;
	Thu, 30 Apr 2026 00:27:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFF5-00000004LKP-39w7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 00:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8961B4439A;
	Thu, 30 Apr 2026 00:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43105C2BCB3;
	Thu, 30 Apr 2026 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777508818;
	bh=CO/0+jLzo0Lhv7wr/PvzYvvNfI5bRrqQLHvDPFKSj8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkFfceaB8vuPalqSPNkELNNHm0YeJ1mLvYdAqud+XEcJ/t8twlwaWwooo1TtWo6az
	 1GLu/LRkVJHWd1M3BCXt5TnTLwyeapCzXP/H9Ck/E4i1+XtZGAkj6SF+WMUsFvw7K9
	 UZ/F2FlRwVIeej0FO9TzbyaGqEXdfX0xRTny4TBNxKyn5PKeExWxU+QGf+sH3MRx3m
	 LjaxU8SF7WgYTQYcdm38KjzV52c3kbrcnePTAYxpCii/caftMMEaRYa2gwFpHiISln
	 b4og/j45iXHnOliLHI4JWXgP5BRuGoLgx9ndNbAOngveVuSX+Bjzap2iwBAgJ3cLwi
	 V3B4SygL3FLWA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A25281AC585B; Thu, 30 Apr 2026 01:26:55 +0100 (BST)
Date: Thu, 30 Apr 2026 09:26:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs
 definition
Message-ID: <afKhz892PmLHrv5_@sirena.co.uk>
References: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OmBvADEWYAWPzpCG"
Content-Disposition: inline
In-Reply-To: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
X-Cookie: 667:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_172659_815678_9BF373A4 
X-CRM114-Status: GOOD (  11.28  )
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


--OmBvADEWYAWPzpCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 03:30:10PM +0100, Leo Yan wrote:
> kselftest includes kernel uAPI headers with option:
>=20
>   -isystem $(top_srcdir)/usr/include
>=20
> Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
> user_gcs from the uAPI headers, and remove the redundant
> definition in gcs-util.h.

Reviewed-by: Mark Brown <broonie@kernel.org>

--OmBvADEWYAWPzpCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnyoc4ACgkQJNaLcl1U
h9C9GQf+NOhc5i1MwWxubDh2bdGL/RXXFzMh7TOJbjJsabRAQ1+QhaCCgYGZA8Kn
Z6XvUoggWPub7Oyv4WgJYIgnv4N075s5ps8Y02WQy/LET7xJojMtFOMAsK5QCNyu
vq4uJWmrJ3e4zISnCpnc5Irjphii1ocaYeK05/QeQ1wXulHS6UiGzIQmPfYYc1ZC
SZxUD4ZDDO8itTFkDlfJr99MrdRUMhhAr0zCQGdllvpG/sLMJiHWz81E1WlGviSe
wY551AARf+cuELiGA8qDMmv9pKakxUCERrr70UVpj9frqbV2h89psWngR6D6ddVs
hBq5huCfeRvdVzUOsK8uAMqcvgZcOA==
=HLqY
-----END PGP SIGNATURE-----

--OmBvADEWYAWPzpCG--

