Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4B2CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spLaJFBDA2I9mv/iGjdSPVlGR48vOUEIla/fx1TJJh0=; b=fiHXoeCj4QGOBA9PMfJIfIcKqt
	jh5ljPqv3C/2YgXVHQzhHqlBJXVljww3ownTyKE/TFDaGXOlhJqJT2+YGgbMpBNysZR9KkjTuPbJi
	5/n7wt8nHlkIB8fvBRwS9g95Cf+KZem05nnnL0btDny0PMEZOplmyfkN/YMSMkM8ROwHDocoM00F3
	4NjXj9Q63l3grkabegBfrp/TVtf/H/jVYcy5xPFmODz5yvtfhJM5Zt6Bm9vx/L0woQL2VpJwwTD+8
	vS/wD2XoYd1K75ibktiaU4IsDDG2Kt3LyOOhNeliq4F/yjAAiFg1UlhcZK/5D8JBMA/nVOVmZTB/w
	wROK9h4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4w-0000000CSTa-482v;
	Tue, 13 Oct 2026 09:45:51 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4t-0000000CSRM-0hfV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:49 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spLaJFBDA2I9mv/iGjdSPVlGR48vOUEIla/fx1TJJh0=;
	b=T72C/PhT8ZNZUOcjrgMiDKhS+DjWiqA58Vnk63sU29TSpoqH/4rH3oc16rH8+yJHl5idbZ
	2Ma814Zs5xaceblmywgjjAUWz5dss3o+IjQVoW9NWH7/2m4SuqBkzAVJ77PUf/qGBdX2ZL
	2jUVplLjstEth6ZyInd1u+EBbZ+F8dWD4/BXuxsrsSNmSeQo7mJDpLaxwlFkmOZyZ+QNTa
	0KINd25aX74q1u6uwNKn2L2UeeX6YHwoFAa/34gBSZE07pBceKU0GBeioBY9+z/hyvyi/3
	6QG8M0JWIq2TlBqHU3Si6/TGTBtlGPEsiLtwtcShtnHZ8Q1H82KkHwFyPBT42A==
Date: Tue, 13 Oct 2026 11:44:46 +0200
Subject: [PATCH 1/8] arm64: dts: imx8mp-kontron: Fix GPIO label assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-1-94f09ec520ef@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=om7LyEc69G6kO1gRBMD5Mt5tCVN+v7qqCDAAFMdEM9g=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs3yPzHjO8SlpWzPZU8s1ylzWR7I1/L+lnHJaO3aeXO
 Xf51+WNHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABOZeJiRYfcnhZ/Ws12V2369
 EO0/H+SeUPfMfE3f6diJjHtm3rX8cpKR4VP93AN9M07qP3h9qF6wO6RzbXiCyiS59z6F2fXKva8
 O8AAA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024547_676202_01FAF31B 
X-CRM114-Status: UNSURE (   9.29  )
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

The OSM-S pad names GPIO_A_7, UART_B_RX, I2S_LRCLK and PCIe_CLKREQ
are incorrectly assigned. The labels I2S_B_DATA_IN and I2S_B_DATA_OUT
are missing and SPI_A_WP/SPI_A_HOLD are unconnected. Fix the labels.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index ea69c639b30b8..3c183ab573bed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -158,8 +158,8 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
-			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
+	gpio-line-names = "PCIE_WAKE", "GPIO_A_7", "PCIE_A_PERST", "SDIO_B_D5",
+			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
 			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
@@ -178,7 +178,7 @@ &gpio4 {
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "GPIO_A_7", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
+			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 &gpio5 {
@@ -189,7 +189,7 @@ &gpio5 {
 			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
 			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "UART_B_RX", "UART_B_TX";
+			  "PCIe_CLKREQ", "UART_B_TX";
 };
 
 &i2c1 { /* OSM-S I2C_A */

-- 
2.55.0


