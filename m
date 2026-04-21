Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B714F94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQBe29SFf+YGKMOWLOABQcmzj11dz1XzTxlqMgpLVYA=; b=sPgcG46YJQaFs0eejmc9dxO8SO
	NihMPNbznLQe5tNVlPH0X+dkCT2UDjx9JDv/mKAtK86hJ29GbflLyFn3kWRPLkoziTAReyauDzBvz
	hB3P0+yEBOovA+yYruRnyeiP3Gb45AKmmmrNYd/zScymot4/vwtO3cvfnD0O5/55su0BgL3lF52EV
	uZyhFyY+yt3CXSOtiHaNPbzWvLoMLy5oneMDYYBDEn4yrag0nBY9UJCy0jynOr4w18TicUCIMTEyr
	i4veoQu+V9dkdQALiV9rxXQVH0/DWNOctKiO+Zo3Bxaa3IzcVLQnwS1Re+G20dakfWrgsN+YsQ4j+
	z4hZHYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFar-000000091MZ-2Y5v;
	Tue, 21 Apr 2026 18:13:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaq-000000091LF-3Nrw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D3F161143;
	Tue, 21 Apr 2026 18:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B44BC2BCB7;
	Tue, 21 Apr 2026 18:12:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 13/14] arm64: dts: renesas: r8a78000: Add CPG/MDLC nodes
Date: Tue, 21 Apr 2026 20:11:46 +0200
Message-ID: <586b1266f9a8e5aaccc010d4a3a02276ea44f3c8.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
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

Add device nodes for the Clock Pulse Generator (CPG) and Module Control
(MDLC) blocks on the R-Car X5H (R8A78000) SoC.

Convert all (H)SCIF serial ports from dummy to CPG clocks, and link them
to an MDLC for power domains and resets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Add all MDLC nodes from the start, or only when used/tested?
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 300 ++++++++++++++++++++--
 1 file changed, 275 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 11922b1ac73b3af5..640b622435569461 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -636,23 +638,6 @@ L3_CA720_7: cache-controller-37 {
 		};
 	};
 
-	/*
-	 * In the early phase, there is no clock control support,
-	 * so assume that the clocks are enabled by default.
-	 * Therefore, dummy clocks are used.
-	 */
-	dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <66666000>;
-	};
-
-	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <266660000>;
-	};
-
 	extal_clk: extal-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -813,8 +798,12 @@ scif0: serial@c0700000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
 			interrupts = <GIC_ESPI 10 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x40>;
+			resets = <&mdlc_perw 0x40>;
 			status = "disabled";
 		};
 
@@ -823,8 +812,12 @@ scif1: serial@c0704000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
 			interrupts = <GIC_ESPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;
+			resets = <&mdlc_perw 0x41>;
 			status = "disabled";
 		};
 
@@ -833,8 +826,12 @@ scif3: serial@c0708000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
 			interrupts = <GIC_ESPI 12 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x42>;
+			resets = <&mdlc_perw 0x42>;
 			status = "disabled";
 		};
 
@@ -843,8 +840,12 @@ scif4: serial@c070c000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
 			interrupts = <GIC_ESPI 13 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x43>;
+			resets = <&mdlc_perw 0x43>;
 			status = "disabled";
 		};
 
@@ -853,8 +854,12 @@ hscif0: serial@c0710000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0710000 0 0x60>;
 			interrupts = <GIC_ESPI 14 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;
+			resets = <&mdlc_perw 0x54>;
 			status = "disabled";
 		};
 
@@ -863,8 +868,12 @@ hscif1: serial@c0714000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0714000 0 0x60>;
 			interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x55>;
+			resets = <&mdlc_perw 0x55>;
 			status = "disabled";
 		};
 
@@ -873,8 +882,12 @@ hscif2: serial@c0718000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0718000 0 0x60>;
 			interrupts = <GIC_ESPI 16 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x56>;
+			resets = <&mdlc_perw 0x56>;
 			status = "disabled";
 		};
 
@@ -883,8 +896,12 @@ hscif3: serial@c071c000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc071c000 0 0x60>;
 			interrupts = <GIC_ESPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x57>;
+			resets = <&mdlc_perw 0x57>;
 			status = "disabled";
 		};
 
@@ -897,6 +914,239 @@ scp_sram: sram@c1000000 {
 
 			/* scp-sram node must be set per board file */
 		};
+
+		cpg: clock-controller@c1320000 {
+			compatible = "renesas,r8a78000-cpg";
+			reg = <0 0xc1320000 0 0x10000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vipn: system-controller@c3060000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc3060000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vips: system-controller@c3460000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc3460000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vio: system-controller@c5000000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc5000000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_pere: system-controller@c08f0000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc08f0000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_perw: system-controller@c05d0000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc05d0000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr0: system-controller@e8000000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8000000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr1: system-controller@e8080000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8080000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr2: system-controller@e8100000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8100000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr3: system-controller@e8180000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8180000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr4: system-controller@e8200000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8200000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr5: system-controller@e8280000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8280000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr6: system-controller@e8300000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8300000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr7: system-controller@e8380000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8380000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_hscn: system-controller@c9c90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc9c90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_rt: system-controller@19440000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0x19440000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_top: system-controller@c6480000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc6480000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_hscs: system-controller@de200000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xde200000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_imn: system-controller@c1990000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1990000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ims: system-controller@c1d90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1d90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_gpc: system-controller@cb510000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xcb510000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_dsp: system-controller@cbe90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xcbe90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_mm: system-controller@e9980000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe9980000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_npu0: system-controller@d2c30000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xd2c30000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_npu1: system-controller@d6c30000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xd6c30000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_cmnn: system-controller@ca410000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xca410000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_cmns: system-controller@ca510000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xca510000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_scp: system-controller@c1330000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1330000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_aon: system-controller@c1338000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1338000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
 	};
 
 	timer {
-- 
2.43.0


