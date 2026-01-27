Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE5BD2D8DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ81IiPYrQXDGtzL2McmgLf7a6F5SEWyTDwzthxfSqQ=; b=ytbpThAU2Mw5vBJnbyfkQUC5Ja
	l5v7mNIBzsnLcEUN7SsRyyQMcTqFNB3G7eWFJ+FLGnsiROQh2RF1l6LjvJBrZSh71ZbjUTJCinoV0
	7yy1gX/JOrbgOCnUKraa5uSrS+kKlWN3lIBc0t9ecIbVNsXqZ4VzFaENaDCYW54QTHjuuZk3J9lNT
	CVgdjpx24E8YEBq3/g0FA8mgcn2lI45YViYMwuU7X0W7RHKEqfqdVkWvuhitRfW3/U/EAf4udgu0y
	B7CygzqLPiuM/HAiUB7i6zMWZng/KKSsfowmaaWzjcyUxObr+ynnq2XHvIeEHSM4K37/N3m0LQv2n
	Hk3xu3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfjc-0000000Dzv6-19Mh;
	Tue, 27 Jan 2026 09:51:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfjZ-0000000Dzto-2ceD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ECB842B66;
	Tue, 27 Jan 2026 09:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD9C116C6;
	Tue, 27 Jan 2026 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507500;
	bh=fHNDf98UfSxZP/5620ThKlWUIXX7A+obJ7tl3F71J2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aa/8qJY0e6xOLcJGlkXtsRB5yaIEhLxJRgDjRIt77AeIOoU+yBZvFSDMePfS4/uIQ
	 Q7n4zXIUfPoGXGk8df0O9mZjh+Bw2QapijH5i4+yCJ2PwRl/LRVu94XfTia5ttLAa0
	 APU/YyYxVQCi8MT3MK2oJfj0YHvTUClco4CwSXGUDp1lbqLE6oENK7ODxshuua+YSd
	 mY758ebI6rofXlCT4W4YqjG2NzdZ2+57k2qlWxuMVbt9Jw/ueHp3XgnGacusaxp/2v
	 m129Og3jFuXkv7Kv6NW/ALo3/YsM8GXD1t5zFVCjmXwL1iC1B8XgUej5cZBKQ19/CS
	 g5BhrKLr3KVaA==
Date: Tue, 27 Jan 2026 10:51:38 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiJGxVnYxRuHIMv@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <20260122-hidden-goat-of-excellence-a43b9f@quoll>
 <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
 <aXIVmW_mjb0AdDwe@orome>
 <684526d5-f1ac-46d5-b147-1fb906ba2248@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zipssenwoagfsy7"
Content-Disposition: inline
In-Reply-To: <684526d5-f1ac-46d5-b147-1fb906ba2248@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_015141_707669_7B287EF7 
X-CRM114-Status: GOOD (  31.51  )
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


