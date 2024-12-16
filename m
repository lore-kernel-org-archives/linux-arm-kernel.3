Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBDDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4N4npRw9l2lYAIYPKpSwxZEHeTuyIbIDB3Me3pUDDU=; b=e258CigoXjs0AoMIp26V1it7L8
	4K3IPC422sFnV9wkvMvzyVzNAthWEESqcdM2QUJ8f+FFyofQfplvaLOaA8cQ4Zq7tRhV5p4Dl1Too
	qBJVQ5ZPOodsaIUXdRfcAuVC5g6OYU2BVO2Z2kRvaUT1b0gtOuOtx8qOGZZ2u0sTD0its99yVLgUQ
	09Rmi3fZg6FVE1wgFj/otCh0+rHaN4C5EdihGRredswwNEBAoQEWATL1697eI8r5ks+Ri/NfEulir
	sPuHr7X8TYJSI42BD7lIsIMqjL83gpp4Ft7MDsFOhkt59tU78QWzVCxojHIs36J3/CoGllqekhXyK
	+zxjqtzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI5g-0000000BKb4-3Tt7;
	Mon, 16 Dec 2024 20:53:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI4b-0000000BKMN-125C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 20:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B3C5A41AA4;
	Mon, 16 Dec 2024 20:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6B6C4CED0;
	Mon, 16 Dec 2024 20:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382331;
	bh=P4N4npRw9l2lYAIYPKpSwxZEHeTuyIbIDB3Me3pUDDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFTWMAz5yd1SZCjlq7bX24x3pqbze2bCFMcTpKm1UX9IY2TNPqrHq8swBaG4tLgm8
	 7s+XugKt1YR/GT6YbYq5Tq7ikXwD5CcQnz5CoagtKrKw1JBRhJj/QW/ln7DqUFzfQ/
	 di1owgcNZrJvdChtaVIK7s5R5+htBDCIg30rkctsbJi8sEL6xrzRGafKQrxoU+zZbM
	 INSchVZJ+0xw6wGl8SN4sUA2l6x+V+t7ccKe6RzCGfByFZbZc8i27vDhbu4rbEjQcV
	 UnKesr9HTjRSuVReMnkXsC2A42t6Hqsce1W5dXR75wc9/QsB+4v+LdUBh8ZB2qp3pY
	 8Hh1h++DkLqdA==
Date: Mon, 16 Dec 2024 20:52:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 09/46] arm64/sysreg: Add register fields for
 HFGWTR2_EL2
Message-ID: <1c1ac530-35cd-4fe4-93f1-1a6876c796c7@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-10-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQgirNPpUJRoLazz"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-10-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_125213_357442_2A0D093B 
X-CRM114-Status: UNSURE (   7.79  )
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


--gQgirNPpUJRoLazz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:34AM +0530, Anshuman Khandual wrote:
> This adds register fields for HFGWTR2_EL2 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--gQgirNPpUJRoLazz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgkvUACgkQJNaLcl1U
h9BxRAf/UGDgCBdJrU3TS+Kx10KsHXS5MIs8ainlwpwbKqo+Hddp7hl5ChN12hfI
PUJ7bT89YTFmjheYBgShw88T5p+HqaK4189NAkrgLj5KzkgmhM5296OyNtLmVDKr
0zfPSIYCIsmu5UTWI+tzH7pg+aqY76VhrLn3sd8AVnu6UYAYENaEXwsTyyExknF/
RwLCMSwxWmibB5S7g/96QtCrGbeUvGB4XvpVMUijNuctxmAdYzCknDaiXWjKnsEv
Q4DwAsSzJXIDPdmaAz6vZTbgjd2dFuIDFFOXqSKRmPzLgFSEyVTp38Ycr9YHYTko
teeYnuvVoWxVt6mriGL/LR7vjicAgw==
=zIEV
-----END PGP SIGNATURE-----

--gQgirNPpUJRoLazz--

