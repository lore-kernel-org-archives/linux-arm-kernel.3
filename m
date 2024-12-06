Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1558E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cbygikUCESgNV8TlX+N1yyRafcdbiIiqKGBmV3HzKrM=; b=kFUdqj2VCQa6exrcbNpadF5cEY
	EbeAPMMXGiQJkVBXdzSYV2WPXkjcphqLQvk6lYE9jPnAg1Z4I1eK2bJHULdMrGI9DmsxVUHm+8Kee
	KIvT6nT8BzfJjXpKo4IAiy5Ywjf8PJAb2IQ8qiyzY0eF84dS8Xb2qNfmV0tl3MgLmnzviT+JqF7QW
	ILTXevBUd/GSoVdSGdmv2pyRwsOZdbEpG0ieeYipkAIyRR9IVBKPhbM/et6RYy2RwqFqyfMuZCkTc
	YLPOYN5yIrMhgVI73/LRdl9WWCfHdKf4ws/IhqIdhNHxnVzPysz/yhL1VQVepKAjVLO54I1GIUC3S
	q1sZZxtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaaA-000000022nX-0YmJ;
	Fri, 06 Dec 2024 15:49:30 +0000
Received: from smtp-42ae.mail.infomaniak.ch ([2001:1600:4:17::42ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaXF-000000022MR-1wlS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:46:31 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Y4bG85qNJztSm;
	Fri,  6 Dec 2024 16:46:24 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Y4bG81dM8z6Rx;
	Fri,  6 Dec 2024 16:46:24 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 06 Dec 2024 16:46:17 +0100
Subject: [PATCH] arm64: dts: rockchip: minimal support for Pre-ICT tester
 adapter for RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAEgcU2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3YIioFByiW5WYnppYpFukqVBWmJaaqpFUoqFElATUDotswJsYHR
 sbS0AYe0Q72AAAAA=
X-Change-ID: 20241206-pre-ict-jaguar-b90fafee8bd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074629_774363_5C7935ED 
X-CRM114-Status: GOOD (  19.62  )
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
GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
rails and can only be used as input and their bias are important to be
able to properly detect soldering issues.
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..60074d21d92b4800bdc555648a9360e13d19febc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
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

---
base-commit: b8f52214c61a5b99a54168145378e91b40d10c90
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


