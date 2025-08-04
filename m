Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F579C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9Y5WEyg2wD6p3X1x95PQ8hHUWj51XON8yXPIvFr2zg=; b=dtozMJ8Mn0vyim7ynUibdmN675
	pt+JlUG/mRJNghu1sIdYvCOiA8FRqmOvcnIAR65uPhY50I0LVlV3HjZTSjaZzExLIqBC/3IWHhNUi
	ZJKsyukfyb1c2vuBY3KUkDPMo19Ox8GkNx7KO4TrXHH+jMAzcoIWv7ZMVrGYzJfRT7PQ+wkjpvQND
	wvBWuyAAUpgL0l+px+XvbQzsqSe+CDnmh4dSjdet/uqN2dMdEqfUv8vwtvKwyk6MhDHC/30zSxnO/
	MqSKkEo6uLs+LRjmmavUBRwP7RtBgqYZU8g0wDC3K1MsK+xFKd+l+e3yKmyulNQR5ZR03nDMyiXaq
	+ka9B/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwuI-0000000Al6C-3MIJ;
	Mon, 04 Aug 2025 15:15:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw7v-0000000Af9a-1MKx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C22045E08;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C23C4CEFA;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317522;
	bh=SUEmfllbxCfuPwlmfLNSQ5Zq6XjkIAA05us9mJD3pTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uDLoSEjzgY7QQQV+umULTFZuwx+xylsxVX1YDLNRl4T1Q3WovI9DeTCl7qi+6lVsf
	 MblQfE/YyybwAGYTB6jGC+cJ2PNfeA03I+5Z9VHFKIIlWYJVnc0XL+wNMhb4eAizck
	 4J0GOUmZu1pKC+l+yP3chWK9We0LgfrhgM0/GA6Esp7lmOfYHJ2pqZ/E7xZC18Pxon
	 P7SV4YviMDVrP+FXbVHxmKgFlrr7O/wIJPGd85+c72A/UeictqJeWuVT7rpkhdnAwR
	 VSy1ORKB84K46Zb/iR9kBH25x/C8aCpOjfpSs7E9NrlbOprxhAvh+wpmFpAVWDQnyX
	 FxpBjkjaE4Bmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB71C87FCF;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 04 Aug 2025 16:26:41 +0200
Subject: [PATCH v5 4/4] arm64: dts: exynos: google: add Maxim MAX77759
 Fuel-gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-b4-gs101_max77759_fg-v5-4-03a40e6c0e3d@uclouvain.be>
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754317658; l=4842;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=WF3EeuQVRCI8z8XyGntN8UgYyyixrVyY5uSQUCZ94dw=;
 b=v68T20khFe1UGQ2JyoNgy4ms6kbeJYjj9SRA+1t4Mx+n0o6kAgF3AMdV/EemaH96ywtN6rd6t
 EPtpPJzp0m8A2BonUtQTkzYgodWp+grRpoUrNC1z/wYrp6tl5qw45Kw
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072523_451083_ADFD4CE1 
X-CRM114-Status: GOOD (  15.81  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Add the node for the Maxim MAX77759 fuel gauge as a slave of the i2c.

The TODO is still applicable given there are other slaves on the
bus (e.g. PCA9468, other MAX77759 functions and the MAX20339 OVP).

For the device specific values (full design capacity and terminal
current), the device should check an EEPROM at address 0x50 of the
hsi2c_8 for a battery id stored in register 0x17. A set of parameters
for the initialization of the fuel gauge should be chosen based on
this id. Those sets are defined here:

Link: https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviole-5.10-android15/arch/arm64/boot/dts/google/gs101-oriole-battery-data.dtsi
Link: https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviole-5.10-android15/arch/arm64/boot/dts/google/gs101-raven-battery-data.dtsi

This does not seem to be a standard pattern in the kernel currently
so it is not implemented. Values observed on tested devices are
instead used. The driver or the devicetree should be should be
extended in the future to take versions into account.

The pinctrl name follows the convention proposed in
Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org/

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 30 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  | 11 ++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 8df42bedbc036b5e97f6238d64820370043ffef2..18d147f6ea4a1a76c375996557349c866b9dad72 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -13,6 +13,12 @@
 / {
 	model = "Oriole";
 	compatible = "google,gs101-oriole", "google,gs101";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <4524000>;
+		charge-term-current-microamp = <45000>;
+	};
 };
 
 &cont_splash_mem {
@@ -27,3 +33,7 @@ &framebuffer0 {
 	format = "a8r8g8b8";
 	status = "okay";
 };
+
+&fuel_gauge {
+	monitored-battery = <&battery>;
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..3362ad89ef6bacb7349259cf9e14452193ff7361 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/usb/pd.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
@@ -99,6 +100,16 @@ &hsi2c_8 {
 	eeprom: eeprom@50 {
 		compatible = "atmel,24c08";
 		reg = <0x50>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			fg_state: fgstate@42 {
+				reg = <0x42 0x17>;
+			};
+		};
 	};
 };
 
@@ -188,6 +199,18 @@ usbc0_role_sw: endpoint {
 			};
 		};
 	};
+
+	fuel_gauge: fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&if_pmic_fg_int>;
+		interrupt-parent = <&gpa9>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		shunt-resistor-micro-ohms = <5000>;
+		nvmem-cell-names = "fg_state";
+		nvmem-cells = <&fg_state>;
+	};
 };
 
 &pinctrl_far_alive {
@@ -214,6 +237,13 @@ typec_int: typec-int-pins {
 };
 
 &pinctrl_gpio_alive {
+	if_pmic_fg_int: if-pmic-fg-int-pins {
+		samsung,pins = "gpa9-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index 1e7e6b34b8649bc700a745c579a0268f0f6a9524..f91800879ea94b8fb0008c5e1f828072cabc1ac7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -13,6 +13,13 @@
 / {
 	model = "Raven";
 	compatible = "google,gs101-raven", "google,gs101";
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4904000>;
+		charge-term-current-microamp = <49000>;
+	};
 };
 
 &cont_splash_mem {
@@ -27,3 +34,7 @@ &framebuffer0 {
 	format = "a8r8g8b8";
 	status = "okay";
 };
+
+&fuel_gauge {
+	monitored-battery = <&battery>;
+};

-- 
2.50.1



