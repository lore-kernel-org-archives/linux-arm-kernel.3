Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D286CCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvSvoU+dIjb1sAVDi9EeEkONp4VCoKJknz01o8+S1PI=; b=Vw2r/t5LZemGz6Si40Mk7awmQ+
	OktHRIKzbapbdGoHZexz1QtJmy2zIYnKMNFzPPjU7Sy1IqgUyzPNsGqIPMYrYcI5l8xXf+r+fdFP2
	m3spwniOyYVgYveu6HqgFzHsLZwNcvBh5vn8fH0aIAgeeIHuWWxRnBYS2Snjj7s2mpR5rSGyhx/Hg
	i9fZRDJoVLWDi4GvViezyaAU3tNtK23VTPtsF+/4ndw7yH1I3M4NZJbMrUZUtk9MjuBE6EpaqVw2V
	1mWzRadBIrbx27kjsU0dRRhG7v0YoNCa4dKLNWBA8egnkMVQCfrbdMPncFnbPWaqIJcDOVqYeLi4X
	vl5rAABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVq-0000000Gerl-47pU;
	Sun, 28 Sep 2025 16:44:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVi-0000000Gekp-3Wp8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:32 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C3E225F6E;
	Sun, 28 Sep 2025 18:44:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpWCGwt25lt2; Sun, 28 Sep 2025 18:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077868; bh=UbPnHJf956rZTtuCLsmnXRg9ZzBiNla+b7VWRly7X50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WDm1Gy3VYFTqwFfhm0pakU1sBUzZXUxpwTq4vxQPeKczZg9vM8y7GVTvd8rAvzBUO
	 npRYkCiCigcHMaaqX+knxUxQrivggI2gEteZuN4vhVkilwcVYwjL+R7gLu551+rQoR
	 YphJNwPfI/VzPu7u7T1N99uN/ZOEES05TgPjmNj/l/p+1cExOGnHTnz0mMNK8HDVdO
	 EmyjcZ7Fs9i0UOwQbQOm5KVNA9bmKuRzBX1blofFbg+JmXH35toLkvw7yeF4n+uvlB
	 HHKR1nJNnXqrK36G/AinGSIa9E6mRj+WLJxxnt5DH768qXbznxAY+w7IiQLlXXpEVP
	 E7Sz16VOSH4vQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:55 +0530
Subject: [PATCH 4/7] arm64: dts: exynos7870-on7xelte: relocate ${x}-names
 property after ${x}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-4-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=3400;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=UbPnHJf956rZTtuCLsmnXRg9ZzBiNla+b7VWRly7X50=;
 b=fYDg693vp5Xw8QFXe9ZhGEa7QFh5dp0xJyUgp7qsfXL6wqKWzu4vQSDNCrPWN61RYf+ypVJqJ
 FDCbhzHyEqaDghxz5x0HO0xbeLPbsfAn+MuomqDUWklJNS+EXe+A7Dq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094431_024796_1A3CBD00 
X-CRM114-Status: UNSURE (   8.16  )
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

All ${x}-names properties are conventionally placed after their
corresponding ${x} properties. For instance, 'clock-names' must follow
'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
changes to follow said convention. No functional changes made.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index b1d9eff5a82702cd7c9797b2124486207e03ad89..66413a9506276cca8925e644c0e857fb5c48112d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -47,8 +47,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_home &key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-home {
 			label = "Home Key";
@@ -139,8 +139,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -385,8 +385,8 @@ touchscreen@70 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		syna,reset-delay-ms = <200>;
 		syna,startup-delay-ms = <200>;
@@ -423,8 +423,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "1",  "0",  "0",
 			       "0", "-1",  "0",
@@ -449,16 +449,16 @@ proximity@48 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&proxm_irq>;
+		pinctrl-names = "default";
 
 		proximity-near-level = <25>;
 	};
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
@@ -476,8 +476,8 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
@@ -495,17 +495,17 @@ &mmc1 {
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -640,8 +640,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;

-- 
2.51.0


