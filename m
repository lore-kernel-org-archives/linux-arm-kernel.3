Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F98D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O6AH+QQ+K0XhTFuvL7V6/cCVOp33zjss7FmSiSGhqU=; b=B6AegOPjfXqkv0rj+EiDXqB9GB
	aD6ikdEGJNyW/iTNxkYXQs3FrRFlh3SNj/GGN52v3xLvDQyi5z9uJUVpFdaLTMW23Ix8FjnM8w0G+
	KSqeSQX6cpAm4p1IVrxxX4srGyCwM2nOE9OcmMqpjsPTt5qUBI0EX10/3yntPuuWLiOs7AsQ6EaO+
	L/UasjwExm12rMJjXarkdpNk5C6fIbPez6kzrh+LuM3+A1ssJKGmRUjXfK38i9E+z7SNnzYpcnnsS
	9BhVjnEPCi3Mpt2FWGf4/DO+I07njIXxsrqpO+3LrQ5wiVq8NqmzGXyNU5zVabeoFBwJx9Zev4pbr
	mglSZN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodS-00000006bVU-1OfX;
	Wed, 17 Dec 2025 10:19:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodE-00000006bDH-2CW1;
	Wed, 17 Dec 2025 10:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966782;
	bh=FRKo1AwARMqoLFZEk9QOpazS6ahQf/BJkIKaYNCuSC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ezsn7pd5tJy020A1BAD6VN/cJ7cMTgOHEHQaGGOA604TLZx+i5EUvCg9Jj+cYnOe9
	 d/v1JgnKQSGi0SL/+yfJ9tjXt6ulicwceqbIWhGDkaA+hNZYx5VBmAJl+Xwi09YgNt
	 qjdQXzhKbiqbT4K/ltFEpalpTh+fXQQ2Jm9jxW0ThVeVbO1hgNcelxFn60PXeXonFD
	 rN5YfzqaUe5WXuzD4dPE3iEE3w0olXXGNrSXOU8dvCDVm3KVddVWmBZnjpTiI76GMR
	 LldJIA42jR0RooGlMrcLqdbwytE1MVaLxKsxR7OTpOABr7MdYj+gUu1sHbfLwY0CzT
	 rHAi25s6wMYRQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41F0617E13F9;
	Wed, 17 Dec 2025 11:19:41 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:05 +0100
Subject: [PATCH v2 06/12] arm64: dts: mediatek: mt8390-genio-common: Enable
 HDMI output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-6-a994976bb39a@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=4058;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tvaehzMkqfYCKCJ6Z6JeDcEahAcXLZ26L71FY8FX9n8=;
 b=m93+1AytD0vl+xyLNbckUMdjGneuDB88dGZzXe08hvJBwBY3x3NIiKWoAgS5f4XMljfL1HhoP
 63HxPhXO2JeCl9vypcm8lkSYGNZ8Au1z3iGRdvdBa8vcnPxSEzxqWYO
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021944_734778_6D1C7005 
X-CRM114-Status: GOOD (  10.78  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a node for the HDMI-A connector found on this board, then
configure the display pipeline and enable the required DPI1
interface, HDMI controller, its integrated DDC and the HDMI
PHY to enable support for the HDMI output provided by these EVKs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
[Louis-Alexis Eyraud: reworded subject and description]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a2cdecd2b9034e2f295d817e846d6ed1845e686a..5fa1f5fbad18f2bf9b153ae9a029829641e43023 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -55,6 +55,20 @@ dmic_codec: dmic-codec {
 		wakeup-delay-ms = <30>;
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&hdmi_ddc>;
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
@@ -328,6 +342,18 @@ &dither0_out {
 	remote-endpoint = <&dsi0_in>;
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
 &gamma0_out {
 	remote-endpoint = <&postmask0_in>;
 };
@@ -337,6 +363,55 @@ &gpu {
 	status = "okay";
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
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -475,6 +550,35 @@ &i2c6 {
 	status = "okay";
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
 	domain-supply = <&mt6359_vproc2_buck_reg>;
 };
@@ -727,6 +831,31 @@ pins-txd {
 		};
 	};
 
+	hdmi_vreg_pins: hdmi-vreg-pins {
+		pins-pwr {
+			pinmux = <PINMUX_GPIO50__FUNC_O_HDMITX20_PWR5V>;
+			bias-disable;
+		};
+	};
+
+	hdmi_pins: hdmi-pins {
+		pins-hotplug {
+			pinmux = <PINMUX_GPIO51__FUNC_I0_HDMITX20_HTPLG>;
+			bias-pull-down;
+		};
+
+		pins-cec {
+			pinmux = <PINMUX_GPIO52__FUNC_B1_HDMITX20_CEC>;
+			bias-disable;
+		};
+
+		pins-ddc {
+			pinmux = <PINMUX_GPIO53__FUNC_B1_HDMITX20_SCL>,
+				 <PINMUX_GPIO54__FUNC_B1_HDMITX20_SDA>;
+			drive-strength = <10>;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins {
 			pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>,
@@ -1286,6 +1415,18 @@ connector {
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


