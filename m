Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDD1FA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/Ny6JhGi6zeECQ/2cOlUtsGqQyNjZtaIiZMAq3KW6E=; b=wrYPoC0AV2UrZvH7VOCu1xrfYI
	943AaKSyEkwBg8w29Qwky3vM27YFdh+CPgthA7pdIcVY5ssgC5nDP124dob7CDzfxBFwPSEKq6M09
	JfRTiOe+TGFGO2Ft4O9G5TYrPHyFMy+pW1gAitZw3vWd8Uzg4zm6xiikDzRnFNBASO8oGAhmqZThs
	Y5wquIsiqK8yuhCteoAJOeOYQP5RtbR6Kc0oZq1mnISnGefmLoGob81kBBoZl9zQjJJ+OgObsRiFA
	uGvi5ViLF45Uh9+fIS6ptOCRLDVfp3kmlYDQSvJvg2io5CtFTukZjVzIHlj9Bo9gUNxEXwPyXyUXP
	3uEvHqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbFP-0000000AZUY-4BMg;
	Wed, 22 Apr 2026 17:20:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbFO-0000000AZUS-0xgM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56F7860132;
	Wed, 22 Apr 2026 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8EFC2BCB2;
	Wed, 22 Apr 2026 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776878421;
	bh=D4358O16wmyLgUeamrhlg2RP4x61t3u/UfesRcKy8I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAF+IVScTCD3pTNviz1AJIPRlteZadkFjuj1vBekRnD/dzDwUNfJcVAN9Bau4ggp/
	 KjOGvjYRsDeNRSlX4hb6L6xdquiN6wQIYAFiwlPGmcNiTvnmWA05RWwxlx9vNVcghR
	 /eb+Rsp6p8IMfXYCxenZVPlnD6yCD8y3x6B8E4b/WUJzDKhOiqL+s8QkFYcgU5yHzF
	 6YLnxv5QakItDAp8iSBgKO+0nE9dSihXPQsYc0HMvhw04DJbBpS1jNNxR2weaoU9zZ
	 CecvxqC1223RJj2E9bsIoC0IGMdkXXWizB7G7ibTcpjb4mtBuAdq48npD5dcRgUdU5
	 FH+qQDWTc6p3w==
Date: Wed, 22 Apr 2026 18:20:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NH2ONQh63iws1FPL"
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
X-Cookie: I'm definitely not in Omaha!
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


--NH2ONQh63iws1FPL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 06:01:39PM +0100, Leo Yan wrote:
> Building on Debian sid with GCC 15 fails:

> GCC-15 defines NT_ARM_GCS in the toolchain headers, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.

Are you sure it's GCC and not libc?  Anyway...

>  tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing=
/selftests/arm64/gcs/libc-gcs.c
> index 17b2fabfec386e523e788d8bcfcafa553c93bd9b..72e82bfbecc99e34da71d56cf=
5401c137d6e9a48 100644
> --- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
> +++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
> @@ -16,6 +16,7 @@
> =20
>  #include <asm/hwcap.h>
>  #include <asm/mman.h>
> +#include <asm/ptrace.h>

Shouldn't this be in gcs-util.h where the local definition is?

--NH2ONQh63iws1FPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnpA08ACgkQJNaLcl1U
h9AfMwf+LeHbYFk3XVNgKZhX1fgnIL1di317+6P71Duwc1yNNAL9TlLKpirWPaVc
gIwXDO4vXZL7f5SPwFvX/8RedM+oX2gxbDgrvfWr2eLpff8+idR1B6nC9B5bdH9s
0rEG3VFJf+gkIPgE7XOUuxkjJWCPALtT5FSdkkQ37kZ1q6+d5yfbzRz+Wt23qu0e
lTXDVWd9Bzy3aQaDqFg/F1IS4d5jacaAmucqBU+YwYfi1Bmpf5d3aDz0BCoy6Lii
WHzHzizXro0hqwrcb3wF5Y7Jd5Rwq1d4ElZP9+hlsvs/8JeahxbiMHmLusOHkIrP
sL+ElLbJB7EDhZu8RZb8LBqji1E4cg==
=OiBd
-----END PGP SIGNATURE-----

--NH2ONQh63iws1FPL--

