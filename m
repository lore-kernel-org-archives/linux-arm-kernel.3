Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95374CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuMgQ0i0EhEzmfgP8r1W/diFinK/iV2etDFg22neMpo=; b=Zuv5wduCddnvZ3XrCN6no19tRM
	yIZ5MQOWm2koaFuxfIUN2g8q/qwHsdft15P9ggxS0gR4sTO+iOeh21EJhjnI5MM0HUlRptj34hLId
	0vOlBOGCCG3O8btoDv4S3bMmyWSXFIPGgN88naEwxO4kz3B//IHrPh5yuiQng9SGzeFeciAgqD82q
	3eEvNy43bBh0xeCny1lUhLJ7EWT45epNXr1rZ/Zubm4CGi9PNcwHC9W7Rx+lUWm1bvtPdGmZRmCxl
	yOh726msXjboDmzamJ00ISwBbqEgUXbbrl1dYRbIxecJlCm4XeNkH5eplbSmfzUs23EsHsSlR/2PC
	wq4ZQV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ54-0000000CSXk-1Z02;
	Tue, 13 Oct 2026 09:45:58 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4t-0000000CSRZ-1RY2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:50 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuMgQ0i0EhEzmfgP8r1W/diFinK/iV2etDFg22neMpo=;
	b=g1ICr0bcCHY4JXdYSNZK9F0V1rTOt4Zwkn8emZ4QcET2bp3d7zbzJpoCTECqeHlzjKJnzX
	c43vq+M5tl0Cf3qopQQMpTSQHGfsdyNldJOXk+cOw8g4Z8e+bXN4YaOov5UPwfOOOdjqPB
	oV4jJO6pcGfDtj9udbDylNCfovUoiAH2zhx5SFo6UuKeFqajBbqyibpVV/MZPLzQIfCID9
	GNPRinPgTIIczTdKTTbT/0zz66QtJ3FwG8/bFC6SsomWI4u8W0CwbAQCZuGQwYl66AEDI6
	ROV+DABFHubyqDZ2Ezucsq33Z73qBGOtOtI6vxOM/kZQInyGfSi5llOPnTR++Q==
Date: Tue, 13 Oct 2026 11:44:47 +0200
Subject: [PATCH 2/8] arm64: dts: imx8mp-kontron: Fix GPIO labels according
 to OSM spec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-2-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=5231;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=P7zRyEtLVs0alTYfa2W2pXIHV5EGBxZ9yMkrcZy/Vnc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36N53K1sPuskXk8rvfJt37bgD+qnv0qd+/FgRvW2S
 /zbxI4FdZSyMIhxMciKKbJI8Vu8tjWL9ZE/Vh0FM4eVCWQIAxenAExkBj8jQ3tgFFd6mW7tdLug
 lm+u+/8rWLJf5heexLRw0RoR3c+3QhgZtv0Tq9iwVH5T6ffit9cmuGqyWp+4rGjSslYqdcPtiW1
 n+AE=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024547_677931_9CAD8011 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

The OSM specification provides generic names for all pads. Fix the
GPIO labels to use the correct pad names in order to align the
labels with the spec and with other OSM module devicetrees.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 50 +++++++++++++---------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index 3c183ab573bed..3459ee2c0eb64 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -141,16 +141,19 @@ &gpio1 {
 	gpio-line-names = "GPIO_A_0", "GPIO_A_1", "", "",
 			  "", "GPIO_A_2", "GPIO_A_3", "GPIO_A_4",
 			  "GPIO_A_5", "USB_B_EN", "USB_A_ID", "USB_B_ID",
-			  "USB_A_EN", "USB_A_OC","CAM_MCK", "USB_B_OC",
-			  "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
-			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
-			  "ETH_B_RX_DV", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
-			  "ETH_B_RXD2", "ETH_B_RXD3";
+			  "USB_A_EN", "USB_A_OC#","CAM_MCK", "USB_B_OC#",
+			  "ETH_B_MDC", "ETH_B_MDIO",
+			  "ETH_B_(S)(R)(G)MII_TXD3", "ETH_B_(S)(R)(G)MII_TXD2",
+			  "ETH_B_(S)(R)(G)MII_TXD1", "ETH_B_(S)(R)(G)MII_TXD0",
+			  "ETH_B_(R)(G)MII_TX_EN(_ER)", "ETH_B_(R)(G)MII_TX_CLK",
+			  "ETH_B_(R)(G)MII_RX_DV(_ER)", "ETH_B_(R)(G)MII_RX_CLK",
+			  "ETH_B_(S)(R)(G)MII_RXD0", "ETH_B_(S)(R)(G)MII_RXD1",
+			  "ETH_B_(R)(G)MII_RXD2", "ETH_B_(R)(G)MII_RXD3";
 };
 
 &gpio2 {
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "",
-			  "SDIO_A_CD", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
+			  "SDIO_A_CD#", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
 			  "SDIO_A_D1", "SDIO_A_D2", "SDIO_A_D3", "SDIO_A_PWR_EN",
 			  "SDIO_A_WP";
 };
