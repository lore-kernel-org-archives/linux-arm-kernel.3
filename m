Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E5C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB96pS2lXgKbRferXQ6MVjY4lTebWD1sRvTJ4mcNWqk=; b=E43MzjHAQydpFflnUm+65zQlFe
	r1kNLEaRIU10Hk2x502PemKaHonBA1cAvfDm2Ou4MNyH/Nzj99Tzn6eJRnBfAuqq+1YnJ7aYWfMTj
	k43D8XsUi83PR3zHEf8ooXDO6pft4Jcma1C6ajw4h2lyNBvsVVDCyqQ7XrJe/YFC1nqc08uAiNf6z
	cH9FjgW23P64YC7axBwMT1VmXjzj/PkH+PpEb1U5dfP0DPxNR6axO4wmoOe8F2LfneUYobRlZ0NNA
	4lUYp5BActzVC0sUx+6Y/JQXsRLzFAzENUN8EiyRjsZ4Nke0SJ/y0mXY+FfSLcQf/SMiRcFjm4txN
	I3PYnbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yBV-000000057d6-1vZd;
	Tue, 22 Sep 2026 10:57:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yBT-000000057cw-3wYh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:57:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AC4B601F7;
	Tue, 22 Sep 2026 10:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502211F000FF;
	Tue, 22 Sep 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074630;
	bh=UB96pS2lXgKbRferXQ6MVjY4lTebWD1sRvTJ4mcNWqk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Rq2lHonwYPyCf0LLYZb2zrrKIpjLsvWXDigwiH5+Vfw1oOnTbWsoaDFGlnn8yAkKl
	 YBtUcTcqQ6S8bDc3xrwMdxRk7g9MqnsSrnTti5Dv9matZxJl+3v37KxReqYELKuHDT
	 A1MxyhZaHxRuSiSDIeTSL1yOggks0CmlBEhGuKS4phKSLfzIhy3hGLXx6xuX+3To7F
	 T9x32aqA7aV1zpniyrAHl0cauBnGJ/2lkq80honi2zzl31bFmeIdOGlZPLa6tk45uH
	 Jpok/CVRDPvfYy5nB+eP3YDsKHSCeV01tKRv2gnUbIm2pKCzR/BdcVSsa6x9ymPLQd
	 cuJMpvaYGHv/g==
Date: Tue, 22 Sep 2026 12:57:08 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com, 
	will@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, 
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com, 
	ardb@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <arJcN60nagFKXj2Q@orome>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d2bniudpfuafwp74"
Content-Disposition: inline
In-Reply-To: <arIYtjmSKCs14SqO@sumit-xelite>
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


--d2bniudpfuafwp74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 11:27:10AM +0530, Sumit Garg wrote:
> Hi Vincent,
>=20
> On Mon, 21 Sep 2026 at 12:00:42 +0100, Vincent Donnefort wrote:
> > This series is a follow-up to the discussion that has started here [1].
> >=20
> > When memory is lent to the Secure world via FF-A, CPU speculative
> > accesses from NS to the lent pages can still occur as long as it retains
> > a cacheable mapping to it.
> >=20
> > Ideally, lent memory would be "no-map" but that would mean giving up
> > MiBs of useful memory, so let's try to do better with the help of a CMA
> > pool.
> >=20
> > On arm64, modifying the direct map at runtime is generally restricted
> > because the linear map defaults to block mapping and splitting blocks at
> > runtime may trigger fatal page fault, unless the CPU implements BBML3
> > or the entire direct map was mapped at page granularity from boot.
> > Forcing last-level mappings system-wide incurs a severe penalty we want
> > to avoid. Instead, this series introduces targeted last-level mappings
> > for designated memory regions, along with the "arm,ffa-lend-pool" CMA
> > driver to manage unmapping and remapping on lend/reclaim transitions:
> >=20
> > 1. memblock:
> >   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific=
 region.
