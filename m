Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D39D59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ17WqEILD7Kll+4ZeYXAHOwrO2QFpsk2DvYlmp301Q=; b=TVmQv2/IqY1ipIDlBB79D017xj
	jraEFyJUjNveNIiwPwsudtpQlTllMdrVVvkWbFBaNNmkIA1IvgQawTVuTwSwjhIXmwp6NAkXL39uN
	nkv5N2hz9GLnZOGrtuBHOpOEH44x4OMmCaiSlwRdKiLqf99q1HLDdEJAS6HiZATU9TauiGEE6m/jR
	kd4MO6AYBRJOL9L7CIaJwNEfMJh82VE0kfIKVSuZEJkuCZKfJ4MczxxdC1UY1OClsAIr+jIkbbJRG
	E7/vhgm9+RGy/fnHuZPEjKeOscYMcdy8hjLOukQm6f7LXjSxFuCd0nuUHzebgb5yYAlxOePSuAft2
	jyMBNzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jQv-000000047o0-3Thv;
	Wed, 06 Nov 2024 17:03:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jN7-0000000472i-1PHK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97946A4416B;
	Wed,  6 Nov 2024 16:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6B1C4CEC6;
	Wed,  6 Nov 2024 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730912348;
	bh=HZ17WqEILD7Kll+4ZeYXAHOwrO2QFpsk2DvYlmp301Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2TTy5Opov7sh+rDv8kdwfeF+lVtZhDpschWVtHswEfyoHRo4ZmqDwQieaR8x2n4H
	 CzH0q4frq8yORjmM25Sh5btewKpYgRKwuEQ3B26t2NutXK2psJ+bQ7v+Kx2j11arOd
	 E/6vEmbwX0e8kKus0g5saDOtYZ3wEwpGq78eFPXI+Aa/CebWBsW7/cvshFHNA2mMh0
	 dq9+Bu+ADSXgFgxLMRP/zWSVs2bJmFDoRNEanbWumfFT/651Z1Qa4XaikcUe8JdNJ9
	 pDXtOD6XhOFtKGwkh91drgB+yOHe+9frlq5ezKii2HNDCJ8PuoHRtBX0GTGjaXsD91
	 4jvkUJeg2MXFw==
Date: Wed, 6 Nov 2024 16:59:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, stable@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: Make SME depend on BROKEN for now
Message-ID: <adafab34-b63e-47a5-bdb1-3c00aa4e191e@sirena.org.uk>
References: <20241106164220.2789279-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozIHRFC2xGFdUTh8"
Content-Disposition: inline
In-Reply-To: <20241106164220.2789279-1-mark.rutland@arm.com>
X-Cookie: Include me out.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_085909_460836_42099E37 
X-CRM114-Status: GOOD (  16.80  )
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


--ozIHRFC2xGFdUTh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2024 at 04:42:20PM +0000, Mark Rutland wrote:

> Although support for SME was merged in v5.19, we've since uncovered a
> number of issues with the implementation, including issues which might
> corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
> patches to address some of these issues, ongoing review has highlighted
> additional functional problems, and more time is necessary to analyse
> and fix these.

It would be good to start landing some of those as well (and more of the
test improvements that are pending as well).

> For now, mark SME as BROKEN in the hope that we can fix things properly
> in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
> very little extant hardware, this should not adversely affect the vast
> majority of users.

It doesn't seem ideal to bounce on and off in stable, though as you say
there aren't really any practical systems at the minute and hopefully we
can revert this fairly soon.

--ozIHRFC2xGFdUTh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcroFcACgkQJNaLcl1U
h9D0gQf/aDpiO9OipacEeHevFDiPlRn8VswSIyhWS7wB6DmIXKG8c2kpuUjfAudz
at7bqcW1OIPNG28Ch51pyA9aFESqsXPI/m3cCJeba9k6CtwUFDJ/UPQk0DU4WQYD
H5GjsoKStlTJl4hjOr629IMWfR7ZGe6BjZh3S0iwwWRPu1IzUQdrDs9E+svsuN3s
2dJhzlKp29dZOCaSdZ9p2kOHlwmfTWDeB9o9dmSXV7yT1EaMIwpEe2ihQmwBqpAG
0ocAaSrH+KQuSUKeNxGU0m1s7fHxB0Hu39mavckaginH+Y0Qe0vJrgFi2N/NYrHs
ZKnwgCdaHHl07hQNcVLR1TDJkSj1/Q==
=7wit
-----END PGP SIGNATURE-----

--ozIHRFC2xGFdUTh8--

