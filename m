Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6BDCC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUMQVPmAXVyHnbGSMizW+WgNWwNECkBdTvVIDO923a0=; b=HQyyLGbchTh9HhBRd3iQMsutj9
	9ItANlK91Eu5SDF5sGb2OjIo5kHBd4DAmIRLdoOf4e1KYjR7HpIGUx0VIlcBSabGL+LpMuhoXhjKw
	y5XjVw/8nQGtPHGBVN0X2VxjL9lwzpbvlH+RjhJclZurr3XK4H/yKXqKTwFy6yNB4j4loM4z0EFgR
	RZLVbd+n44yDv/kFyQzh9wNO8NdtYuFu8Q9Ku2nkxZJ3ztu4y42DZtqeQJOum/Ewoh+PgRSvXy61C
	kZPGW118PYFTnPHyZZxy00ZbL6Y0KvDk6k/X0W41YsIzZKLUKWpGOPjAtBsbXmWg/yaluRAi6prjD
	w/k4+W/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb35-0000000CkcO-2f5U;
	Tue, 13 Oct 2026 11:52:03 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb2o-0000000CkWm-2mLA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:51:59 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUMQVPmAXVyHnbGSMizW+WgNWwNECkBdTvVIDO923a0=;
	b=sMriuHDbbUocAMam8jKFeNarTr7Hcdg4y+PutzwPz0TzQRSrIUDkO/X3bD6V4jW42PPX76
	/qK8f3y6bE5ogHHIU3cnz0OShFe3oALxt9RlI9Qf7ldb1I93fXYycD11LT/jj5eVY8Gpwj
	i6L1E4RiH6dguHJHMGdlSr0NPQPvRTPQADKBuldK0fWhHUHUqxSKq7IEna5NQ8OIS53w/g
	jq40MSX1FSWq4hPjU+yZm9KnAeSyLPR4WR1yWaZPSc4JhyQVzjUF9M8cVZEqgsz59x4y90
	W1UhD2wc5YBA8BiWMgKTrKP4I6/R6FKM4MWGGmOosEwZzI+gkOlKXTPRJQmhFA==
Date: Tue, 13 Oct 2026 13:51:09 +0200
Subject: [PATCH v2 4/9] arm64: dts: imx8mp-kontron: Remove obsolete
 VDD_CARRIER regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-4-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rxs3VbVI1vjxWa6AD5PEYJSFI5cFMyZj7PFfdoDP6C8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ+3fJFT6u2VWUmfdq95vP3v/APSXJYnxB3PsTo6H
 6zVm5zSUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJH90YwMh0JW5pjGaRmrrFg4
 S6H9eNF9+absmvlcLR1THSfM3+PKxshww7CjdevM9bPXXyyeWeUX9X0Fa/6W88w3nX/u3rv3O7c
 YNwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045156_363182_7C015701 
X-CRM114-Status: GOOD (  11.38  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

For early prototypes, the CARRIER_PWR_EN signal was controlled
by software. Now, for the regular revisions, this signal is
controlled by hardware. The corresponding pad is now available as
GPIO_C_1. Reflect these changes in the devicetree.

Also update the GPIO label in the BL board devicetree and drop the
CARRIER_PWR_EN label from the SMARC module devicetree.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |  2 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 32 ++--------------------
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   |  3 +-
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 831bf8cfc5bd1..e7241a71da68b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -167,7 +167,7 @@ &gpio4 {
 			  "CSI_ENABLE", "",
 			  "USB_HUB_RST", "TFT_RESET", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
+			  "I2S_B_DATA_IN", "GPIO_C_1", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 /*
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index 3459ee2c0eb64..4fd42e7170ee8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -72,29 +72,6 @@ reg_usdhc3_vcc: regulator-usdhc3-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_B";
 	};
-
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-name = "VDD_CARRIER";
-
-		regulator-state-standby {
-			regulator-on-in-suspend;
-		};
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-
-		regulator-state-disk {
-			regulator-off-in-suspend;
-		};
-	};
 };
 
 &A53_0 {
@@ -185,7 +162,7 @@ &gpio4 {
 			  "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
+			  "I2S_B_DATA_IN", "GPIO_C_1", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 &gpio5 {
@@ -547,6 +524,7 @@ MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x19 /* GPIO_B_3 */
 			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x19 /* GPIO_B_4 */
 			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x19 /* GPIO_B_2 */
 			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x19 /* GPIO_A_6 */
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0x19 /* GPIO_C_1 */
 		>;
 	};
 
@@ -683,12 +661,6 @@ MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0x19 /* SDIO_B_PWR_EN */
 		>;
 	};
 
-	pinctrl_reg_vdd_carrier: regvddcarriergrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0x19 /* CARRIER_PWR_EN */
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x1c0
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
index a88883e847457..599faf4600d48 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
@@ -175,6 +175,7 @@ &gpio3 {
  *   CAN_B_TX -> CAN1_TX
  *   CAN_B_RX -> CAN1_RX
  *   I2S_B_DATA_IN -> n.a.
+ *   GPIO_C_1 -> n.a.
  *   I2S_A_DATA_IN -> I2S0_SDIN
  *   I2S_B_DATA_OUT -> n.a.
  */
@@ -190,7 +191,7 @@ &gpio4 {
 			  "ETH2_INT", "USB_HUB_RST",
 			  "ETH1_INT", "GPIO4", "CAN0_TX", "SER0_CTS",
 			  "SER0_RTS", "CAN0_RX", "CAN1_TX", "CAN1_RX",
-			  "", "CARRIER_PWR_EN", "I2S0_SDIN", "";
+			  "", "", "I2S0_SDIN", "";
 };
 
 /*

-- 
2.55.0


