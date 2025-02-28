Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5935C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=775evDg1YCOE4KeHp/EcISrgAi5/5BCQk1GDyV+DPBc=; b=FNSP08WkJJRgu1sjNe4hkrMO2T
	u+7YMsPL0ksu0GaTlERTnaD2Niw11HlAmy34URQai40yWjsH0bYAdqczPzelLk64SVCvYz4UTFagr
	cNfToco52pxSxBhvU4iCODiYDfJeqs3FEPaGIty12WjbVQ94e2i+cm7Is4BazkWXvIGUbqXc/+9XD
	L7tlbBOxTp4XkI/BmjKmqqn96jnC//it8Ay+ExH6gpE2+NE8bJ0qwnNPgQWQ03MmlVbKV5mw6a7y0
	PvR8Q1Nd1IoQgGQcc5XGkwzRuGioq+ZlCu7LeVtBW4hDA+4D6PX9y/JDesU51MavvINsBOzeD3kMP
	n0dOfc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2GT-0000000BT41-2vNj;
	Fri, 28 Feb 2025 15:27:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1zB-0000000BOdg-30GH;
	Fri, 28 Feb 2025 15:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=775evDg1YCOE4KeHp/EcISrgAi5/5BCQk1GDyV+DPBc=; b=UMh/3T1vQrfYxrviT5c3amxzfj
	7Adc04gNO8Vo/oY6E/WIOsvgvA0+PE153N5dWbBgei4D1wN/WoU4g1N8RyZvIA4wLzFgkbbgcYXYe
	nh35NuxltxJ4mNCLwchlaTETWT0PcGMV8f4B1KWbHQE0zfCkI1zsR1w3aEKlOOJwKW4hrq7lttnUY
	RiAVmxpmYVGjbU2CDBG9bRtwYVArd20VL7Lhfo0OyIFpoiaOaFZXGpSX5wx3J7suDZIoNrGEei5sN
	WLdmyF6LxRGfEpRer5+/B4C9UHZyg7DhLPDh3PumPGGWgxr7jSXWwz2L1+NVHof3r0mMqR751AXfY
	9CEMUDMw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to1zA-0001Ww-2G; Fri, 28 Feb 2025 16:09:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
Date: Fri, 28 Feb 2025 16:08:53 +0100
Message-ID: <20250228150853.329175-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_070909_923701_9E08329C 
X-CRM114-Status: GOOD (  14.48  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Jaguar has two type-c ports connected to fusb302 controllers that can
work both in host and device mode and can also run in display-port
altmode.

While these ports can work in dual-role data mode, they do not support
powering the device itself as power-sink. This causes issues because
the current infrastructure does not cope well with dual-role data
without dual-role power.

So add the necessary nodes for the type-c controllers as well as enable
the relevant core usb nodes. So far host modes works reliably, but
device-mode does not. So devicemode needs more investigation.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
---
changes in v4:
- reword commit message to reflect device-mode not working
- rename sbu-pins pinctrl to include _dc
- set sbu-dc-pins pinconfig to pull-down. This follows how some
  dedicated SBU-related ICs do it either internally (TS3USBCA4)
  or in the block-diagram describe external pull downs (NX20P0407)
changes in v3:
- more review comments from Quentin
  (sbu-pin pinctrl, comments)
changes in v2:
- address review comments from Quentin
  (comments, pinctrl, sbu-gpios and much more)

 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 218 ++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 9a43e4fdc4f5..9fceea6c1398 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -333,6 +333,56 @@ rtc_twi: rtc@6f {
 		};
 	};
 
+	typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cc_int1>;
+		vbus-supply = <&vcc_5v0_usb_c1>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USBC-1 P11";
+			power-role = "source";
+			self-powered;
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+			vbus-supply = <&vcc_5v0_usb_c1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+					};
+				};
+			};
+		};
+	};
+
 	vdd_npu_s0: regulator@42 {
 		compatible = "rockchip,rk8602";
 		reg = <0x42>;
@@ -394,6 +444,56 @@ &i2c8 {
 	pinctrl-0 = <&i2c8m2_xfer>;
 	status = "okay";
 
+	typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cc_int2>;
+		vbus-supply = <&vcc_5v0_usb_c2>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USBC-2 P12";
+			power-role = "source";
+			self-powered;
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+			vbus-supply = <&vcc_5v0_usb_c2>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc1_hs: endpoint {
+						remote-endpoint = <&usb_host1_xhci_drd_sw>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc1_ss: endpoint {
+						remote-endpoint = <&usbdp_phy1_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc1_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy1_typec_sbu>;
+					};
+				};
+			};
+		};
+	};
+
 	vdd_cpu_big0_s0: regulator@42 {
 		compatible = "rockchip,rk8602";
 		reg = <0x42>;
@@ -487,6 +587,26 @@ pcie30x4_waken_m0: pcie30x4-waken-m0 {
 			rockchip,pins = <0 RK_PC7 12 &pcfg_pull_none>;
 		};
 	};
+
+	usb3 {
+		cc_int1: cc-int1 {
+			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cc_int2: cc-int2 {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		typec0_sbu_dc_pins: typec0-sbu-dc-pins {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>,
+					<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		typec1_sbu_dc_pins: typec1-sbu-dc-pins {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>,
+					<1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &saradc {
@@ -854,6 +974,24 @@ &tsadc {
 	status = "okay";
 };
 
+/* USB-C P11 connector */
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+/* USB-C P12 connector */
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
 &u2phy2 {
 	status = "okay";
 };
@@ -896,6 +1034,56 @@ &uart7 {
 	status = "okay";
 };
 
+/* Type-C on P11 */
+&usbdp_phy0 {
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&typec0_sbu_dc_pins>;
+	sbu1-dc-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU1_DC */
+	sbu2-dc-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU2_DC */
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
+};
+
+/* Type-C on P12 */
+&usbdp_phy1 {
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&typec1_sbu_dc_pins>;
+	sbu1-dc-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>; /* Q7_USB_C1_SBU1_DC */
+	sbu2-dc-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>; /* Q7_USB_C1_SBU2_DC */
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy1_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc1_ss>;
+		};
+
+		usbdp_phy1_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc1_sbu>;
+		};
+	};
+};
+
 /* host0 on P10 USB-A */
 &usb_host0_ehci {
 	status = "okay";
@@ -906,6 +1094,36 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+/* host0 on P11 USB-C */
+&usb_host0_xhci {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb_host0_xhci_drd_sw: endpoint {
+			remote-endpoint = <&usbc0_hs>;
+		};
+	};
+};
+
+/* host1 on P12 USB-C */
+&usb_host1_xhci {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb_host1_xhci_drd_sw: endpoint {
+			remote-endpoint = <&usbc1_hs>;
+		};
+	};
+};
+
 /* host1 on M.2 E-key */
 &usb_host1_ehci {
 	status = "okay";
-- 
2.47.2