--4zipssenwoagfsy7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 08:43:44AM +0100, Krzysztof Kozlowski wrote:
> On 22/01/2026 13:20, Thierry Reding wrote:
> > On Thu, Jan 22, 2026 at 12:02:04PM +0100, Geert Uytterhoeven wrote:
> >> Hi Krzysztof,
> >>
> >> On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
> >>> On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> >>>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d040=
27cb1e8:
> >>>>
> >>>>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags=
/tegra-for-6.20-dt-bindings
> >>>>
> >>>> for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c=
627:
> >>>>
> >>>>   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 =
01:58:18 +0100)
> >>>>
> >>>> Thanks,
> >>>> Thierry
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> dt-bindings: Changes for v6.20-rc1
> >>>>
> >>>> This series updates various DT bindings for Tegra architecture,
> >>>> primarily focusing on schema validation fixes and new feature
> >>>> documentation for Tegra234 and Tegra264 SoCs. Key changes include
> >>>> correcting realtek,rt5640 audio codec bindings (adding missing ports,
> >>>> clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> >>>> YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> >>>> (introducing CMDQV and DBB clock support). Additionally, it resolves
> >>>> legacy warnings for Tegra30/132 display and VI interfaces.
> >>>
> >>> Same comment as was for Geert, I am surprised to see DT bindings as
> >>> separate pull and I see drivers were alerady merged, so I will defer
> >>> entire Tegra pull to Arnd.
> >>
> >> The soc tree used to have a separate branch for dt-bindings.
> >> Hence several soc submaintainers still use that split for their PRs.
> >=20
> > Yeah. I usually also only put things in the PR for ARM SoC that have no
> > related driver changes (fixups, conversions, ...) and therefore nobody
> > else feels responsible for picking up.
>=20
> Why these are still separate? There are few options here:
> 1. These were needed by the drivers you sent in pull: should be in that
> driver pull. It seems Geert confirmed this was the case with Renesas.
> BTW, checkpatch asks for that somewhat - you will have checkpatch
> warning of undocumented compatibles and you are not suppose to have such
> warnings.

Yes, most of the time they'll be in this type of pull request and I
don't usually apply them when they are in this category.

> 2. These were needed by the new DTS you sent in pull: should be in that
> DTS pull.

This happens sometimes. In that case what I will usually do is have them
on a separate branch that is merged into the branch with the DTS changes
so that they are separate but the dependency is explicit.

> 3. These were not needed by anything yet or they document compatibles
> already in the tree: that's the only case I imagine having them on
> separate branch. You can take such bindings when subsystem maintainers
> do not - they ignore them. 90% of bindings in this pull are not like that!

This is typically the majority of patches that end up in the Tegra
dt-bindings branch. It's random assortments of things that nobody seems
to feel responsible for and they concern primarily Tegra, so I consider
the Tegra tree to be the fallback and will vacuum these up.

In this particular case I was heavily relying on Patchwork and missed
that Mark had already applied them. Jon pointed it out to me, and so did
Rob, so I removed them. Unfortunately, I didn't send out an updated PR
in time, so Arnd ended up pulling this into ARM SoC.

Let me check in with Arnd to see if that one PR can be backed out, so we
can iron this out.

Thierry

--4zipssenwoagfsy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4iqkACgkQ3SOs138+
s6H//A//Sgq9M8Nb3DnMTwj6xOLWTSrty3XpzgLqTud6s2j5MLPaQGnmUf+FWZYI
+Tj+YToZBG2Lt5pF3kbmWjAedbfqEQX27f4XlJFuazxdQXOjjx4EjDUdhKVvJaA3
bH0JhOLOq225sLB1SqSDNewDJDxTXkc4FTrL/cevxR7hlC6tWTLtLoauQa18AYKG
wSz1nCseXHsXKWWWlFAnio6oPvIg4lN0h2AbcO6TwFUl4lWC4AID0cK3WScvmwos
j3Rj8aziEV8sFBfAHEu1pJ0ZuOlYnLg4FC/vMyhpm17zYfkk9BxO9xfguZ0i6BPI
iXlvadk93zSDqTrgJHcoHE9A0EvxSEWL40Qgoph4dPxPhZ7mZRYHBKcqT2uR0Y+h
rBx/ZXKre6zyP4uQhKpWAImFQ3Qxwkk1lrRzAT/whK0EYXpzhtUH8IMyZLFCRSBd
IEUZOHKXGM0df6JdRWuOllAyYCTIDDjMKVvZdn0uFlzRTnK7a5O/JOVbyvbpFqbx
vTyPSmIe7dl7PtE6y+lmWlia+NaGKpg2IE7lOzwV147A3X1i2wM/pVSderi5Woyj
4zXcNXZRNHty3iPtpqhVpdwkq/Zwz7nTDvcPA4PbeQchek+FOJIeIuaVphS+A4/f
zIPtw+JH92AcZIO2lZJp5ERxGb56Xf1/qUSLyZxRl0OF+ECkbms=
=QO4O
-----END PGP SIGNATURE-----

--4zipssenwoagfsy7--

