Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20923103E17A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YlbmDYooZqN28cWCjnsQtrdgEEhMYDmUb1WD/TzZiE=; b=vzZraaXfC3Yw/FT74vlApNE4BH
	wMylBI9rHKUf69kXmRuVCP2FzHCGuxaCxcLQ9Oz+s13k1/CDi2zz/dIOeQyE4i9Bxh4OKMEUCm63Q
	lFSJlKCXFj83I6EPwblRh382nJbfUPofge/oqCZDrAq3YEUWwuDmAQ0sHxD6BRMOuQqLndood0pNM
	FAWUit+nJ30Fy9VPwwq8T0Q2F449EPx++aLdEcVEQjEOYZ7UpzLa5RI25FgXZuRzRfZFKYnDHzKQH
	jWMC3B6zWd0sN/Ro3Uc33G+HYGXt3etGFavplaV2RltWnUhjThhrxjHFmFUMlWg2o/rT0GQy8HK0p
	68Wz3OnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rT6-00000008XjO-3ePD;
	Wed, 18 Mar 2026 14:01:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rT6-00000008Xj7-0sQW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F69360054;
	Wed, 18 Mar 2026 14:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1644C19424;
	Wed, 18 Mar 2026 14:01:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
Date: Wed, 18 Mar 2026 15:01:47 +0100
Message-ID: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Restore alphabetical sort order of the pin control subnodes by
exchanging the gmac1-pins and gmac2-pins nodes.
While at it, fix the index in an incorrect "GMAC2" comment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.

 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 58 +++++++++---------
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 60 +++++++++----------
 2 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 52e5f6c3ab67d177..4c0e52850ca97250 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -253,6 +253,35 @@ can0_pins: can0-pins {
 			 <RZT2H_PORT_PINMUX(24, 4, 0x19)>; /* CANTX0 */
 	};
 
+	/*
+	 * GMAC1 Pin Configuration:
+	 *
+	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
+	 * P35_0-P35_2 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
@@ -283,35 +312,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
 	};
 
-	/*
-	 * GMAC1 Pin Configuration:
-	 *
-	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
-	 * P35_0-P35_2 for Ethernet port 3
-	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
-	};
-
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 3c636c92f3d6f445..ef6cc7497c2c4c8c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -336,6 +336,36 @@ can1_pins: can1-pins {
 			 <RZT2H_PORT_PINMUX(12, 1, 0x19)>; /* CANTX1 */
 	};
 
+	/*
+	 * GMAC1 Pin Configuration:
+	 *
+	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
+	 * for Ethernet port 3
+	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
@@ -368,36 +398,6 @@ gmac2_pins: gmac2-pins {
 
 	};
 
-	/*
-	 * GMAC2 Pin Configuration:
-	 *
-	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
-	 * for Ethernet port 3
-	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
-	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
-	};
-
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
-- 
2.43.0


