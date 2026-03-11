Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FA1125839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JIER7R8qDnMGwL9/jL6JXXVIFVskDrUvTFsgBe7z7Gc=; b=gppjj4gEUbg0vN/rfbcgcmdtBb
	xNrKfmWwDnpP4Vq5WjLYVOVRqunZ5BqbQFm407xyQemuwUHdfiq9tn4R+W7d0lG57fm5M+Pm/Aumj
	Jx3QOx4nhyBRXOw8MDGJBuWHmcoCpVYLFPMA/EjtxSVAL9v1AbWX5FeSiR1+fiGJB9GyZzG2So6H5
	/YGUp3zurS8dHshtTMrlM4E8BhU5rv6BgpqTddt+FGUqmFlAJtkYBF8HYbigzZt87bo7lvMGafCR0
	6ZrxeaQ0pAwcuV14Ls+gJov19cQbVaH1R4ObSpPnJh4cZHvVHfWkIyLcXlAS+5uPrF4mxGWn0NmK4
	FJdszotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L0p-0000000BkVH-2JIt;
	Wed, 11 Mar 2026 14:58:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L0n-0000000BkV2-3ttJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FD9E6013E;
	Wed, 11 Mar 2026 14:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA66BC4CEF7;
	Wed, 11 Mar 2026 14:58:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores in node names
Date: Wed, 11 Mar 2026 15:58:07 +0100
Message-ID: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
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

Node names should not contain underscores; replace them by hyphens.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index b720c001e77680a9..d0956950472c1fde 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -237,13 +237,13 @@ &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_cpld>;
 
-	pins_can0: pins_can0 {
+	pins_can0: pins-can0 {
 		pinmux = <RZN1_PINMUX(162, RZN1_FUNC_CAN)>,	/* CAN0_TXD */
 			 <RZN1_PINMUX(163, RZN1_FUNC_CAN)>;	/* CAN0_RXD */
 		drive-strength = <6>;
 	};
 
-	pins_can1: pins_can1 {
+	pins_can1: pins-can1 {
 		pinmux = <RZN1_PINMUX(109, RZN1_FUNC_CAN)>,	/* CAN1_TXD */
 			 <RZN1_PINMUX(110, RZN1_FUNC_CAN)>;	/* CAN1_RXD */
 		drive-strength = <6>;
@@ -256,7 +256,7 @@ pins_cpld: pins-cpld {
 			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
 	};
 
-	pins_eth3: pins_eth3 {
+	pins_eth3: pins-eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(38, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -273,7 +273,7 @@ pins_eth3: pins_eth3 {
 		bias-disable;
 	};
 
-	pins_eth4: pins_eth4 {
+	pins_eth4: pins-eth4 {
 		pinmux = <RZN1_PINMUX(48, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(49, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(50, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -290,13 +290,13 @@ pins_eth4: pins_eth4 {
 		bias-disable;
 	};
 
-	pins_i2c2: pins_i2c2 {
+	pins_i2c2: pins-i2c2 {
 		pinmux = <RZN1_PINMUX(115, RZN1_FUNC_I2C)>,
 			 <RZN1_PINMUX(116, RZN1_FUNC_I2C)>;
 		drive-strength = <12>;
 	};
 
-	pins_mdio1: pins_mdio1 {
+	pins_mdio1: pins-mdio1 {
 		pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
 			 <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
 	};
-- 
2.43.0


