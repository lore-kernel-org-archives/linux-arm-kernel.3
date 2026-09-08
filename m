Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C78C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC952bHmiBBRZiJqd17i/7x1m+YVL1dngpkL95OZce4=; b=HzEDQFkBpTMKilylavF0zAuQtK
	V1L67IbaOqbV5/YEyWMzxaWP2+18NFGGrtUb0JbOAavA0rExXZW4mMtx54IGqNq68PwtZJFLHpQEn
	oa+yidjym0y2U7FhiMsmgvSxV9BY0oVNIon9BCSAQogPlaHz/3i8vJ4LNdt8VPNU9NxUffsv2J6Fd
	/1TFw94+PTqehxRiQsxOjfXEjOzGblOA7Wh3KTMGF/xkRGOIGyUoxD/YZ8LgKL9kPlJKIEtR56nVj
	HNu8bD5FHPx1muzYySDttfP0fNAfMPeuwbJ+0UfJHQ2zlqwuIHEhqVZt5BuUDkC7CgcujsL1Cod6d
	jC4HUsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ryo-00000008Xm6-1d6e;
	Tue, 08 Sep 2026 09:19:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ryn-00000008Xlr-0X36
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9982D43A93;
	Tue,  8 Sep 2026 09:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB201F00A3D;
	Tue,  8 Sep 2026 09:18:59 +0000 (UTC)
Date: Tue, 8 Sep 2026 11:18:53 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org, 
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org, 
	ardb@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap_RRSM7RBONvHaR@orome>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
 <ap-74AkHSGXbFCF_@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajtkrsfbue5mdrla"
Content-Disposition: inline
In-Reply-To: <ap-74AkHSGXbFCF_@kernel.org>
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


--ajtkrsfbue5mdrla
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
MIME-Version: 1.0

On Tue, Sep 08, 2026 at 10:40:16AM +0300, Mike Rapoport wrote:
> On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> > On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > > Keeping last-level mappings is interesting on some architectures as=
 it
> > > > allows mapping/unmapping pages from the kernel direct map without t=
he
> > > > risk of splitting blocks which, under the break-before-make rule, m=
ay
> > > > trigger page-faults the kernel can't handle.
> > > >=20
> > > > However, mapping the entire direct map at PTE-level is costly. So
> > > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the sy=
stem
> > >=20
> > > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> >=20
> > The idea was to have something close from NOMAP, to emphasis it is one =
or the
> > other. But PTE_MAP sounds good too.
>=20
> Could be PTEMAP if you prefer.
> My point was that unlike PTE, "LL" is not perceived as last-level, it
> should be looked up.

We were discussing the concept of enabling entire block mappings to be
removed at once from the linear map, so at that point "PTE"MAP may no
longer be accurate.

I imagine that in some scenarios we might be able to go to PUD mappings
for something like VPR (say systems with a fair amount of system memory
and we want to carve out 4 GiB for VPR, split into four 1 GiB chunks).

Thierry

--ajtkrsfbue5mdrla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqf0voACgkQ3SOs138+
s6EFrw//chVhQxMWtCxc+JK5ON8AveSiC1Dhl62Q8IhDi1Pr5AWMxC7K8li30qSy
0r+vt3im7cyLAkLE4+kAZXtHcCV1288tZZErEnuotKkDkGDaDExBqr5yHlPseVq0
2ekvvxz7mSRh5Wfxn5Tq+MYQcwUYACknVRhGjuplsa05oSZA7GWbViEHFVP25/Pq
14BkCYqXXj/NfSceq84ukKSePfpEG9Jrmnl7Ey73eyGHNeRvziLQC7qd9MuHwiqp
Jn9Geb830b3ufqnZK23k5BuEp/+lAGTkflZGTlEM5A6yTIEnvfVtpimFwGtHret9
L0HZ/xg087+Wj7Kdgu/VjdftAzj81qqnKT8dpnGWH4SwsTLtcRDqxpNZatKlVJsF
NJG1Q8yBEtB+KIIiSK/00K2im6bSroJoGbTljdLQVi/hjBkQuDHtugvyyycXYc5y
cLPWS6i+0eG+IWvM+wGH7zWT9kvJeyYWh8jH4qk/J0sTkVlz5IY25AOerpGGdx4S
slR0PSPzLmGm/uHHm6PpuJK8vjqKJkGmsLiXQ5XkrUgmOG8EkWHG9Uzx358zDsQg
AYe3yJ0IiuCS2fketV+KzHy7VqFU3tC9kgkyrIO3PJSJLSVSeTVFNJ3WTUJTEBBb
ztr3XvA0Jm7feoWXZzfW9fwBYnq+5ey+M+KDQ6qsCZGpgY7FCeo=
=5bgM
-----END PGP SIGNATURE-----

--ajtkrsfbue5mdrla--

