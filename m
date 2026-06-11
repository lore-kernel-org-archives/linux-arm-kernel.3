Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80BDCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DHHyzLEfw3GTU4oBkJkB3iK+XV3OFBbTGTbLxfr4IM=; b=w6f37eUs05DIeNgGiDbUc+eR4X
	g/vFq+qzZn9pBLdERaLOVX1uqJ4mDxIPNrAo/CxWOayO+7zGF+09NpMesVzqggxRup8jFWGS5BohT
	kxljDw/35QxQ168ObzTkyFUQSg+lxmV3/EJ/tQlanK+Fie63lIIcUyOtQ5qtQp/pwUP7hTzY1DEva
	heO87uwyHkR1FoLvnsg3uksHMzZ7QZDbyAsKh+Oi8IRtR9X5q5nj2+zPNSfsgROGBbLSot0Fv6YOD
	8xx0WR64wUR+pJmAUlXCBpEqw9VEWONJfLkNTnlXt76qfC2drUf5lU+wSaim9ycvwFwkXCUvdDh4C
	mz+4EZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg05-00000009ZLT-2cpL;
	Thu, 11 Jun 2026 14:03:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg04-00000009ZLK-2eiG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 14:03:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EB0C41A0B;
	Thu, 11 Jun 2026 14:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E2C1F00893;
	Thu, 11 Jun 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186596;
	bh=5DHHyzLEfw3GTU4oBkJkB3iK+XV3OFBbTGTbLxfr4IM=;
	h=Date:From:To:Cc:Subject;
	b=dXe9Ur/gCDsCGP9BHXfYJ4cZ5PQRdbtr/IcXQWn1RrkY66fLe5sWl9AlrF0vmaX5O
	 Ju65FBO7/IXscgKD3270ZN/Kbs9XyfoFdTMjo+Ck6OcZS1l1+ZNRqB5f+y7tLwGbKn
	 /4n4miM7gjBeiKNcOX7AVYNFYCMsxwlfq0hpzozAuH6O57YDENSKH2nDGyHbf5o8sR
	 mbVqMI+/QPV5CQbGXpS+kztKG5m7exMbMr8wvEm8Rr9MztsOJbBlPeo+g3XnHBq48r
	 A5SMZda86jWkUKAolKWCrC9o741RC7THdZ8McHw1uc08Pxnwmf80Q+FXMvC/wifklF
	 Ylj8bCDeyRdkQ==
Date: Thu, 11 Jun 2026 22:03:11 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.2 - take 2
Message-ID: <airAH8n0YEtB3i2a@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dusNKKIGbS/LLl67"
Content-Disposition: inline
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


--dusNKKIGbS/LLl67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2-2

for you to fetch changes up to 6b81aa0c8a4f038712fa549e4d44d8279eeb0440:

  arm64: dts: allwinner: a523: Add missing GPIO interrupt (2026-06-11 21:46:33 +0800)

This is a respin of the previous pull request, minus the V3s clk
bindings change and MBUS node addition.

Another patch, a fix for the A523 pinctrl interrupts, is included. This
patch was just merged, but is long overdue from pre-7.0, the binding and
driver changes were just picked up for v7.2, and we are confident this
will not cause more issues.

----------------------------------------------------------------
Allwinner device tree changes for 7.2 - Take 2

Some changes for old chips and some for recent ones.

- A83T gained the MIPI CSI-2 receiver
- overlays enabled for Pine64 boards
- D1s / T113 and H616 gained the high speed timer
- T113s watchdog enabled (for reboot)
- H616 gained proper SRAM regions
- A523 family gained EL2 virtual timer interrupt and GPADC
- A523 pinctrl IRQ fix

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: a523: Add missing GPIO interrupt

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

Marc Zyngier (1):
      arm64: dts: allwinner: Add EL2 virtual timer interrupt

Michal Piekos (4):
      riscv: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node
      arm: dts: allwinner: t113s: enable watchdog for reboot
      arm64: dts: allwinner: a523: add gpadc node

Paul Kocialkowski (3):
      dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node

Peter Robinson (1):
      arm64: dts: allwinner: sun50i-a64: Enable DT overlays

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  6 +++
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  6 +++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        | 43 ++++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       |  4 ++
 arch/arm64/boot/dts/allwinner/Makefile             |  6 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 38 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 19 +++++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  9 +++++
 8 files changed, 128 insertions(+), 3 deletions(-)

--dusNKKIGbS/LLl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmoqwB8ACgkQOJpUIZwP
JDAD5A//djDPJ8AgAYJEx/+UhvSbVJaDgrM+3z6ZNKoTblwS052gP0PR5n65Rdv8
wAqc63YXeDX2a/19UJPYP5K4DyRPWR8qxl32AEEprSFikiy2lB0DztklCKxHodYE
HmeBsaXEioccXGUAN0p/9CH9DnBBw5LNMKNgmGPJ/ComopfC6U6ITgAP3gB9+0VY
AtkrCoaV+f7iWROLQMTHdV3lFBO8195TyC6abrww+eLgc2+3nwSRYhcMTMis7+/N
x6vr5JpdoaUCpdQEnCHinP7+DGlzMdSgYFo++akkgArfRopJSH7fdD+k/V0DSCz0
le07XIVEzg/4o9x+9P0oy0KTwcxWebEcf2SP5ylVOJ3bu6zkVCXcvCeKubm0/QDZ
+m6ktbPK86ubMXYzb6FYJw28lUndEShEOWfW4OQ3bsnBl2gZvmrgErUybYrQV8ob
nrEcUllBOTE46bfI42wiPrFo91oH8YybTe7uFC7jzOZ4GI4NGOgBaDVp+w7er0Sg
DBMUti5R0oWtaf2mTnQZbB6C4xM/6boVlijnizEUBttjMVcXjC2EKIXqyX+/VXaR
47sThcuJTPSTtZtdxP3ar48z7NWNowFx092Jn0suSd3EU8HVDf6Am/TmIsONwrom
mqI0E3H7aI+xRnkQStqIQ1YPUN4VBn6ubis4oLByQlLFLgAES3g=
=6DUJ
-----END PGP SIGNATURE-----

--dusNKKIGbS/LLl67--

