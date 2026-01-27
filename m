Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91021D2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiwzb3Kd4GaoYhZC40kyu9KY8tSClogbdJZYCenQQk4=; b=diM4rOrHSj+VZ1OSLUhfmtqrH0
	+G6D+d6iW/6xW+Uc/Y0SDL0p6I+CLNqDBs7PWGLjid0LIFcbhXsJfiNNqGpk2xXqJxF3svf6AIqk1
	f/3+IG1XrVaillBIPOd5dn4GAQ4EHAmgsKn2EZY/jbIzOkewPnXccEWcl4Nyg99rMH2JHuq/J/Gsc
	LdChgjDzIcC+Y7WLMcO1s9q4Ms3Zyd2SDKt7F2X6rYI9vkO2zvZNWAastq7GuEarGdb/Ux8Tx6POO
	lCP9gDZhk8rE9/iB3wpsxNobUQ9qpUvvDZ9hqmbAj84B1/QHpCXW2xH9p5Lf9qiFwwxskVg5zMesq
	yaOtlqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfu6-0000000E0nw-1yow;
	Tue, 27 Jan 2026 10:02:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfu5-0000000E0np-1C78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 837B7600AD;
	Tue, 27 Jan 2026 10:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC902C116C6;
	Tue, 27 Jan 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508152;
	bh=HWNG6t4bLDI150f5FrT5PWxgTiyUBMXs8EoDIcMXM94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLjZAn62EoTrUYXfPb3/szKLY14XSI7jYICGN+szXRBoI8LBYMyPjn63t75jStVAI
	 m3Ep9160QTR+/q3tNhOqfmOhuTzWdpWk/xxL3DIivngIBoHIp2aSj32tAUUVtzER/Y
	 7L13kalhXya2ouDBTnpCK9CKAJ3fFv5b6EkFkOzFBP/9i4vDAufQQvuYLcplMORMwH
	 VOkR8UoLubJJqwaeJF6i+or+6t1Gi7jjusQEWqr8PqOUhl3c6Tt7ogp9m2n4tthd0y
	 /NaktrbYcDvOPXtUpF6//YQn6hHXf+X17ukxVX/WbXeyn0jwLcoGm8n2YiQse4fLtX
	 TQcPctB8h8S+g==
Date: Tue, 27 Jan 2026 11:02:29 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiK_37WeNBrB037@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chtvw53wng52x7jg"
Content-Disposition: inline
In-Reply-To: <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
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


--chtvw53wng52x7jg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 08:47:24AM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2026 09:03, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027c=
b1e8:
> >=20
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-6.20-dt-bindings
> >=20
> > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> >=20
> >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:=
58:18 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v6.20-rc1
> >=20
> > This series updates various DT bindings for Tegra architecture,
> > primarily focusing on schema validation fixes and new feature
> > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > legacy warnings for Tegra30/132 display and VI interfaces.
> >=20
> > ----------------------------------------------------------------
> > Ashish Mhetre (1):
> >       dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
> >=20
> > Charan Pedumuru (1):
> >       dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema
>=20
> This should go via MTD. I think Miquel is not ignoring bindings.

I think this was standalone and hadn't seen any response from MTD, so I
vacuumed it up like I usually do.

> >=20
> > Jon Hunter (4):
> >       dt-bindings: tegra: pmc: Update aotag as an optional aperture
>=20
> ...
>=20
> >       ASoC: dt-bindings: realtek,rt5640: Document mclk
> >       ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> >       ASoC: dt-bindings: realtek,rt5640: Document port node
>=20
> No, Mark always promptly picks up bindings patches, so I do not
> understand why these are here. These should go via subsystem maintainer.

There's no clear pattern amongst subsystem maintainers, and given that I
make a final pass towards the end of the -rc5 week, I will usually look
at what patches haven't been picked up yet and apply them, provided that
they have a Reviewed-by/Acked-by from a DT maintainer.

In this case I missed Mark's reply since it was posted to the cover
letter and therefore didn't show up in Patchwork (I don't know if newer
versions of patchwork track this somehow, the instance on ozlabs
certainly doesn't). I'll work on a way to better track this.

> > Svyatoslav Ryhel (2):
> >       dt-bindings: display: tegra: document Tegra132 MIPI calibration d=
evice
> >       dt-bindings: display: tegra: document Tegra30 VI and VIP
> >=20
> > Thierry Reding (1):
> >       dt-bindings: memory: tegra: Document DBB clock for Tegra264
>=20
> And this one was never publicly acknowledged that you applied it and
> lead to ACTUAL warning/review comment from my side postponing your other
> patch.

Sometimes I forget to send out acknowledgements. I haven't found a good
and reliable way to automate this.

> If you took this patch for DTS, then it must be on the DTS branch BEFORE
> the DTS uses it. There is explicit rule about this in writing bindings.
> You even sent it like that, look:
> https://lore.kernel.org/all/176856655186.139432.6919318227218814446.b4-ty=
@nvidia.com/
> 1/3: DT binding
> 2/3: driver
> 3/3: DTS
>=20
> so why a correct posting you would disorganize and break the
> bisectability rule by applying binding separate?

As I explained earlier, I usually do exactly that, except that I keep
the branch separate and pull the dt-bindings branch into the DTS branch
as a dependency. I might have missed the dependency this time.

>=20
> >=20
> > sheetal (1):
> >       dt-bindings: dma: Update ADMA bindings for tegra264
>=20
> Vinod also picks up such bindings. If this is for DTS then should be in
> DTS branch.

Same as for the MTD patch, there were no related DTS or driver changes,
and there was no message that this was applied, so I picked it up while
I was going over the list of pending patches.

Thierry

--chtvw53wng52x7jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4jTIACgkQ3SOs138+
s6GOuA//Z7nPcCe2ob7LORQw5yKFtcUUnwdDMBeVFsCE1a3KEHFowGkX54Mu1HSp
NP3w3HlXWRrLz/a1/qWJ8A3bHN8l8oMM/ygXx2HfWJKLSyb+nA3eI2WoMVO8OBLe
Kbl7h+Kaq2opo35jKxFwTGqIz4+UWWFl4nb41DqRv1RMSH/07+7Vu2PtPDoLYs4P
3PsAp2nGNyLTpmzJ5HhKiM8srRybBUDxMc9mfHQ3qfWRyZIasupVMcJzAqJ85t6y
ERxQmiR3Bc31IM//SgPd4UMsAu4+h/aZiZs6dLC0O3p/p2pTHpcFYIR+4VCjKboZ
RyVWARDqCN1o7X+h4QOQry6INnfYRYVv8ijxeCafkss6d8PPtmnJuX3bQ9VYWSp9
xDq8TpYPvaW/3l6FqhOdyWqLWuY0HW2vW0b6xmiMEk8uApV34k6i5vRXt50CiBNV
uIS+FyCtZgoYhcfVFW4KU917ZnzybZ+oeF9R6JBaRqf2idxPpp2P0PK/NA6e+xYo
aml4iH3DNlqcoEbbF0Tb+lI3/M5aSzBTXSOo7HoI1OMiGTDET88FEWUcozfSXPq/
yVrAEm8MaXKHvbrEt8Oow1xNY+VZWJvSZ+fiivPqza955sehlypypmtKL8jLCkYR
ehoM5cykwJAXRw8ZtAnLT4R65dbMUSPUO/ESUubark3uruhXXoc=
=qz6T
-----END PGP SIGNATURE-----

--chtvw53wng52x7jg--