@@ -158,13 +161,13 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "PCIE_WAKE", "GPIO_A_7", "PCIE_A_PERST", "SDIO_B_D5",
+	gpio-line-names = "PCIe_WAKE#", "GPIO_A_7", "PCIe_A_PERST#", "SDIO_B_D5",
 			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
-			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
-			  "GPIO_B_1", "", "BOOT_SEL0", "BOOT_SEL1",
-			  "", "", "SDIO_B_CD", "SDIO_B_PWR_EN",
+			  "PCIe_SM_ALERT#", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
+			  "GPIO_B_1", "", "BOOT_SEL0#", "BOOT_SEL1#",
+			  "", "", "SDIO_B_CD#", "SDIO_B_PWR_EN",
 			  "HDMI_CEC", "HDMI_HPD";
 };
 
@@ -172,10 +175,14 @@ &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
 	gpio-line-names = "GPIO_B_5", "GPIO_B_6", "GPIO_B_7", "GPIO_C_0",
-			  "ETH_A_MDC", "ETH_A_MDIO", "ETH_A_RXD0", "ETH_A_RXD1",
-			  "ETH_A_RXD2", "ETH_A_RXD3", "ETH_A_RX_DV", "ETH_A_RX_CLK",
-			  "ETH_A_TXD0", "ETH_A_TXD1", "ETH_A_TXD2", "ETH_A_TXD3",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "GPIO_B_3", "GPIO_B_4",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_TXD0", "ETH_A_(S)(R)(G)MII_TXD1",
+			  "ETH_A_(S)(R)(G)MII_TXD2", "ETH_A_(S)(R)(G)MII_TXD3",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
 			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
@@ -183,13 +190,14 @@ &gpio4 {
 
 &gpio5 {
 	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "PWM_2",
-			  "PWM_1", "PWM_0", "SPI_A_SCK", "SPI_A_SDO",
-			  "SPI_A_SDI", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
-			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
-			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
-			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
+			  "PWM_1", "PWM_0", "SPI_A_SCK", "SPI_A_SDO_(IO1)",
+			  "SPI_A_SDI_(IO0)", "SPI_A_CS0#", "SPI_B_SCK", "SPI_B_SDO",
+			  "SPI_B_SDI", "SPI_B_CS0#", "I2C_A_SCL", "I2C_A_SDA",
+			  "I2C_B_SCL", "I2C_B_SDA", "PCIe_SMCLK", "PCIe_SMDAT",
+			  "I2C_CAM_SCL/CSI_TX_P", "I2C_CAM_SDA/CSI_TX_N",
+			  "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "PCIe_CLKREQ", "UART_B_TX";
+			  "PCIe_CLKREQ#", "UART_B_TX";
 };
 
 &i2c1 { /* OSM-S I2C_A */
@@ -623,7 +631,7 @@ pinctrl_pcie: pciegrp {
 			MX8MP_IOMUXC_UART4_RXD__PCIE_CLKREQ_B		0x19 /* PCIe_CLKREQ# */
 			MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02		0x19 /* PCIe_A_PERST# */
 			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00		0x19 /* PCIe_WAKE# */
-			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x19 /* PCIe_SM_ALERT */
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x19 /* PCIe_SM_ALERT# */
 		>;
 	};
 

-- 
2.55.0


