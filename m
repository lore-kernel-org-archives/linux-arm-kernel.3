Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104F0C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWu52B/V45Sj+zawQFQZIAYKWu1W4y6AIeR9Ixu3gtc=; b=GaltdYAqpIFSgO/nS5LHGxzXpU
	3/OXKOi7ePebRlx8j4jNpfqoz3ptuxIH3DwsJlRsob4+eLRX8AaG+qv1PuKYSZmMOzMxCkCNPAjtA
	zFuxHHxzHOzUeqD4reKKLTErdguB2/UTlov10YlV4gYCcM1jv+SbMdz0xObtcq7/kD54fs8Mq2EH5
	qg2VQfouD4d8rBuaLM6X8PM3K5RuXt+gDGfF6vxv5mnackOKzzAER0Fmk59w39G89IioAojdsukXI
	pdo4TMNlCEnqYtT2WwCFOO0bZZuWqdmvHpfZV0EhITw6IwZA6Cw7ADk10T+/GvVniZBZrlvh9Nxbu
	cRAwtnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnG-00000002ZZF-3XCe;
	Mon, 14 Jul 2025 15:08:38 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2g-00000002SMB-31Mb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5CAAC753B;
	Mon, 14 Jul 2025 16:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502829; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iWu52B/V45Sj+zawQFQZIAYKWu1W4y6AIeR9Ixu3gtc=;
	b=H075nMUAryfiTjjXkh4NHGhnjvKu4X/PbXOBcPh1WQDB/oWUcUydF9BgX449/rBjDVPYo3
	7gqAUc5yWozk82qk4U1qz16GGLrSGWFx5PuQPRSGGrKRljyFCMD/Qo9AqUw9A435ZdG46t
	utK2drUWyaGr4zW+68dUsqOhfmg9y8MRAkeNEQEpRh8i5mo1vdfNUncl0Il5iGEkIQAKE1
	hmLljy8GnqXnyRUPp4EYsFWrpLpBbU0NICQ5/YghCjTz9JPS1Gw5Cj6LdIQDHKiEeJLgxw
	s3GFKr25YCIMduu5ZD5ViymZqNLbC8lVSBoPZNJaQFGYckGweMR9h6KRp8o6Yg==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 08/12] arm64: dts: imx8mp-kontron: Fix GPIO labels for latest BL board
Date: Mon, 14 Jul 2025 16:17:34 +0200
Message-ID: <20250714141852.116455-9-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072030_904277_9901A22A 
X-CRM114-Status: UNSURE (   8.54  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Hardware rev 3 changed a few signals. Reflect these changes in
the GPIO labels.

* digital IOs were moved to GPIO expander
* remove labels for unused signals
* add labels for TFT, CSI and USB hub IOs

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 4aa5c261b865d..bbcd76e9e9913 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -123,38 +123,36 @@ &gpio2 {
 
 /*
  * Rename SoM signals according to board usage:
- *   GPIO_B_0      -> DIO1_OUT
- *   GPIO_B_1      -> DIO2_OUT
+ *   GPIO_B_0      -> IO_EXP_INT
+ *   GPIO_B_1      -> IO_EXP_RST
  */
 &gpio3 {
 	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
 			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
-			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "DIO1_OUT",
-			  "DIO2_OUT", "", "BOOT_SEL0", "BOOT_SEL1",
+			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "IO_EXP_INT",
+			  "IO_EXP_RST", "", "BOOT_SEL0", "BOOT_SEL1",
 			  "", "", "SDIO_B_CD", "SDIO_B_PWR_EN",
 			  "HDMI_CEC", "HDMI_HPD";
 };
 
 /*
- * Rename SoM signals according to board usage:
- *   GPIO_B_5      -> DIO2_IN
- *   GPIO_B_6      -> DIO3_IN
- *   GPIO_B_7      -> DIO4_IN
- *   GPIO_B_3      -> DIO4_OUT
- *   GPIO_B_4      -> DIO1_IN
- *   GPIO_B_2      -> DIO3_OUT
+ * Rename SoM signals according to board usage and remove labels for unsed pins:
+ *   GPIO_A_6      -> TFT_RESET
+ *   GPIO_A_7      -> TFT_STBY
+ *   GPIO_B_3      -> CSI_ENABLE
+ *   GPIO_B_2      -> USB_HUB_RST
  */
 &gpio4 {
-	gpio-line-names = "DIO2_IN", "DIO3_IN", "DIO4_IN", "GPIO_C_0",
+	gpio-line-names = "", "", "", "",
 			  "ETH_A_MDC", "ETH_A_MDIO", "ETH_A_RXD0", "ETH_A_RXD1",
 			  "ETH_A_RXD2", "ETH_A_RXD3", "ETH_A_RX_DV", "ETH_A_RX_CLK",
 			  "ETH_A_TXD0", "ETH_A_TXD1", "ETH_A_TXD2", "ETH_A_TXD3",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "DIO4_OUT", "DIO1_IN",
-			  "DIO3_OUT", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
+			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "CSI_ENABLE", "",
+			  "USB_HUB_RST", "TFT_RESET", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "GPIO_A_7", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
+			  "TFT_STBY", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
 };
 
 /*
@@ -325,4 +323,4 @@ pinctrl_usb_hub: usbhubgrp {
 			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x46
 		>;
 	};
-};
\ No newline at end of file
+};
-- 
2.50.1


