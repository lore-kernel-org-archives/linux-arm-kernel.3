Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B974C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxMTlhxWU57nA7Q4F+UtfAVqht6xflsvFvNCCdkrARE=; b=4EdsGwr7hEXD2qd7u0uIbX1jKw
	Oni/xwJgPXkatZAt7TiaWPdSnd6vEXt6L+fSjsbbznD/zrsdbFIwPzmzQckAadMOVstwbO97b+qAQ
	MiiFIpPjho72Y87AP48Wh1mJnaZHO6Cb4o23B1qy7xZ7JSDFqBaAe8QnJThZZhQEslxCUA611Efky
	eWRnjZzNomk7wp13CutsLMjTSJ3YykONilcovjUB5H44kKoEignkC2gBf6wDAfPJazTXymYG7J4Pv
	8O9VA4MpFzz61TgXh4pXFOu3QkIjvqaBvFfd6ipbjcALKl3PuCI5p+L5cxiZ8c6pKQZZWFs2Hdn8z
	FBgIimCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRPL-0000000CbuO-1tSQ;
	Thu, 03 Jul 2025 21:23:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOHM-0000000CCNq-3YVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70ED244D38;
	Thu,  3 Jul 2025 18:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95AAC4CEE3;
	Thu,  3 Jul 2025 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751565802;
	bh=DAlQxIcteaDn8QOHRzwZvy79winbFs5xEUAf0FyF0aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDbd9qquuPLQ/EAUpln2smNPbxdrJ3tuUba8ONxsrbhMpdG/wrPKE29RjfbT84y8W
	 wuQXP9hwff4X73xRuO6IWbzDVYI3hX/GTvsNJl5BXvlvPTMJwIppkiNib7uF8EdAgD
	 jyDBtCmfRFvLyQxgSl0t1Z0Ze5UQyQqpSLMZjn+eebnyZuVEKbeXjNqZAH/FQG5vGm
	 48aJVBD62eB0H8PxRK9DoGOXEPCOCUv36abG/uZwkawxyCR5IwFlOJzSwvn+n0t3Mh
	 VFU0RO4QYYAK0ajkKCt556ks2Yf6OUH3hnT2L+cFTTJikcJajjFcAVUiExcd+YMRj+
	 B9IeeM2LItFqw==
Date: Thu, 3 Jul 2025 19:03:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 18/28] KVM: arm64: Support SME priority registers
Message-ID: <3ada3079-6f01-41d5-927f-afbbd57d934b@sirena.org.uk>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
 <20250625-kvm-arm64-sme-v6-18-114cff4ffe04@kernel.org>
 <86o6u6c2qg.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjNON9hcckQNbems"
Content-Disposition: inline
In-Reply-To: <86o6u6c2qg.wl-maz@kernel.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_110324_926445_9585FE15 
X-CRM114-Status: GOOD (  20.11  )
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


--pjNON9hcckQNbems
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 29, 2025 at 10:32:23AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -495,6 +495,7 @@ enum vcpu_sysreg {
> >  	SVCR,
> >  	FPMR,
> >  	SMIDR_EL1,	/* Streaming Mode Identification Register */
> > +	SMPRI_EL1,	/* Streaming Mode Priority Register */

> What is the point of making the sysreg file larger for the sole
> purpose of returning a value that is firmly always 0? Can't that be
> synthesised on the fly whenever needed?

This was patterned of what you'd done with SVCR, I'd formed the
impression that the idea was that for registers that really exist like
this one it was more robust and less code to set them up in the sysreg
file and have everything look standard than do custom handling.  That
case was a bit different as the arch FP code needs a variable to point
at, I'll remove this and synthesise instead.

> > +	EL2_REG_FILTERED(SMPRIMAP_EL2, trap_raz_wi, reset_val, 0,
> > +			 sme_el2_visibility),

> Wut??? You clearly said it yourself: this register "has no specific
> traps available". If you end-up here from a guest access, this is a
> bug. So this "trap_raz_wi" makes no sense.

I see, so the callback should be NULL?  Access to the register will get
trapped as part of the general trapping of EL2 access by a NV hypervisor
so it wasn't clear to me that that we shouldn't have the handling.

> I also cannot see where this register is properly configured to be
> fully RES0, as it should.

Me either now that you point it out, thanks.

--pjNON9hcckQNbems
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmxd8ACgkQJNaLcl1U
h9Cnigf9FOTIvLzH7nW4Ne5KezFk5Oy7PnPYWnqdug2uCPZ/c0vKArSLFLGgbaQC
LNFKKt/Ki9NPakD73zenb2iRfQHst2Z/XNgHqvDVczgNsuJx4BVX5hsObCeIKdrj
RCTmY9X9Jb4b6lHsM/BH6pEIysEYRA8zj5+KbHhi5vm9EgAoq6um6H1kW2kCEUXb
10We2nKb5cHNobBonc54HhAgxOpEM52E+dE9MdDa9SoUWwKBzzaJHTv6FRIHomJN
EhsF7DLO6ovjqOaXBLj9tGalSO4xXR+EPQdJSmhExqjSywYoQP0S6ncSlwwS0PdG
W7906Lv0olpdyCLF/Cav9KCU4YU9AA==
=/1vV
-----END PGP SIGNATURE-----

--pjNON9hcckQNbems--

