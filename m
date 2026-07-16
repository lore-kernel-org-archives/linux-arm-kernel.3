Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B052AC44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Transfer-Encoding:Mime-Version:From:Subject:Message-Id:Cc:Date:To:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvWqR6dd71zAw+FOFVw8a/mY/YSCIUJHe3fH8/EgSb4=; b=VJsuewIOTrktXOFSOX/ae5T5pa
	FHYfhnOF1gDK9ABugZnlqTAO3Q6ErFhhPOHSuEHSZHvh8Dz4ty+PUUnroHH6iPZkA6PpkZ0pxkQKw
	1o97HwIByAWuWh100dgY/wfNvFBCmez2XKgK891ojzfgSIYpAaFn1xmYdv2E0IJ/M3i8G2wWBZkkQ
	Z+r9MFzH0zx7NmCdbLltStq1A3kHEBjk7l62vZ5V/yUTDd2HQXLVZkFUPcpYxm6aFfDgqfFD4AiqG
	gqHSMfh/eu9N4Z1a3jcXW3qgJq0OuzP4uMoIdIEUsu9FRKny6PQkBh8uzX/dVIVTy9rlJf8jzlt+d
	kxzcOs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0p-0000000GaXD-0pYX;
	Thu, 16 Jul 2026 06:56:03 +0000
