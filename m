Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C8CD63923
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9roJnZwwWv8+ZgGYI+S5MQKlpoizdoQUP7oPX+hGrg=; b=snP80ek8gnDAkVaPdtLUHdLOib
	CP2831aj3fq7djSgPt2jaCmjVZVIxBZA8cYA7W9trQpP3aKht0nkjDobQqttl3Gr6+b+QgB3pl/jX
	Jfk/BuyGNmgcUXCzfqglLuYJ2TlQZIdHyGtCrp78kFFaR5LqP1io/wIyq3hcl8BGDUKtqDCwRMEA4
	7+rW76QPg4rcCrOq57QtDtYn1PPMqvA1Cf7GhBJb1vzTupn3oBkI8mNBkfow04cpbYI28q+o3XeGw
	pJdk7wzLFunC+EOfqjNdSac1SqNlsZoFKDdjcBeciOWEB8t9YPFzhphwUH8uX9JoWWEZaMfZFir6R
	u/oCEmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDi00-0000000F3vb-2Wwj;
	Wed, 20 Nov 2024 10:31:52 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhz4-0000000F3sc-2ylO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:30:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by michel.telenet-ops.be with cmsmtp
	id eyWn2D00f3gUftr06yWnEw; Wed, 20 Nov 2024 11:30:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhya-007bk2-8e;
	Wed, 20 Nov 2024 11:30:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhyx-005W42-Hn;
	Wed, 20 Nov 2024 11:30:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r7s72100: Add DMA support to RSPI
Date: Wed, 20 Nov 2024 11:30:46 +0100
Message-Id: <dfafc16b840630f20e75292d419479294558e173.1732098491.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_023054_884179_87DEA6DD 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

Add DMA properties to the device nodes for Renesas Serial Peripheral
Interfaces.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.14.

Tested on RSK+RZA1 with Renesas YRSK-LCD-PMOD (Okaya 1.44" 128x128 Color
TFT LCD) expansion on PMOD2, using r7s72100-rskrza1-pmod-spi.dtso and
r7s72100-rskrza1-pmod2-lcd.dtso from my renesas-overlays branch[1].

Without DMA:
  - Screen refresh is visible and takes ca. 1s,
  - "modetest -s" causes 163930 interrupts,
  - workqueue: drm_fb_helper_damage_work hogged CPU for >50000us 19
    times, consider switching to WQ_UNBOUND.

With DMA:
  - Screen refresh is instantaneous,
  - "modetest -s" causes 100 RSPI and 14 DMAC interrupts.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index b831bbc431efb93e..1a866dbaf5e93423 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -238,6 +238,8 @@ spi0: spi@e800c800 {
 				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI0>;
+			dmas = <&dmac 0x2d21>, <&dmac 0x2d22>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -253,6 +255,8 @@ spi1: spi@e800d000 {
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI1>;
+			dmas = <&dmac 0x2d25>, <&dmac 0x2d26>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -268,6 +272,8 @@ spi2: spi@e800d800 {
 				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI2>;
+			dmas = <&dmac 0x2d29>, <&dmac 0x2d2a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -283,6 +289,8 @@ spi3: spi@e800e000 {
 				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI3>;
+			dmas = <&dmac 0x2d2d>, <&dmac 0x2d2e>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -298,6 +306,8 @@ spi4: spi@e800e800 {
 				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI4>;
+			dmas = <&dmac 0x2d31>, <&dmac 0x2d32>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
-- 
2.34.1


