Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrjiL8gREaotPHEf47Ag0NZU7yfgejgTAoVGa97++6U=; b=zhAjAFdbEPN8TE3cx9S7auJHp+
	kzaIa2czgBjA7dAKvJhvaIlXn1tuCTQtymezo0uqpkdhz79PuqGEU6IHiblEqeXhUdhUe39wroNT4
	vCRESUNoEK1PCEd9+veQzYxfnBDnCFBlIIh31wuFXRta0kPGAhr+nLomu0rtlVXZXbgPtNOzalpLB
	ZnC/c1a8xcZwXyzUSJPyVKiNaRcxI9tC34sDCFzMu/uB2jXCFmp/E+uJHwJREzbK7nOzv5QNac3j4
	ZQahTFxPhjBFIFj1hUs6y/h288605js3w2v60on9uc7+fmDla27vLZRsYKwz8vxdjoR3VTPA0tvYS
	86tc60yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVi-0000000GelU-1U0G;
	Sun, 28 Sep 2025 16:44:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVd-0000000GegG-0hWj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:26 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 833AB25F6E;
	Sun, 28 Sep 2025 18:44:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1oXz3zQtE9i; Sun, 28 Sep 2025 18:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077863; bh=W7tJnP95hyUEWGNcPwAbe7Oj2n+1XQRFsX/DmSwFBAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HQvgaoTipU32grUZI7A7bEOhLg12tZ6IhoCEXy8odnpxxm6DjEt2f3a3DObcYPVWL
	 e08bPa17JxXY+kJJIQ+AHfsBDGNa1twrd9lGyyGmfh+ZZyMXDh5A+jn4vXpncsHnxz
	 JDNYfLeGefI3fIAbhZJ2qSNzbibKuCJOLH6sbwFsVWqnyiGBSPY9gYQsAAHl6Z6dDA
	 gEHfpXYuW2/igx0gg2DbaKwzRyc4YZ2viyn0lp/8ZIL9Yzm5x9mvYE9qbQyLJ74MNz
	 yqsVLCsjLcW1WuuWgGCsaJBEZ1TPFDU/sk6B6N1y1Vb1/C7p0ngDNs34DwvlTiMFp7
	 jZrYu5aw2LVJw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:54 +0530
Subject: [PATCH 3/7] arm64: dts: exynos7870-j6lte: relocate ${x}-names
 property after ${x}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-3-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=3458;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=W7tJnP95hyUEWGNcPwAbe7Oj2n+1XQRFsX/DmSwFBAo=;
 b=VYquYavS5dw58+dRSsHgr0zW6A3A/hWh4xitfihLdzdiBiaLvKR7b5eW/+gcpoqymmyJPjSZB
 E18+vHIO2aBAsMuuOf5nnyOB/5+hid96eg1/K/IgK56Z7c/A97YE/pX
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094425_386547_BFF28DFB 
X-CRM114-Status: UNSURE (   8.34  )
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
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index b8ce433b93b1b488da31bbe4846f8092243611ad..b2990b5466c949c18a61d1b1c4427986b19804ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -47,8 +47,8 @@ gpio-hall-effect-sensor {
 		compatible = "gpio-keys";
 		label = "GPIO Hall Effect Sensor";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&hall_irq>;
+		pinctrl-names = "default";
 
 		event-hall-effect-sensor {
 			label = "Hall Effect Sensor";
@@ -64,8 +64,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-power {
 			label = "Power Key";
@@ -149,8 +149,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -387,8 +387,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "-1", "0",  "0",
 				"0", "1",  "0",
@@ -413,8 +413,8 @@ touchscreen@20 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1480>;
@@ -424,8 +424,8 @@ touchscreen@20 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
@@ -443,8 +443,8 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
@@ -462,17 +462,17 @@ &mmc1 {
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
@@ -591,8 +591,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;

-- 
2.51.0


