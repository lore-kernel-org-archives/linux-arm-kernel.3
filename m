Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DADDC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRzqf2shrR44HA8wPQ1sC1lsZa/glIiZVGgK/DCpDrU=; b=nZffDuqGb2p9u4J79YHROt83px
	3yhDsg20G0fYfiWy2bZxQmbRi7AIIbRIcu1/yubHioQgdLTRmsTdBwKcyOibfjfzPBOWh6TzlO9TB
	pnLxJP1Fq9bw5pTBNRqpDLdWJ6/J4BPFLt2kWrL2yhXTAJzOnrXmmQ+5EF3KMZZgMesng7+Npmikp
	Kf0ln8Tx0tmqzQFbkTanOWj8VJenAaViveiqUWAn9d+A+tOMgN1QRN2t4RNhDgdfwHdy7tuewUH87
	GxwwF5mHS1zLoxlRUoAK6zfLO9ErSOO17YUUSRIC8myzHAAvBv0W9pTTDOl0wbOKCirfV91xHJUeL
	Vb8S5zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JNQ-0000000Bzc7-1ECe;
	Wed, 09 Sep 2026 14:34:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JN6-0000000BzHv-3N1z;
	Wed, 09 Sep 2026 14:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C57260230;
	Wed,  9 Sep 2026 14:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF5CBC2BCFB;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=FgYAt4FdKYRaHvN/Jovmu1CGu4q+km/qUNCr8TO8xwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dSDSqR9NYHZPXJdLKkHQZSfdvCQUzG6w9qXm7qH34YR0/ODBkPFJ4kkwD4uT5UaKT
	 /Ycjuw8ArmuMvoET1oNSpr2dwe1cIV9VKyfYFoE8rnF2yv1ZjTO8cyzDUxhTEcGXar
	 hYKgy4Z8zb3azsOLEzJTrA68QlHj/2srEFDIQfGRy/kl7ch84qcThAjA9WE0DMdtD7
	 XDxPIbw0D8YrnzColj3cBktajy2mtF0qoWjOde2otC2sv7YfPZxWSkcjfdIdvpzFrX
	 6vWanek3cwHyBlUglaWX0hRkagI92lVNLpNgWfpHSwbdE3snMd4/p81jTLbR0283ns
	 F9Cv4xvlYbZdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD068C79FBB;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:26 +0800
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Follow the DTS coding style
 in the NanoPi RK3528 devicetrees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-5-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4985;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Dx8JcLzyZT+3t40Yo8VLHukY1rcwOrhijfk5CDwzcYM=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYE7JdWva/W4qp3d+23SVVPXZafqJcsLzBN33Zij9
 7zK9mJQRykLgxgXg6yYIovspupIoVXRM4tYpI7DzGFlAhnCwMUpABPZZcfwm82k4GDV/Emnb8i8
 nLFiVVn0j+zz0WdEazScD7FsUP92zI+R4eaXS3cN3RfbX3Z2tN3bHW41r/GnWYewgeLUidfPJzE
 U8gMA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

scripts/dtc/dt-check-style --mode=strict reports two deviations from
Documentation/devicetree/bindings/dts-coding-style.rst in the shared
NanoPi RK3528 devicetree and in the NanoPi Zero2 board devicetree:
"pinctrl-0" has to sort before "pinctrl-names", and "status" has to be
preceded by a blank line when the node has content before it.

Sort the properties and add the missing blank lines. The generated
devicetree blobs are unchanged.

The remaining findings of the tool are left alone, as they contradict
the established practice in arch/arm64/boot/dts/rockchip: "model"
before "compatible", "regulator-name" before the other regulator
properties, "regulator-min-microvolt" before "regulator-max-microvolt",
"pwms" before "pwm-supply" and "linux,code" before "wakeup-source" or
"press-threshold-microvolt".

Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  5 +++--
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 26 +++++++++++++++-------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 48e4273872..96c537da6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -25,8 +25,8 @@ button-recovery {
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
 		pinctrl-0 = <&led1>, <&led_sys>;
+		pinctrl-names = "default";
 
 		led-0 {
 			color = <LED_COLOR_ID_RED>;
@@ -59,8 +59,8 @@ usb2_host_5v: regulator-5v0-usb2-host {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&usb20_host1_pwren>;
+		pinctrl-names = "default";
 		regulator-name = "usb2_host_5v";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -96,5 +96,6 @@ &usb_host0_ohci {
 
 &usb2phy_host {
 	phy-supply = <&usb2_host_5v>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
index 1980d14d6f..45e31b90a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
@@ -77,8 +77,8 @@ vcc_3v3: regulator-3v3-vcc {
 	vcc3v3_sd: regulator-3v3-vcc-sd {
 		compatible = "regulator-fixed";
 		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwren_l>;
+		pinctrl-names = "default";
 		regulator-name = "vcc3v3_sd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -97,8 +97,8 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 	vccio_sd: regulator-vccio-sd {
 		compatible = "regulator-gpio";
 		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		pinctrl-names = "default";
 		regulator-name = "vccio_sd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
@@ -152,20 +152,23 @@ &gmac1 {
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-id";
 	phy-supply = <&vcc_3v3>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
 		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+
 	status = "okay";
 };
 
 &i2c1 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	hym8563: rtc@51 {
@@ -174,8 +177,8 @@ hym8563: rtc@51 {
 		#clock-cells = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&rtc_int_l>;
+		pinctrl-names = "default";
 		wakeup-source;
 	};
 };
@@ -216,19 +219,22 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 };
 
 &pwm1 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pwm1m0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &pwm2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pwm2m0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &saradc {
 	vref-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -241,6 +247,7 @@ &sdhci {
 	non-removable;
 	vmmc-supply = <&vcc_3v3>;
 	vqmmc-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -252,12 +259,14 @@ &sdmmc {
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
+
 	status = "okay";
 };
 
 &uart0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -266,6 +275,7 @@ &usb_host0_xhci {
 	maximum-speed = "high-speed";
 	phys = <&usb2phy_otg>;
 	phy-names = "usb2-phy";
+
 	status = "okay";
 };
 

-- 
2.55.0