> >=20
> > 2. set_memory infrastructure:
> >   - Introduce can_set_direct_map_range() to check if a specific address
> >     range is mapped with last-level entries and can be modified safely.
> >   - Introduce __set_direct_map_*() variants that bypass redundant checks
> >     when the caller has already validated the range.
> >=20
> > 3. "arm,ffa-lend-pool" driver
> >   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
> >     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
> >     when reclaimed (ffa_lend_reclaimed()).
> >=20
> > 4. Optee support
> >   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" f=
or
> >     both SMC (via DT memory-region phandle) and FF-A (via
> >     ffa_lend_pool_attach()) transports.
>=20
>=20
> Thanks for your proposal in trying to solve this hard problem of
> unmapping pages from kernel linear map. I remember discussing this
> problem last year at LPC too.
>=20
> Have you had a chance to look at a more generic MM proposal around this
> issue here [1]?
>=20
> One of the major concern for me with your proposal is tying the
> protected memory allocation to fixed sized platform specific pool size
> based on DT. Then the cost of granular mappings/unmapping if the
> platforms choose to enlarge these pools.
>=20
> As you maybe aware one of the major use-cases here for protected DMAbufs
> is the secure media pipeline use-case which is memory intensive
> workload. IMO, the solution proposed at [1] seems to address it although
> people have flagged rough edges there but should be addressable.
>=20
> Can you try a port of [1] for arm64 since the author did all the work
> with x86 as reference?
>=20
> [1] https://lore.kernel.org/all/20260726-page_alloc-unmapped-v3-0-6f5729a=
a9832@google.com/

There's a lot to unpack and I'm not sure I fully understand all of it,
but from reading through that series it seems like the primary use-case
is to allow things like alloc_pages() to unmap pages from the kernel's
linear map. However what Vincent is trying to solve (and there's some
overlap with the VPR work on Tegra) is how to remove pages from the
linear map that are part of a fixed carveout region.

I suspect there's some overlap, and we might be able to reuse things
like the folio_{zap,restore}_direct_map(), but given that we already
have a set of struct page objects, the two approaches seem to be fairly
orthogonal at a higher level.

Thierry

--d2bniudpfuafwp74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqyXwEACgkQ3SOs138+
s6Fsgw//dlQUJrbDWiXuqxe3GRzKuh4gFS8vuMFfMkbYyeXhcsFi2RHH2NVZ4O/0
7E51l7U9VQKmCvcjTzd4+9m47q3h2TskmNQsMA1vWWQDFKOWrbDw2yL11vSqZ90D
hcquJSGds+Gu8eaJFKONeIxfUmuGawtaqTl1JtehYNaN6wur68zTbhS/dkDD4OrZ
9MCyUlhaLPSfadqpBQSLucmYM5GhSQikGcqIJMIYkP7kd3HgWfr0XlqW1+tN3PjO
MzP9sBX/LMW6HrsGa1CJNMRSaEhldJ9JFoNaIFyIBiN0+L7UBUyFlByNoFuatUqn
NAQsB90d2EuSmo5zz5zmeuoNGhc4k0jO6i8YS3zVmeL/eIWg1ZbifIm7FTaNB8iX
DMs9aq3ovYnbfGOpOOni1Z5BWz6LD4+2WG7bnOVXhKIWE6wOLG8cW/nTEt6hZ/xA
6wY+TFrZMoIRCOREqxTbz+TImFkTuF8OS4ZIo812FNBgUcGQu9nfbTzrebUs9pGY
bjieIqRLmuyXIXHDayd1NcnmuIxN1OgwzIJO5CQvG6yCJ1sk6DVrgODmKed2Nxoh
vRm9IRG6yWGxpf3DeQmUvHd4ZRogSpRfQ3713PrxjnIj9WUO7fs8yGq6F5xHrmMb
FlXPgJng4yDFZ0eb9bKte5N6yvKoTI8e4jsUD1NL7y/YNh6lWy4=
=42dx
-----END PGP SIGNATURE-----

--d2bniudpfuafwp74--

