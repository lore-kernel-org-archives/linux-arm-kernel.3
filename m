Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44E4FF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33SrgSFM5oKuf+EtGfQ42X1hrddtM4xaF+17DDZ0WQA=; b=ljqB2Ipq2X1udYb5GrL2YXoFvv
	ne37RLKfyuitf/6Pfc7HVWfLaL+nRv+t4wq4qtsWoTOcGaenIC5dYjRGyC6CXXRaHVAbx+4se2FPa
	M+y0CvkMBTjMR3vhRvUx1tWc1JHWMEtCoZp9DNnAI8cg7rBdu56DT4GxGmwxaHuMyq9BO/RIme8Nc
	WIxfkuHaSSWU/Gtcc8/hCy1fZun+zxentUgkPx6nyXba8dgC2GMer/QiimTb29h6gSnedfeVSAmeT
	w1QirOz/eg7rDzLiIJ5n5fqffiaqOhPLXwL4OGcDxYS50nLUffCs7NEjIqELqqAry9qjZi/rZ17eM
	6czlASuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UhR-0000000CcxR-0OF2;
	Tue, 31 Mar 2026 08:43:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UhP-0000000Ccwu-2QyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FE7F60145;
	Tue, 31 Mar 2026 08:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC60C19423;
	Tue, 31 Mar 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946596;
	bh=5rouBpWCbG9UoNdZ2vpMLgofqK8ufoMoBBsc7BuxqyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkDnYVFd9BXu6hp7sGrVjkTVKvXZyBIREQBbQFsGO1X9QHoFFrZYb8fVTXY/schZ2
	 5h1d0PpG0QmAMd/ZI/dKW+LlkeDvN9r2s63KsuJGSycdCWDfl62BLb7RlhNaJAG40r
	 gl3CW0cyl2KZpHsFplSbZD2cu1vVEPgGzm7wdE36Ftc0WRaF1Lf+RfiMwCbtssppfN
	 nFlbuoVSzX+zyFh9RHCeE8TuFCQPu4dg9+q5tIUpYpDALb/1XER8SxB6Q/xz44xWLf
	 jnQ4ZfyAJU449MFc3tmGaxhgiAJyMVAj3H1Cgod4Pfxrz/vQozTuqfBCSP4iagBdqC
	 9Edpt4J+vWgSg==
Date: Tue, 31 Mar 2026 10:43:13 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <acuE-URAuRvmtd4u@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <7b9bc5d1-7a1d-456c-b280-5f4dc969609d@kernel.org>
 <act77WcvwYedN0Q8@orome>
 <e5327cd9-4aa1-4e26-b748-dd1af29e6fdb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efltvkno4xbepiec"
Content-Disposition: inline
In-Reply-To: <e5327cd9-4aa1-4e26-b748-dd1af29e6fdb@kernel.org>
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


--efltvkno4xbepiec
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 10:00:01AM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2026 09:53, Thierry Reding wrote:
> > On Mon, Mar 30, 2026 at 01:45:24PM +0200, Krzysztof Kozlowski wrote:
> >> On 29/03/2026 17:10, Thierry Reding wrote:
> >>> From: Thierry Reding <thierry.reding@gmail.com>
> >>>
> >>> Hi ARM SoC maintainers,
> >>>
> >>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5=
b5f27f:
> >>>
> >>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-7.1-arm64-dt
> >>>
> >>> for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab390=
30:
> >>>
> >>>   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0=
100)
> >>>
> >>> Thanks,
> >>> Thierry
> >>>
> >>> ----------------------------------------------------------------
> >>> arm64: tegra: Device tree changes for v7.1-rc1
> >>>
> >>> Various fixes and new additions across a number of devices. GPIO and =
PCI
> >>> are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowi=
ng
> >>> it to boot via network and mass storage.
> >>>
> >>> ----------------------------------------------------------------
> >>> Diogo Ivo (1):
> >>>       arm64: tegra: smaug: Enable SPI-NOR flash
> >>>
> >>> Jon Hunter (1):
> >>>       arm64: tegra: Fix RTC aliases
> >>>
> >>> Prathamesh Shete (1):
> >>>       arm64: tegra: Add Tegra264 GPIO controllers
> >>>
> >>> Thierry Reding (6):
> >>>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
> >>
> >>
> >> This is unreviewed/unacked binding where PCI maintainers had 1 day to
> >> react to your v3.
> >=20
> > Rob gave a reviewed-by on this about a week ago:
> >=20
> >   https://lore.kernel.org/linux-tegra/177440189257.2451552.181961018302=
35626115.robh@kernel.org/
>=20
> Rob, although knows a lot about PCI, is not a formally a PCI subsystem
> maintainer.
>=20
> >=20
> > In my experience the PCI maintainers typically defer review of the DT
> > bindings to DT maintainers, so I considered Rob's R-b sufficient.
>=20
> Sure and they acknowledge this, that review is done and patch can go
> other way, with "Ack".