Received: from gy.d.sender-sib.com ([77.32.148.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0m-0000000GaP2-2Pjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=CvWqR6dd71zAw+FOFVw8a/mY/YSCIUJHe3fH8/EgSb4=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=DkeOfS7e8UGnW1CgvygJystTDXTGtW7ScZLcssmMw7xYFFqyYeajkeSzmnBQMLTkpZkOrbngK59P
        YAbnJm4yCyTPkAvGrEnOenqN+kIZONltzjeu0xf7slsxgMIzDtfobahUhHW0gczaZK68E0NrOMzw
        DLIF7tLgPTMFmxieFz3QXOoQUlvDrzlUJQvV3YclbjVZGO0mEK4LiC0f9PDF8etliaoiTrwFaYwZ
        nrh8VHXi2IPu96FszdWeiE/NIfioqheK+0tYrKF52SJsIVi6zsScEphaXaKWWbrYfu1DHTETuU1u
        1tC+l+BsYok3vNfh7W823gsh/qgvimP7+wif+Q==
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDg1NjE3NDAyfmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZ348MjAyNjA3MTYwNjU1NDguMjQ2NjE5OC0zLWdhaGluZ0BnYWhpbmd3b28uY29tPn5neS5kLnNlbmRlci1zaWIuY29t
To: <heiko@sntech.de>,<robh@kernel.org>,<krzk+dt@kernel.org>,<conor+dt@kernel.org>
Date: Thu, 16 Jul 2026 18:55:48 +1200
X-sib-id: aaAFNnGYnE0mTJ8XibvE-Dy-LOmZAJIYz8kBjnq7SQ-LfSGieDkVS18g84Npe8GL66HULOOzaV68uJDVj-DbmzVIah0hqBZ-8an2N3MmWqqg3RHPrj1De8EAyn9967AFpR_TqlKQymd8v0w1-IQNfe2P0-ScG6byTP8onMIFzVoEOo2CK8bspqL_J_g2Od0rQXJJ
Cc: <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Message-Id: <0b2212fb-8149-453c-bdef-dacbf2263f1a@smtp-relay.sendinblue.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Origin-messageId: <20260716065548.2466198-3-gahing@gahingwoo.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716065548.2466198-1-gahing@gahingwoo.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235600_908788_B161BCCB 
X-CRM114-Status: GOOD (  12.77  )
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


Add the ArmSoM CM5, an RK3576 compute module (rk3576-armsom-cm5.dtsi),
and its CM5-IO carrier (rk3576-armsom-cm5-io.dts). The module has the
RK806 PMIC, HYM8563 RTC, eMMC, GMAC0 with an on-module MotorComm YT8531
PHY, and the SDIO bus for the on-module WiFi. The carrier adds HDMI, a
GbE RJ45, two USB-A ports behind a USB3 hub, USB-C with FUSB302 and DP
alt-mode, a PCIe 2.0 x1 M.2 slot, microSD, status LEDs and a 40-pin
header.

The YT8531 has no crystal, so it uses the SoC 25 MHz reference output,
described on the gmac node as clk_mac_refout. Its reset is described at
the MDIO bus level: mdiobus releases a bus level reset before it scans
for PHY IDs, whereas a per-PHY reset-gpios is only applied once the PHY
has been found, which never happens while the PHY is still in reset.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 401 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 564 ++++++++++++++++++
 3 files changed, 966 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/ro=
ckchip/Makefile
index cb55c6b70..3ec0b6e20 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5.=
dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-100ask-dshanpi-a1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
new file mode 100644
index 000000000..79a903585
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ArmSoM CM5-IO - official carrier board for the ArmSoM CM5 (RK3576) modu=
le.
+ *
+ * Carrier provides:
+ *   - Full-size HDMI 2.1 (HDMI TX via HDPTX PHY)
+ *   - Gigabit Ethernet RJ45 (GMAC0 + on-module YT8531)
+ *   - 2x USB-A behind a USB3 hub (combphy1 + u2phy1)
+ *   - USB-C with PD/altmode (FUSB302 on i2c0, combphy0 + USBDP PHY)
+ *   - M.2 PCIe 2.0 x1 slot (combphy0 as PCIe lane)
+ *   - microSD card slot
+ *   - ES8388 audio codec on i2c0
+ *   - Green/red status LEDs, 40-pin RPi-compatible header
+ *   - 12 V DC barrel jack
+ *
+ * Copyright (c) 2024 ArmSoM
+ * Copyright (c) 2026 Jiaxing Hu <huhuvmb88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3576-armsom-cm5.dtsi"
+
+/ {
+	model =3D "ArmSoM CM5-IO";
+	compatible =3D "armsom,cm5-io", "armsom,cm5", "rockchip,rk3576";
+
+	aliases {
+		ethernet0 =3D &gmac0;
+		mmc0 =3D &sdhci;
+		mmc1 =3D &sdmmc;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:1500000n8";
+	};
+
+	/* Full-size HDMI Type-A connector, driven by the SoC HDMI TX. */
+	hdmi-con {
+		compatible =3D "hdmi-connector";
+		type =3D "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint =3D <&hdmi_out_con>;
+			};
+		};
+	};
+
+	/*
+	 * Carrier status LEDs (schematic ARMSOM-CM5-IO-1V1_20240829):
+	 *   green - GPIO2 PD0 (net LED_GREEN_EN)
+	 *   red   - GPIO2 PD1 (net LED_RED_EN)
+	 */
+	leds: leds {
+		compatible =3D "gpio-leds";
+
+		led_green: led-green {
+			color =3D <LED_COLOR_ID_GREEN>;
+			function =3D LED_FUNCTION_STATUS;
+			gpios =3D <&gpio2 RK_PD0 GPIO_ACTIVE_HIGH>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&led_green_en>;
+			default-state =3D "on";
+		};
+
+		led_red: led-red {
+			color =3D <LED_COLOR_ID_RED>;
+			function =3D LED_FUNCTION_FAULT;
+			gpios =3D <&gpio2 RK_PD1 GPIO_ACTIVE_HIGH>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&led_red_en>;
+			default-state =3D "off";
+		};
+	};
+
+	/* Carrier power tree: 12 V barrel jack -> 5 V -> peripheral rails. */
+	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_12v0_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt =3D <12000000>;
+		regulator-max-microvolt =3D <12000000>;
+	};
+
+	vcc_5v0_sys: regulator-vcc-5v0-sys {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		vin-supply =3D <&vcc_12v0_dcin>;
+	};
+
+	vcc_5v0_device: regulator-vcc-5v0-device {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_5v0_device";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		vin-supply =3D <&vcc_12v0_dcin>;
+	};
+
+	/* PCIe 3.3 V for the M.2 slot, gated by GPIO0 PC3. */
+	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+		compatible =3D "regulator-fixed";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pcie_pwr_en>;
+		regulator-name =3D "vcc_3v3_pcie";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		enable-active-high;
+		gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
+		startup-delay-us =3D <5000>;
+		vin-supply =3D <&vcc_5v0_sys>;
+	};
+
+	/* USB-C / OTG 5 V, gated by GPIO2 PB6. */
+	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
+		compatible =3D "regulator-fixed";
+		enable-active-high;
+		gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&usb_otg0_pwren>;
+		regulator-name =3D "vcc_5v0_typec0";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		vin-supply =3D <&vcc_5v0_device>;
+	};
+
+	/* USB-A host 5 V (through the hub), gated by GPIO4 PB0. */
+	vcc_5v0_usbhost: regulator-vcc-5v0-usbhost {
+		compatible =3D "regulator-fixed";
+		enable-active-high;
+		gpios =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&usb_host_pwren>;
+		regulator-name =3D "vcc_5v0_usbhost";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		vin-supply =3D <&vcc_5v0_device>;
+	};
+};
+
+/*
+ * ComboPHY0 -> PCIe lane (M.2 slot); ComboPHY1 -> USB3 lane (USB-A hub).
+ */
+&combphy0_ps {
+	status =3D "okay";
+};
+
+&combphy1_psu {
+	status =3D "okay";
+};
+
+&hdmi {
+	status =3D "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint =3D <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint =3D <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status =3D "okay";
+};
+
+&hdptxphy {
+	status =3D "okay";
+};
+
+/*
+ * I2C0: ES8388 audio codec @ 0x10, FUSB302 USB-C PD controller @ 0x22.
+ * Pinctrl i2c0m1 (GPIO0 PC4 SCL / GPIO0 PC5 SDA).
+ */
+&i2c0 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0m1_xfer>;
+
+	usbc0: usb-typec@22 {
+		compatible =3D "fcs,fusb302";
+		reg =3D <0x22>;
+		interrupt-parent =3D <&gpio0>;
+		interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&usbc0_int>;
+		vbus-supply =3D <&vcc_5v0_typec0>;
+
+		usb_con: connector {
+			compatible =3D "usb-c-connector";
+			label =3D "USB-C";
+			data-role =3D "dual";
+			power-role =3D "dual";
+			try-power-role =3D "sink";
+			op-sink-microwatt =3D <1000000>;
+			sink-pdos =3D
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				 PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
+				 PDO_FIXED(12000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =3D
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			altmodes {
+				displayport {
+					svid =3D /bits/ 16 <0xff01>;
+					vdo =3D <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					usbc0_orien_sw: endpoint {
+						remote-endpoint =3D <&usbdp_phy_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					usbc0_role_sw: endpoint {
+						remote-endpoint =3D <&usb_drd0_role_switch>;
+					};
+				};
+
+				port@2 {
+					reg =3D <2>;
+					dp_altmode_mux: endpoint {
+						remote-endpoint =3D <&usbdp_phy_dp_altmode_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
+/*
+ * PCIe 2.0 x1 M.2 slot. Reset GPIO2 PB1, power vcc_3v3_pcie (GPIO0 PC3).
+ */
+&pcie0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pcie_reset>;
+	reset-gpios =3D <&gpio2 RK_PB1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply =3D <&vcc_3v3_pcie>;
+	status =3D "okay";
+};
+
+/* microSD card slot. */
+&sdmmc {
+	bus-width =3D <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency =3D <200000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply =3D <&vcc_3v3_s3>;
+	vqmmc-supply =3D <&vccio_sd_s0>;
+	status =3D "okay";
+};
+
+&u2phy0 {
+	status =3D "okay";
+};
+
+&u2phy0_otg {
+	phy-supply =3D <&vcc_5v0_typec0>;
+	status =3D "okay";
+};
+
+&u2phy1 {
+	status =3D "okay";
+};
+
+&u2phy1_otg {
+	phy-supply =3D <&vcc_5v0_usbhost>;
+	status =3D "okay";
+};
+
+/* Debug UART0 on the 40-pin header. */
+&uart0 {
+	pinctrl-0 =3D <&uart0m0_xfer>;
+	status =3D "okay";
+};
+
+/* USB DRD0: USB-C (USBDP SuperSpeed + USB2 HS), OTG with FUSB302 role-swi=
tch. */
+&usb_drd0_dwc3 {
+	dr_mode =3D "otg";
+	usb-role-switch;
+	status =3D "okay";
+
+	port {
+		usb_drd0_role_switch: endpoint {
+			remote-endpoint =3D <&usbc0_role_sw>;
+		};
+	};
+};
+
+/* USB DRD1: USB-A ports behind the hub (combphy1 SuperSpeed + USB2 HS). *=
/
+&usb_drd1_dwc3 {
+	dr_mode =3D "host";
+	status =3D "okay";
+};
+
+&usbdp_phy {
+	status =3D "okay";
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios =3D <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios =3D <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
+
+	port {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		usbdp_phy_orientation_switch: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&usbc0_orien_sw>;
+		};
+
+		usbdp_phy_dp_altmode_mux: endpoint@1 {
+			reg =3D <1>;
+			remote-endpoint =3D <&dp_altmode_mux>;
+		};
+	};
+};
+
+&vop {
+	status =3D "okay";
+};
+
+&vop_mmu {
+	status =3D "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint =3D <&hdmi_in_vp0>;
+	};
+};
+
+&pinctrl {
+	leds {
+		/* GPIO2 PD0 - green carrier LED */
+		led_green_en: led-green-en {
+			rockchip,pins =3D <2 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		/* GPIO2 PD1 - red carrier LED */
+		led_red_en: led-red-en {
+			rockchip,pins =3D <2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		/* GPIO0 PC3 - PCIe power enable */
+		pcie_pwr_en: pcie-pwr-en {
+			rockchip,pins =3D <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		/* GPIO2 PB1 - PCIe PERST# */
+		pcie_reset: pcie-reset {
+			rockchip,pins =3D <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		/* GPIO4 PB0 - USB host 5V enable */
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		/* GPIO2 PB6 - USB OTG / Type-C 5V enable */
+		usb_otg0_pwren: usb-otg0-pwren {
+			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		/* GPIO0 PB4 - FUSB302 INT# (active-low) */
+		usbc0_int: usbc0-int {
+			rockchip,pins =3D <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
new file mode 100644
index 000000000..4612b7e1d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ArmSoM CM5 - Rockchip RK3576 compute module (Raspberry Pi CM4 form fact=
or).
+ *
+ * Common to all CM5 carriers. The carrier .dts includes this file, sets t=
he
+ * board model/compatible, and adds carrier-specific peripherals.
+ *
+ * On-module devices:
+ *   - RK806 PMIC on I2C1
+ *   - HYM8563 RTC on I2C2
+ *   - eMMC (SDHCI)
+ *   - GMAC0 + MotorComm YT8531 Gigabit Ethernet PHY (RGMII)
+ *   - SYN43752 WiFi 6 + BT 5.x (SDIO + UART4)
+ *
+ * Copyright (c) 2024 ArmSoM
+ * Copyright (c) 2026 Jiaxing Hu <huhuvmb88@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3576.dtsi"
+
+/ {
+	compatible =3D "armsom,cm5", "rockchip,rk3576";
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_1v1_nldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <1100000>;
+		regulator-max-microvolt =3D <1100000>;
+		vin-supply =3D <&vcc_5v0_sys>;
+	};
+
+	vcc_1v2_ufs_vccq_s0: regulator-vcc-1v2-ufs-vccq-s0 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_1v2_ufs_vccq_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <1200000>;
+		regulator-max-microvolt =3D <1200000>;
+		vin-supply =3D <&vcc_5v0_sys>;
+	};
+
+	vcc_1v8_s0: regulator-vcc-1v8-s0 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_1v8_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+		vin-supply =3D <&vcc_1v8_s3>;
+	};
+
+	vcc_1v8_ufs_vccq2_s0: regulator-vcc-1v8-ufs-vccq2-s0 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_1v8_ufs_vccq2_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+		vin-supply =3D <&vcc_1v8_s3>;
+	};
+
+	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_2v0_pldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <2000000>;
+		regulator-max-microvolt =3D <2000000>;
+		vin-supply =3D <&vcc_5v0_sys>;
+	};
+
+	vcc_3v3_s0: regulator-vcc-3v3-s0 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_3v3_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		vin-supply =3D <&vcc_3v3_s3>;
+	};
+
+	vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_3v3_ufs_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		vin-supply =3D <&vcc_5v0_sys>;
+	};
+
+	/*
+	 * WiFi power sequencer for SYN43752. Reset GPIO1 PC6 active-low,
+	 * clock from the HYM8563 RTC oscillator.
+	 */
+	sdio_pwrseq: sdio-pwrseq {
+		compatible =3D "mmc-pwrseq-simple";
+		clocks =3D <&hym8563>;
+		clock-names =3D "ext_clock";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&wifi_reg_on>;
+		reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&cpu_b0 {
+	cpu-supply =3D <&vdd_cpu_big_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply =3D <&vdd_cpu_big_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply =3D <&vdd_cpu_big_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply =3D <&vdd_cpu_big_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply =3D <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply =3D <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply =3D <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply =3D <&vdd_cpu_lit_s0>;
+};
+
+/*
+ * GMAC0 drives an on-module MotorComm YT8531. The PHY has no local crysta=
l, so
+ * it relies on the SoC 25 MHz reference: clk_mac_refout (REFCLKO25M_GMAC0=
_OUT)
+ * has to be named on the gmac node for dwmac-rk to enable it, and
+ * ethm0_clk0_25m_out routes it to the pad.
+ */
+&gmac0 {
+	/* The RX delay is added by the PHY, the TX delay by the MAC below. */
+	phy-mode =3D "rgmii-rxid";
+	clock_in_out =3D "output";
+	clocks =3D <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
+		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
+		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
+	clock-names =3D "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
+		      "ptp_ref", "clk_mac_refout";
+	tx_delay =3D <0x21>;
+	rx_delay =3D <0x00>;
+	phy-handle =3D <&rgmii_phy0>;
+	phy-supply =3D <&vcc_3v3_s3>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&eth0m0_miim
+		     &eth0m0_tx_bus2
+		     &eth0m0_rx_bus2
+		     &eth0m0_rgmii_clk
+		     &eth0m0_rgmii_bus
+		     &ethm0_clk0_25m_out>;
+	status =3D "okay";
+};
+
+&gpu {
+	mali-supply =3D <&vdd_gpu_s0>;
+	status =3D "okay";
+};
+
+/* I2C1: RK806 PMIC @ 0x23 (interrupt on GPIO0 PA6). */
+&i2c1 {
+	status =3D "okay";
+
+	pmic@23 {
+		compatible =3D "rockchip,rk806";
+		reg =3D <0x23>;
+
+		interrupt-parent =3D <&gpio0>;
+		interrupts =3D <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+
+		system-power-controller;
+
+		vcc1-supply =3D <&vcc_5v0_sys>;
+		vcc2-supply =3D <&vcc_5v0_sys>;
+		vcc3-supply =3D <&vcc_5v0_sys>;
+		vcc4-supply =3D <&vcc_5v0_sys>;
+		vcc5-supply =3D <&vcc_5v0_sys>;
+		vcc6-supply =3D <&vcc_5v0_sys>;
+		vcc7-supply =3D <&vcc_5v0_sys>;
+		vcc8-supply =3D <&vcc_5v0_sys>;
+		vcc9-supply =3D <&vcc_5v0_sys>;
+		vcc10-supply =3D <&vcc_5v0_sys>;
+		vcc11-supply =3D <&vcc_2v0_pldo_s3>;
+		vcc12-supply =3D <&vcc_5v0_sys>;
+		vcc13-supply =3D <&vcc_1v1_nldo_s3>;
+		vcc14-supply =3D <&vcc_1v1_nldo_s3>;
+		vcca-supply =3D <&vcc_5v0_sys>;
+
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins =3D "gpio_pwrctrl1";
+			function =3D "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins =3D "gpio_pwrctrl2";
+			function =3D "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins =3D "gpio_pwrctrl3";
+			function =3D "pin_fun0";
+		};
+
+		regulators {
+			vdd_cpu_big_s0: dcdc-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <950000>;
+				regulator-ramp-delay =3D <12500>;
+				regulator-name =3D "vdd_cpu_big_s0";
+				regulator-enable-ramp-delay =3D <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_npu_s0: dcdc-reg2 {
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <950000>;
+				regulator-ramp-delay =3D <12500>;
+				regulator-name =3D "vdd_npu_s0";
+				regulator-enable-ramp-delay =3D <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <950000>;
+				regulator-ramp-delay =3D <12500>;
+				regulator-name =3D "vdd_cpu_lit_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt =3D <750000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc_3v3_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt =3D <3300000>;
+				};
+			};
+
+			vdd_gpu_s0: dcdc-reg5 {
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <900000>;
+				regulator-ramp-delay =3D <12500>;
+				regulator-name =3D "vdd_gpu_s0";
+				regulator-enable-ramp-delay =3D <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt =3D <850000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name =3D "vddq_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_logic_s0: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <800000>;
+				regulator-name =3D "vdd_logic_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc_1v8_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt =3D <1800000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name =3D "vdd2_ddr_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <550000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-name =3D "vdd_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcca_1v8_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo2_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcca1v8_pldo2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-name =3D "vdda_1v2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcca_3v3_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vccio_sd_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcca1v8_pldo6_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt =3D <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <750000>;
+				regulator-max-microvolt =3D <750000>;
+				regulator-name =3D "vdd_0v75_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt =3D <750000>;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <850000>;
+				regulator-max-microvolt =3D <850000>;
+				regulator-name =3D "vdda_ddr_pll_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v75_hdmi_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <837500>;
+				regulator-max-microvolt =3D <837500>;
+				regulator-name =3D "vdda0v75_hdmi_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <850000>;
+				regulator-max-microvolt =3D <850000>;
+				regulator-name =3D "vdda_0v85_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <750000>;
+				regulator-max-microvolt =3D <750000>;
+				regulator-name =3D "vdda_0v75_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+/* I2C2: HYM8563 RTC @ 0x51 (interrupt on GPIO0 PA0). */
+&i2c2 {
+	status =3D "okay";
+
+	hym8563: rtc@51 {
+		compatible =3D "haoyu,hym8563";
+		reg =3D <0x51>;
+		clock-output-names =3D "hym8563";
+		interrupt-parent =3D <&gpio0>;
+		interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&hym8563_int>;
+		wakeup-source;
+		#clock-cells =3D <0>;
+	};
+};
+
+/*
+ * The PHY reset has to be described at the MDIO bus level: mdiobus releas=
es a
+ * bus level reset before it scans for PHY IDs, whereas the per-PHY reset-=
gpios
+ * is only applied by phylib once the PHY has already been found, which ne=
ver
+ * happens while the YT8531 is still held in reset.
+ */
+&mdio0 {
+	reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
+	reset-delay-us =3D <20000>;
+	reset-post-delay-us =3D <100000>;
+
+	rgmii_phy0: phy@1 {
+		compatible =3D "ethernet-phy-ieee802.3-c22";
+		reg =3D <0x1>;
+		clocks =3D <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clocks =3D <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clock-rates =3D <25000000>;
+	};
+};
+
+&saradc {
+	vref-supply =3D <&vcca_1v8_s0>;
+	status =3D "okay";
+};
+
+/* eMMC: on-module, HS400 200 MHz with enhanced strobe. */
+&sdhci {
+	bus-width =3D <8>;
+	full-pwr-cycle-in-suspend;
+	max-frequency =3D <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	/delete-property/ supports-cqe;
+	status =3D "okay";
+};
+
+/* SDIO: SYN43752 WiFi, power-sequenced by sdio_pwrseq, clock from HYM8563=
. */
+&sdio {
+	bus-width =3D <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq =3D <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply =3D <&vcc_3v3_s3>;
+	vqmmc-supply =3D <&vcc_1v8_s3>;
+	wakeup-source;
+	status =3D "okay";
+};
+
+/* UART4: Bluetooth (SYN43752). */
+&uart4 {
+	pinctrl-0 =3D <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names =3D "default";
+	uart-has-rtscts;
+	status =3D "okay";
+};
+
+&pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	wireless-wlan {
+		/* GPIO1 PC6 - WiFi power enable / reset (sdio_pwrseq) */
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
--=20
2.43.0




