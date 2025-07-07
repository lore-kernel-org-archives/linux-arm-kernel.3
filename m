Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B14C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB4kxhJdLd6PjF19nLcxPxFmoQE4JCqE8lMaPC00Llo=; b=O5e5gVOtlT6MGgaFszM3tPTx28
	OUx07z7WVqkCFEeKqYb2rcL7+LXhI0hO5qPOieHcEhlir86KaEv79jQC7vyfflfslwocZWzmjB3AT
	3xt2kWXSrnZqxP+N7WTjl8nJzexnBOHtn2drmpizkdfGx8/G4eWr8UlLrITb4AeqsaJ4pix2Mhqv5
	JlYPidNk/nTEEnZn459DdjyI6Ry9YxThgJFVnX7t/vhqJpfc+U7yTHAbhwyiwncFkLpFsfiDEDlGu
	LC0pRLs2ltmuXArxfxUboF8iVKWsZiU7PnVd2Cv8SkircEUH09muj025hjyYOCnU9C2Io3CyTKttU
	3tI9mhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpwF-00000003D2H-1waG;
	Mon, 07 Jul 2025 17:47:35 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp5h-000000034yH-1ttQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:53:18 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E2CDB1F00047
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 16:53:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 68643ACAEED; Mon,  7 Jul 2025 16:53:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id CF175ACAEE1;
	Mon,  7 Jul 2025 16:52:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin function name"
Date: Mon,  7 Jul 2025 18:51:52 +0200
Message-ID: <20250707165155.581579-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095317_797049_9CBDF3F5 
X-CRM114-Status: GOOD (  14.08  )
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

While the A100/A133 chips only expose a single EMAC, the sun50iw10 die
that they share actually has two such controllers.

One specific package, the T509 is reported to expose both ports.

Since we want to keep the pinctrl function names unique accross
packages of the same die to share a single common base dtsi, keep the
emac0 naming in order to allow the introduction of the emac1 function
in the future.

Note that the original commit also breaks the ABI between the driver
and the device-tree. It's however unlikely that anybody would have
complained about that since the a100/a133 port is still very early
and experimental.

Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
index 95b764ee1c0d..b97de80ae2f3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
@@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
 		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "ledc"),
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
 		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
 		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.49.0


