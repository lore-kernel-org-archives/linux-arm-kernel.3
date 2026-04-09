Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A29FEA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPK/XaSCepp7xehb3948it67OpF7BpIVSyqbY5BVmOc=; b=p8NHSjnHyiDjhowq+0WcorlmIE
	Wm4fFqZpEchde79uYMnfVo2jVpUYeluxeHiAxvvNTB3LZf7NjLSRc2UBl8hLGJDSm6PumME7cTQUM
	NhQ3TvOF9QSCgvypC0TWfo1oGwYNNP6b2bl8/eSLtT0zDDNvguezDJagDb1wblL4pdJLrvQ/J5QJF
	a8tKHRfOxwCQRVaW2MmreDyx1/S+coqWOSIXhivh+Z/Ytf79e2qNBJ8BWIc/uc51KtxFXsJr7gXQX
	+3WoPJhtvRpTAqezlaMgxnlkE0ERRI1fAyFiUkgLvseBXDJESa63xVUJRG1bP6nsv7eBq52U9LNie
	Pg7nCe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoFY-0000000ALtn-3tpO;
	Thu, 09 Apr 2026 12:12:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoFW-0000000ALtR-3TFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 115A444240;
	Thu,  9 Apr 2026 12:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFA1C2BC87;
	Thu,  9 Apr 2026 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775736761;
	bh=nVlf9SwrvS+dG5uiC/p58bO6GfSls1UYlsHSnGbsU2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H41L8hJAWe19Yc2RdQYZ5iZor468SrA6cvNCotIbjI7yMdxWggTUBbyoRy1T8wqDL
	 XStPLRT2sKH/aZ/Kz9HcRyJaVeSFj3qlkm0gK+KmdjNpVYqUm6xYOka8eSGcNWAihd
	 5ua2pfEIet147phAEJeaAdCfPLVGqIvpoCEhcw581oWRDda0blLC2gA7PeWf4gkqEh
	 AIOjnSRXYk03dKA3Hfc+CeEHZoXBNjM7NTUFWUpXx4nczz07cF7zzYcRZ2G+sk68Se
	 2ZnCISch2av5+G3QKCqc0c4Zs4d3u4M17tyX5poLOaKjBUzHAyveyH3Bt8aVoVh6ic
	 XcvW4Sc0qRcdA==
Date: Thu, 9 Apr 2026 13:12:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <4de93318-5b31-4bce-911e-275b6a70f2c6@sirena.org.uk>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <20260302-arm64-dpisa-2025-v1-7-0855e7f41689@kernel.org>
 <adeOnmy60AUQzSvo@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XBCDYlAwEN9zYdRe"
Content-Disposition: inline
In-Reply-To: <adeOnmy60AUQzSvo@arm.com>
X-Cookie: Hailing frequencies open, Captain.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_051242_907444_07CDA8D2 
X-CRM114-Status: GOOD (  30.31  )
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


--XBCDYlAwEN9zYdRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 12:33:50PM +0100, Catalin Marinas wrote:
> On Mon, Mar 02, 2026 at 10:53:22PM +0000, Mark Brown wrote:
> > @@ -3290,11 +3295,13 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
> >  	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
> >  	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
> >  	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
> > +	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, LUT6, CAP_HWCAP, KERNEL_HWCAP_LUT6),

> IIUC that's a LUTI6 SVE instruction which would not be available if
> SVE2p3 is not available (or SVE in general), though we have the
> equivalent SME one with SME2p3 (and a separate HWCAP for it). We should
> rename it to HWCAP_SVE_LUT6 and make it conditional on
> has_sve_feature().

OK, and hope that the SME feature always keeps in sync with this.

> KVM will probably confuse guests here if SVE is disabled but the
> ISAR2.LUT field is not capped (I haven't checked). The conditional
> has_sve_feature() would solve this but it won't address the MRS
> emulation. Arguably it's a KVM problem for exposing inconsistent
> id regs: ISAR2.LUT==0b0010 is not permitted without SVE2p3 or SME2p3.
> But the spec isn't greatly written either - why does a field about
> AdvSIMD all of a sudden reports SVE instructions availability?

Yeah, it's just a generally interesting choice for the architecture.
It'll also be fun if we get a new LUT feature that isn't SVE/SME
specific.

> On SME, unless I'm misreading the spec, the bits seem to have been
> written by three different people in isolation:

> - ID_AA64ZFR0_EL1.SVEver + ID_AA64PFR1_EL1.SME (and if these weren't
>   enough, we have ID_AA64SMFR0_EL1.SMEver) tells us that SME2p3 is
>   implemented. LUTI6 is mandated by SME2p3

> - ID_AA64SMFR0_EL1.LUT6 means that the LUTI6 instruction is present but
>   this field can only be 0b1 with SME2p3

> - ID_AA64ISAR2_EL1.LUT == 0b0010 means that LUTI6 instruction is present
>   (if SVE2p3 or SME2p3) and, again, that's the only value permitted by
>   SME2p3

> So a lot of redundancy and we did end up reporting the fine-grained
> details to the user already. The SMExpy versions seem to be cumulative
> unless Arm decides to make some of the instructions optional (it still
> doesn't explain why we have the same information in SMFR0 and ISAR2). I
> guess that's where the fine-grained HWCAPs come in handy.

There's a few things like this with the FP extension, I think mostly
with SME - it's future proofing in case we want to allow more
flexibility with when the individual features are available.

> I wonder if the user would ever be able to parse these ID fields
> correctly if using the MRS emulation. We'd need to sanity-check KVM as
> well, not sure it proactively caps id fields.

Yeah, there's some traps here.  Generally you're probably best using the
most specific field for a given feature but there's still traps there.

--XBCDYlAwEN9zYdRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXl7QACgkQJNaLcl1U
h9AB1wf/bAlVLqBnPfZafOm30ynwxrYVBj4L2GjvTuQQiXYP91h8ipxEIHrS0QN5
1uN+XXj8RSKqhkRCPkLNGiWmsu7Af+Cvc900So85xXniywBZA7xqqN975rCCeZy4
nS5N16VNgI0qp15b9KWM1VXSjCl9ninfYvh4XV7WimOuy7y/GoYljf5vFG2vertO
FlUJLvtcke3OR67RrlEF9jBIfSsM2R1u45EDlSrt8ja3+HbUAlhYfic1zetw7vzE
dOoHC9ZIfyNuyY18XVF+8tvYtYIBH2g1yOVv4kola+cFsrXPOhVCS6H0KjkC5HxA
4q102DsZwOrLriumYtBRqV46AVzeZA==
=ixAV
-----END PGP SIGNATURE-----

--XBCDYlAwEN9zYdRe--

