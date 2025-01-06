Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2446CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psZSmkilvcDdXohdN3+BmnbDzvJ1EVoZ2W73bI7eFpY=; b=jVSjdf+QqdCIDgwz/2lVCV4PAf
	NGZ2klYXifXs0fehsIqzk39cJYKRDqWyMWXUCxdgryFHgAgQpK3d6bqa3Mu53jNfk7d2e8dIjoqfS
	KutKGPu6JgfcnjZZ0uhaFAJvWwymjbnPV1IoeTGlDWRe1mLEUqpK9/yWfX5d634X6pvjlQK0lpAF2
	/0ag2ltTkme9/vilRW59/AB8i247gyNI4PVEulcws1cKqQOxUeAyTNYU23CSyqM96Pj1kXW/rcpH2
	3QgFjylmqtKXSAgXqOr2f+sd58hpccFisus5ne+LiJtBJJs3/69EWuccOdQCsPtWVyoIynkCCm0mK
	7lJthqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrWL-00000002Dvy-0gNw;
	Mon, 06 Jan 2025 18:08:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrV8-00000002Dqr-2znE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 18:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B929B5C5FBA;
	Mon,  6 Jan 2025 18:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4346FC4CED2;
	Mon,  6 Jan 2025 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736186813;
	bh=IYBstVCYrspgWhZSdpjgcQcvE2+H3d+Eb8ozdPQwSSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIIpyGYg4A0HSXK+GbaXaVsI7rlmV0ozDlF6Uji2MoYBbeY53IbCAbjABtlxuA71m
	 RrFVPwDkpoHaHT7BTIJL7ruVIy964XL03t8P22IJn3ZhWtsoO1wMh+FleuJYbTpxkX
	 et6dswvL7KrgmABKFEBnUt2h0HNjCXAkfdWcU1V3TBv+u5tmV/hmMgxHTPEEEkJhpm
	 PcMGpzTwnJrvJrmfKPVNTUhyncASpV2TYDqipsDk20jjo/2NjWd1DkEhDZhdfvO9Ko
	 iR9TQw4XSIV3wDmzyHLtWDrCQrvFVpdY0CN7H1aeULUiouaPRhfgYQWgH3scfe69ic
	 SF0pmz3l16ZDA==
Date: Mon, 6 Jan 2025 18:06:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] arm64: Add basic JSON register parser
Message-ID: <467ffed2-933a-4f45-8802-3b799dfd6753@sirena.org.uk>
References: <20250102144339.1564778-1-maz@kernel.org>
 <63543c41-607e-45cd-9266-a60838ff233e@sirena.org.uk>
 <8634hvq50l.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PQfbZOQezoF/RsuD"
Content-Disposition: inline
In-Reply-To: <8634hvq50l.wl-maz@kernel.org>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_100654_794459_2825F259 
X-CRM114-Status: GOOD (  23.02  )
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


--PQfbZOQezoF/RsuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 04:30:18PM +0000, Marc Zyngier wrote:

> The moment you use a general purpose language, you end-up reinventing
> JSON in another way, and I didn't have the courage to do that. Also,
> jq feels like an exotic mix of functional programming and Forth,
> something toxic enough to be irresistible.

Yeah, it's super neat for the inline processing stuff.

> Mark Brown <broonie@kernel.org> wrote:

> > then we can hopefully use that for things like diffing two architecture
> > versions while handling cases where we've intentionally diverged from
> > how the architecture describes things. It'd be nice to have something
> > that'd go through and check for updates to registers we already have
> > mapped and provide an updated sysreg file.  It might however just be
> > easier to use something like this and then work with sysreg files using
> > text processing tools.

> My current plan is somehow different: extract all the trapping
> information for each register handled by KVM, and *automatically*
> generate tests that check that KVM is doing the right thing. Or rather
> convince someone to do that.

> Then get rid of all such manually implemented tests from the kernel,
> once and for all.

That would be awesome - there's far too much stuff needs typing in
there.  There's a bunch of these places where we either already use
register data or could use it if it required less typing/verification to
do so, the ideas I mentioned were just the first things that popped into
my mind.  Having a reliable machine readable data source for this
information is going to be *so* helpful.

--PQfbZOQezoF/RsuD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd8G7gACgkQJNaLcl1U
h9BrgQf/bv5vWOvyO9cU7dNIbkh1TXkpAgkTON9IqDitBobS4uT9In8Kp5yTUbgs
4B9Tly5vaLM1hfCCU8Nyy/UnPqqG8gKyS330oSkdHsBa1nr5n5aJXcgXqRznrj1E
/kWGSiG3QXPNwe69C3GL2E7FY8LAu0dMCKAL1IBlpz8nV/rhak5yR4f6gNxinn5O
BDO6JwH/UFIO3KctwS1nrX9cRCeXpRs6NAA5dnlSz0a2udt3rxRuTatn7GSzt/4u
lfnEsI/+3A4cBPBFHx22t7MpeiJutrHWAoraKuM2LDm0mpqEomutaJKqXysiqA7Q
vZPXjHfAKBklRMThzbMMnwG8B/XicA==
=/UTO
-----END PGP SIGNATURE-----

--PQfbZOQezoF/RsuD--

