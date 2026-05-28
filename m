Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CFBCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xCLVbh1sBBSOmagGE/x9KMj2LGr4xyccPuWMFIUyF8=; b=S0EGbbAZcKJ0QKYPEVvMjRii3t
	ISu/xsaMUEPLivAdJnrwQQ2Tn0Ri0FCWa4EVnF1jsVX6NijdCcebjJWEDolvZs+90QfEkRG3R/80+
	6TD3kRlUYK2VCTiMRkdfFwdBkS/d/ko7A7CvGEOsONKfD1fAUJtIr39PX7ZKkKKrqioUn2NpanQQ1
	L6t8oQZmi1pJf7OrH/MWg05o0HdCQ+ErYJZ+8M6PUyc0x++DvisoWQ/xQJLr4FxjP4SsHv7AprFhi
	3JC4ObTx+jSpx52hMmfnwk3CIZqeZOIPbWKjNYANbzExX+hg7/E7TccXGx8zvbIdI81ezErZ1RO+N
	cqEcpIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXxc-00000005atT-3SQm;
	Thu, 28 May 2026 10:27:32 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXxZ-00000005asi-3fw7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:27:31 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1779964044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7xCLVbh1sBBSOmagGE/x9KMj2LGr4xyccPuWMFIUyF8=;
	b=sVs8wgSwuXagVcjaN4bUG8ffMt9SC3SKS7fi/IvtdN2Kjx1bAGOxYocRmpi1oZAgiSpa2b
	XhfjagBznFWm5GX3fpTUEIkvsGvPuNVj2EZHrB4GnNwXnuhGo2fBOtGKCLo9OwP73jN2D2
	Gy6WtVvcNSPqUH2mRSgv5njAsMuR0JMy14ab7T225xdxUcmVj1i8JMi47BWxI8I6O1Smja
	01DcRNx7R25p5NOa7w0L2hWHotSQrwZ3VNw2qeyaOqCVWiilbk+E3xfHpQ10xVFayVK/x7
	w6NNkps3L78GNo7y3sr/9RNdqC5FXoW3qTiBUDPolijNgkocvPYjSGqn48xpWw==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
Date: Thu, 28 May 2026 12:15:56 +0200
Message-ID: <20260528101556.75926-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_032730_343748_9AFB9C17 
X-CRM114-Status: GOOD (  12.46  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The GPIO that controls the power supply for the LVDS display
connector has changed between early prototypes and the current
production design of the hardware. Reflect this change in the
devicetree to properly switch on the panel supply.

This was working before even with the wrong GPIO due to the
bidirectional level shifter used on the board which drives the EN
signal high even when the input has a (weak) pull down configured as
reset condition of the SoC pad. As a result the display was working
but the supply was always on.

Tested on BL i.MX8MP to show the correct voltage level on the level
shifter input.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 75ae46642782..29ce863403b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -49,7 +49,9 @@ pwm-beeper {
 
 	reg_vcc_panel: regulator-vcc-panel {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_panel>;
+		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
@@ -172,7 +174,7 @@ &gpio4 {
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio5>;
-	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "PWM_2",
+	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "VCC_PANEL_EN",
 			  "PWM_1", "PWM_0", "SPI_A_SCK", "CAN_ADDR1",
 			  "CAN_ADDR0", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
 			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
@@ -329,4 +331,10 @@ MX8MP_IOMUXC_ECSPI1_MOSI__GPIO5_IO07		0x46 /* CAN_ADR0 */
 			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x46 /* CAN_ADR1 */
 		>;
 	};
+
+	pinctrl_reg_vcc_panel: regvccpanelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03		0x46
+		>;
+	};
 };
-- 
2.54.0


