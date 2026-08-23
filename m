Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716DEC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsT0fU2OAbIaUC/H0O+g+p8uKSt2lh+vKTmHlqNtR+8=; b=VrX367r61ksTZZ8tpBuczfB/S4
	3nMwA1FBUOfYFYvyH7xzMJOy2nOkM0Vz5Raz8Z+AkYtwExnDgoHJCY6DkawEZHBXOPOBhAzgmpI/5
	gfhJoqb36QeUATjT1eRfN44UF/obWeAsMCiHXV3coT8LjGTuovgKgrsHOeW4jNutA7WqsEYgWTrBe
	/yGTwQH1wyKj+07i0jaWtzugdpXAtFAVK3+mreAj8T6QbxvZVpHIDHAcEDP9nkLwq7V9ilyVEEM+l
	5jG2hGS0ZkjiUcO/Ris6DjNqLsCc/RRjhvmXpixJpyXlAo/B1Ays8jUae/B7RDib2u1IyWIf6sME6
	zSW4EUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQG-0000000FSi7-1cqU;
	Sun, 23 Aug 2026 15:47:48 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQ4-0000000FSaK-212B;
	Sun, 23 Aug 2026 15:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787500044; bh=SsT0fU2OAbIaUC/H0O+g+p8uKSt2lh+vKTmHlqNtR+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GjOcj7XdPqz4efrXI66kN5G3jE6hVsYfr5xZ4avC/+Z3HGNVZdBmGtJ3E0UhwL6mr
	 BeMYiwDPfH8WbtVwc0edZlVGno2o7MC8MBp7bxMgKaiKDPhT4+t51QfCJfZcvtsupf
	 p3CfekK9wq2vbJNBlYfb7hkDPqC/DUkjiJ4RmxkE=
