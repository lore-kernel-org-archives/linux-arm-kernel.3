Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC9C44509
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 22:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiR326BltenYfP7oOmK/uyciJKx9HucPz1BDtKemkaM=; b=RxUFgQM1/Aywb5SDx1qlDyDEdA
	NavOqMVzALYIIkU1kmputkKI1PV/aqODsDO+OThs9ehXF3o5wvW0oHUzeOcVkjhC6v1PygLJz13C5
	VVRX+KmGXHBrihUM16bojCS52PLFT0KHFoC7kpVePmyyQJLRuNqY2TYgai3TzJAIj1pCd1+DOG5bU
	P91ECXF/Zm5Mq8xSiFh2mj7FCOEzsVzhjCrbjMCxXmc/VyxNvMNtDmc1Vyutrb9n8XHSAdy7pJJhT
	CNh75VCzwRj0AJpJvvxP4CCfU7jKPJi/8folR5K4p3Nvb9iXw5FVbzz5I04ZpO1oMX9306OmQWaue
	ylK6jPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPaA-00000005cNX-0ly8;
	Thu, 02 Jul 2026 22:08:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPa4-00000005cHN-2n85;
	Thu, 02 Jul 2026 22:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D96F43F0D;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0BA8C2BCF6;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=p8WO4o/I480NES+b3qaNouXk4eoGUbReu9hZJqx0uvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W5JUxAN3zLhJ53gQZvVEeA0Zkp8efjA3gsf0GarMjYTGioiyOvbZVCd9Pjl+06lhL
	 mn1g2TQd7OVrZWIgLPN+ZNDUNrwowt7kqtlpmzJzH468mddVutrUq/cDVJvMMRHCt8
	 tqBnaQJbwXQLEBrQKYh8CXnEsmVA28Vak1bGuijZNRh+mFRQmx968dw5tbcVd/pNlW
	 JC6I1+Fx5rLA2lCzlpkrB5a4GGMjf+IGuKBnlZskbr4A0Fm4KSWxM5tI78Gou+M3Nq
	 pB7qlws3rYRCKnYzKl8K+kz061lgDniOK10e91BOTcEkeXLZQP36noLB1/9zvpMgO1
	 7gLr2WSGtbTow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45DBC43327;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:18 +0200
Subject: [PATCH 03/12] arm64: dts: rockchip: move NanoPi R6 code into
 common dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-3-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=6924;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=l+IoGL0+AR8uHVcN+bVq+UedJE3QXtq5gzvflNswvyo=;
 b=EMU88dour4nfaO1bE9tsP+h3kY20srqlGoBU4BZdfjH+8c4EnBfj9Pmg6PSOl1DDHMl83XZwT
 P6S1Byw6GKxBFVnlM9uEGqFAa4m2T/qYwbN64qe35L9RXkCueBCQpkz
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Move NanoPi R6C and R6S specific DT into its own file.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 96 ++++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |  1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 89 --------------------
 4 files changed, 98 insertions(+), 89 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
new file mode 100644
index 000000000000..2f8c580afc2b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key1_pin>;
+
+		button-user {
+			label = "User";
+			linux,code = <BTN_1>;
+			gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_led: led-0 {
+			label = "sys_led";
+			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sys_led_pin>;
+		};
+
+		wan_led: led-1 {
+			label = "wan_led";
+			gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&wan_led_pin>;
+		};
+
+		lan1_led: led-2 {
+			label = "lan1_led";
+			gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lan1_led_pin>;
+		};
+
+		lan2_led: led-3 {
+			gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lan2_led_pin>;
+		};
+	};
+
+	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vcc5v0_usb_otg0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb>;
+	};
+};
+
+&pinctrl {
+	gpio-key {
+		key1_pin: key1-pin {
+			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gpio-leds {
+		sys_led_pin: sys-led-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wan_led_pin: wan-led-pin {
+			rockchip,pins =
+				<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lan1_led_pin: lan1-led-pin {
+			rockchip,pins =
+				<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lan2_led_pin: lan2-led-pin {
+			rockchip,pins =
+				<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
index 77fef2662ca5..90922c55da37 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "rk3588s-nanopi.dtsi"
+#include "rk3588s-nanopi-r6.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6C";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
index f8993418a122..8b318561342c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "rk3588s-nanopi.dtsi"
+#include "rk3588s-nanopi-r6.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6S";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 91b6eefd7abf..d41c49716fa2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -33,19 +33,6 @@ button-maskrom {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&key1_pin>;
-
-		button-user {
-			label = "User";
-			linux,code = <BTN_1>;
-			gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
-			debounce-interval = <50>;
-		};
-	};
-
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -57,38 +44,6 @@ hdmi_con_in: endpoint {
 		};
 	};
 
-	leds {
-		compatible = "gpio-leds";
-
-		sys_led: led-0 {
-			label = "sys_led";
-			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-			pinctrl-names = "default";
-			pinctrl-0 = <&sys_led_pin>;
-		};
-
-		wan_led: led-1 {
-			label = "wan_led";
-			gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&wan_led_pin>;
-		};
-
-		lan1_led: led-2 {
-			label = "lan1_led";
-			gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lan1_led_pin>;
-		};
-
-		lan2_led: led-3 {
-			gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lan2_led_pin>;
-		};
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -151,18 +106,6 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&typec5v_pwren>;
-		regulator-name = "vcc5v0_usb_otg0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
-	};
-
 	vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -380,34 +323,6 @@ &pd_npu {
 };
 
 &pinctrl {
-	gpio-key {
-		key1_pin: key1-pin {
-			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	gpio-leds {
-		sys_led_pin: sys-led-pin {
-			rockchip,pins =
-				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		wan_led_pin: wan-led-pin {
-			rockchip,pins =
-				<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		lan1_led_pin: lan1-led-pin {
-			rockchip,pins =
-				<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		lan2_led_pin: lan2-led-pin {
-			rockchip,pins =
-				<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -427,10 +342,6 @@ sd_s0_pwr: sd-s0-pwr {
 	};
 
 	usb {
-		typec5v_pwren: typec5v-pwren {
-			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
 		vcc5v0_host20_en: vcc5v0-host20-en {
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.55.0



