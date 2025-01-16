Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EBAC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7sqGys7nvKOPvERPDHxZGh/399RltTubDkuslGcOGw=; b=Gtmr1teXVVkEWWjHFYIIYbWC2S
	9moghjnZlELpUDLnTAz9Jza3V1KCkBUX60PE1JdPZogZCt/uuEQ2VaKzIiE6wfJqGl25FxYeoxPMJ
	Okrm0K+6Eoif2Qd2YGTRzxJYOeSWVlq/6CVajqCi5ucD1rTrJl5yGQWwoAHl+Q99e2k2BiFla8spB
	wuHNTajDVI2I5QhMFVPdB86cBuv6G8EwRjgN9cVGIgQkATMxdWM8gPOGzBkoRJuEIpnDDNA1nb/em
	s8jWAr+pKGfyI2nlKt+oSzRfkKW2MQNxsq2UjPugH4KLknJf+EoZYYddEAsMH0m86qnBORzT70mW9
	tAFMaG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRFF-0000000FFOn-1Gtv;
	Thu, 16 Jan 2025 14:53:17 +0000
Received: from smtp-190a.mail.infomaniak.ch ([185.125.25.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRAC-0000000FDsc-0lcQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:48:05 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YYm1m1T7jzBHW;
	Thu, 16 Jan 2025 15:47:56 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YYm1k6M7czZGk;
	Thu, 16 Jan 2025 15:47:54 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 16 Jan 2025 15:47:12 +0100
Subject: [PATCH v2 3/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-pre-ict-jaguar-v2-3-157d319004fc@cherry.de>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
In-Reply-To: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_064804_361267_53464912 
X-CRM114-Status: GOOD (  20.69  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The Pre-ICT tester adapter connects to RK3588 Jaguar SBC through its
proprietary Mezzanine connector.

It exposes a PCIe Gen2 1x M.2 connector and two proprietary camera
connectors. Support for the latter will come once the rest of the camera
stack is supported.

Additionally, the adapter loops some GPIOs together as well as route
some GPIOs to power rails.

This adapter is used for manufacturing RK3588 Jaguar to be able to test
the Mezzanine connector is properly soldered.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 72f8666b42400a2f462421f5db6b3cb0cf369611..deeb96609461847d4039e144beb36522333ca398 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -163,9 +163,11 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
 
 # Overlays
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
 
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb rk3588-edgeble-neu6a-wifi.dtbo
+rk3588-jaguar-pre-ict-tester-dtbs     := rk3588-jaguar.dtb rk3588-jaguar-pre-ict-tester.dtbo
 rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-ep.dtbo
 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..9d44dfe2f30d793accb994a230c58038f0c3daad
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2024 Cherry Embedded Solutions GmbH
+ *
+ * Device Tree Overlay for the Pre-ICT tester adapter for the Mezzanine
+ * connector on RK3588 Jaguar.
+ *
+ * This adapter has a PCIe Gen2 x1 M.2 M-Key connector and two proprietary
+ * camera connectors (each their own I2C bus, clock, reset and PWM lines as well
+ * as 2-lane CSI).
+ *
+ * This adapter routes some GPIOs to power rails and loops together some other
+ * GPIOs.
+ *
+ * This adapter is used during manufacturing for validating proper soldering of
+ * the mezzanine connector.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	pre_ict_tester_vcc_1v2: regulator-pre-ict-tester-vcc-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pre_ict_tester_vcc_1v2";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	pre_ict_tester_vcc_2v8: regulator-pre-ict-tester-vcc-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "pre_ict_tester_vcc_2v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&gpio3 {
+	pinctrl-0 = <&pre_ict_pwr2gpio>;
+	pinctrl-names = "default";
+};
+
+&pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2x1l2_perstn_m0>;
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>; /* PCIE20X1_2_PERSTN_M0 */
+	vpcie3v3-supply = <&vcc_3v3_s3>;
+	status = "okay";
+};
+
+&pinctrl {
+	pcie2x1l2 {
+		pcie2x1l2_perstn_m0: pcie2x1l2-perstn-m0 {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pre-ict-tester {
+		pre_ict_pwr2gpio: pre-ict-pwr2gpio-pins {
+			rockchip,pins =
+			/*
+			 * GPIO3_A3 requires two power rails to be properly
+			 * routed to the mezzanine connector to report a proper
+			 * value: VCC_1V8_S0_1 and VCC_IN_2. It may report an
+			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
+			 * but GPIO3_C6 would catch this HW soldering issue.
+			 * If VCC_IN_2 is properly routed, GPIO3_A3 should be
+			 * LOW. The signal shall not read HIGH in the event
+			 * GPIO3_A3 isn't properly routed due to soldering
+			 * issue. Therefore, let's enforce a pull-up (which is
+			 * the SoC default for this pin).
+			 */
+				<3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
+			/*
+			 * GPIO3_A4 is directly routed to VCC_1V8_S0_2 power
+			 * rail. It should be HIGH if all is properly soldered.
+			 * To guarantee that, a pull-down is enforced (which is
+			 * the SoC default for this pin) so that LOW is read if
+			 * the loop doesn't exist on HW (soldering issue on
+			 * either signals).
+			 */
+				<3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_down>,
+			/*
+			 * GPIO3_B2 requires two power rails to be properly
+			 * routed to the mezzanine connector to report a proper
+			 * value: VCC_1V8_S0_1 and VCC_IN_1. It may report an
+			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
+			 * but GPIO3_C6 would catch this HW soldering issue.
+			 * If VCC_IN_1 is properly routed, GPIO3_B2 should be
+			 * LOW. This is an issue if GPIO3_B2 isn't properly
+			 * routed due to soldering issue, because GPIO3_B2
+			 * default bias is pull-down therefore being LOW. So
+			 * the worst case scenario and the pass scenario expect
+			 * the same value. Make GPIO3_B2 a pull-up so that a
+			 * soldering issue on GPIO3_B2 reports HIGH but proper
+			 * soldering reports LOW.
+			 */
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
+			/*
+			 * GPIO3_C6 is directly routed to VCC_1V8_S0_1 power
+			 * rail. It should be HIGH if all is properly soldered.
+			 * This is an issue if GPIO3_C6 or VCC_1V8_S0_1 isn't
+			 * properly routed due to soldering issue, because
+			 * GPIO3_C6 default bias is pull-up therefore being HIGH
+			 * in all cases:
+			 *  - GPIO3_C6 is floating (so HIGH) if GPIO3_C6 is not
+			 *    routed properly,
+			 *  - GPIO3_C6 is floating (so HIGH) if VCC_1V8_S0_1 is
+			 *    not routed properly,
+			 *  - GPIO3_C6 is HIGH if everything is proper,
+			 * Make GPIO3_C6 a pull-down so that a soldering issue
+			 * on GPIO3_C6 or VCC_1V8_S0_1 reports LOW but proper
+			 * soldering reports HIGH.
+			 */
+				<3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>,
+			/*
+			 * GPIO3_D2 is routed to VCC_5V0_1 power rail through a
+			 * voltage divider on the adapter.
+			 * It should be HIGH if all is properly soldered.
+			 * To guarantee that, a pull-down is enforced (which is
+			 * the SoC default for this pin) so that LOW is read if
+			 * the loop doesn't exist on HW (soldering issue on
+			 * either signals).
+			 */
+				<3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_down>,
+			/*
+			 * GPIO3_D3 is routed to VCC_5V0_2 power rail through a
+			 * voltage divider on the adapter.
+			 * It should be HIGH if all is properly soldered.
+			 * To guarantee that, a pull-down is enforced (which is
+			 * the SoC default for this pin) so that LOW is read if
+			 * the loop doesn't exist on HW (soldering issue on
+			 * either signals).
+			 */
+				<3 RK_PD3 RK_FUNC_GPIO &pcfg_pull_down>,
+			/*
+			 * GPIO3_D4 is routed to VCC_3V3_S3_1 power rail through
+			 * a voltage divider on the adapter.
+			 * It should be HIGH if all is properly soldered.
+			 * To guarantee that, a pull-down is enforced (which is
+			 * the SoC default for this pin) so that LOW is read if
+			 * the loop doesn't exist on HW (soldering issue on
+			 * either signals).
+			 */
+				<3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>,
+			/*
+			 * GPIO3_D5 is routed to VCC_3V3_S3_2 power rail through
+			 * a voltage divider on the adapter.
+			 * It should be HIGH if all is properly soldered.
+			 * To guarantee that, a pull-down is enforced (which is
+			 * the SoC default for this pin) so that LOW is read if
+			 * the loop doesn't exist on HW (soldering issue on
+			 * either signals).
+			 */
+				<3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};

-- 
2.48.0


