Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167E7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObLaAYoyvB6LoMw99kz/PIoFUnb2A80Eg5JhAz6Bfs4=; b=jUHb/3+oVTDMymiVKkKaFE0oQU
	jVSS7xj8eWXVxP7cxrnUDdUf2wYTX+HRJtIsp+UR7pXTzj7V9uBC8sJtkPXG1iyGxHqRchonvlGoP
	aYaT9FbQ4CtgFfhfmgV/HL5fBbMVz1QoIrpKdPfMFTeEdL0LgcCQG5j89XjzOaNWrP7yycUtIkskl
	pXBORx39nyrP48/1LqxnbVyjZ0ToN/RIqBlRETT6BljCoNZip5qtMBoniLfEppcYuMq2HA8mAo2XQ
	bpeRjuQ3wjwGJWypBnjg4SCL4fpMadFU1ahSgvdOt91Z/AS07CNYDOtXvz3xdvhxjAOh5lxM9YHpG
	5PGo4WIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqqw-0000000DmU8-0S6y;
	Wed, 04 Jun 2025 16:20:34 +0000
Received: from smtp-190a.mail.infomaniak.ch ([2001:1600:4:17::190a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqop-0000000DmJN-0OyB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 16:18:25 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCCRs1k0Vz2q8;
	Wed,  4 Jun 2025 18:18:17 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCCRr39Q3zXxC;
	Wed,  4 Jun 2025 18:18:16 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 04 Jun 2025 18:18:08 +0200
Subject: [PATCH v3] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
X-B4-Tracking: v=1; b=H4sIAL9xQGgC/4XNTQ6CMBCG4auQrh1DCwV05T2Mi/4MtCaCaWsVC
 He3sGJjXL5fMs/MxKOz6Mk5m4nDaL0d+hTFISPKiL5DsDo1YTnjOWcU7qJ7CQcPnCbAYMC/bVA
 Gal6WvNVU1YyTdPx02NrPBl9vqY31YXDj9ifSdf1LRgo5nCRXZYNSNlV9UQadG48ayUpGtmeKn
 wwDCkKhbmRbVZTpPbMsyxcrQaQRAwEAAA==
X-Change-ID: 20250521-jaguar-mezz-eth-switch-75445fd1c725
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_091823_410322_90F12A99 
X-CRM114-Status: GOOD (  17.62  )
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

This adds support for the Ethernet Switch adapter connected to the
mezzanine connector on RK3588 Jaguar.

This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
connectors, two user controllable LEDs, and an M12 12-pin connector
which exposes the following signals:
 - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
 - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
 - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
   GPIO3_D1)
 - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
@Andrew, I haven't forgotten the request for adding tx-internal-delay-ps
support to RK3588 GMAC but it wouldn't change the Device Tree for Jaguar
as we have the delay on the PHY side only.
I have a patch that needs testing and then will send it for review.
---
Changes in v3:
- fixed comment style in i2c1,
- added link to manual (content half broken at the moment but will be
  fixed soon (tm)),
- Link to v2: https://lore.kernel.org/r/20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de

Changes in v2:
- removed patch 1 adding ethernet1 alias to jaguar base DTS,
- added ethernet1 alias in the DTSO,
- change rgmii phy-mode to rgmii-id and have the delay in the PHY
  instead, as suggested by Andrew,
- Link to v1: https://lore.kernel.org/r/20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../rockchip/rk3588-jaguar-ethernet-switch.dtso    | 195 +++++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db473696f64b157ba94560f476d4f52f..1321f54da28ad6aefae7eccf02ad95a4ee2264d5 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -160,6 +160,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
@@ -233,6 +234,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-wifi.dtb
 rk3588-edgeble-neu6b-wifi-dtbs := rk3588-edgeble-neu6b-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
+rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-ethernet-switch.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
 rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-pre-ict-tester.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..7d9b1f080b3fcc9e19ff4973e90b763bfaa573b5
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ *
+ * Device Tree Overlay for the Ethernet Switch adapter for the Mezzanine
+ * connector on RK3588 Jaguar
+ * (manual: https://embedded.cherry.de/jaguar-ethernet-switch-user-manual/)
+ *
+ * This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet connectors,
+ * two user controllable LEDs, and an M12 12-pin connector which exposes the
+ * following signals:
+ *  - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
+ *  - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
+ *  - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to GPIO3_D1)
+ *  - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)
+ *
+ * RK3588 Jaguar can be powered entirely through the adapter via the M8 3-pin
+ * connector (12-24V).
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	aliases {
+		ethernet1 = "/ethernet@fe1c0000";
+	};
+
+	mezzanine-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_usr1_pin &led_usr2_pin>;
+
+		led-1 {
+			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+			label = "USR1";
+		};
+
+		led-2 {
+			gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+			label = "USR2";
+		};
+	};
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_rx_bus2
+		     &gmac1_tx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus
+		     &eth1_pins>;
+	rx_delay = <0x0>;
+	tx_delay = <0x0>;
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	/*
+	 * ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
+	 * but SoC can handle only up to 400kHz.
+	 */
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PC7 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&adc_alert>;
+		pinctrl-names = "default";
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <5>; /* Single-ended between AIN1 and GND */
+			ti,datarate = <0>;
+			ti,gain = <5>;
+		};
+
+		channel@2 {
+			reg = <6>; /* Single-ended between AIN2 and GND */
+			ti,datarate = <0>;
+			ti,gain = <5>;
+		};
+	};
+
+	switch@5f {
+		compatible = "microchip,ksz9896";
+		reg = <0x5f>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PB7 IRQ_TYPE_EDGE_FALLING>; /* ETH_INTRP_N */
+		pinctrl-0 = <&eth_reset_n &eth_intrp_n>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>; /* ETH_RESET */
+		microchip,synclko-disable; /* CLKO_25_125 only routed to TP1 */
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lan1: port@0 {
+				reg = <0>;
+				label = "ETH1";
+			};
+
+			lan2: port@1 {
+				reg = <1>;
+				label = "ETH2";
+			};
+
+			lan3: port@2 {
+				reg = <2>;
+				label = "ETH3";
+			};
+
+			lan4: port@3 {
+				reg = <3>;
+				label = "ETH4";
+			};
+
+			port@5 {
+				reg = <5>;
+				ethernet = <&gmac1>;
+				label = "CPU";
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <2000>;
+				tx-internal-delay-ps = <2000>;
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	adc {
+		adc_alert: adc-alert-irq {
+			rockchip,pins =
+				<3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	ethernet {
+		eth_intrp_n: eth-intrp-n {
+			rockchip,pins =
+				<3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		eth_reset_n: eth-reset-n {
+			rockchip,pins =
+				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_usr1_pin: led-usr1-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		led_usr2_pin: led-usr2-pin {
+			rockchip,pins =
+				<3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&uart9 {
+	/* GPIO3_D0/EN_RS485_MODE for switching between RS232 and RS485 */
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_rtsn>;
+	pinctrl-names = "default";
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};

---
base-commit: 5abc7438f1e9d62e91ad775cc83c9594c48d2282
change-id: 20250521-jaguar-mezz-eth-switch-75445fd1c725

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


