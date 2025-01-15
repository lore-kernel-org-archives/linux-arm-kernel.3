Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6C4C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwWG4QVQ1mZL+ZKPudmUC2gYE7RFuNS4P6G2TDdyrvg=; b=aNit0zLgr8aEdV6y/MetstJYpo
	QDLtsbvpTMxHht/qAxAwHLUHBbSBYFQwSZ83TY4R4bk8+GvX/YGa9BmGqh7X5fKbflK7xeSBcvhrr
	HACqBT6jtLE6Wn/lNeIFF7j+Icr0KuhvGU1/vb4pfdf/g5vcwgLU3vjUa9cCQYxpF6n/0b1DgCjFP
	jxJXOmYW9f+nr0WTTh0qJnRZeJwJTQTcrlAPQUh+lDwm9QqxIxZnj7aw3HTr0+IVVrUvPYZGuw2Eq
	BwAmXwagIEM+Wb+tOr4i4X+7IjJzddyVDgAKFd04NcP9j4yZMZKWct/MT4buMbN0dG8RQXoq6tXnM
	3XF8U7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4A2-0000000C5IK-0T4W;
	Wed, 15 Jan 2025 14:14:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY48l-0000000C59e-3JnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7928D5C5B36;
	Wed, 15 Jan 2025 14:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B09C4CED1;
	Wed, 15 Jan 2025 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736950383;
	bh=HwWG4QVQ1mZL+ZKPudmUC2gYE7RFuNS4P6G2TDdyrvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er4h4L75gfhJbai/B02+qfp7tdfAQeXzkFyqSaaX5lMEczdWI1z/TkOfH4rJ3AagS
	 yhsp/Byww+1Zc3A3AY89UPDdromE2VWkpSd84eJ9isaYpbMIxAmBBQuJCjBD8iwmBl
	 03ktVtOOhjlpgpaR030tEHcA/WEVBAgkmB7SJ9EdV+gjwcnyAZSpp7p5xWssgdDYLn
	 +qvAUUGDDN0ZFalzhpQqJ18SOKaSFwbkvxUAYiztN9JkhXeykxEr4Ycts8u7sPsdEf
	 BOzEUILtVE/jMIdm1q3PhPXcMlyipz2vm1G6B2JrS+BlnzNWpDJsuD2QZRmEg3/ulc
	 a3l4oTGRgja2g==
Date: Wed, 15 Jan 2025 14:12:58 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64/sysreg: Enforce sorting
Message-ID: <e2ce2707-89dc-4668-80d9-513cea80de75@sirena.org.uk>
References: <20250115134259.1864060-1-james.clark@linaro.org>
 <20250115134259.1864060-6-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q8eJHwiE91loMLYF"
Content-Disposition: inline
In-Reply-To: <20250115134259.1864060-6-james.clark@linaro.org>
X-Cookie: Phasers locked on target, Captain.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_061303_876667_03FDFF81 
X-CRM114-Status: UNSURE (   9.26  )
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


--q8eJHwiE91loMLYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 15, 2025 at 01:42:57PM +0000, James Clark wrote:
> Make an unsorted sysreg file a build error so it stays sorted.

Reviewed-by: Mark Brown <broonie@kernel.org>

--q8eJHwiE91loMLYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeHwmkACgkQJNaLcl1U
h9DXCAf+KsRn7OzcqbfuT+TgSNkJ+oG1eWWSvPmnQ7hsN2ogCl9PlZa88IkgLMxe
nCiTOm756h2r2Wh6eP6Ov2Duj2eFGz+pXWAubGuGaDQnELmjstIfTTCJpvI1xqlx
VmxpkD+dTb2IumBn+5fsFFrnWJx7KrkqB2DYTtK5QyHWSO2v5lyZ/8qLyyFF0P/k
+CscY+lQHPQ3ta0bMpkmlQevV5rBsod/3t01EsZOSFOHbYsHY73e+YybluGW11HJ
Hd1cqLkUm7GrAkG1ELQOGu4jUNOykoqyp/EBIL+uKP6LMGvRssb/fDOnCRgRCMXn
9nCo/xqhb2gtHafsBJfnwf3PTNE69w==
=k6pg
-----END PGP SIGNATURE-----

--q8eJHwiE91loMLYF--

