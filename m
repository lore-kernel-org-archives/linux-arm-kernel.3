Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E60C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wg7ENZe68tYnBvM7KrefHw01PjvjPra7kg4z+FggwU=; b=DnNXrrCXjGg5o8PEoi12LJxQj7
	iD0ZZV9iL76U+CoT6RRzgB2GF7q9Q9+uOO2HEfu2uT55UCAeex4amL4SV5uvhQgMjqnpvMy4w3KnM
	0cv0s1z07JvP0e/RI+m3bfp7d3+HUFSwh37c2rEDvCUOmbRvvAGgoGJuRTAO3RYMjPaEKq7RxP6BP
	HVhLSY0F4J6Gg8T+nS/ze7Evc9pi9Luxjr1LuTWoIn+JoEOfDqScEVYDj7v2DMCQuFlBgs07tLy/g
	pncuZR/W5tj0rZ3+dRQOe7PK9aYzC5JmB7Pd8dP/acTW5QuK6UmZSaXGvZzLlWHDGPs8zUHKEJN61
	GxGnbf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N0e-0000000CbmY-0OKy;
	Wed, 09 Sep 2026 18:27:00 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N0Z-0000000Cbk9-0VUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:26:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BD93102AD6;
	Wed, 09 Sep 2026 20:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788978409; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1Wg7ENZe68tYnBvM7KrefHw01PjvjPra7kg4z+FggwU=;
	b=gDzO7eohwLt3Qe+C8Qd9pn8up2gjS6VhXrnbxqkJma2v7dTcfCmnrFRfMCKkJI+MwmFUTN
	+TNIcQ18EnorZ80Jye8JVIYG3HX33TyokLfpEK/0Il35M6HvCf/sOimAYclN2FMyF0RsWb
	1+I5aUujV58ttSM32NPe+YOKecFmMJTWctkwP4jfAVtNd+lB80ZG3iI40J4VKdVhEqjCkx
	cPEoAN+QU+8D2v8nQ+ABwTlEMyHFf4HFRXzoNjGRfFnLhDd+NDm/uEvaKjynYTR5fdklOR
	WpadlhXpXYoD58vx6N6edvt8XwZzOshdGpQ3EEf6VJ1vqxJ1T25Ixxa4uTSixg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Date: Wed,  9 Sep 2026 20:26:05 +0200
Message-ID: <20260909182641.165383-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909182641.165383-1-marex@nabladev.com>
References: <20260909182641.165383-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_112655_507102_AFE5289F 
X-CRM114-Status: GOOD (  14.95  )
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

Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
      undocumented, but the TI DP83822I is generic C45 PHY that
      is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
---
V2: - Rename lm75 node to sensor@
    - Use GPIO_ACTIVE_LOW macro
---
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 321 ++++++++++++++++++
 2 files changed, 322 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b276df0..936ddf6eb80a6 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-vhip6-evalboard.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
new file mode 100644
index 0000000000000..0108f3d505a7f
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ifm Zynq UltraScale+ MPSoC VHIP6 Evaluation Board
+ *
+ * Copyright (C) 2022-2026 Fedor Ross, ifm ecomatic gmbh
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "zynqmp.dtsi"
+#include "zynqmp-clk-ccf.dtsi"
+
+/ {
+	model = "ifm ZynqMP VHIP6 Evaluation Board";
+	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
+
+	aliases {
+		ethernet0 = &gem0;
+		ethernet1 = &gem1;
+		ethernet2 = &gem2;
+		ethernet3 = &gem3;
+		gpio0 = &gpio;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		rtc0 = &i2crtc;
+		serial0 = &uart0;
+		spi0 = &qspi;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	chosen {
+		bootargs = "clk_ignore_unused";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
+
+&dwc3_1 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&gem0 {
+	phy-handle = <&phy0>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio0: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 78 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&gem1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+
+	mdio1: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			max-speed = <100>;
+			reset-gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+			tx-internal-delay-ps = <1>;
+		};
+	};
+};
+
+&gem2 {
+	phy-handle = <&phy2>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio2: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy2: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 79 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&gem3 {
+	phy-handle = <&phy3>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio3: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy3: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 80 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+		/* GPIO 0 - 77 */
+		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "",
+		"ifm_device_info_eeprom_wp",
+		"", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/* EMIO 0 - 96 */
+		"", "", "", "", "", "", "", "",	"", "",	"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		label = "ifm-logging";
+		wp-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+		label = "ifm-deviceinfo";
+		wp-gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			vhip-signature@0 {
+				reg = <0x0 0x4>;
+			};
+
+			vhip-version@4 {
+				reg = <0x4 0x4>;
+			};
+
+			vhip-size@8 {
+				reg = <0x8 0x4>;
+			};
+
+			device-serial@c {
+				reg = <0xc 0x10>;
+			};
+
+			order-number@1c {
+				reg = <0x1c 0x20>;
+			};
+
+			article-name@3c {
+				reg = <0x3c 0x20>;
+			};
+
+			article-rev@5c {
+				reg = <0x5c 0x4>;
+			};
+
+			hardware-rev@60 {
+				reg = <0x60 0x4>;
+			};
+
+			product-type@64 {
+				reg = <0x64 0x20>;
+			};
+
+			software-compatibility@84 {
+				reg = <0x84 0x4>;
+			};
+
+			manufacturing-date@88 {
+				reg = <0x88 0x20>;
+			};
+
+			production-order-number@a8 {
+				reg = <0xa8 0x20>;
+			};
+
+			/* Each MAC address is padded to 8 Bytes */
+			cfg_eeprom_mac1: mac-address-1@c8 {
+				reg = <0xc8 0x8>;
+			};
+
+			cfg_eeprom_mac2: mac-address-2@d0 {
+				reg = <0xd0 0x8>;
+			};
+
+			cfg_eeprom_mac3: mac-address-3@d8 {
+				reg = <0xd8 0x8>;
+			};
+
+			cfg_eeprom_mac4: mac-address-4@e0 {
+				reg = <0xe0 0x8>;
+			};
+
+			cfg_eeprom_mac5: mac-address-5@e8 {
+				reg = <0xe8 0x8>;
+			};
+
+			cfg_eeprom_mac6: mac-address-6@f0 {
+				reg = <0xf0 0x8>;
+			};
+
+			cfg_eeprom_mac7: mac-address-7@f8 {
+				reg = <0xf8 0x8>;
+			};
+
+			cfg_eeprom_mac8: mac-address-8@100 {
+				reg = <0x100 0x8>;
+			};
+
+			next-block-offset@108 {
+				reg = <0x108 0x4>;
+			};
+
+			section-crc@10c {
+				reg = <0x10c 0x4>;
+			};
+		};
+	};
+
+	i2crtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <80000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&sdhci0 {
+	xlnx,mio-bank = <0x0>;
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+
+	eeprom@0 {
+		compatible = "atmel,at25";
+		reg = <0x0>;
+		address-width = <16>;
+		pagesize = <64>;
+		size = <32768>;
+		spi-max-frequency = <60000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb1 {
+	reset-gpios = <&gpio 77 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
-- 
2.53.0


