Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TqsOa1rvGDxopVBYQ+zTn4967jcE0GLlKMO9YJV04I=; b=aQUX4/2EOdi8D3JmEMDScg98dJ
	/Sz8CRhEpZbqKI1Wy4U7mDb64IXHYoCkaxQrMTnzVuZKRwLn03jyEbLx0f+Wtvh1c3BO60TZDErZf
	xD2DtHFYzsW4kYhn2RtOPoNqOyZdysWE4QVH4LQivMBClm87W5fYvVI6ruz9xSs48+FnV4sZNa8ku
	glQSj99MN8WUHT8/MTxOgJNfpBLN7yN2JFNkzrjiuHKdqfQFnw5poWhBSbFb1B833qAyXC3eFem4S
	Yizy7yG3fXElH4wZg8gqyPZeC0BFHBJFpsI93NcxzNJUt/3hD9FEQhlIgZd0hsR6/AlrAwXFQ8ASL
	6rghxJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWd-0000000Gv97-2f3q;
	Mon, 05 Oct 2026 17:30:55 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWZ-0000000Gv66-2aDn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221447; bh=4TqsOa1rvGDxopVBYQ+zTn4967jcE0GLlKMO9YJV04I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9YZuGu64l6YNUScxZAqrPveQSupH1zujFv8+6J0fKEyUVIWbD53R0CLzCGKmkxLH
	 tplAT6rbWFBmLV7q1Dsa3nDsiToHcn3m7SkL2Y5FNnAmS1LCldJXxdzCNhy2MGJ8K7
	 BPBw090a1EkNNeviBIlnTPHw1NFtkmDeuGHCmqck=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221444tw7m44esb
Message-ID: <tencent_B409D5BD9480045814D3720C7D9047C55406@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb56ovUuknNPm1oIUn05VExjOqJsUmdfwgXPZ8UhOh5pdOVgOxrAb
	 Tc/jw7pRzljOXyzCjQlL819NaOO1hIidkUgYJCLUlAsE7cCgd5vQIDi0m822WbhFglB6ZsbKMn+d
	 UTb61T659JM9zT/U37G0baid56y8+nILjDqp33F+wY2v2N22OLSelUHGGidelLsEkxlAsXzIB/hW
	 7YX4Vayzd4uVt/NvVwllWnfDH3O/G+p6V4KKjYt8jNJDL0ct/azAoHQvw4t1wI3FSoCS2d5/xRg8
	 d4+5y0xSxj76zROcUD9Ofd8IX1wIeFcPEgAaUvoQkEvG0iFijvddQYFF9IHPvxbYwiOgkIhT399P
	 z4q2C7gR31cKQu3jZ8axcRqP/yWqxK+qvFKCknSoOpi//25zXg3ynIQc5FcZWcXsOnN1kvdHzSBM
	 YvgTrEP2o5rmkAfhrhXomGyNP/ypDqtZP+C/nUtF3md3SDWkZHx/tVlgVkRCt2vzhdc4dfOPG2wk
	 Eaddk7C3aCLlGPAsGjq4yZzZXihdN88sxLUBirWg43RrJyN2bPaT+DT1SJ5ctpeF3gc5YT8AZ7zn
	 pjIfqba61L5vW0VZTOa/JYYHHXzVGPCDXs1WoSZSvSD1F3iQFSVnVq/LcePUqNFIv0LfTShNFUCI
	 bKa8bMEMkIzTr0jHQywVYRE/qvQ9LNJUROvGhWPFeWGJOtfpKg6t2SFu8JqSnObMeYhqdEub7nfO
	 9nALAAgpEEwqWLPsYdo7/WZg1PHV8KiBe8GkWjyvSddOu/QtqB4Vw+lTrItqKOq9ByIn8P78Xxm5
	 LQQ78NIdap3tESlHq4WO/qFVr0M7hNimLQq8L9N9IxNB9332HJJQDYIlO7oMZ3p9185YPIWdkU9R
	 ++pWylDkMeZTsA0m5+nbrIk9DJBaIXUUdZzp9ZmxZ1iN9TcOASl0qEZn992Lrfx4jn2F69EUZTUh
	 xu62pNP9NKvH6VRP93brwJq+W8ggjLbgYs5aVImIaYUAAdeFcSlwRJ+ds+dhWM4Sckm342LFwbD/
	 X0zWKeYKKTcxJMkcwoywf7qYP+a4PuUqzzIe0ezcJadH05AfYoLqqBUKh3SRsMWVSGPOahidDQYW
	 QiXmXuQUl23KDR1pdiyOi6J1zEOQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:30:39 +0800
X-OQ-MSGID: <20261005173039.707304-4-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103052_219370_4916E8C1 
X-CRM114-Status: GOOD (  17.27  )
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

Add device tree for the ALINX EdgeBoard FZ3A, a single board computer
based on the Xilinx Zynq UltraScale+ XCZU3EG SoC.

Supported peripherals:
  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

Tested on hardware with Linux 7.3.0-rc5: the board boots from SD card
into userspace over the serial console, gem3 negotiates 1000Mbps/Full
duplex with phy-mode = "rgmii-id", and the eMMC runs in HS200 mode.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
 2 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b27..3e07b36ef 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-alinx-edgeboard-fz3a.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
