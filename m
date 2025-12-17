Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9436D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CANBeX4LU3zJpUcEFr87pEOkvV/bA9q1+D4dcRWj3OM=; b=B0yO+qCCZb26/GMxG0zBbJabLP
	CO8V+9qKHdAD7Ad3E/7LdmWqmI9ORCAxY4TXBM2GF5reCNr87ex2WZSOgcb/rA0gJEsK6+Etr/T+h
	aNAjXxeC6hEl6Z62TA4/NEM7jeF1RD79T1obz2qf6u42xV6KBXVBMKeopTLxD3l2tWzgAv4GwiFuB
	eucvD3l4do3YUgysFdZ8pERBdqWRXmrvZoboD41P/xL9oWTw7sNdkvlfpgKNa5+CHsuVhF+i/LDQn
	isY+fgqxJm08X+IoPldtRdeCLDtASMPVT3EvuhSTm1EBFuqaw0JFxeZWh8wVhnDcbZmVgUw3CmIRK
	gcOKNNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVods-00000006bux-1Azu;
	Wed, 17 Dec 2025 10:20:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodI-00000006bGc-0wDB;
	Wed, 17 Dec 2025 10:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966785;
	bh=k+v8SYao3ZD64CLFD+XjDGMvWoE/ID1iLX1nmD/fyWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oN0GpeyrTaG7FAbrXrOQDRUW8PaNc0qv08Xtp6Ug6ImU8nzcseEHtvuKS+48eytzM
	 5tDaw053BaWHbN2u5rmYgVn+Xowz/yMLRbFVTHTPS8OE0+NnOSb3xKHJvItn90nZ6P
	 kofqUzQ389+xNcUEf7C0ddnGYF1zZqOVqXTaVbzslIC5B6s3MtzfqqYd5Lr9wTDje6
	 Vu+srGEOJ2ukqmaLJm+ziKNy3IxCL62j+SOoJb/3jFy1/SwzFo3isSB3c5OaOEDgC4
	 n1c1mdfzU1QvM4T6Ol1PyAPl2TO7o6zDDnvwVgTwhRQGHmFgGPgT18fQJ5GOH2Dkpm
	 ADpDWYouEQEIA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5E9F17E1146;
	Wed, 17 Dec 2025 11:19:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:09 +0100
Subject: [PATCH v2 10/12] arm64: dts: mediatek: mt8395-genio-common: Enable
 HDMI output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-10-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=3939;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=k+v8SYao3ZD64CLFD+XjDGMvWoE/ID1iLX1nmD/fyWk=;
 b=iCH9l+9ECj5gnRoKQfLZvXchacGc8ddZF3G59cMvsTh43xSFWn0a4o6ef0unqV0vSNnuwJKdZ
 sWawKAMLLb/C+BIwqG7ehZkrNL08ZA4JnnKlp7GFh0GnhDps9rEF/o1
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021948_926652_54E75D3B 
X-CRM114-Status: GOOD (  10.21  )
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

Add a definition for the on-board HDMI connector, enable and add
the relevant configuration for the HDMI PHY and controller, and
define the pins used by those.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 2b7167804e71d0ced33c048ecb2040667b5fece1..345fc5ac9e039de8660ae325f36ae6265ef3a7c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -26,6 +26,20 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&hdmitx_ddc>;
+		hdmi-pwr-supply = <&hdmi_phy>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -247,6 +261,18 @@ &dmic_codec {
 	wakeup-delay-ms = <200>;
 };
 
+&dpi1 {
+	status = "okay";
+};
+
+&dpi1_in {
+	remote-endpoint = <&merge5_out>;
+};
+
+&dpi1_out {
+	remote-endpoint = <&hdmi0_in>;
+};
+
 &dsi0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -313,6 +339,35 @@ eth_phy0: ethernet-phy@1 {
 	};
 };
 
+&ethdr0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			ethdr0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&vdosys1_ep_ext>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			ethdr0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&merge5_in>;
+			};
+		};
+	};
+};
+
 &gamma0_out {
 	remote-endpoint = <&dither0_in>;
 };
@@ -329,6 +384,27 @@ &i2c0 {
 	status = "okay";
 };
 
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	remote-endpoint = <&dpi1_out>;
+};
+
+&hdmi0_out {
+	remote-endpoint = <&hdmi_connector_in>;
+};
+
+&hdmi_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_vreg_pins>;
+
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c1_pins>;
@@ -533,6 +609,35 @@ mt6360_ssusb_sbu_ep: endpoint {
 	};
 };
 
+&merge5 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			merge5_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&ethdr0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			merge5_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dpi1_in>;
+			};
+		};
+	};
+};
+
 &mfg0 {
 	domain-supply = <&mt6315_7_vbuck1>;
 };
@@ -762,6 +867,31 @@ pins {
 		};
 	};
 
+	hdmi_vreg_pins: hdmi-vreg-pins {
+		pins-pwr {
+			pinmux = <PINMUX_GPIO31__FUNC_HDMITX20_PWR5V>;
+			bias-disable;
+		};
+	};
+
+	hdmi_pins: hdmi-pins {
+		pins-hotplug {
+			pinmux = <PINMUX_GPIO32__FUNC_HDMITX20_HTPLG>;
+			bias-pull-down;
+		};
+
+		pins-ddc {
+			pinmux = <PINMUX_GPIO34__FUNC_HDMITX20_SCL>,
+				 <PINMUX_GPIO35__FUNC_HDMITX20_SDA>;
+			drive-strength = <10>;
+		};
+
+		pins-cec {
+			pinmux = <PINMUX_GPIO33__FUNC_HDMITX20_CEC>;
+			bias-disable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
@@ -1212,6 +1342,18 @@ vdosys0_ep_main: endpoint@0 {
 	};
 };
 
+&vdosys1 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys1_ep_ext: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&ethdr0_in>;
+		};
+	};
+};
+
 &xhci0 {
 	status = "okay";
 };

-- 
2.52.0


