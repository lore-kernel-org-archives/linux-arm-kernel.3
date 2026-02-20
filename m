Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A85C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaXRyQ+nfw0fuP69PhNRAluZJ/sPQG2jCzkgPfelTnQ=; b=1SjGbiTkCRlhtutW5kdVT2hHAS
	aKqRz5a2hfXDAHz1R4207WgLy+EAl395mQ4FPYuZXLsK4nvJ5oNf3EWCWlgV9oxQwIHmAgb9fmtl/
	iCq4NFcND0YAHYtKRR/YPxTxxk7JjmDx0Juli+PpYwDTDsX4QPxY77y2EW6tMIYk8XQjyrseYaYUu
	p+Jxj4tCgkXN6TBIiIr+47Eec2d+p7JLjrfPHoLeqBM0mOfCgVbf9nOvkvEz/zPY4/AGrWBzh7kzB
	+ovN2eLNp8UtOwNygoYw+/yDpBZ2QQ5jEDYzDc2oTduCJTh8NiD1R5C+JwkB5kb037aspBQ6O/Mtc
	xO/uXtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSYW-0000000F3Gf-1sLR;
	Fri, 20 Feb 2026 15:36:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSYV-0000000F3G4-09XR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 760586185C;
	Fri, 20 Feb 2026 15:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC05C19425;
	Fri, 20 Feb 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771601794;
	bh=uaXRyQ+nfw0fuP69PhNRAluZJ/sPQG2jCzkgPfelTnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hs+JJevjOchfCOhWZxu2I1PPToeQ4ku52TqSgNuYDfcls5XgxYlB08nTtJTl9l2SP
	 17fZsD8otb2eOPv4WOV5Ln3N5O+JjrCbsDDziMNi7QYRijEe6OG+jKFtCnPQgrFtRq
	 U67H6CwwjpL+w4jSrw95a4eyYeA2wZMWr9bG+K1skwwrpQX+k8bMP1HTuLcNtcafXJ
	 5Os0VgJY0Y8sohZIvdm6SWRFk9IGEg8B9BbTVAg1rJ3mhvsYFrBbGOeEN18W9UwH21
	 kM2EUnbxGIL6wHS6Om/+UANvDmwSo3jgc9naYps/xMEIZoKVQomZgLOUjFjom9i31e
	 nOD5yLXgaiQWA==
Date: Fri, 20 Feb 2026 15:36:29 +0000
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] arm64: gcs: Do not map the guarded control stack as
 THP
Message-ID: <500e3d38-2443-4ced-a2a5-f53155858288@sirena.org.uk>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-4-catalin.marinas@arm.com>
 <4b8449b3-2e99-4a22-b89e-f7fc917a83fd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZbyHsP7lN+x8iOHi"
Content-Disposition: inline
In-Reply-To: <4b8449b3-2e99-4a22-b89e-f7fc917a83fd@kernel.org>
X-Cookie: Booths for two or more.
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


--ZbyHsP7lN+x8iOHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 20, 2026 at 04:33:12PM +0100, David Hildenbrand (Arm) wrote:

> I'll note that madvise() would be able to turn THPs back on; I assume that's
> okay.

It's not a functional problem so if people want to do that it seems like
it's on them.

--ZbyHsP7lN+x8iOHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYf30ACgkQJNaLcl1U
h9DJOQf/bBSHws+qVzADmtqDh7w6i5tcIIkkDGu1yDDkYyY3EfaQeKEWtnvUnyIQ
W5grSs+Z8DJDTAk2c+W/9wEVJGGuQN7jDBsGYTGF4JglSJanR5P5vCaY50UV5pVy
ck9VO/M6TJSmRJssNCKbIjlvWo/lgMV28obL+9CifZO3ktZRBLRGJaOrY3/mpxU4
Ov7aouWYC1/sZSv2xQQPJZW5PRatWjqA4ma+KWwj19c7ia61g+mnIR6rNGIN596D
KL3DbEZ8BKDozRTPh4hDD6hoogvv5PscTgB7CqvtEEYUs0IGZ4eHjdNp8XuP3yjr
bHWVYQC9AwKpTZ560BJLrAza2xPvZg==
=SSVy
-----END PGP SIGNATURE-----

--ZbyHsP7lN+x8iOHi--

