Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A46EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNMDnKXII92afWHhH4RWZCjxwftjZXkXdjE1exG0TPY=; b=XpKxMtbzYl/MprOqzwdgJZo5R3
	+5/wb5+v7S1A1r1GCAXpgCKmsy0Pq/byYVrCnblqNBrDQnKTMWJUpPjZVsQGDnjr0eImH02DKbVm0
	RsW+8n++kpghqZ417rrQV5AqnixHcgO8z8h0FLBDmMyWtLu5cSJzsib4hAPQX1iZLeRUNmJjQD2e5
	kMZCy+sTrhgW0FclgXMaWpsFal4GE0AkIYrZy9lYPyQnFcGOE8YBo6X+b8RrcSkA4hFze74Mj0rne
	w4nwGfgiJwmfoicZz4dfr/muEAAn/I9Al8KMdm7IF0TphQbGpD+2TW8slQV2+bFzcnaqz9kA9VrVs
	chk/x8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieGs-0000000CIjU-14TW;
	Thu, 13 Feb 2025 18:49:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tic6c-0000000BmCc-2UpV;
	Thu, 13 Feb 2025 16:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MNMDnKXII92afWHhH4RWZCjxwftjZXkXdjE1exG0TPY=; b=uMF6tyMHrDtDZmzYEsUM6TiN6a
	B7J+wLSoaIctHizwPTfwt/IN/8YkHFjVLnzP6ujA2Yp+Y9LmhmndovbrGI6pWtveKtcMVdVWW98ND
	MYgtTv+nJOB5ej8lsP0v/3RlZKRDWhLgXYCpJPBqqhqHyXsOP1EAqS8gfUt2nCYy9MgzghiqlLc5+
	q+G1B9E72QQd7mBBZ6Hfc1VFxFcXVhqxEY+/Fv1fyLVzQVzbHBl1RlGsayIyEJQO7Wl83iMm45kw9
	OH1pUcUSe95K4Z0CzhGgV5UPfkAWUhSACiNRHw+qA4MhUqCH2utD0D//SE5cZ1qXgTh/ejnTFFJ0U
	ntTudkIg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tic6Z-0004lW-34; Thu, 13 Feb 2025 17:30:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
Date: Thu, 13 Feb 2025 17:30:13 +0100
Message-ID: <20250213163013.1616467-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_083026_656547_F49C6C7D 
X-CRM114-Status: GOOD (  14.13  )
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

So add the necessary nodes for the type-c controllers as well
as enable the relevant core usb nodes, but limit the mode to host-mode
for now until we figure out device mode.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 90f823b2c219..329d98011c60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -333,6 +333,52 @@ rtc_twi: rtc@6f {
 		};
 	};
 
+	usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vcc_5v0_usb_c1>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USBC-1 P11";
+			power-role = "source";
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
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
@@ -394,6 +440,52 @@ &i2c8 {
 	pinctrl-0 = <&i2c8m2_xfer>;
 	status = "okay";
 
+	usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vcc_5v0_usb_c2>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USBC-2 P12";
+			power-role = "source";
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
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
@@ -851,6 +943,24 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	phy-supply = <&vcc_5v0_usb_c1>;
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_usb_c2>;
+	status = "okay";
+};
+
 &u2phy2 {
 	status = "okay";
 };
@@ -893,6 +1003,46 @@ &uart7 {
 	status = "okay";
 };
 
+&usbdp_phy0 {
+	orientation-switch;
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
+&usbdp_phy1 {
+	orientation-switch;
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
@@ -903,6 +1053,34 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usb_host0_xhci {
+	dr_mode = "host";
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
+&usb_host1_xhci {
+	dr_mode = "host";
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


