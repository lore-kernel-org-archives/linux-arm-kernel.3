Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210EBC1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0hvkKiKjwmUePwlOOCNI53m5bcrOrm3zmBCTUjxU+c=; b=LbaYwhuh52U9MCgLaFRNUGV1Mp
	nWCUMeoAd1RZmJu6HQY95lBQgC9PwTNMF7zuIojew3GJ0tvPkJ2lFFd+4TohnhMQql24Pjxnmn4j9
	Sotlo/z9J7E/wMDk8ZrPS2NQHG0Nga6W1FbmCMa3j/Q1N5B6VpV7OyPFpZ/NZqdkaGiep5slyeXJp
	1MjWZT9Ub8Ysw6CdXoyHzwVGJyvITDwJpxU8KW5g2pX8C7dNGEOo+ycVer03R8LIlnn1mjcLUrmbT
	n7CMl7GwMR6+9SBQC7mqyk/zaFBS04h780FTsJMvStKFWsM1OXtaIxaKyel9EMCSCbixG668Teqix
	Bip4kq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJF8-00000004Frg-0CSo;
	Wed, 26 Feb 2025 15:22:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIVt-000000046tK-0Rz8;
	Wed, 26 Feb 2025 14:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740580551;
	bh=oeoroF8KNenaCDMp30ILoE7NYXjjtAHcEZu1+5jM4O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bGopM7t9Gc+tPxRmLZVTAumruwzXbteqxFjJKpPdKvv+Jf5Tw+XQ1AqiajK3AB0sU
	 2G37BPuqSvukYP3muFbN5L5++T7VDyUa9HRW3w4SbohrCZHGZQSvHqemrg3eBG8EyI
	 gOkdbUiK19AWfxmOcvbtTtt9z+pvyGUGWNGHYKYSybKeWmR/TruUA3wN1WxEWSJh1f
	 nJZiQL2DN4yQBTsT+HKdpWRDUy9ibb6rnNoSWv/uSa5TXlqp/qq8LEkz98wOpEzj5p
	 Cj3V6krk8DcsK1z6AOBcvjlfwmQCJ0uuQaqNmNiI/Dnizi8YoXjpqt/XA78TG4cOEt
	 xA72VdZhwzxQg==
Received: from apertis-1.home (2a01cb088CcA73006086F5F072c6a07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DFD617E05EA;
	Wed, 26 Feb 2025 15:35:51 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 26 Feb 2025 15:35:27 +0100
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
References: <20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com>
In-Reply-To: <20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_063553_296907_A12B289D 
X-CRM114-Status: GOOD (  11.45  )
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

This board can use a MIPI-DSI panel on the DSI0 connector: in
preparation for adding an overlay for the Radxa Display 8HD,
add a pipeline connecting VDOSYS0 components to DSI0.

Also add the backlight, and some pin definitions available
through the DSI0 port.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 7184dc99296c7f5d749c7e6d378722677970b3b7..65c77e43d1cd4913b6741e25130febd746ff753c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -48,6 +48,17 @@ memory@40000000 {
 		reg = <0 0x40000000 0x1 0x0>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 1023>;
+		default-brightness-level = <576>;
+		enable-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
+		num-interpolated-steps = <1023>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi0_backlight_pins>;
+		pwms = <&disp_pwm0 0 500000>;
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -499,9 +510,20 @@ &mt6359_vsram_others_ldo_reg {
 	regulator-max-microvolt = <750000>;
 };
 
+&ovl0_in {
+	remote-endpoint = <&vdosys0_ep_main>;
+};
+
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 
+	dsi0_backlight_pins: dsi0-backlight-pins {
+		pins-backlight-en {
+			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
+			output-high;
+		};
+	};
+
 	eth_default_pins: eth-default-pins {
 		pins-cc {
 			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
@@ -699,6 +721,13 @@ pins-irq {
 		};
 	};
 
+	panel_default_pins: panel-pins {
+		pins-rst {
+			pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_default_pins: pcie0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
@@ -717,6 +746,12 @@ pins-bus {
 		};
 	};
 
+	pwm0_default_pins: pwm0-pins {
+		pins-disp-pwm {
+			pinmux = <PINMUX_GPIO97__FUNC_DISP_PWM0>;
+		};
+	};
+
 	spi1_pins: spi1-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
@@ -737,6 +772,19 @@ pins-bus {
 		};
 	};
 
+	touch_pins: touch-pins {
+		pins-touch-int {
+			pinmux = <PINMUX_GPIO132__FUNC_GPIO132>;
+			input-enable;
+			bias-disable;
+		};
+
+		pins-touch-rst {
+			pinmux = <PINMUX_GPIO133__FUNC_GPIO133>;
+			output-high;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -912,6 +960,18 @@ &ssusb2 {
 	status = "okay";
 };
 
+&vdosys0 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys0_ep_main: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&ovl0_in>;
+		};
+	};
+};
+
 &xhci0 {
 	vbus-supply = <&otg_vbus_regulator>;
 	status = "okay";

-- 
2.48.1


