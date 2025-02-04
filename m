Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F77C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNgAUVXXhIdnR++Vsod+JavMfDup78D694pT7zIrODc=; b=niRPHecHYR4OKStAOKynMjitWa
	cESk+QYFlgFEms58XhyYHksgRHwuClYz3xKT0LVDd8prECxFLyi0INT/vJyfGJl3EyQZ+5/AQ09Ts
	+0VGyGo54t8JMDU/Wbfb0FcYngvUgnQ5ct8V6uwvbXpZRxNP0djhL39Qpy6FfsZjLqFjTLgdmRLI/
	MNgZBjz8pewdTwmyYiS5VED6YaGqVh+UvTUEUBGdydwSuICJOKqAnZ95C4sHe2/MwHMv9MgLb0kyd
	Bdng1O0uO38PeosYbe5HkaQR5k1YCLFyPKh1FmEJmUd1NSKo39Nw2/4ezzSlBLD8niaBHsIskJ79G
	u/emcRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMf8-000000015FB-0x8u;
	Tue, 04 Feb 2025 17:24:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMdn-00000001572-3pWz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81D295C5F21;
	Tue,  4 Feb 2025 17:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63064C4CEDF;
	Tue,  4 Feb 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738689795;
	bh=NNgAUVXXhIdnR++Vsod+JavMfDup78D694pT7zIrODc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB17wYsZv6+yEre7xIg5FslQ7E2eOLrz5v0yogrmTmtl2JtMSqn8F1I5NjO8OIqI5
	 Ep5IUordkAWbWkyZ8FkWFVyMUaCzhmyfSc8gUN2aNt6y85jECF763uqJqKcF5sClEx
	 l60jN167ybBtBbZjZ+SiSVvLeYXSnNH+xLci2d0vwJaOtY/um7+mPcJXGiFs4Dpacy
	 KzzXLTxTBbc9EPjnIbZaga8Nq5XQbJuAe7eH+HyWc5W9mLKsecjCZwWjuis05d5WM0
	 N4VRxCUJZ0Bkm1Vko//aZFG5grNWlfUj1C36DL8C6+hCzAsOjeXig7Q+k7xRhMLgfw
	 HTkUN1v67fILw==
Date: Tue, 4 Feb 2025 17:23:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 4/8] KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
Message-ID: <58e56e6d-2eec-49fb-89e4-1a5c10bfa121@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qiBGpraq5W+X9KJu"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-5-mark.rutland@arm.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092315_992570_C284EE5A 
X-CRM114-Status: GOOD (  11.18  )
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


--qiBGpraq5W+X9KJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:56PM +0000, Mark Rutland wrote:
> When KVM is in VHE mode, the host kernel tries to save and restore the
> configuration of CPACR_EL1.SMEN (i.e. CPTR_EL2.SMEN when HCR_EL2.E2H=1)
> across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
> configuration may be clobbered by hyp when running a vCPU. This logic
> has historically been broken, and is currently redundant.

Reviewed-by: Mark Brown <broonie@kernel.org>

--qiBGpraq5W+X9KJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiTPwACgkQJNaLcl1U
h9BIXgf8Cf4mi03nwy2+qlBtq2eohiCV6ypAD6QEzQPa4o4jAOECNyNKPDhpSBv+
uGqnWIf85+TuIMG4MYEo4bjSLH0WzeDaV14FO22GHwpTMy/W977Z8Zh9aRmKUGe+
C/EC09lcM8qUEsrEpvBbd3zy1P7qKL939eKvay2M6SktW4XZb6e0gy0hYrkL1X7i
3UbRvknWwRJd5Ko9ivIQM4Mrpkv7IThCgVLNXZ+ltDxqCEeF3De7zKOxO5fOKIAL
Y/aGEEbx4n3F8FChNwazv++1BytDkJlxtcn7l4ek6w14+P+o5S+L2kMippZB0NNl
Mdqu7d2RGfH+JUlA0rqGXr6KfeY/HQ==
=Ig6n
-----END PGP SIGNATURE-----

--qiBGpraq5W+X9KJu--

