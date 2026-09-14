Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1892DC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=; b=3DTMQE5jqvOCf5WsJiRXh3aW7e
	VNHXpjI/gyKEmxNsIue+8XpTs0ACJrydKxrXVSGTg8yAyGwW0xRH4DZXkl1iB2nZupfmBzwdfaDOf
	+WtOWqL2W0C54AoHV4gBdjxaT9Fv2hSQ5HBdiUX0dtfDn2ikqbwixOvuEUrXn0LxwtQ7vkDlW2+ck
	qkcp+qlSdLswRYLM6IFAaKGn3DIqt/zems+QV0vvvqE+z2wfyxNyFSGB58GV3iPcNZcO3juygkfXP
	OfZCbAu3SyJYiDyaZfYPPGJjT5OaxKVUF9pbWFNZk1yicgHkistluYVH8VWMi7YPqC6t9iU5ax9pb
	HGjCfYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671a-00000003q5I-0ViQ;
	Mon, 14 Sep 2026 13:47:10 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671N-00000003pxi-0YLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:00 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=;
	b=tt1cIA6L1NI0lx1LP9GjDCxbkc/j8IVjuNnI5DHTDtEgSxUYrHT4TU11T8GfN5MV1yy9r1
	QqsGp0LZVZ2d/tTENBDt0FauCApiBFFX//LHvCE8Y46JcUNdvMYEafX/oyRtgRVxRVR+xi
	ZHRXwhtQ+aWAroTw8BeZT3dMZJPoNF7CGv4DxumF0OYp5LIxb7SN9VVJe87kpE2C2v7DLr
	09WkgHi9FeGswpK/MEK4rKGbLkAllm0kH/4V2OThtIvhveejty72awrE9lcHxs90ZQVT6B
	L1bXpt++QcCv62egaaM1DUTvNAzRlCrIcxwWzpCTjDSaCLxIwOa8iecvgTmlug==
Date: Mon, 14 Sep 2026 15:46:12 +0200
Subject: [PATCH v2 4/9] arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-4-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=MMVzO63V/8fkJV9PzRy2jq7KDqxZ4OTRvgqObIY0heI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1O/k0vFA+felbev5PLWjlE1+SLs7VesK729YHbhl
 71zL9h0lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATOTOU0aGHilPxjj/M08fHL38
 v0+19aSm9rRb+o1LXeLE80XY53LPYvhnqfBQ0DTm0StRxQoV9oeHeMNNXNtuHb2+Sdvgpci9ax4
 cAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064657_570282_B631958A 
X-CRM114-Status: UNSURE (   9.75  )
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

Early prototypes had GPIO4_IO29 control the CARRIER_PWR_EN signal.
This is now controlled by hardware and the GPIO4_IO29 is routed to
the GPIO_B_2 OSM pad.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 32 ++--------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index f881912cde46..36548d918169 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -34,29 +34,6 @@ reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_A";
 	};
-
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
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
 
 &flexcan1 { /* OSM-S CAN_A */
@@ -113,7 +90,7 @@ &gpio4 {
 			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH_A_RX_CTL", "ETH_A_RX_CLK",
 			  "ETH_A_RXD0", "ETH_A_RXD1", "ETH_A_RXD2", "ETH_A_RXD3",
-			  "GPIO_B_0", "CARRIER_PWR_EN";
+			  "GPIO_B_0", "GPIO_B_2";
 };
 
 &lpi2c1 {
@@ -385,6 +362,7 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e /* GPIO_A_7 */
 	pinctrl_gpio4: gpio4grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x31e /* GPIO_B_0 */
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* GPIO_B_2 */
 		>;
 	};
 
@@ -465,12 +443,6 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07		0x31e /* SDIO_A_PWR_EN */
 		>;
 	};
 
-	pinctrl_reg_vdd_carrier: regvddcarriergrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* CARRIER_PWR_EN */
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_VSELECT__GPIO3_IO19		0x31e

-- 
2.55.0


