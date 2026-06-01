Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B72CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W43qI/57Dq34auorc7rm5R4Kf1qpPgs0LDeJ2dQV7M4=; b=QKQ/6JEYsKwhf7uXge/BccBYd2
	tNXtzRbV7+wInP7rgGM9gkhd/ZftI5XZl3kLSutbHW7jhXXc8cV/ZWSf73KPjxD7L8RZlP5YWHYLf
	orlrxOG/ZM9pXhgSbAKj2BZtvOYfCoSxmIfQwbVuUQ1DvV7ehI0GHQtgeLHSMDIZ+MPRw8MG1Z9BX
	lqhW/WoMyw1edE6/e+c4AcckFFMgTF0Qkh8skjWcnjYsQ7RyMkPa1twi9Pa7fOFqMQESbaNrbux/2
	VPNxegaN0ZzkAr0L+Uj2YsKyEOJyXlhqmo6e/NYEsjjlfuUhb8z12BPpvZb7gIyAXYVkA2b1nkbm5
	ouga96RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU81O-0000000BhQx-1qCy;
	Mon, 01 Jun 2026 19:09:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU81N-0000000BhQm-3enE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A4F4600AA;
	Mon,  1 Jun 2026 19:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8D91F00893;
	Mon,  1 Jun 2026 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340996;
	bh=W43qI/57Dq34auorc7rm5R4Kf1qpPgs0LDeJ2dQV7M4=;
	h=Date:From:To:Cc:Subject;
	b=JYFjMXiTbTwgfk2vu8SK6JiKGJNyCAywoTY0e5JJUjtqH2PKQhxhDQOlm7Iagwy7O
	 jTuX8o4YgPLbvC351hyUVHPn+O2SLgdRzmfDbbpdIg6e1aryHrBat2DVGKo1uFM5h4
	 FO9m7maUkpOv95jAJI1ZybfvbeeZwmr4Kxfl0pv8yMQyLFj6h5MJHoRMWvCVQ0lNzc
	 xT3TUIZas7Fy2865h0hEAebi5DVBLNEDMJi0AVs3waehoX9b+N1Y7aaOM7q9J5Jkw1
	 ZaYnIfXFd1OIQHs2juZZxLQPqkJOAFwceQBSq37UyKFMpoSC0+uhUU2XpO1dR5fFAW
	 1Dr41pr1nEfkA==
Date: Tue, 2 Jun 2026 03:09:52 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] Allwinner DT Changes for 7.2
Message-ID: <ah3ZAPLzh8ORGmpH@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SU/u6IheFArjYhKz"
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


--SU/u6IheFArjYhKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2

for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f:

  arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0800)


As mentioned in the tag, this pull request contains a change that should
be shared between the soc and clk trees. However since I don't have any
clk changes to send this cycle, I think it can just go through the soc
tree without any issues.

----------------------------------------------------------------
Allwinner device tree changes for 7.2

Some changes for old chips and some for recent ones.

- A83T gained the MIPI CSI-2 receiver
- overlays enabled for Pine64 boards
- V3s gained the MBUS interconnect
- D1s / T113 and H616 gained the high speed timer
- T113s watchdog enabled (for reboot)
- H616 gained proper SRAM regions
- A523 family gained EL2 virtual timer interrupt and GPADC

This tag also contains a clk DT binding change that changes a private
header of the clk driver to export some extra clocks to the device tree
on the V3s.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      Merge branch 'sunxi/shared-clk-dt-ids-for-7.2' into sunxi/dt-for-7.2

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

Marc Zyngier (1):
      arm64: dts: allwinner: Add EL2 virtual timer interrupt

Michal Piekos (4):
      riscv: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node
      arm: dts: allwinner: t113s: enable watchdog for reboot
      arm64: dts: allwinner: a523: add gpadc node

Paul Kocialkowski (5):
      clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
      dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
      ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node

Peter Robinson (1):
      arm64: dts: allwinner: sun50i-a64: Enable DT overlays

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  6 +++
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  6 +++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        | 43 ++++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       |  4 ++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         | 15 ++++++++
 arch/arm64/boot/dts/allwinner/Makefile             |  6 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 38 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 16 +++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  9 +++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h               |  4 --
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  4 +-
 11 files changed, 143 insertions(+), 8 deletions(-)

--SU/u6IheFArjYhKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmod2QAACgkQOJpUIZwP
JDBE7BAAhgTSkzIg3EDmxIDjfjZ4N7NoRIkrn/5E8EyHdBkkCDrZYioibHuPmnzh
pDSkuab3Jk6ZRbEXTvyoxHZbjU7Ed33bbuRv7ISDs058iJCDhgUs8uuI0Y3XbBSi
5CYYIJMf800oG09rNFYr9F8IEgiBU7qi2uTJxCHa9Rjvm64NOUnXhE5D/m5PhfbU
9e/+d1C4sixqgtNE36w6h7l+rGH3Ow51NM2f+D41mSRcuYATEC7EmpmdHpuF0lEn
gi57YQuQnfa3zmMvm9G0RSKoMiuC7zoxEEibXQkYfXtbwh+WbD/NbLrblFftRk6I
M5eFVDKKrduTJzkOzwvfxqTMhgURmR/XVa/DAYv324bJbz4cLml251GV+PJIl8jD
LjkIuS9qeHSDD8fd2T1LM3NGeGX3y3TYyGQm7k1oMr2g8UGRxatP4JcwGEF+PhQE
GPOEabV1pN3tYNecbs4C7B/B1Er2pKmyrz+v+qyRHi74Tdqq0P9fDiGx0exzODb6
Nmh4GnSdJ3IhtBvCHknKo+CoZP1xsfQGlJl/TvizANN+NBnqFLZ8wSmnyzHRGirH
xnfCy41UviL2niTNRGNFhPXCqFftt1NuORZXVAMDs/ciN+ROYoL41ZEU/eJnYQo/
CixzCK6ZA/azao6Ra/CYOs6iBrHSP9eebA+D4tqvK9/YDXrLkFw=
=4TaZ
-----END PGP SIGNATURE-----

--SU/u6IheFArjYhKz--

