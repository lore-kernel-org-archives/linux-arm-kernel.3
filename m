Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B679CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyab/DTAR9jhfJIBsm1z8Es4blkN8hawSJWx0kJHmZ8=; b=fHTcj9SuvlXjssqTC9fudF04fV
	R3MAxmiKvqx9nbvPvvsm0ijOg9juDn3bTEYijVq6Mt8pWcaZvogXeowx3fAOJvJTjQBy5T3MMdVRP
	F5zZg+/c+PUzBXePUEBgJ5x5rRZY3qrw1L2kZEFVy4iEkXF6OWd5pzZMvcqJSiNeTP4CKAl2csG87
	qoY3/04zTy/VQY8DEThV9sECKQf3vUJsNsIx/LLnM1kah6T9oGFK851w0CNYT5TYbyQR+Qfw1AMMY
	fE7+qd3S4PxAtuWSi1Q0UKv/jLoE9u7kE6yrRpJIgaPDKzUe8COcbAEmE0lU5qwcYUR6KMuOzH7ei
	SOMqimXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb36-0000000CkeB-1nHf;
	Tue, 13 Oct 2026 11:52:04 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb33-0000000CkZc-1ZxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zyab/DTAR9jhfJIBsm1z8Es4blkN8hawSJWx0kJHmZ8=;
	b=bLqmeGjL4ncxPL9Y/WU2s3PFTuAm2wBGGHxur8rGe5CSetvhDNQssGfI+CqTq7qmubvZ06
	VmukKc+pqlWerDhaDK7VXx5zEWiJCA7QVHlte4dFopCGwIhAs/2GDfkS0VDftwCqDVWIo3
	Xsm4dGROTK5FC4O7S6rUl06O5sMaisJyeDo2Dl2DBWW9N8OpdBTApaZSSNSu7fQjIz7mWR
	xsyCFH2/dDYQ1TikorjYJjZY2hjBu+GB1ed/hMtP1sNFDq3N2jdKNrVOjA0V9B6CfAOeWk
	7vRnO3VAfWdrCK/odYlOeZVcXJqScj8nVC5cgY+GHG6lG17yW0xjsUrIFmWRTQ==
Date: Tue, 13 Oct 2026 13:51:13 +0200
Subject: [PATCH v2 8/9] arm64: dts: imx93-kontron: Fix UART RTS/CTS pad
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-8-d464ca652c91@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=4bKC16o5GKSU948TfhevL5l/gtf8VzrNd538OkRdtV8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ/5tjVm++d+n3Dq/AmntI//RP8/XnTse4eG8re+g
 9FNT+xKO0pZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACai3cvI8Dn3ecaPrzerDwr2
 V617MfUj7+qC9qXFSbFTH0so7WQPV2P4XzFRzPv6hUdP1qX6eb7XuXzsvmvmItE2xpupWrJvUwo
 WcQAA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045201_582477_7EC33D98 
X-CRM114-Status: GOOD (  10.15  )
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

On i.MX93 the LPUART RTS_B signal is an output and CTS_B is an input,
so they connect directly to the OSM-S UART_x_RTS and UART_x_CTS pads.
The naming used for the Gpio labels and pinmux comments was carried
over from i.MX8M, where the UART RTS/CTS signals have the opposite
direction.

Fix the naming to match the hardware:

  GPIO_IO06 (LPUART6_CTS_B) -> UART_B_CTS
  GPIO_IO07 (LPUART6_RTS_B) -> UART_B_RTS
  GPIO_IO10 (LPUART7_CTS_B) -> UART_A_CTS
  GPIO_IO11 (LPUART7_RTS_B) -> UART_A_RTS

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index a6b6128f22ddf..850a92dd9b9ba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -59,8 +59,8 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio2>;
 	gpio-line-names = "I2C_B_SDA", "I2C_B_SCL", "GPIO_B_1", "GPIO_A_2",
-			  "UART_B_TX", "UART_B_RX", "UART_B_RTS", "UART_B_CTS",
-			  "UART_A_TX", "UART_A_RX", "UART_A_RTS", "UART_A_CTS",
+			  "UART_B_TX", "UART_B_RX", "UART_B_CTS", "UART_B_RTS",
+			  "UART_A_TX", "UART_A_RX", "UART_A_CTS", "UART_A_RTS",
 			  "SPI_B_CS0", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
 			  "I2S_BITCLK", "I2S_MCLK", "GPIO_A_1", "I2S_A_DATA_OUT",
 			  "I2S_A_DATA_IN", "PWM_2", "GPIO_A_3", "PWM_1",
@@ -423,8 +423,8 @@ pinctrl_lpuart6: lpuart6grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO05__LPUART6_RX			0x31e /* UART_B_RX */
 			MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e /* UART_B_TX */
-			MX93_PAD_GPIO_IO07__LPUART6_RTS_B		0x31e /* UART_B_CTS */
-			MX93_PAD_GPIO_IO06__LPUART6_CTS_B		0x31e /* UART_B_RTS */
+			MX93_PAD_GPIO_IO07__LPUART6_RTS_B		0x31e /* UART_B_RTS */
+			MX93_PAD_GPIO_IO06__LPUART6_CTS_B		0x31e /* UART_B_CTS */
 		>;
 	};
 
@@ -432,8 +432,8 @@ pinctrl_lpuart7: lpuart7grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e /* UART_A_RX */
 			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e /* UART_A_TX */
-			MX93_PAD_GPIO_IO11__LPUART7_RTS_B		0x31e /* UART_A_CTS */
-			MX93_PAD_GPIO_IO10__LPUART7_CTS_B		0x31e /* UART_A_RTS */
+			MX93_PAD_GPIO_IO11__LPUART7_RTS_B		0x31e /* UART_A_RTS */
+			MX93_PAD_GPIO_IO10__LPUART7_CTS_B		0x31e /* UART_A_CTS */
 		>;
 	};
 

-- 
2.55.0


