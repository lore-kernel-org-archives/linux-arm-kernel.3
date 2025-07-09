Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsBxDlYhjAofEPWom7d+T/lnP4Zt99xFdjIq9olRVNc=; b=YMTMj+pTAxYKxfs+hFtACHHY2S
	rgQzqdsadteXcXbyu07Aut0ahZXgn263RTq773cOXqGgJykncUqHtiA4UZn/Hz/ekbNSmI54RnX3P
	H+9QkG3hzgMplQkpaP+aEhsw0JYSHKYP8TxWbB5qMyHVxORzXsvISDAYJ8NJtrJYBp1B+6VU540HZ
	0USvIe/2HqmjCwisDRk3wMBddK2HwDuj2UVD5BvmHEN1PQVG41FW024Q1rtaLTkfKDfTJUyhG/pFc
	86EA8InwSgQ4z9oWMFAg4prektp9EwyIYhJlEicieHPsVNpv0Rq+uhCL1R1PdT1m++foy/Sz7+74j
	oTNanPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiL-0000000A88z-06oM;
	Wed, 09 Jul 2025 22:56:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbBA-00000009mnl-1nz8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 20:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA1B761152;
	Wed,  9 Jul 2025 20:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E8AC4CEF0;
	Wed,  9 Jul 2025 20:14:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:27 +0200
Message-ID: <cover.1752090401.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The following changes since commit 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f:

  arm64: dts: renesas: r9a09g047: Add GBETH nodes (2025-06-26 16:37:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.17-tag2

for you to fetch changes up to 145a2a9e27562926c592645a05d682fe8e1f82e9:

  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH (2025-07-08 12:06:26 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.17 (take two)

  - Add support for the Renesas Gray Hawk Single board with R-Car
    V4M-7 (R8A779H2),
  - Add eMMC and microSD expansion board support for the RZ/V2H and
    RZ/V2N EVK development boards,
  - Add GPIO keys and Ethernet support for the RZ/G3E SoM and SMARC
    Carrier-II EVK development board,
  - Add QSPI FLASH support for the RZ/V2H and RZ/V2N SoCs and their EVK
    development boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys

Geert Uytterhoeven (3):
      arm64: dts: renesas: Factor out Gray Hawk Single board support
      arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag4' into renesas-dts-for-v6.17

John Madieu (1):
      arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH) interfaces

Lad Prabhakar (8):
      dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
      arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix pinctrl node name for GBETH1
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix pinctrl node name for GBETH1
      arm64: dts: renesas: r9a09g056: Add XSPI node
      arm64: dts: renesas: r9a09g057: Add XSPI node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH

Niklas Söderlund (1):
      arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target

Tam Nguyen (1):
      arm64: dts: renesas: Add Renesas R8A779H2 SoC support

 arch/arm64/boot/dts/renesas/Makefile               |  15 +
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  | 866 +++++++++++++++++++++
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 855 +-------------------
 .../boot/dts/renesas/r8a779h2-gray-hawk-single.dts |  17 +
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  37 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  21 +
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  66 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  66 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  31 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   | 111 +++
 .../arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso |  50 ++
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso  |  69 ++
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |   1 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |   1 +
 16 files changed, 1383 insertions(+), 856 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso

