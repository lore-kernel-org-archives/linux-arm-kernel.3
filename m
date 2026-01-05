Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D4C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJVqJaQHGnHNwn+NsCjpyA0YMFbmKoccSlZUowb2XBY=; b=2qPIwzV0y6lfRoiAR7KXeBZKRP
	Jdp+Msrh3SvhTo2nv1UK9tDFAaSWoztj5srd1lVf7duPgv+Of3Y2vFbAIz9kG6C3FAuYHIFHTeYTA
	R+Ax8Da5GLznDK0oY3GRo9ZZaHiKgfoNyQSh56kjTPhCiN5gt9vftIbUfW2yfvnNE5X1iWZdClkyk
	0j6EIIx5Ed+i5nOIPcV4l4f1M+iwyjTo2y5SjGQS0sDJ/fbGWgH0IxsPgDfFrp8F/grYgX1YZiHhl
	E9ROJrkQiu0rlYOiSqHdzUwVinbv3kUxZuS6PZ8QLMR9KFLQx0zUEWUizUPfXIGfGIVp/oaqdyHX0
	guyaK2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXP-0000000Bztw-1tMs;
	Mon, 05 Jan 2026 19:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXN-0000000Bztc-2kE3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B8846013A;
	Mon,  5 Jan 2026 19:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A90C116D0;
	Mon,  5 Jan 2026 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767642404;
	bh=jXT/B7qerXIpcbaLv0iK/+Rwz/W3jTzZ5aQTdvgrZgI=;
	h=From:To:Cc:Subject:Date:From;
	b=H3UYn4jGB3zIZ/hSnUBT6WLmSoTbGjmDcCLCV1LHlH2IuQO2qxPQTyEW0Zc+W0IPe
	 1Wy2LcLW13W8eLdLeM8kh25YKTVn42uZbgmRwpI5VthSTraGpe0iE4yXLFeJRwqIp3
	 MfCSMHCVCJjYSxhmmhMVapBj3MeFStl4nAdjMK0YCJY/G/zfqumy4MNhfBG3pnHlcz
	 7wHZsujnidHnvPEM3BwQdbQe4qtOckMUYl85NzNRC7Q0I/b+/ILaYxLoW4PWTKDvEp
	 F5EoEeqYDIP8Br5Pyv0UnwztvboAt41AxVAYZXn4DOLN6k/8rHzjqbuqIZ6xojBNEK
	 VjgUCMXkqwr3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: Fix stray and typo "pinctrl-names" properties
Date: Mon,  5 Jan 2026 13:46:41 -0600
Message-ID: <20260105194642.3189113-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

There's several cases of "pinctrl-names" used without any "pinctrl-0"
properties. Drop them.

Fix the typo "pintrl-names" as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts | 1 -
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts                | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                   | 1 -
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi                    | 2 --
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi                    | 1 -
 5 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
index e82284888b9a..0ab33aa928e7 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
@@ -42,7 +42,6 @@ usb3_phy: usb3-phy {
 	};
 
 	gpio-leds {
-		pinctrl-names = "default";
 		compatible = "gpio-leds";
 		/* No assigned functions to the LEDs by default */
 		led1 {
diff --git a/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts b/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
index 788a5c302b17..212865f6cf6a 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
+++ b/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
@@ -137,7 +137,7 @@ led@1 {
 
 &cp0_pinctrl {
 	pinctrl-0 = <&sim_select_pins>;
-	pintrl-names = "default";
+	pinctrl-names = "default";
 
 	rear_button_pins: cp0-rear-button-pins {
 		marvell,pins = "mpp31";
diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
index 5689a8bdfd03..c9050e707a60 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
@@ -93,7 +93,6 @@ &uart0 {
 
 /* on-board eMMC U6 */
 &ap_sdhci0 {
-	pinctrl-names = "default";
 	bus-width = <8>;
 	status = "okay";
 	mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
index 7156739aa31a..8e413286e019 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -111,7 +111,6 @@ &uart0 {
 
 /* on-board eMMC - U9 */
 &ap_sdhci0 {
-	pinctrl-names = "default";
 	bus-width = <8>;
 	vqmmc-supply = <&ap0_reg_sd_vccq>;
 	status = "okay";
@@ -166,7 +165,6 @@ &cp0_i2c0 {
 	/* U36 */
 	expander0: pca953x@21 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x21>;
diff --git a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
index f82d45e62753..98eee9e4e10b 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
@@ -142,7 +142,6 @@ i2c@1 {
 			/* U12 */
 			cp2_module_expander1: pca9555@21 {
 				compatible = "nxp,pca9555";
-				pinctrl-names = "default";
 				gpio-controller;
 				#gpio-cells = <2>;
 				reg = <0x21>;
-- 
2.51.0


