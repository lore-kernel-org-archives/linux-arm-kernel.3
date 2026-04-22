Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C45FA1FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEJN6Fp5WBBUFYhWt0RYxU8no8HRwn0KnhiTxwY2j3k=; b=pyRQvEm6I9I0RTadoynOwy93te
	dml4R6bJjouU7Aa2qaOWW2oeFB3AG3HP+xG7NgK269jb1GlAyckDryml0g3goUUnZDC1FojvwjsW4
	3A5hK8laaYhfivt5essn8r1NXd8HjxYSoF9Hk8GJF9ubx7KOzoXAxdNiVBvK0EhJE1hfwjRzXSOaV
	AmFKNSnX92MoZvdrLVuDvuEM/+nXp0KrdptrAdPqucbLagvhwZJWuJvKxrC2qKCGM4z6filARTV5c
	wozMa9Mii94ft5nwZGL22v2RJ9S2PZiXoq7+5bB9Q9tOJdCKcstl7HXmUXvx8jSax+IOcIgx1T/V5
	CkcIYz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbj9-0000000Aaxo-0GLi;
	Wed, 22 Apr 2026 17:51:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbj7-0000000AaxZ-3RAP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0AA46057A;
	Wed, 22 Apr 2026 17:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F148AC19425;
	Wed, 22 Apr 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776880264;
	bh=KPvLrXE2/oUIc7/DGRST/uOw61jgaB21B6zfJODnfvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0gxB7GBgcmuNv2k5W7mvLRhUPeknwOcHhJ7vcUMwYyOAwhEzMlPUUdgqqKEAKf8N
	 plJ8OVHHWcqO1GleG/UwibiIldak2bSKxxAxwbJLZOSJXDOTK0ujQP3Qwd/8XnT3yA
	 JrpBzw2UUsrCMwaFOBMxN6fbmxpKDlH+tbFpVXLPJpISxuz61JOg3NP7BEnsDkvmUw
	 xr6F2v6PKHMAPsxtjfirmtwB7hn6vJakeYGRo8+++ZoQ9Rhi4M1lPQSq9ynhlqlXdj
	 fEmrqFEMzegKfYNLB/QVN4Qb62nNUOgAQtUtIef9ono1OQRpwltgmo2dCxusebfONM
	 PVDN3ioktc9uQ==
Date: Wed, 22 Apr 2026 18:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <bdec0293-e962-432e-9056-f21079707a4d@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXxGrSnyNAOe7ayE"
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
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


--KXxGrSnyNAOe7ayE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:

> For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.

> Fix this by including <asm/ptrace.h> to provide the proper definition.

> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -7,6 +7,7 @@
>  #define GCS_UTIL_H
> =20
>  #include <stdbool.h>
> +#include <asm/ptrace.h>
> =20
>  #ifndef __NR_map_shadow_stack
>  #define __NR_map_shadow_stack 453

Reviewed-by: Mark Brown <broonie@kernel.org>

--KXxGrSnyNAOe7ayE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnpCoMACgkQJNaLcl1U
h9A52wf9FOb2X61sAKZFg0tLjl5OvSTmH8kEuCqQRMnPND+u2vn+CKXzQ5pK8x9e
TSdPkU3ttff8u5Rifl1nk7RKEotMP7APZv0h7JiP9+Qd/mfWaJXYlP9XBgtyHUdn
KCLU0uMCzGlRtmXdLVTqTB6K2ov8/3W89yKCdFITnrq8KXfLGJRO1mA8fqkSs8cP
snGks4TIezZkA/9yTuL5DIIf+xYH1ip7nR+FMO20SVcwLdJytIYVgqC7lnG5L5kr
GSCN6E7oIBmck2ja63nvFkqUq7kbCjDexlObJ5kiOnVM+NpdXkHgACuO5Uiom87H
p3cJ+0uKaqvgmKYFycqXl4hXixcMsw==
=z8AI
-----END PGP SIGNATURE-----

--KXxGrSnyNAOe7ayE--

