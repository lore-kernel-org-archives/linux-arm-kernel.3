Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830CFCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5BBooQ+POiDj884MIiobYfemB6cKypHIDePShLGDwAA=; b=e/xcyXrNulOzCwXuwRRPyrzVKK
	bktFIP2OhaGS/gwNlDydbDGpSPSiy2VjwtiYG29wmE1sjSeF/iyvxQAwDLn3BHdycNa2DkIzbmADi
	tK2KqY27VPTD8vxPd/Jzg600/14qVPcx53n9XojkD0zU7CqygC7wd2ButIHck+cRuTXVd1I3srXCy
	GL6BEyhThpztbJ8/qRpBE7twrvH/IBFgTDlt+GvQ9udfOikQnz9Xzb3SKRZrhxhzyff2Ut2AAKSFZ
	05Ex9qh+OqboxUoghewCn77CWZH/6jp8smdVsFf3WCwJhGnKEMnjpI6r++dLDaqtQqIj09nrb/JeF
	1hLqFTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7zf-0000000BhEc-0g0K;
	Mon, 01 Jun 2026 19:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7zb-0000000BhEF-3wpj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:08:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2CD243730;
	Mon,  1 Jun 2026 19:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AF1F00893;
	Mon,  1 Jun 2026 19:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340886;
	bh=5BBooQ+POiDj884MIiobYfemB6cKypHIDePShLGDwAA=;
	h=Date:From:To:Cc:Subject;
	b=lBM3ebbe9lmiNelN1SZsZyIQSG0p8EK04o1Wgb6+YGsr5Wg6fEIGbsm4MTlvyTPDy
	 Byr9a2TILbEzLQkx0p+KszgyZJLPSWQ0bCrhFZVeWJcseFsK17n9PN6ykzRNLYUbUA
	 Ga2vhcJ1jQ3rq/KtN9m1C6iEo+nCrTrPKDzSziboMtAhCoHpSVB6iiqbmVWnvm7Gt/
	 d+Re7CsZjqrxvgkxYeyLPeFuLe2mRQyrU7lwpezY+i/YKmGlSZ38tezYXgrdvPtLC1
	 iRb3ACgZerQ0B0QK9gVwEbKL6QicBj7FOltQmbEchNTsh4wsSCX53E2F9DkYxdT4nb
	 4MJkIULoRcV6A==
Date: Tue, 2 Jun 2026 03:08:01 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver Changes for 7.2
Message-ID: <ah3YkTZAR2GXlC3x@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VfsGAi0BIhPgGehB"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_120808_029177_62ED4FAE 
X-CRM114-Status: GOOD (  10.50  )
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


--VfsGAi0BIhPgGehB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-7.2

for you to fetch changes up to 61192938a5870ac36edae81e4775b680dcf02c61:

  bus: sunxi-rsb: Always check register address validity (2026-05-25 06:37:11 +0800)

----------------------------------------------------------------
Allwinner driver changes for 7.2

Mostly changes to the SRAM driver to allow for one SRAM region to be
"claimed" by multiple changes. When a region is "claimed" it is removed
or disconnected from the CPU's view. This is needed on the H6 and H616,
which have one alias region seemingly shared between the video codec
engine and the display engine.

One minor fix for the RSB driver is also included.

----------------------------------------------------------------
Chen-Yu Tsai (6):
      dt-bindings: sram: Document Allwinner H616 VE SRAM
      dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
      soc: sunxi: sram: Const-ify sunxi_sram_func data and references
      soc: sunxi: sram: Allow SRAM to be claimed multiple times
      soc: sunxi: sram: Support claiming multiple regions per device
      soc: sunxi: sram: Add H616 SRAM regions

Samuel Holland (1):
      bus: sunxi-rsb: Always check register address validity

 .../sram/allwinner,sun4i-a10-system-control.yaml   |   5 +-
 Documentation/devicetree/bindings/sram/sram.yaml   |   1 +
 drivers/bus/sunxi-rsb.c                            |   3 +
 drivers/soc/sunxi/sunxi_sram.c                     | 196 +++++++++++++--------
 4 files changed, 127 insertions(+), 78 deletions(-)

--VfsGAi0BIhPgGehB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmod2JEACgkQOJpUIZwP
JDAwzg/9FDd9z1H9vB3wTj2ptls9aWIdVQ1kIinzaIl3/AzoSdJXNevbei+l0njd
plqY6KeJIT8DDIR9d548fEFsQt5E7LIrDXxSx+lk+VfynjFlORlCwTNM8DbqtRMB
hw5iAZAm8krS/QP3CRMgZ/wKzwwNLabjdLDB+7lDGVBxAIQOoOuSqU/CSpWrro8u
mCY1M2xYN4yf1Hn8+dwAgKBEp+DbmlZCuD2SFWM4JeII2jNKTaq1P88pVGHpZsTe
Kf07EppN4gllUIrHoPchRzoumuUG2ix5/CtseEm2D8MUDLwPqDPt0U0uwERhvJ5W
U3QGN24gtcX7CyMhfoA8Gowbn0+0j/1EnlNBS4UY8frdHItbXMDcwgrTvA0M1eEe
FbyNKqD2/a8kwEn2avghaWu/qL7+CPoU3YB0A3aJyfRZbXPL6lL1BHZ1GcEWPa8y
WqmS3GwbeJ5Za2dI9BG7f45rpF2cfntUbVclMO28LsI9uDTaFCO7WcLxeMrY7Ipy
jwd4bQhynnM3d8qS2f/628+jGQ9qmjmaGAfyOrusrkYLqHpRI9wiq7kMSzCcy/5t
n58YlYxoNNeivq4ZOZPvL+/jVDOFGE/aNfoJT6xjA/WYjtdZ4hBZT7/+GRWHOckN
VBmYdIkScoL/FPdLyx1mUcUGT8NhfPpbH6kGWCyWm69k0nLqKro=
=Bcm6
-----END PGP SIGNATURE-----

--VfsGAi0BIhPgGehB--

