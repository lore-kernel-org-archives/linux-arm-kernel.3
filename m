Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D20C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrXfcdVr6NdC02aW2xfqrEL5toMXHgGsEbUdVnuz8pA=; b=D8ViRZxx6vNmrPNRvVkLbyX6SN
	GmCyP6BV8pqWCCbBvlCgrwo2NdvdXpV+Oo+qaVyN36QrCDeqRo4P5Adj/26oNSyXYBkOS3gMWdyFr
	fWBmfPTJQGbBNKL2RV5eM3PVHKWoRVtFTLTaUZg8QccOzOcyjTTkeJBiDEHF09+rWo6e55uhN0JXC
	e0Y142xFcSz15pOnYx8t+HmVC/gcUOMzQ6RINS4iNHAsT8JyYcJF5aRlnMuBczsSLckKRSrFz+J2R
	MwjIER3E1IiwgC5TKqXbmeOPbopRCsPfPPgrQ/ZUA1TDhs9gvmi3QPJNyRV/iO9SQe5JNZRSEeQNP
	loHMhoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taEOg-00000007zAU-34Y0;
	Tue, 21 Jan 2025 13:34:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taENQ-00000007z0P-0fvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 13:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8CD0A4195B;
	Tue, 21 Jan 2025 13:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC92C4CEDF;
	Tue, 21 Jan 2025 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737466387;
	bh=Xk56czmJVwBhrixeLvjBArHXhkCDOSVkd9QDQyRZfSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5xMJZBWzG2m/L3H3qmDGn9EsnFk5GqYLdAoLjsya5FjHHKx4JKVnVEsRBH/QkuBK
	 ZyxC35WL6QVpmZawDTqUpwpUo/viLIetkrp6HgCTj80a5zlSay0WotDqRKSIHaKzgj
	 JLsAM+DeQmzyc7y9tKZkD8Tzd/42dpZR/DIIl1JOpM4JDIxm87ybKADNinMgRTNWgG
	 U76gC+a/4x+5CoG18vhJ8YcBJmC5OYiIQX8SI/UlDroKPjW+qe7bzfq/qnxhulW9VH
	 fWrNaWO0/lpunSLR9IoJrZz0iEhpRq4jIV7WI1yrRzqbUA/1xZsNUoXbsTjCz3oM6P
	 i5TMRgeD2fJGA==
Date: Tue, 21 Jan 2025 13:33:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64/sve: Ensure SVE is trapped after guest exit
Message-ID: <59f02239-98d3-4768-8520-a2532e400a8f@sirena.org.uk>
References: <20250121100026.3974971-1-mark.rutland@arm.com>
 <86r04wv2fv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N27dzkvpr7ZXoSe4"
Content-Disposition: inline
In-Reply-To: <86r04wv2fv.wl-maz@kernel.org>
X-Cookie: <Manoj> I *like* the chicken
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_053308_323017_E403168D 
X-CRM114-Status: GOOD (  25.04  )
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


--N27dzkvpr7ZXoSe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2025 at 11:20:04AM +0000, Marc Zyngier wrote:
> Mark Rutland <mark.rutland@arm.com> wrote:

> > +		/*
> > +		 * The KVM hyp code doesn't set fp_type when saving the host's
> > +		 * FPSIMD state. Set fp_type here in case the hyp code saves
> > +		 * the host state.

> Should KVM do that? The comment seems to indicate that this is
> papering over yet another bug...

It should, we need to record what format the data we saved was in so
that if the saved state is loaded we load what we actually saved.

> > +		 * If hyp code does not save the host state, then the host
> > +		 * state remains live on the CPU and saved fp_type is
> > +		 * irrelevant until it is overwritten by a later call to
> > +		 * fpsimd_save_user_state().

> I'm not sure I understand this. If fp_type is irrelevant, surely it is
> *forever* irrelevant, not until something else happens. Or am I
> missing something?

The confusion stems from the fact that the setting of fp_type is done
separately to the actual state save since we don't map fp_type to the
hypervisor.  Either we don't save in KVM, in which case any later save
in the host kernel will write both state and fp_type, or we save in KVM
in which case this results in the correct fp_type being set.  In both
cases we have live state in the registers and whatever is currently in
memory should be considered stale and it's not the end of the world if
it's corrupt.  It would be a lot more straightforward if we wrote
fp_type from the hypervisor as part of the save.

I want to rework the way we represent the state so that we don't have
the state spread around like this, avoiding the need to map individual
parts of it separately to the hypervisor.  We need something like that
to sensibly implement in kernel SVE/SME which we will need at some
point.

--N27dzkvpr7ZXoSe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmePogwACgkQJNaLcl1U
h9D19AgAgrJ45489o8TGJ8JMXDL8lZvvna95oXYrXXqodtkC+PMzli9Rc8kMrsWK
pHnwe7xWvLYz3pcEAAb8p9EDnGs6bZqU4cqW+BFXzi7L6sTGKWtR2TkafJdZIDuM
mGG7+67auJDb7kYHQouE3TADsTa+qPz3uoqQ51n2SMB6qJwZni5AEo1jYsrXAebW
qVy0IusFb3ENgNkcXMOg5+CQdvZrxhdFBcPTXTTQWhMinZuS/Rcjp3Inh1S7ypLW
UPq/lPkAcNduYdGhngmECCzNntGwlT4MZ5Z/M+7AuWo1YPT2pp9d76D40KAqOcHK
2d3lB6DgMxJs5JG6LZ7L8pG0GaJDJw==
=f6Ta
-----END PGP SIGNATURE-----

--N27dzkvpr7ZXoSe4--