Received: from ubuntu2204.localdomain ([2409:8d20:2b:671:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id BD29E410; Sun, 23 Aug 2026 23:47:18 +0800
X-QQ-mid: xmsmtpt1787500042tpj03631s
Message-ID: <tencent_AC68050423A2FB5D3571D158CB7C25048C0A@qq.com>
X-QQ-XMAILINFO: NAo94oiSCcszj3Tk60FFLAH8KvTbLV2Ij2a93jYj1xZXyrq2aQJ8JLtut5DV2A
	 BEqz70ek9xCRI1drDIxOLX2n20XU6ZCmOcABL8e8a+CzEbW+VyuHDMAhUQQPYH0CRxg8JHDi3jR4
	 lbuoFOPNnc4mqRSA+oSq5Z7PMaHG98gyUk2bnKMHhuqE7fwTbWinH1C2D22DRWdsveLQH/H+y563
	 CJiPHqZqK6s89/HMb/GhcUFFM5VcdP6QI1cG1PifZLEjkts/LNK/Q8V2kMsSP4yxHjS5rNHMoUGO
	 U9gvTC5qXgXK06+nCyoPRlIVQIAPdF6cUa/bCYWy0Ctr68z0kcPWGWRKoqiCroURvfnDJIt1uws8
	 1eY01PcOziuKCCC/YZgyZTpSCeRUR2EuKe4SEZinFRP83cuEAuxZvC1kauVV0dfE82NPHwGXZmOZ
	 QxrBdWuEdhaPetQGAUbnqEXVAp07mOyT9wvd+rsq6ya2Ts2IP8A6g3AzOCS9UU9H5XVjpdPGakrA
	 Eyx2UG9FXf++oAD4mlgqxk2t3NJYdjhKgqsBT0njsqvCZO7xO1HwOFVeAfDitoWeL5ttiNFfIr3z
	 Cj3K4TYrSmwWMZ/SaPzvr94268XTvWl4xxBXILXKaFvwTv1CGJRQo3nogFlRLW7GoTwFNk1JtwSP
	 /yBUHKdU+afk8XDbpH1RJYb0oPP6w3yIyejnLwgnJRO3Z2XmoEu+Y/knDzvyXzCwPPp+L5T8ufMk
	 NO4FN2g24jIaDzzThjAyz9fp/ecW5Cw2aBd3j6CFXRcMM+u1aHTu8UqO91rDs8wSrDbPn+zPZZKu
	 zUECdQdCC4f74uxX+K6w7WU3i/bI0BqSm+dgwvxqYrvTGHAMayPcjGTaoPN6TpRJPCtUQSuraHJo
	 IKbAp++yXTLAfZ50jbROYrFvf09w3ygt2+YPBNTVvLGUDMQEyt+1rPB1VMZLE64CQrEmZwkLCBs7
	 RIdFhodz09A6e++EO1y9aAGb4/zbQjxDyppsv55PfuwkNqZPZBAH4QPyDCrFGFUmr6OfzpYn4Wtt
	 W4RCaxKcZmHX/PaVNvWoWNCssDUXf7j3ZIftd5PdPctb8wRbxLWtJ+CKCT1S46oVnEsy3+qPfYvg
	 qS8t6p8uPgeKBlEW3e2uKoxAQszRHQRQdnFd255K+jv77JD8NMBhSrvbuU8wQprXrGDhRCjaVbYh
	 3wGx18P97QhHcV5zIurJmhtinTp5EvLv7CyrzX2c+JZsq1PA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Cunhao Lu <1579567540@qq.com>
Date: Sun, 23 Aug 2026 23:46:54 +0800
Subject: [PATCH 2/2] arm64: dts: rockchip: Add LubanCat 5IO board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260823-add-lubancat-5io-v1-2-e6b7894e8c60@qq.com>
References: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
In-Reply-To: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_084736_975674_D14647F0 
X-CRM114-Status: GOOD (  12.75  )
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

The EmbedFire LubanCat 5 is an RK3588-based BTB core board. The LubanCat
5IO is its carrier board. The combination has the following features:

- Rockchip RK3588 SoC
- eMMC and microSD storage
- 2x RTL8211F Gigabit Ethernet
- 2x HDMI output and 1x HDMI input
- 1x M.2 M-Key slot
- 1x M.2 E-Key slot
- 1x Mini PCIe slot
- 1x PCIe x4 slot
- 1x SATA port
- 2x CAN-FD
- 2x UART
- 4x USB Type-A ports
- 1x USB 3.0 Type-C port with DisplayPort Alt Mode
- ES8388 analog audio codec
- HYM8563 RTC
- PWM-controlled fan

The carrier routes CAN1 and CAN2 to SIT1042AQT/3 transceivers. Set both
controller clocks to 300 MHz to provide exact CAN bit timing for a wider
range of bit rates.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi   |  548 ++++++++++
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 1062 ++++++++++++++++++++
 3 files changed, 1611 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c118..f5d5e819a948 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -199,6 +199,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi
new file mode 100644
index 000000000000..1bffd7b3fb15
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cunhao Lu <1579567540@qq.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "embedfire,lubancat-5-btb", "rockchip,rk3588";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	combophy_avdd0v85: regulator-combophy-avdd0v85 {
+		compatible = "regulator-fixed";
+		regulator-boot-on;
+		regulator-max-microvolt = <850000>;
+		regulator-min-microvolt = <850000>;
+		regulator-name = "combophy_avdd0v85";
+		vin-supply = <&avdd_0v85_s0>;
+	};
+
+	combophy_avdd1v8: regulator-combophy-avdd1v8 {
+		compatible = "regulator-fixed";
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "combophy_avdd1v8";
+		vin-supply = <&avcc_1v8_s0>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+		regulator-name = "vcc_1v1_nldo_s3";
+		vin-supply = <&vcc4v0_sys>;
+	};
+};
+
+&can1 {
+	assigned-clock-rates = <300000000>;
+	assigned-clocks = <&cru CLK_CAN1>;
+};
+
+&can2 {
+	assigned-clock-rates = <300000000>;
+	assigned-clocks = <&cru CLK_CAN2>;
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		reg = <0x43>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1m2_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-boot-on;
+		regulator-max-microvolt = <950000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_npu_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&pd_gpu {
+	domain-supply = <&vdd_gpu_s0>;
+};
+
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	status = "okay";
+};
+
+&sfc {
+	status = "disabled";
+};
+
+&spi2 {
+	assigned-clock-rates = <200000000>;
+	assigned-clocks = <&cru CLK_SPI2>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		pinctrl-1 = <&rk806_dvs1_pwrdn>;
+		pinctrl-names = "default", "pmic-power-off";
+		spi-max-frequency = <1000000>;
+		system-power-controller;
+
+		vcc1-supply = <&vcc4v0_sys>;
+		vcc2-supply = <&vcc4v0_sys>;
+		vcc3-supply = <&vcc4v0_sys>;
+		vcc4-supply = <&vcc4v0_sys>;
+		vcc5-supply = <&vcc4v0_sys>;
+		vcc6-supply = <&vcc4v0_sys>;
+		vcc7-supply = <&vcc4v0_sys>;
+		vcc8-supply = <&vcc4v0_sys>;
+		vcc9-supply = <&vcc4v0_sys>;
+		vcc10-supply = <&vcc4v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc4v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc4v0_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			function = "pin_fun0";
+			pins = "gpio_pwrctrl1";
+		};
+
+		rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
+			function = "pin_fun2";
+			pins = "gpio_pwrctrl1";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			function = "pin_fun0";
+			pins = "gpio_pwrctrl2";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			function = "pin_fun0";
+			pins = "gpio_pwrctrl3";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <800000>;
+				regulator-min-microvolt = <675000>;
+				regulator-name = "vdd_log_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-name = "vdd_vdenc_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <675000>;
+				regulator-name = "vdd_ddr_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2000000>;
+				regulator-min-microvolt = <2000000>;
+				regulator-name = "vcc_2v0_pldo_s3";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <750000>;
+				regulator-min-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			avdd_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <850000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "avdd_ddr_pll_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <837500>;
+				regulator-min-microvolt = <837500>;
+				regulator-name = "avdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			avdd_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <850000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "avdd_0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <750000>;
+				regulator-min-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			avcc_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "avcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avdd_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1200000>;
+				regulator-min-microvolt = <1200000>;
+				regulator-name = "avdd_1v2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			avcc_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "avcc_3v3_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vccio_sd_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "pldo6_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+		};
+	};
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
new file mode 100644
index 000000000000..12f11466b9c2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
@@ -0,0 +1,1062 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cunhao Lu <1579567540@qq.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3588.dtsi"
+#include "rk3588-lubancat-5-btb.dtsi"
+
+/ {
+	compatible = "embedfire,lubancat-5io", "embedfire,lubancat-5-btb",
+		     "rockchip,rk3588";
+	model = "EmbedFire LubanCat 5IO";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc1 = &sdmmc;
+		rtc0 = &hym8563;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			press-threshold-microvolt = <1750>;
+			linux,code = <KEY_VENDOR>;
+		};
+	};
+
+	analog-sound {
+		compatible = "simple-audio-card";
+		pinctrl-0 = <&hp_detect>;
+		pinctrl-names = "default";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpios =
+			<&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "rk3588-es8388";
+		simple-audio-card,pin-switches = "Headphones", "Speaker";
+		simple-audio-card,routing =
+			"Headphones", "LOUT1",
+			"Headphones", "ROUT1",
+			"Speaker", "LOUT2",
+			"Speaker", "ROUT2",
+			"LINPUT1", "Main Mic",
+			"LINPUT2", "Main Mic",
+			"RINPUT1", "Headset Mic",
+			"RINPUT2", "Headset Mic";
+		simple-audio-card,widgets =
+			"Headphone", "Headphones",
+			"Speaker", "Speaker",
+			"Microphone", "Main Mic",
+			"Microphone", "Headset Mic";
+
+		simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0_8ch>;
+		};
+	};
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&ir_receiver_pin>;
+		pinctrl-names = "default";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&sys_led_pin>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <0 100 150 200 255>;
+		fan-supply = <&vcc_5v0_s0>;
+		pwms = <&pwm11 0 5000 0>;
+	};
+
+	regulator-mipi-dsi0-power {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&mipi_dsi0_power_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "mipi_dsi0_power";
+		vin-supply = <&vcc_5v0_s0>;
+	};
+
+	regulator-mipi-dsi1-power {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&mipi_dsi1_power_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "mipi_dsi1_power";
+		vin-supply = <&vcc_5v0_s0>;
+	};
+
+	sata_power: regulator-sata-power {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&sata_power_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "sata_power";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vbus5v0_typec: regulator-vbus5v0-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&typec_vbus_en>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus5v0_typec";
+		vin-supply = <&vcc5v0_usb_s0>;
+	};
+
+	vcc3v3_ekey_pcie: regulator-vcc3v3-ekey-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc3v3_ekey_pcie_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_ekey_pcie";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_m2_pcie: regulator-vcc3v3-m2-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc3v3_m2_pcie_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_m2_pcie";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_mini_pcie: regulator-vcc3v3-mini-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc3v3_mini_pcie_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_mini_pcie";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_pciex4: regulator-vcc3v3-pciex4 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc3v3_pcie_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_pciex4";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc4v0_sys: regulator-vcc4v0-sys {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <4000000>;
+		regulator-min-microvolt = <4000000>;
+		regulator-name = "vcc4v0_sys";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc5v0_usb20_host_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usb20_host";
+		vin-supply = <&vcc5v0_usb_s0>;
+	};
+
+	vcc5v0_usb20_hub: regulator-vcc5v0-usb20-hub {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc5v0_usb20_hub_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usb20_hub";
+		vin-supply = <&vcc5v0_usb_s0>;
+	};
+
+	vcc5v0_usb30_otg: regulator-vcc5v0-usb30-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc5v0_usb30_otg_en>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usb30_otg";
+		vin-supply = <&vcc5v0_usb_s0>;
+	};
+
+	vcc5v0_usb_s0: regulator-vcc5v0-usb-s0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usb_s0";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "vcc12v_dcin";
+	};
+
+	vcc_3v3_s0: regulator-vcc-3v3-s0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_s0";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc_3v3_sd_s3: regulator-vcc-3v3-sd-s3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_sd_s3";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc_5v0_s0: regulator-vcc-5v0-s0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc_5v0_s0";
+		vin-supply = <&vcc12v_dcin>;
+	};
+};
+
+&can1 {
+	pinctrl-0 = <&can1m1_pins>;
+
+	status = "okay";
+};
+
+&can2 {
+	pinctrl-0 = <&can2m0_pins>;
+
+	status = "okay";
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_ps {
+	status = "okay";
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&gmac0 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3_s0>;
+	pinctrl-0 = <&gmac0_miim
+		    &gmac0_tx_bus2
+		    &gmac0_rx_bus2
+		    &gmac0_rgmii_clk
+		    &gmac0_rgmii_bus>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3_s0>;
+	pinctrl-0 = <&gmac1_miim
+		    &gmac1_tx_bus2
+		    &gmac1_rx_bus2
+		    &gmac1_rgmii_clk
+		    &gmac1_rgmii_bus>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&hdmi0 {
+	frl-enable-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		    &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdmi1 {
+	frl-enable-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+		    &hdmim0_tx1_scl &hdmim0_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdmi1_sound {
+	status = "okay";
+};
+
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin
+		    &hdmim1_rx_scl &hdmim1_rx_sda
+		    &hdmirx_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
+&i2c0 {
+	gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		vcc-supply = <&vcc_3v3_s0>;
+	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&hym8563_int>;
+		pinctrl-names = "default";
+		wakeup-source;
+	};
+};
+
+&i2c1 {
+	usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usbc0_int>;
+		pinctrl-names = "default";
+		vbus-supply = <&vbus5v0_typec>;
+
+		status = "okay";
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <1000000>;
+			power-role = "dual";
+			sink-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7m0_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x11>;
+		AVDD-supply = <&avcc_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s3>;
+		HPVDD-supply = <&avcc_3v3_s0>;
+		PVDD-supply = <&vcc_1v8_s3>;
+		assigned-clock-rates = <12288000>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2s0_8ch {
+	pinctrl-0 = <&i2s0_lrck
+		    &i2s0_mclk
+		    &i2s0_sclk
+		    &i2s0_sdi0
+		    &i2s0_sdo0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&package_thermal {
+	polling-delay = <1000>;
+
+	cooling-maps {
+		map0 {
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+			trip = <&package_fan0>;
+		};
+
+		map1 {
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+			trip = <&package_fan1>;
+		};
+	};
+
+	trips {
+		package_fan0: package-fan0 {
+			hysteresis = <2000>;
+			temperature = <55000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			hysteresis = <2000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+};
+
+&pcie30phy {
+	data-lanes = <1 1 2 2>;
+
+	status = "okay";
+};
+
+/* M.2 M-Key (NVMe) */
+&pcie3x4 {
+	num-lanes = <2>;
+	pinctrl-0 = <&pcie3x4_rst>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_m2_pcie>;
+
+	status = "okay";
+};
+
+/* PCIe x4 slot */
+&pcie3x2 {
+	pinctrl-0 = <&pcie3x2_rst>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pciex4>;
+
+	status = "okay";
+};
+
+/* M.2 E-Key (WiFi/BT) */
+&pcie2x1l0 {
+	pinctrl-0 = <&pcie2x1l0_rst &ekey_disable>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_ekey_pcie>;
+
+	status = "okay";
+};
+
+/* Mini-PCIe */
+&pcie2x1l1 {
+	pinctrl-0 = <&pcie2x1l1_rst &minipcie_disable>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_mini_pcie>;
+
+	status = "okay";
+};
+
+&pinctrl {
+	hdmi-tx {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hdmirx {
+		hdmirx_det: hdmirx-det {
+			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	ir-receiver {
+		ir_receiver_pin: ir-receiver-pin {
+			rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		sys_led_pin: sys-led-pin {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	mipi {
+		mipi_dsi0_power_en: mipi-dsi0-power-en {
+			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		mipi_dsi1_power_en: mipi-dsi1-power-en {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		ekey_disable: ekey-disable {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		minipcie_disable: minipcie-disable {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2x1l0_rst: pcie2x1l0-rst {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2x1l1_rst: pcie2x1l1-rst {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie3 {
+		pcie3x2_rst: pcie3x2-rst {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie3x4_rst: pcie3x4-rst {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sata {
+		sata_power_en: sata-power-en {
+			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb-typec {
+		typec_vbus_en: typec-vbus-en {
+			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc3v3_ekey_pcie_en: vcc3v3-ekey-pcie-en {
+			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc3v3_m2_pcie_en: vcc3v3-m2-pcie-en {
+			rockchip,pins = <2 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc3v3_mini_pcie_en: vcc3v3-mini-pcie-en {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc3v3_pcie_en: vcc3v3-pcie-en {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc5v0_usb20_host_en: vcc5v0-usb20-host-en {
+			rockchip,pins = <2 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc5v0_usb20_hub_en: vcc5v0-usb20-hub-en {
+			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc5v0_usb30_otg_en: vcc5v0-usb30-otg-en {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0m2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-0 = <&pwm1m2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm7 {
+	status = "disabled";
+};
+
+&pwm11 {
+	pinctrl-0 = <&pwm11m2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&avcc_1v8_s0>;
+
+	status = "okay";
+};
+
+&sata0 {
+	status = "okay";
+
+	sata-port@0 {
+		target-supply = <&sata_power>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-mmc;
+	no-sdio;
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_sd_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4m2_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&uart7 {
+	pinctrl-0 = <&uart7m2_xfer>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_usb30_otg>;
+
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_usb20_host>;
+
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_usb20_hub>;
+
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
+
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_ss_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_ss_in: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usb_host0_xhci_ss>;
+		};
+
+		usbdp_phy0_dp_in: endpoint@2 {
+			reg = <2>;
+			remote-endpoint = <&dp0_out_con>;
+		};
+
+		usbdp_phy0_dp_out: endpoint@3 {
+			reg = <3>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
+};
+
+&usbdp_phy1 {
+	rockchip,dp-lane-mux = <2 3>;
+
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	usb-role-switch;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+/*
+ * combphy2_psu is shared between usb_host2_xhci (USB3) and pcie2x1l1 (PCIe).
+ * Disable USB3 host2 so the PHY can be used for the Mini-PCIe slot.
+ */
+&usb_host2_xhci {
+	status = "disabled";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};

-- 
2.34.1


