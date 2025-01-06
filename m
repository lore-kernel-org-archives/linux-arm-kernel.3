Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2TVELzHCA4aZQ2g5XugjPtl5eBfsMF+kuJW/sAUoIE0=; b=SjMc82JtkwqAkHFtxKDwnPTQri
	wzyKsYp+p8WDTgXTtmoz029Wg22XLgitza0FOYh4y8feIdm0Lh6j/gX82FXE4S/nntYeaMP8uHN02
	Sh40QTPsuDU5NChLYJwnWTwTfO8+KSv5QoQEUd3pat7/ZAhCglqKiH/Jy3n05kq14slLMs5u/kY4Z
	uQ6HQDGL2bMdFt+oaRPd1mTIYSi/d1kub2a0UWaUabfY4dL9y6U2cVURHCVF+Hu92QByzxAVvPsIf
	c4JctldqtiFj444xudJQJC+9/vnO6vTwrCatedzCn87976Oa/LzApc4TYMEzr8l0YLpUfet1bS+PY
	ZBJlN9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqCn-00000001zUK-3LFe;
	Mon, 06 Jan 2025 16:43:53 +0000
Received: from weierstrass.telenet-ops.be ([2a02:1800:110:4::f00:11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqB4-00000001yxX-0ANw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:42:07 +0000
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4YRg206ZDnz4x2cb
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 17:42:00 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by laurent.telenet-ops.be with cmsmtp
	id xshx2D00L3AZZFy01shxk2; Mon, 06 Jan 2025 17:41:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAs-00000008NTv-3A5o;
	Mon, 06 Jan 2025 17:41:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAv-00000004YZR-0Irs;
	Mon, 06 Jan 2025 17:41:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.14 (take two)
Date: Mon,  6 Jan 2025 17:41:53 +0100
Message-ID: <cover.1736180859.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084206_214678_57526414 
X-CRM114-Status: GOOD (  19.86  )
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

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.14.

The following changes since commit acb247afab5bc2b4462f4dfc17a9d930e1153e52:

  arm64: dts: renesas: r9a09g047: Add I2C nodes (2024-12-17 09:42:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.14-tag2

for you to fetch changes up to c357e2295b7880b1d9d365c3389f06ef2eb464d0:

  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders (2025-01-06 16:26:29 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.14 (take two)

  - Add pin control support for the RZ/G3E SoC and the RZ/G3E SMARC
    Carrier-II EVK development board,
  - Add Image Signal Processor helper block (FCPVX and VSPX) support for
    the R-Car V4H SoC,
  - Describe odd C-PHY wiring on the White Hawk CSI/DSI sub-board,
  - Miscellaneous fixes and improvements.

Note that this includes Pin Control DT binding and bindings definitions
for the RZ/G3E and RZ/V2H SoCs, which are shared by DT source files and
the pin control driver.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
      arm64: dts: renesas: r9a09g047: Add pincontrol node
      arm64: dts: renesas: r9a09g047e57-smarc: Add SCIF pincontrol

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-dts-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-dts-for-v6.14

Jacopo Mondi (2):
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      arm64: dts: renesas: r8a779g0: Add VSPX instances

Niklas Söderlund (1):
      arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  7 ++--
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 40 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 13 +++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 36 +++++++++----------
 .../arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi |  2 ++
 .../pinctrl/renesas,r9a09g047-pinctrl.h            | 41 ++++++++++++++++++++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h            | 31 ++++++++++++++++
 8 files changed, 163 insertions(+), 20 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

