Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCB9C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XZvy9/teZpEHlkqIvVOc8IP9ZNPUzpd2q4HvxwEdeA=; b=yAH3f0DTz+jKGuUDLV5DaLa5p/
	OoYe9MdjQFCDCc3snY/61u9A6O9jmxG00CfaeKgNjmlUiK/u1Cvdzlra9FDTa8e3qjQtV9dkiJ3rB
	xnHxAmz2bWKVRz3iSyysVQXmvm4aZnM7LqgrGJQ/DUgp3PpZQUiLWJ50CO7lyoTDIraeZ0c5gfFWY
	ZmD7yOl45ruesZNMVgqumW1Ku8losAA27xmY71p5qq9lQp1QjomE9bBaHu3fjAx8HYRs5ISgjT2W+
	tqpblt+9iXTTnug+P45dkUlygz+P1whmAKLcgZfLdzzH5rWzWQ4GUb8jsSmaBTJCfzagAlvcHU9j8
	i+21PsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPAq-00000003We5-2JVA;
	Mon, 27 Jul 2026 17:31:32 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPAc-00000003WXc-3ban
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:31:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 482CB2028EE;
	Mon, 27 Jul 2026 19:31:11 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woPAV-001aZh-0S;
	Mon, 27 Jul 2026 19:31:11 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 19:31:08 +0200
Subject: [PATCH v7 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-5-ca8a0446166a@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=/5sZ4Ww5VGpOH267RgapxoUvEnHhzIosvBJBtTMkAlA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1b61Due5xvvPJl1Ldt7amHtc4OiuL7/vlXqJx0urrP8e
 kg2OLCho5SFQYyLQVZMkUVlYQWfqMcHz8hpIlwwc1iZQIYwcHEKwETWxjIyrNu/wLRk3c/9WTXp
 a+cwJf5J2Oq9I1thqmeTvtn1ffPdNzL8dxG4+mz9xwN/ZTfvcLvc9+PZiV9x1yurysMPluj8itb
 6zw0A
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_103119_139899_1F1D66F6 
X-CRM114-Status: GOOD (  10.93  )
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

This board is similar to the already upstream
imx8mp-skov-revc-tian-g07017 and imx8mp-skov-revc-jt101tm023 but uses a
different 7" panel with a different touch controller.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 53 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2caac104bec6e..92559e0dd8396 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -435,10 +435,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 
+imx8mp-skov-revc-jutouch-jt070tm041-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt070tm041.dtbo
 imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
 imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-tian-g07017.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
new file mode 100644
index 0000000000000..f3f43e60a0aa7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+
+	panel {
+		compatible = "jutouch,jt070tm041";
+		backlight = <&backlight>;
+		power-supply = <&reg_tft_vcom>;
+
+		port {
+			in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&in_lvds0>;
+			};
+		};
+	};
+};

-- 
2.51.0


