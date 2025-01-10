Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34055E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3B+7xW3A+hBNawXWpX5L5XqlvWj4cEiq29OLLyd2VrE=; b=wWZ4+BVkp6K6x/
	a3ii6NMOtQW+P1RTztZIen2WITkDl68lSsoccWm9X4Up+uIJ7KNhSkH4AWUIeuVu3FIETVUN2/jck
	RXueaRTv7mKRrQ5mn7xUMNH2H1ulW197xxuUEDsIF5n5PGD7ws4fxvNbNM7dz/WwYL+al/IpEuCCU
	f3bV4upYXtxuUrdQ9VH2w/dP/LaPQzLmHrkZoEx3PruhPJevK9f9XaKjKjRx7+pPl2OLL8o8WOQEr
	91CJIorUfRF/noyz0xGAh0KAam4l/UyVQZPEXEERrMHvDgkEXfuaL172n3eitC5a5XOkSIJbV+r+r
	S2Hr9oGGn2u92mnZ8XdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGEN-0000000FfmW-1VXY;
	Fri, 10 Jan 2025 14:43:23 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGD9-0000000FfcF-3VDU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:42:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 652E414867A3;
	Fri, 10 Jan 2025 15:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1736520125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3B+7xW3A+hBNawXWpX5L5XqlvWj4cEiq29OLLyd2VrE=;
	b=RGXH9KoVGDkvTHzliSDjEYC2PihHK/MND2FYnQ4tUGDudInB3lgPPP7BkoIjjhr7SvQItX
	05nAST2vJ+0XqWz4pHod24BKyVyG7zOE47umIXYewTY7B4dGRzy+Gu5LoSB2PmVmrsvdRT
	cqTo7jhgJSV3b8pXt90/fU+wvE//kgro+LLat67zhX5Co5O5IsRttv/wx4G+ZgLKhaz8+x
	OnkTVTMfR3Smqym/pSFJ5GyVnRmbH095SUBYUO87dQcd8Yhr5DtmJpaIy354uD+sc/7p5f
	0HqHCKE8kUGuMSG9ElI2u3HLJS7P/Ob/MBGMMj3ANcgqGQtBRLXMtmx8O4wbeA==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: microchip: sam9x60: Add missing address/size cells for spi nodes
Date: Fri, 10 Jan 2025 15:41:59 +0100
Message-Id: <20250110144159.379344-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064208_032513_DC71D2E7 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "moderated list:ARM/Microchip AT91 SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Complies with generic spi-controller and atmel,at91rm9200-spi bindings.
Fixes dtc warnings, when actually adding spi target device nodes on
board dts files including this soc dtsi.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 36944e18a329..b8b2c1ddf3f1 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -197,6 +197,8 @@ spi4: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -268,6 +270,8 @@ spi5: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -768,6 +772,8 @@ spi0: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -839,6 +845,8 @@ spi1: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -910,6 +918,8 @@ spi2: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -981,6 +991,8 @@ spi3: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
 					clock-names = "spi_clk";
 					dmas = <&dma0

base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
-- 
2.39.5


