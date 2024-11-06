Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED63FD59F4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyvG9j7150OKuwUK9iqtPri4u9myDwfhQithn1RLhIA=; b=Sjhp5R9/LBo1CFwRA+9WGbI3Fl
	DJYrM9FQ15ss/oZpxHOGynYsfsW4bvPyEM+RvsfjnPzuJwctf4DZQXFXkNQcr+ihHamw3NVTEu3Om
	9MLuUkG+pL6GpfRXVTxtA3F9P89esiO/NY71+X+ORF6l/KiJAKq3C7FfGktG4yY6aTZ8oKYXvQaI4
	xN3hUHV6zzjrWyqYWAJscyhdsGGBLm+hAxQQvFNdz4nh/9EuHPeMWl52JHxIrnu2y1RREdByZoSf0
	t6WGvpSD6tAfIhZfdSCmE55KlgTTQHjG66FAB6gueDGHT/bFMeRYUn/0StTU/YF8f8GKLQSBwNDl0
	BEKFethw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iUE-00000003wJR-2ikk;
	Wed, 06 Nov 2024 16:02:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iOF-00000003ubP-1P7h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DB4AA407E5;
	Wed,  6 Nov 2024 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11AFC4CEC6;
	Wed,  6 Nov 2024 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908574;
	bh=o+O3AVjyw4V0rGoTz6Alsf+x7tFbW7A4EL9HlfoJqaA=;
	h=Date:From:To:Cc:Subject:From;
	b=Z3+2ebY6w98hFl22Dlpx0YoZDGuyU9K2I1Pc1MYfgKZpQWGvgqkw8Q4mDrRhcBszg
	 6+S/jrIxqfL4kIaVrPNuXLpZGugxzycRK4t/K+YESAz1Ffxriy5jCeW8tMEM1eCPQ5
	 Zy39+Q4vaSW6EMZfaiD5JUkrRdnPBIN5rHJs1N/dA42py1faG++/69LLJWukthLhJG
	 i8gSbHueRHx0AGUxGvtnMAcuxoX4tE2SAIrLVy73Y2e/R6S5nASDMwCeEsnRCq/QIZ
	 N8ndc4S7rmGYQSqkgTD4xYsbdE5jk1KpUr+VfdHB8skEYRbuYR8L/y7dRdS68h2YtS
	 UN41G7KkHjo6A==
Received: by wens.tw (Postfix, from userid 1000)
	id 374985F8BA; Wed,  6 Nov 2024 23:56:11 +0800 (CST)
Date: Wed, 6 Nov 2024 23:56:11 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.13 part 1
Message-ID: <ZyuRm-gvJX_12NMA@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V50nwjhcp48BVPt5"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_075615_525797_5F3D67B9 
X-CRM114-Status: GOOD (  14.66  )
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


--V50nwjhcp48BVPt5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-6.13-1

for you to fetch changes up to fcfbb8d9ec584c256c0a6e1ae3174a21b007f399:

  arm64: allwinner: a100: Add MMC related nodes (2024-11-02 19:32:40 +0800)

A second pull request will likely be sent by the end of the week or
early next week, once a couple stragglers are run through linux-next.

----------------------------------------------------------------
Allwinner device tree changes for 6.13 part 1

- Enabled audio codec for all H313/H616/H618/H700 boards
- Added audio codec node for H616 SoC
- Set disable-wp on MMC controllers with micro SD card slots
- Added RerVision A33-Vstar board
- Added A100 compatible string to USB and PHY bindings
- Added MMC, USB, PMU and watchdog device nodes for Allwinner A100 SoC

----------------------------------------------------------------
Cody Eksal (3):
      dt-bindings: phy: sun50i-a64: add a100 compatible
      dt-bindings: usb: Add A100 compatible string
      dt-bindings: usb: sunxi-musb: Add A100 compatible string

Icenowy Zheng (2):
      dt-bindings: arm: sunxi: document RerVision A33-Vstar board
      ARM: dts: sunxi: add support for RerVision A33-Vstar board

Kry=C5=A1tof =C4=8Cern=C3=BD (1):
      arm64: dts: allwinner: Add disable-wp for boards with micro SD card

Ryan Walklin (2):
      arm64: dts: allwinner: h616: Add audio codec node
      arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for al=
l supported boards

Yangtao Li (4):
      arm64: dts: allwinner: A100: Add PMU mode
      arm64: dts: allwinner: a100: add watchdog node
      arm64: dts: allwinner: a100: add usb related nodes
      arm64: allwinner: a100: Add MMC related nodes

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   6 +
 .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml |  10 +-
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml     |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |   1 +
 arch/arm/boot/dts/allwinner/Makefile               |   1 +
 .../boot/dts/allwinner/sun8i-a33-vstar-core1.dtsi  |  96 ++++++++++
 arch/arm/boot/dts/allwinner/sun8i-a33-vstar.dts    | 205 +++++++++++++++++=
++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 185 +++++++++++++++++=
+-
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |   1 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   1 +
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |   1 +
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   1 +
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    |   1 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     |   1 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   1 +
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |   6 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |   6 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  44 +++--
 .../boot/dts/allwinner/sun50i-h618-longanpi-3h.dts |   1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   5 +
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |   6 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |  13 +-
 29 files changed, 581 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a33-vstar-core1.dtsi
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a33-vstar.dts

--V50nwjhcp48BVPt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcrkZoACgkQOJpUIZwP
JDDPcBAAo1ztG2mpEqv60U3/VvivQib4VmMPKoQMn91NMsvM/yIjw1OhqeqeUwcJ
LrPdSaWl1sxtIsp+6RZG8431DJzzMqXIIVX03T3kkz6Rc3mSq3BfAW7PbCDAwFZO
yEIFDIwIp5jFn6qLpdrvK+CXitvzP0VK4j3jikLjISTJffNsv5wz7rfRb6HLF0iZ
drSMEVa3HK2gKHDjHOlVKRQXWU1RQUcsj8clOmuoPbJZ774ywwoFSkGm3c5qQn+q
9lTQOLDpO8Y91+qMNv0Bf03k4cJYRaLSYEFkZpOguQVAuC3n2Pvb9S8YCVis0OvD
pRYNJK1JYNA52WAHQUkmT3vm06tJTlyea3hAsU84Omn4h42cByIRek74vw/Hnw7j
rJXa0Vmwuso/ck1+1mDnBo9WMTszRryV4xAJFBcz/X86m7HBX62jMI4fkTISSaf6
PevDApsjus3Z/KBTH3cbpQVcVUZft3wLjmXKjdqOmw3qzne9c2QgXVQTlM50QjH4
It27+69a2xoG8SAKl/29TrgCRf3Y6thWfu8xL0bMin76n3uaPbMVn1fqDheK27q1
5yA5IFESDsqLDPCFJ2Sc8WqDoan1QSp8Kjj6jSptYYsxb1cHlU9pGXB7Cj/SqCIB
eZDWoP0JoLQOEYKAm2jCtScfABmLiAoR3wdq3Q7e/wc3BdyzQsM=
=AEf3
-----END PGP SIGNATURE-----

--V50nwjhcp48BVPt5--

