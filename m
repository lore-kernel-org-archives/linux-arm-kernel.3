Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A630D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lz2JLewZ/gSObJyDoEBsgrGtQ6IZqgHd8/KrIW2d1m0=; b=G/6Zi2C0iHIrhbvO6Tp6bJRnNo
	3Ybq2mfXxvTzJgHRVeqc5osMP3kK7SDIC3ubklKgSQMl5MUYKn6SCE9vf32yWP6CkA09Lv5PYLMpw
	G6LuObSVrE/KCF0pwF0rl5z2tjG6VjvrHA3S+wVLb0373VbfNPLl5TDvufohr+DSoyfX8IJHYLzDa
	FiLUYuQssM5qIe9mJpElQ1pzHSgrWUDFaAiTY1wB3QPp8l2+PygpZN7+EgLlPcjl+b6HOhH43yj8w
	32JgspHqzbhKHPaIqeYYSDZkolLfofNOzlfJJIUKS4ZE9t6KaQP4GgQL7zbULNTb5IKk2S04Dke8I
	aM0HU5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Muk-00000000fnj-0WN0;
	Thu, 02 Apr 2026 18:37:10 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Muh-00000000fmv-06Fp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:37:08 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BADF91F80041
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 18:37:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 35673B40133; Thu,  2 Apr 2026 18:37:03 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1E980B4012B;
	Thu,  2 Apr 2026 18:36:31 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Yannic Moog <Y.Moog@phytec.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Date: Thu,  2 Apr 2026 20:36:26 +0200
Message-ID: <20260402183626.3284639-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_113707_427285_0D266497 
X-CRM114-Status: GOOD (  13.54  )
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

The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
Add the required device-tree nodes to enable support for it, including
both the video and the audio paths.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../freescale/imx8mp-phyboard-pollux-rdk.dts  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..4efdc6bdfe12 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -38,6 +38,18 @@ fan0: fan {
 		#cooling-cells = <2>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	panel_lvds1: panel-lvds1 {
 		/* compatible panel in overlay */
 		backlight = <&backlight_lvds1>;
@@ -126,6 +138,13 @@ reg_vcc_1v8_exp_con: regulator-vcc-1v8 {
 		regulator-name = "VCC_1V8_EXP_CON";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -146,6 +165,10 @@ map1 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 /* TPM */
 &ecspi1 {
 	#address-cells = <1>;
@@ -201,6 +224,32 @@ &flexcan2 {
 	status = "okay";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
@@ -244,6 +293,10 @@ &i2c3 {
 	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &ldb_lvds_ch1 {
 	remote-endpoint = <&panel1_in>;
 };
@@ -444,6 +497,15 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x154
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x19
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
-- 
2.53.0


