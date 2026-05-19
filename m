Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7+TPDNRmMBKzPA7G+4/OR67XS1KLFV6sMuUCk4N2H4=; b=FdDdaK2e/+dMBPlWFXpK+a7ub2
	fPeHod+OTld99ZUyudUxtoEVHFyHn3FwRT7tPcibxGgksIThdba/G6gkTJHInb+EHL3YL0WFMv6iH
	cW5m1y3TaWoNytIeaaE65Lwnv/9l9StR6iBhtrTusBMcS67mKPd2iLsZgNnha/eaZHHwgJOLVsM8k
	OSsdPqnuZKx9023M89rrMngHn3P7Zt9sKqRpgHetI7KDUsZ5nKoZaQuStyju82/1Em0QqGGNhgQ8m
	sQF25xhjV36WfJYfFaSkluS3GvpYWX1YSBi5Rt9H0rxYKAM2Ues8Cil0D7cY7CdZfudaLdvBQ4DIy
	U9SFHFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIEx-00000001FTf-2y5x;
	Tue, 19 May 2026 11:03:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIEv-00000001FT7-0t4u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D421F4087F;
	Tue, 19 May 2026 11:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC2FC2BCB3;
	Tue, 19 May 2026 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188636;
	bh=V7IBH97Z2/GKxpxpkUNDatXbplsDGhepTwPW4cq1SlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAWomEkvJnuu2fb+G1+FjOqSf/R4BcWsFt8i+vOAas+teqBq761ZuGVjPSpHhdnvw
	 ocDjxTi/rw0M2qWFYwXQ64sGjBb91U5eDPFtOvh813nl8XGE5EA42c0s2nvGdkmi7u
	 8gobw8oAu9SP39OvpwkfwPW0aVnMO/ODGc9275d0LK0esFDf4+fChboD6Zwem9+3id
	 aR171PWtqm5Hu56m9MWZWJKptcYE/xwoKm0ZWY3kQsKySLd5jDj6bWD9HwmYTYxtQh
	 0kCXY33r5AnfJDrmtZgD/UTbgfBGmmeJg+GrXFK2xyefvfy5UC2fIroOmqSK9PpoEM
	 wzU1Cwzplec3Q==
Date: Tue, 19 May 2026 12:03:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: clg@kaod.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
 <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ym/3v19Weq8ydfWw"
Content-Disposition: inline
In-Reply-To: <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
X-Cookie: Huh?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_040357_271650_11F7D7C3 
X-CRM114-Status: UNSURE (   9.41  )
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


--Ym/3v19Weq8ydfWw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:

> -			while (k < cols && buf[i][k])
> +			while (k < cols && buf[i * cols + k])

This really needs () to make it clear what's going on; the precedence is
well defined but not everyone is going to know that off the top of their
head.

--Ym/3v19Weq8ydfWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMQ5YACgkQJNaLcl1U
h9B3pAf/am7wOig3BHiAuTlInU7joZdU36Y27z2iCl3tYJ1+lR0IKbwk13HQ65ha
oelRLYtS0WA/lKoyVTCWx2iGhjhxYTdgiQ1Wpta7YDltIy9DHQLpCZjruh7+kS/G
wqj1XvTObSW5coagxf/u3QfSt6IB2m+X5FlNHTaiG16RFXewUBQH7OtS7+ZHArJ0
lf2EakmCFwG+5NYEzYNe70qY8je0okRhaf1vzeHLbER9t7tpKF4EqJWqysgzoLxb
g+re13ZwT/O+tETcGPFo/P68eMXxqIOq5xvJca98XV4s0Fz22aIHitK8dl+HkPRh
aSZ+o1havyWnTEllOggQHwYQsf+ssQ==
=wLZU
-----END PGP SIGNATURE-----

--Ym/3v19Weq8ydfWw--

