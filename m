Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686BFC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXCKZvImQuTOesY0OsMLy2+fVLkdqhy5wBhRUWlJGLQ=; b=l4fQ4QZOt3yjlW4nZm0h+sCRBL
	FvCtDexw/BrrE3TmfpyTO5hCgTs6khdD75nx2OrGPZbfimhTSgAEY5e4iAbKxNvI38EE/MFk4LkCb
	PtxrQrIuL2bCiZaBB41gRam0DZ24Ek+IcX/ao2u3et7v2h2Zemu3ouiBvqHfB5y54AHxYmOJbFrod
	M7QzeIe8hEmA/2/QcFMJYSRuSl5Fz+fUfMEQy5A09ZT+BsjweFT8icsv+b4PB5qeWHnK3j2aKLM7F
	4seIEcy0RALce34DHJYDB4CeWEZJ+UTPOTxj4q0Dbxcp5XT0oKE0/MyyKU/o2ttPjE4m9kHhXlRGy
	JmkiGqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMci-00000001516-1stw;
	Tue, 04 Feb 2025 17:22:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMbO-000000014xK-3fi0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07DE4A42A93;
	Tue,  4 Feb 2025 17:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FB2C4CEDF;
	Tue,  4 Feb 2025 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738689645;
	bh=fXCKZvImQuTOesY0OsMLy2+fVLkdqhy5wBhRUWlJGLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qouqh79DBpvOdtbMgxsL8UoG3JtSlgaiyDYTuryayUfKC6Yl6Sx+yJXuP9uNsskpZ
	 Y8qSpO2I9yChvwWdlNC5judrPT0E3PR75nLQbht5YELjfSKJk156LkoL5iMKA8LSKc
	 CsEUYtqaLD1vSg0/gIl3+2EmT96L8V+Ot8Cgklx5c5lrjmSS+NYT6NM2OvGVon+4y1
	 m/NoCjr9EEHSUmdBsntQxVN9gjhNtodu6tNUo3fFQM13yona3U7sR0oq8wyXDklZ4w
	 ECng3Nd8rPayz9jbjHhNA3GD2P39h1rXFSPhyzKNmGVAd0JffR2ENrnPjBVZaUMm/T
	 Gx5t0kZ5I1vNQ==
Date: Tue, 4 Feb 2025 17:20:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 3/8] KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
Message-ID: <cddb7cc3-9174-4dcf-9eb9-b7f4e2b0d32d@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BrVcv+yk+NCYE+Ng"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-4-mark.rutland@arm.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092046_975632_AB284F18 
X-CRM114-Status: GOOD (  10.93  )
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


--BrVcv+yk+NCYE+Ng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:55PM +0000, Mark Rutland wrote:
> When KVM is in VHE mode, the host kernel tries to save and restore the
> configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
> across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
> configuration may be clobbered by hyp when running a vCPU. This logic is
> currently redundant.

Reviewed-by: Mark Brown <broonie@kernel.org>

--BrVcv+yk+NCYE+Ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiTGcACgkQJNaLcl1U
h9AbPAf/dozy8yHITbWmaPkiPsGMMbfEJ3jszZbKnbD9/ue8ynsjAX3EvHVtsErE
h+Gr5zCGXbAaQRQz2s3TzAjxwoUXH/P+vuVKbIJpqZswAhUZ26o4F26Wbg9k9LVB
L7XtldS31M+F6pu+7iUhmIp2J79oVtSQwvmvUM3jDVbIH0MXnftwXvJOvvSjhzUC
v4Ee5tsnb6SgpXnu2F3BikSCCLscdDbE2MXE6TE64aQtSwlYWblgfYAP8C9A3whB
oAmYZtwNT2EKrApJOU4m47QFG7GMewZI9UcT3mCuz15bcpWACSlA1OXlVs0J8Iba
5n9qOO50XvUdS4cZx373d+cZlklyxg==
=a8u6
-----END PGP SIGNATURE-----

--BrVcv+yk+NCYE+Ng--

