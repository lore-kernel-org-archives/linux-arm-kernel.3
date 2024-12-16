Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E23E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wICNgf+IR97xFy25oLTLwYecGz7p9oalZishcLcdo4o=; b=2Q4AcPAKW+0Mnu5mTIl8fjXds+
	1sbX5LsObBt1FR+nxJ8Cwk6GvxkRNyqzfeKWek1FVgN/Iuf2wv0p/FA8S7Rmh/0cKM7Sxk/D8LLT3
	p+1OHWMVyFf0n0vgAKa28XYR5h/nhV+OlJAZaTghxDE6+Zyt35/qhFmU/x7dscJ2PxWadjiahzguf
	DxQCTvjvbx6hiZjrO46kHHbO6WvuD5yX26h2TDp4jRF8GyErD/hlFP5SC1Dps0spMDLmzT36jj5AG
	dodfUDkaNJ3PBWV63K7FbuAmEIm8xZlKGd/aP2nG7fT3AL8Ss7t6D6vLSFZPlW74kNDALD27xSf0W
	y/YnTZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCoU-0000000ANE4-0sTo;
	Mon, 16 Dec 2024 15:15:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCm2-0000000AMlS-0Our
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BEC55C5EBC;
	Mon, 16 Dec 2024 15:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38A9C4CED0;
	Mon, 16 Dec 2024 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361961;
	bh=wICNgf+IR97xFy25oLTLwYecGz7p9oalZishcLcdo4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otuodDfADecik5dK4A+tvJlOPIlqUWxqN82gnV2UUQLF2EID4UGmWjZlMD9HWIY1D
	 Fchlfp0Af3b4L18QVne282kKyeBqiPkAMXZyLyysO726seCflHNOTQMocYTA24YSse
	 sh6FTadku2KIEU8lgEAWYIPE0vi0/HCbdoR7qVQwzqZStEAtZgV7p29UbStvU+sacX
	 YsQeyrxrxRN+6uzooFaNlaBckOtCP38KhI7KNQD0nVhP4WeRILvxemZv5kk2JV8eNp
	 dSz7paiM4H/y4tq3dQMlbDHHdGdJxKvr4NYYlD4VQ0re2qaCyCbJG5rLDeU55NOwXB
	 ZDmW8v19na22A==
Date: Mon, 16 Dec 2024 15:12:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 04/46] arm64/sysreg: Update register fields for
 TRBIDR_EL1
Message-ID: <1c1c9117-e2b2-49e7-9bdb-7ac6a184d7fd@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZdiaP7+I8rZlyon"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-5-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_071242_172237_16831CAB 
X-CRM114-Status: UNSURE (   7.49  )
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


--7ZdiaP7+I8rZlyon
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:29AM +0530, Anshuman Khandual wrote:
> This adds register fields for TRBIDR_EL1 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--7ZdiaP7+I8rZlyon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgQ2MACgkQJNaLcl1U
h9CPyAf8DgQ5EoPnHTekTgf01FLNQxvy+tdd5SLWHfOh6ppF6KvXlm0TcSi5PgAu
aSCjY9LePmuBhI1O1TwEhN0z+/n7UyXrVNMYRDuV4H0JlUBMgPra1udLCQY1OlXu
G6IKghirOgsOKT4kZop/A/6MXyE3hrdMlYUjieSRAW0f9K+MKLyEefLkGbXYVJIq
Hy+7fdr0rKP0ObUy6a53c5qpU3WqlGbBA+6MHT/CfyIM3wnWSdAD0hfxIbdqFnRh
qm4dB5ri8k5XGzemPWwLnjIEjIaPCXkPCBm+JaZd4M++U4JG849hB6zzAFr7V4Dy
L1f7nGYmPjNsp0HCoNLdxsrdhQBNog==
=7nTo
-----END PGP SIGNATURE-----

--7ZdiaP7+I8rZlyon--

