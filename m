Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700FC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prvGSj+fZwUA3hFUhb/5k8cPZC64I4Fvs/1jMwi2UW0=; b=F73uWMq/k0LvD3tHkjVDEt7aH8
	HvKI4DYK66t3t8XJsok4bcxhVKC1PvQjiiChprFu/YwSRSebkLosz4jh4aZt2hJBr+UDpuShDDY0i
	MeKy8fn2lgeVV87SX5WEVjAQfLrAXsfmBeAI/W2mdRpXtMVqWjar5g4vJZ/Lvv8fXNDExbJNVIo8I
	wlx2QNTyATG3zIlB3TjF5kJVgObC8mjD2u2ibR6s4khLjBmkSAnUaN3sGGebunKVvbx9yac8ngxHC
	korbFFKqvmUdIIO/JJ8kW5ItxtJ0I8tYXpRkGOpmEIeKOH+s6i2kwpkZ8xfbBxBM7O8M7knwaNd6J
	lHwOgQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HFE-0000000BeSD-1Fw8;
	Wed, 09 Sep 2026 12:17:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HFD-0000000BeS4-2J88
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2606437B6;
	Wed,  9 Sep 2026 12:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440B21F00ACA;
	Wed,  9 Sep 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956258;
	bh=prvGSj+fZwUA3hFUhb/5k8cPZC64I4Fvs/1jMwi2UW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XtsvA6WMsvy+Wz3Bt8v0Bdxjg2HPd0rypeZl5SXrxIgVGRT8K6jgPwU4m3cVxZQCm
	 oDHPAIyVoAmgXZ2TE3fA4kJ6ndh5z9JktCCvs4KjO1tEYAW6pGXuzIsYs8w0lJ1Jfs
	 dTN05KtGiIFCChfQdHpdwje0Sqx/jEgvapZmSgZBO1fsEswuEZ4eNL8jxNmbkuOCtK
	 XWO33Mz1fkPNI800PG1f336LFJCdQiU/bTlnmHer56LSvMWwS+soEyRVm8Une2MAq/
	 +mnQ3QKlY7Jql7clJFLnSDTMpFzj7QKxKPCxDsXElcKUkhzXnBqS/GZgyJhbl2zBj1
	 9n+FrZQWu0TqQ==
Date: Wed, 9 Sep 2026 13:17:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Enable S1PIE for hVHE
Message-ID: <e3c716c2-66ef-4dd0-bcae-6df4ff814e48@sirena.org.uk>
References: <20260908-kvm-arm64-nvhe-pie-v2-1-79e42d28cc08@kernel.org>
 <861pb24v45.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MuKrjLDOhzI+PFOi"
Content-Disposition: inline
In-Reply-To: <861pb24v45.wl-maz@kernel.org>
X-Cookie: Postage will be paid by addressee.
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


--MuKrjLDOhzI+PFOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 10:44:26AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > hVHE.  Enable FEAT_S1PIE with hVHE only, hVHE is used for protected VMs
> > but there is no real use case for nVHE mode on hardware with this
> > feature.

> That's not the reason. The reason is that there is no nVHE-only
> hardware with PIE, and that on VHE-capable HW, nVHE and hVHE are
> strictly equivalent. Therefore there is no need to add support for HW
> that does not exist.

Right, that's the reason why there is no real use case for nVHE on this
hardware - even where S1PIE capable hardware can run nVHE there is
always a preferable mode that delivers the same functionality.  I'll
make this more explicit.

> > This should have no practical impact other than causing any unexpected
> > encodings to map to no permissions instead of their default
> > meanings.

> What default meanings?

The meanings that are defined when S1PIE is not enabled.  I will make
this more explicit, or given your comments further down about not
sharing code possibly just renumber so it's not a thing any more.

> > +#define KVM_HYP_PIR_IDX(uxn, pxn, dbm, ap1) (((uxn) << 3) | ((pxn) << 2) | \
> > +					     ((dbm) << 1) | (ap1))
> > +

> This is not what these bits are called. They are just PIIndex[] bits.

I was trying to make it easier to map thing between non-S1PIE and S1PIE
encodings, I'll rename and add a comment to help people follow when
updating.

> > +alternative_if ARM64_HAS_S1PIE
> > +	/* S1PIE is only enabled with TCR2_EL2.PIE if we are running hVHE */
> > +	mov_q	x1, KVM_HVHE_PIR_EL2
> > +	msr	REG_PIR_EL2, x1
> > +	msr	REG_PIRE0_EL2, xzr
> > +alternative_else_nop_endif

> > +alternative_if ARM64_HAS_TCR2
> > +	ldr	x1, [x0, #NVHE_INIT_TCR2_EL2]
> > +	msr	REG_TCR2_EL2, x1
> > +alternative_else_nop_endif

> S1PIE implies TCR2. Why the additional alternatives?

That is true but TCR2 does not imply S1PIE, I wrote things this way so
that TCR2 is initialised even if we end up on a system where that is
present but S1PIE is not (or S1PIE is present but has been disabled by a
command line override).  This is during startup so it seemed reasonable
to write things in a straightforward and easy to read fashion.

> TBH, I think this is completely going the wrong way. Why can't we
> write this as a discrete enumeration of the permission combination we
> support (all 3 of them), and map that to the correct index?

I was deliberately following a similar pattern to that used for the host
kernel, intended to minimise code changes.  I will rework so we have an
alternative path for S1PIE rather than trying to share.

--MuKrjLDOhzI+PFOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhTlwACgkQJNaLcl1U
h9DVCAf9FkLa9EZrlgi6pdkBsc+Zaeb31MjhKkDCcZjLX6spejzs3GGxFnfz3gax
Rn3YMBzXTz0oB5cD9/nP0lAzr99Eq+HdHKbToBocm/U4R8eYZkWRN3flhnfkgRwN
izCAbdK0aAMowX4UGyWPEfVtC71PNTkBegLTTfbChDRmEAmKv8LYSmFjaXywjmkd
IMAecl+BnE8W2lMVDYVNvSJ4YO4dD1d/csfbixh1E87XeuyvOusrjAmbvvIENl4D
9zC7/g8kwJBu4wGn5Jww2sjtWz0ou8oJKQMzQ1TvgcwTXec4YQebamZxFEaTB1fc
dIT1nVqkE5JKtDXKVqmQBX72EOhrcA==
=xhkR
-----END PGP SIGNATURE-----

--MuKrjLDOhzI+PFOi--

