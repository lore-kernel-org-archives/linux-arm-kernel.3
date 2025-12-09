Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24DD3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBs+owaYrzGL57qjzqOLgpSdHNba6hf2E0FlXu6AJl8=; b=qwbk9z7c720mV6upCM7azqDc8r
	NFTcicA/U6Ww9eRFqPD0yTblf3UTpwjI4zpzMlup0pBdHEsWsKnl8mXq+vOTgVrBgKbzXK/DkABtH
	NBNSeTjja+PrkEz94VnGRKDWjAC9tfaAjkVkYZH94C5qTlfynS8Kx/ocm6D4e57/7DyHly30BbCol
	m8xrjUPxiDvRLK7T5F/JnZYlgG+vrNTwrS7HSXiKUxfet87v+vTBB8GaLL1anEw4eK387jeZGEkPb
	sYvxSjJMXjfonjy4Rk2NLR02RlNtR1GPqkFMeWroJDg+6cSRjNXaZZL7kraNKN+7lY1sVxecKPRnK
	bel3Br4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0g8-0000000EWy2-0RQX;
	Tue, 09 Dec 2025 16:35:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fu-0000000EWbY-2czM;
	Tue, 09 Dec 2025 16:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298091;
	bh=v2QuPDw9K0n6FNZS6s1RdjJ61am2N+d7TzADHlSeuNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D3RVUUdDjjnBYMmisNeyHg/xGhQjYItz6+5ENmBlRYYA88TXiRHn5EN58mdX2eRgO
	 Tonj/eoR7hM52IQ7XYNUsbKFo2azsZaeN0XkWWtb3P+b8LhFf8qGfW8gA86T9QdIq/
	 NuZ9MR9C82DQlPT7/3CJDfrsDYHdrS4BawxGqjSaeNpjjonYqYX1wcuNYdwObUrB+R
	 5DgRhmed7fw4i65QWf1gscABXD1t4Rqylds4YeWoMN+q2OXwe1CpI5jErHTWFoDfd+
	 Nm3hvkycTUU3VbfaHshyret4SMpmXOnFiDseL0+6AMtS9OJ5MQqfJ7dCJI7kSifxJ7
	 XN7K551odTkiw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FED717E15C9;
	Tue,  9 Dec 2025 17:34:51 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:38 +0100
Subject: [PATCH 08/12] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable
 HDMI output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-8-9a6106effba6@collabora.com>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=3996;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=2k32lAvL+oS+oCDLIGRUdNxvio3a5abaLFyOgFe4WZE=;
 b=DkvEw4jjCy8/G9Cxzn+fIvvRAIsdDwTI7MEyObRJRUi7J9Apzra24g5ZNkOLSxH/e8WXmO5pZ
 1y/HseRToIGARVIEukPOKaUVHSGaFTWe7mU9MRl0Ue6IIJtETAcr1VS
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083455_056114_94392D74 
X-CRM114-Status: GOOD (  10.30  )
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

Add a definition for the on-board HDMI connector, enable and add
the relevant configuration for the HDMI PHY and controller, and
define the pins used by those.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index d32f973f5e0528bc3233ff01f029006dbe6ef894..b0e18876bd5d2341c6f17f47e9f11433be807ccd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -37,6 +37,20 @@ chosen {
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
@@ -245,6 +259,18 @@ port@1 {
 	};
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
 &eth {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&rgmii_phy>;
@@ -265,11 +291,61 @@ rgmii_phy: ethernet-phy@1 {
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
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
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
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c2_pins>;
@@ -448,6 +524,35 @@ typec_con_mux: endpoint {
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
@@ -647,6 +752,31 @@ pins {
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
 	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
@@ -1058,6 +1188,18 @@ &ssusb2 {
 	status = "okay";
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
 	vbus-supply = <&otg_vbus_regulator>;
 	status = "okay";

-- 
2.52.0