No they don't. The vast majority of the PCI DT bindings patches are
indeed applied by the PCI maintainers, but for those that aren't (there
are, admittedly, only a handful over the last few years) there were no
Acked-bys from the PCI maintainers.

> Where is the Ack?

Again, this is where your rules start to fail to meet demands. As it is,
the only option that we have is to get DT and drivers merged, then wait
for an entire cycle before we can merge the DT parts, otherwise we break
DT validation.

> >=20
> >>                   Maybe they had more time for previous versions, but
> >> nevertheless it is also part of other patchset, so it will get into the
> >> kernel other tree and nothing on v3 posting:
> >> https://lore.kernel.org/all/20260326135855.2795149-4-thierry.reding@ke=
rnel.org/
> >> gives hints that there will be cross tree merge.
> >=20
> > Maybe look at the cover letter:
> >=20
> >   https://lore.kernel.org/all/20260326135855.2795149-1-thierry.reding@k=
ernel.org/
> >=20
> > I clearly pointed out the build dependencies and suggested a shared
> > branch to resolve them in both trees. Given that the bindings were
>=20
> No problem, that's a valid solution. Can you point me with a lore link
> to the shared branch posting (these tags/pull requests must be posted on
> the lists)? Or to an ack from PCI maintainers?
>=20
> The commit itself does not have an Ack, but maybe was just missed.

Yes, the DT bindings patch does not have an Acked-by, but again, I
didn't think that was necessary, especially since we were going to have
a cross-merge anyway.

Here's the PR for PCI:

	https://lore.kernel.org/linux-tegra/20260329155040.1448158-1-thierry.redin=
g@kernel.org/

Thierry

--efltvkno4xbepiec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLiR0ACgkQ3SOs138+
s6G4LBAAgGRxK+lFtOn4x21DEpRTkr34pM8znEkHgV4Cz3p3BWeDHApam1q3P1f5
+HAluqpvvDgbSK1xgAnYcChoB90//J4vmGmP5hVWNni+3lg5/LSfywTYLF8TaCbL
mn7grnLzl4EJiDyCsRGhFp89lWkDPXYu3WT3ZZqHoLovfNWhw4tl7PANDtwfhjnZ
fIg+b8Apg/jegTZTXuhA8AvB6mQquUgoBKDYhhoFX7657SL43ZYB/SPrTbPcIJu/
0TlOjOD+yd9aUCE8o3u10WdzQtCmeHAS2O+lG6UYpJBRQqzfWySMuL/Fkr2XsaEf
Dsmglp3t1HYv5ksIHklmDwP/Z1/0TpJxIIiEe8uVLaGmB9USIFE1QUwGIAtzFB4z
8aPJnCLqLtevCZiLK8LQiusxx2WOoykEZrTjQTu2wxJlOVF0NCEbHHCL+BDFpdoc
C9+KlFbfTfyYzXqY9j3i4sprlXjkBm3812lzCrf4StDGNI8uo+Z0TB6rY4qC0/Vn
5+wOpZqr7TvAUXark267/ZlZfwQgwETuDWYt/8SLMqLupYYSQ9qjNOSfx9UC4Wbr
rqjQuKtCguBpof8MQFcMh35okMBqAdyfqIQwbSraW5Fa+0y21bAjghiC183NFyVy
fMZStfxWvo3bYmUffoVnRYON9uXN6lSTCIdA20vx7lTVoQG9REI=
=RrIw
-----END PGP SIGNATURE-----

--efltvkno4xbepiec--

