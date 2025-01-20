Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D563C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uItd0SWL17PoFeICTMhNhilgJz7uTDu01p0p2n4NKBY=; b=eFyc19SSDBMnUot4I2K2Ui6hKN
	++pRTgfpzGdH3i9HEpmdbXHmu8YpFhivByUfeusJxPcMg45wE4At5R+fFgxwQJ9r7nwm8YycAT7hH
	Q1M86lyLAbnqzVBLvv393mZhrHWyCgNdszv1ICyHYu3pbEdJ5DxJdyQ4lU2VhinCpCVsXjkYeE+ts
	w6V3pIcwWNOoFw7+dYI5DzhOlYxy9pAL0gxiKFAeKkGm+J2jT/BUrjqglkfe6lJ2Vz73rXr30mhnf
	HVDDUHtPWjN0jXfRifH0QaxLqrGPM+hQxPOOV7iNFzKM4A5V9tcjCRORtc8P4u/SpvJk6GuTJXPgF
	CYHSmlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqzW-00000005Yq5-1h59;
	Mon, 20 Jan 2025 12:34:54 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqyE-00000005YlI-2TGH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 12:33:36 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:30c9:4dcf:fe21:4b10])
	by laurent.telenet-ops.be with cmsmtp
	id 3QZH2E0060raqVW01QZHyr; Mon, 20 Jan 2025 13:33:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZqxq-0000000DgtV-2XTn;
	Mon, 20 Jan 2025 13:33:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZpef-0000000CU8e-3Zp6;
	Mon, 20 Jan 2025 12:09:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Restore sort order
Date: Mon, 20 Jan 2025 12:09:12 +0100
Message-ID: <ccd215c1146b84c085908e01966f7036be51afa8.1737370801.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_043334_768141_F53E8D32 
X-CRM114-Status: UNSURE (   8.79  )
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

Numerical by unit address, but grouped by type.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.15.

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 80 +++++++++++------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 89049e40086c2d41..cbc4680e497734d3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2171,6 +2171,24 @@ fcpvd1: fcp@fea11000 {
 			iommus = <&ipmmu_vi1 7>;
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x7000>;
@@ -2193,6 +2211,28 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1028>;
+
+			renesas,fcp = <&fcpvx0>;
+		};
+
+		vspx1: vsp@fedd8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd8000 0 0x8000>;
+			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1029>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1029>;
+
+			renesas,fcp = <&fcpvx1>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a779g0";
 			reg = <0 0xfeb00000 0 0x40000>;
@@ -2453,46 +2493,6 @@ port@1 {
 			};
 		};
 
-		fcpvx0: fcp@fedb0000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfedb0000 0 0x200>;
-			clocks = <&cpg CPG_MOD 1100>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
-			resets = <&cpg 1100>;
-			iommus = <&ipmmu_vi1 24>;
-		};
-
-		fcpvx1: fcp@fedb8000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfedb8000 0 0x200>;
-			clocks = <&cpg CPG_MOD 1101>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
-			resets = <&cpg 1101>;
-			iommus = <&ipmmu_vi1 25>;
-		};
-
-		vspx0: vsp@fedd0000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfedd0000 0 0x8000>;
-			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 1028>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
-			resets = <&cpg 1028>;
-
-			renesas,fcp = <&fcpvx0>;
-		};
-
-		vspx1: vsp@fedd8000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfedd8000 0 0x8000>;
-			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 1029>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
-			resets = <&cpg 1029>;
-
-			renesas,fcp = <&fcpvx1>;
-		};
-
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.43.0


