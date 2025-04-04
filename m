Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fmVXnOG0ETpJPqL4RDiC+7Ib6o7Jxdi2A4vq8OSqsA=; b=0Bcn0098MDVpKztHPQOMiPdCKD
	pNinreERNtu8C07NVkZDrFNM2OmTn4TIsWlRST4TTyYzEzetyLaQz3bA7t2Y/mwmEH9TfehVpSRGu
	F4O43FHPWAHkfvLXUh+a47Wy2JKloNeUEjR5iODrfpe+oI4ubcKdveWrrxBW+RHpaGoR/HNnEuF1d
	FAf6vy83FiJSsxfqweHZ5SFWLcj5OOQocZYCNx9X3ZROt6danGHt1Ph4K9fjOt8dyT8AnmLTfnPH2
	iRvG+IQQhjDOM+7V9fuSFv4FlVGdC/56AZVEIdrhQsRCrNlgt3HKebwt/zGLyTqHF1KCrG5itzXcb
	7RfRJMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m3Y-0000000CYCb-0HWV;
	Fri, 04 Apr 2025 18:46:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m1j-0000000CY5B-3kRm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7C1E45134;
	Fri,  4 Apr 2025 18:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B01C4CEDD;
	Fri,  4 Apr 2025 18:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792267;
	bh=5fmVXnOG0ETpJPqL4RDiC+7Ib6o7Jxdi2A4vq8OSqsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muE6m4eMX3vw53rnoadIG5y6gjcvAV2nH0AKc6irFKWy2qsqU3FnLMgnjGVKj5JEA
	 AUkhAt2MfmIAgjGoKQ6zJ1tt3FVwu+NWPL3p3kyxEMHy6gA7zhEtr8HwuafWFd/y4a
	 Fn2t9VY1WC/MkGXqAEQh/BDGAd5GlaL0XFa24bx9xOuyAUBFSvl7Rz8mVrH8XiPLx9
	 qvxyGqVpC+mhAOkue1vQYmg424pI0nJaTapIyifGzWNCB+gdh8MMX4l4MS4J0RcT9y
	 jIW/jn0ibxcCunxL/xmuvalZCl5/OMUihj0ftCys1YEX3Fzl95IN7gGHG/9zqrterF
	 dxdwipdv2w95w==
Date: Fri, 4 Apr 2025 19:44:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 08/14] arm64/fpsimd: Avoid clobbering kernel FPSIMD state
 with SMSTOP
Message-ID: <ef325764-6578-482d-858f-1f55c1979bf6@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-9-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0zan7YOHF2n5rLeO"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-9-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_114427_951246_BB0AB702 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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


--0zan7YOHF2n5rLeO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:29PM +0100, Mark Rutland wrote:
> On system with SME, a thread's kernel FPSIMD state may be erroneously
> clobbered during a context switch immediately after that state is
> restored. Systems without SME are unaffected.

Reviewed-by: Mark Brown <broonie@kernel.org>

--0zan7YOHF2n5rLeO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwKIYACgkQJNaLcl1U
h9BlFQf/dqRAgmgVSbcDj67F93gle/nb88rAO8aAxgNhUjy/TLes95zZIdxEgT2D
RZshLk7wDovj2kPAU0P6V5M1I6jxAhBDet58jxDw5yhazauJFFMdhMz8wN8ibP0B
fVuAegG6OErISHt/lYH76GlQanpknIuGy444g641Ve8ovukAXj/T1cEQ4jnAQLux
L27izmjs2G9TYS7kD2JXEQE4snl3x3ueey4cvQeTS/KC2Lc3TVstf2CbfaM3J6ug
reARQPHPzy/mgYtsCb0LQXbplSSZOji8otJhQgAJ8kPNBX6tPtTipm2CUX4o7/Xm
ScAXa6ceU+8j1V4dl/sGxHhFjtV0xg==
=Ur0R
-----END PGP SIGNATURE-----

--0zan7YOHF2n5rLeO--