new file mode 100644
index 000000000..ab6bda7a6
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device tree for the ALINX EdgeBoard FZ3A
+ * based on the Xilinx Zynq UltraScale+ XCZU3EG
+ *
+ * Copyright (c) 2026 Pufan Jin
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+#include "zynqmp.dtsi"
+#include "zynqmp-clk-ccf.dtsi"
+
+/ {
+	model = "ALINX EdgeBoard FZ3A";
+	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
+
+	aliases {
+		ethernet0 = &gem3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		spi0 = &qspi;
+		usb0 = &usb0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	dpcon: connector {
+		compatible = "dp-connector";
+		label = "mini-DP";
+		type = "mini";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
+
+	dp_aclk: clock-dp-aclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk0: clock-gtr-ref0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk1: clock-gtr-ref1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	gtr_refclk2: clock-gtr-ref2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
+	/*
+	 * Vendor TF-A 1.8.1 does not register LPD_LSBUS (ID 31) into CCF.
+	 * Provide a fixed-clock fallback for bus peripherals to probe.
+	 */
+	lpd_lsbus: clock-lpd-lsbus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x7ff00000>;
+	};
+
+	vcc_3v3_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie-reset";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux_cma: cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			alloc-ranges = <0x0 0x0 0x0 0x80000000>;
+			size = <0x0 0x20000000>;	/* 512MB */
+			linux,cma-default;
+		};
+	};
+};
+
+&ams_pl {
+	status = "okay";
+};
+
+&ams_ps {
+	status = "okay";
+};
+
+&dwc3_0 {
+	dr_mode = "host";
+	maximum-speed = "super-speed";
+	snps,dis_enblslpm_quirk;
+	snps,dis_u2_susphy_quirk;
+	snps,hsphy_interface = "ulpi";
+	snps,usb3_lpm_capable;
+	status = "okay";
+};
+
+&gem3 {
+	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
+		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
+		 <&zynqmp_clk GEM_TSU>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gem3_default>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			compatible = "ethernet-phy-id0022.1620";
+		};
+	};
+};
+
+&gpio {
+	clocks = <&lpd_lsbus>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0_default>;
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+	status = "okay";
+};
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
+
+&pcie {
+	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
+	status = "okay";
+};
+
+&pinctrl0 {
+	status = "okay";
+
+	pinctrl_i2c0_default: i2c0-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c0_8_grp";
+		};
+
+		mux {
+			function = "i2c0";
+			groups = "i2c0_8_grp";
+		};
+	};
+
+	pinctrl_i2c1_default: i2c1-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c1_8_grp";
+		};
+
+		mux {
+			function = "i2c1";
+			groups = "i2c1_8_grp";
+		};
+	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			function = "usb0";
+			groups = "usb0_0_grp";
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups = "sdio0_0_grp";
+			function = "sdio0";
+		};
+
+		conf {
+			groups = "sdio0_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+			bias-disable;
+		};
+	};
+
+	/*
+	 * Omit 'power-source' and 'bias-high-impedance' to avoid spurious
+	 * warnings on the board's pre-2023.1 PM firmware. Bank voltage
+	 * and pin directions are already configured by hardware.
+	 */
+	pinctrl_gem3_default: gem3-default {
+		mux {
+			function = "ethernet3";
+			groups = "ethernet3_0_grp";
+		};
+
+		conf {
+			groups = "ethernet3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-rx {
+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
+			       "MIO75";
+			low-power-disable;
+		};
+
+		conf-tx {
+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
+			       "MIO69";
+			bias-disable;
+			low-power-enable;
+		};
+
+		mux-mdio {
+			function = "mdio3";
+			groups = "mdio3_0_grp";
+		};
+
+		conf-mdio {
+			groups = "mdio3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+			bias-disable;
+		};
+	};
+};
+
+&psgtr {
+	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
+	clock-names = "ref0", "ref1", "ref2";
+	status = "okay";
+};
+
+&qspi {
+	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
+	num-cs = <1>;
+	status = "okay";
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&sdhci0 {
+	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+	non-removable;
+	disable-wp;
+	no-sd;
+	no-sdio;
+	mmc-hs200-1_8v;
+	cap-mmc-hw-reset;
+	bus-width = <8>;
+	xlnx,mio-bank = <0>;
+	assigned-clock-rates = <187498125>;
+	status = "okay";
+};
+
+&sdhci1 {
+	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
+	disable-wp;
+	no-1-8-v;
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
+	status = "okay";
+};
+
+&uart1 {
+	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
+	status = "okay";
+};
+
+&usb0 {
+	phy-names = "usb3-phy";
+	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb0_default>;
+	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&zynqmp_dpdma {
+	status = "okay";
+};
+
+&zynqmp_dpsub {
+	clocks = <&dp_aclk>,
+		 <&zynqmp_clk DP_AUDIO_REF>,
+		 <&zynqmp_clk DP_VIDEO_REF>;
+	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
+	phy-names = "dp-phy0", "dp-phy1";
+	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
+	       <&psgtr 2 PHY_TYPE_DP 1 2>;
+	status = "okay";
+};
-- 
2.55.0


