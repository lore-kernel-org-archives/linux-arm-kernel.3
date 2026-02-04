Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD05E9D40F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtWXBHq2lcY0B2Rqyb+pE75tSBjgB/loLoBl9VXzBO8=; b=GXPGVnzipDLkAvGyfs9QObQl6G
	F1KAPEfSotmBkCJjTnFRY5D6LiOq7kDV5I7oQV8cdBD9pXf8RVoZ2NgUN9YbDUQlJCNcVzkUl+IEk
	qCU/XvM02x3AN0mukoiPxYfDWzWuH6hLR62rqIKIh2b/iXMnhL+vDpM+NGTvv2qNPekGGyj3szKbe
	bWYh4TfXNTSTplfbpXbfokxRpQAoAXsXPXzJydDlsuBUDIwsGbt+j2giRE9GLUAOACDonT1x+Z/Ig
	g1KGzo+Ub9Vyldifou4pnefSI62paOoH9qK4uyciaJriZAistYbM1TC7fQf8RpYMc0qguhphWFGOC
	2hw/ITEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfrD-00000008lfe-0Cvq;
	Wed, 04 Feb 2026 16:35:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfrA-00000008lex-2jRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42D924080F;
	Wed,  4 Feb 2026 16:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FF2C4CEF7;
	Wed,  4 Feb 2026 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770222955;
	bh=b55cNPA4UGm1kxxCOKwyiRzZZe2Dcu9HtwMc2LpvfLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdEqR/D8vYsvP4rOW71wItbb4oS4aFlgB+qyvn7nTUo+JeNwh7I0tnFqFyjcxZwx2
	 WB0osxKOIDqxIrOnK4nxlAsKiT3jUq/qbXglmiQv+0Jc6yfnh6yDZNR03CLkNRab7w
	 SHifqoYmKygeQ8mK69u6RF0mKToO63c6FphTJ2gtutGullcqYtatEaqz5mR8Zcn0Kn
	 uGcItP5wFZOVJWjpjFHlkK320iTrghzE1FG5wKgGVh1k5DOLK371uu1+VaS82Rf26W
	 QdKz+KQC/gk9kXBHI9V2rx8ZO5Z4LgFEDivKOGKUKUI803XsHExmBjk8CtDxWukK+L
	 tYAKKAe6SEKbg==
Date: Wed, 4 Feb 2026 16:35:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: arm-mail-list <linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: inconsistent SME2 ID register fields confuse kernel into
 reporting but not enabling it
Message-ID: <bbe45492-0e97-4396-be32-6fb3f990c122@sirena.org.uk>
References: <CAFEAcA9yyLBa1Hp-2CrSsHBOBcGKSg6Rr3uvfZPckcRsTXDC8w@mail.gmail.com>
 <6731ba86-cd65-4d5c-9ee2-55aa59094eaa@sirena.org.uk>
 <CAFEAcA-FhJtBerdCwHoL5F3nuN5beC=44ZfK24xzVDENRMFfkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZNq325WdrAIzeCwP"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-FhJtBerdCwHoL5F3nuN5beC=44ZfK24xzVDENRMFfkA@mail.gmail.com>
X-Cookie: Are you having fun yet?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083556_710709_70E0CAD3 
X-CRM114-Status: GOOD (  19.47  )
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


--ZNq325WdrAIzeCwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 03:54:05PM +0000, Peter Maydell wrote:
> On Mon, 2 Feb 2026 at 18:01, Mark Brown <broonie@kernel.org> wrote:

> > We do have some cross checking of ID registers in the kernel, though
> > other than big.LITTLE consistency it's fairly limited - mainly for cases
> > that are architecturally valid but unhelpful (ID_AA64ZFR0_EL1 indicating
> > SME features on a SME only system)

> Hmm, what do you have in mind there? I ask because I was just
> working on this for QEMU and am wondering if I misinterpreted
> the Arm ARM. My reading of the definition of ID_AA64ZFR0_EL1
> is that there are some features that an SME-only system
> *must* report there, as well as some fields which are SVE-only
> and which an SME-only system will report as 0. (I agree with
> the description of this as "unhelpful" -- it would have been
> clearer if SME features and feature levels were exclusively
> in AA64SMFR0, so that an SME-no-SVE CPU reported ZFR0 as 0.)

Exactly what you described there, leading to the situation where if we
just set hwcaps based purely on the value of ID_AA64ZFR0_EL1 on a SME
only system we end up setting SVE only hwcaps and potentially confusing
userspace into thinking SVE is supported on a SME only system.  This was
the case for a long time but was fixed by Marc in 064737920bdb ("arm64:
Filter out SVE hwcaps when FEAT_SVE isn't implemented").

--ZNq325WdrAIzeCwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDdWYACgkQJNaLcl1U
h9AVKgf/XxgOqs859IjjBGLpOTG2nTmHeYToLO6qelNxZ2Ti+sH0wbR22HKoFEFn
F8sGNv26gxXVgneZqlexDyOi4uSkwgiNLSUkmT8Q54Pn3prVcOVcK5F771a7Cx99
NQRlb1fYoF2nP3TpnkkYRsnwCNkr+Uev8tswe5wEpdY3EdvUHy68qakpA3uNC8AD
cFq58LPKu8eHZow7M0deroaySpmodesliXBcCiIU6Y6cAtaPzxkD6yuxr+d8hWRB
9WQkXBE/gsIDj2TmRDBQZKz3LSyUM7IiQjqx2kNB+zlxwshpY3D4koWBm5LA/HkU
ItsLaIMbt4dWhOraVWDmymYGv1K5dg==
=ySWK
-----END PGP SIGNATURE-----

--ZNq325WdrAIzeCwP--

