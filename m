Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D211DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 20:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUCokILFAhe1TeQ8AP9BFXp7WcCOGZ9VoQeUHpvzSVo=; b=JLDFB1moIAERPblLcsLa3cwupj
	xUGaNoVP7IrdTUktzxj1zgWhGAgfGDvMRI5RODGhBQsEB9RfW0XWAlcr43//+7eQWXU6gImxm7MdH
	w76qJQj4lmElVkPws+TWpT3pg+NR2FpsWuBoT+3KlIDSjiav06jssTCzq1z5w1uPaanU+4fPSgkkh
	P+ohsGfD0PgiFFxFjhAVTBxSLNk2gFYxpCjt0bLwqYQZ4Uhe+fpfuBVItH4XZb1oeMZVn0HL4DkW/
	DjoG9lM7oS1at0flNfaO1vS5/iFO1s7jq+aug//aO4envUzSHjfoFO7fV5xEJ2WRWmOh/jCVVLbvr
	7VlLm5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIAx-0000000BLjA-1pOV;
	Mon, 16 Dec 2024 20:58:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI9s-0000000BLU4-43dE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 20:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42DFBA41AB1;
	Mon, 16 Dec 2024 20:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79813C4CED0;
	Mon, 16 Dec 2024 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382659;
	bh=dUCokILFAhe1TeQ8AP9BFXp7WcCOGZ9VoQeUHpvzSVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ry74bAht+j7Yb+3PLt9ikvHcUjFI/Rjq96N/KKb/4PjRcvJCCJEbWNEe0L4HZY2xU
	 fIAwLehF3EgBLz5RvEybSN08cu6WQ+RnX0qA8eTFCl55Eo4pcuAzDETyoF7LUXpn2r
	 hcXBuQYcHT0lNg81f49GHQyAdDBAl6TbBMtN6EOzTimXXiWudQ1XQfmby0FnXPzy+x
	 C9EIR7+kRU+ABKboDqo1tui044995Csa5BaQxBeRUSICMz43wbpug6moFz7te7PG8L
	 M0qtUgRXMG7WXlPLiHeRBCatW9WbEGb/xAWDaJnP7mOZSDcPJv90SNfR6TNuhkkSDB
	 83UO7/cSSyZoA==
Date: Mon, 16 Dec 2024 20:57:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 10/46] arm64/sysreg: Add register fields for MDSELR_EL1
Message-ID: <9004e368-6e0d-4313-8ae7-62e3200697f7@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-11-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iHVTl3Ik9oIY/II9"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-11-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_125741_074829_952314B0 
X-CRM114-Status: UNSURE (   7.70  )
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


--iHVTl3Ik9oIY/II9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:35AM +0530, Anshuman Khandual wrote:
> This adds register fields for MDSELR_EL1 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--iHVTl3Ik9oIY/II9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdglD0ACgkQJNaLcl1U
h9AOFwf7BA2WfqloQj9HA2ADyHaPT54vh7gI/1Ca4P+RV6QXVNk8heRuDU4KGu/v
R4G59TH4DzmpTitMKTuJRVfCbRGx9ye++8k6cRRcvoT2Zmj6u0HbdmP05MSGczl0
d3D2VApNIWS0WJuSsyuq1AUZ5Wt0/mHnXr5nqQxVevGW41Fc+w37y0ccjOVsDjRE
DoudrfrUL9Fx9pnwyt+kDsVYqzS2+zYawsDtCAagiesIqEI34AMCMhcYPLkICQ8G
YuE76bqbaKQNBYaVQ8nhQy3mP4HzTOKtgIW5wHT0zMolTGW/HvUmRZF1Yq4N90ox
JPWfTzzY9Ev15BDJiGuzmPHPttHM8A==
=ObPL
-----END PGP SIGNATURE-----

--iHVTl3Ik9oIY/II9--

