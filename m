Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA033CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRvuRuILNq/yWoa/NRjDFom6P+NjTUbwcwNhaaI2vJw=; b=K9UmVlkJ70W5gXikLwBFM6KYmr
	JwWJbfIijrGcewUZVDwasV9Ak8QzvYfM8aml1n6ZOLoBfd+4cnjOBUfwFZSRitI+vtmBWQoZW0BdP
	bnX08rVAc8A+eDD/gluUTDIZ43BomZgO6Md6XUisJQQr+zuhM9jRu2OH6zQIID9s3JbjtjBPKKDoe
	+f1a9o615AGx2kGz09UxRJldatefjW6nMAz5gEJhlUL1VyIj6e5Jeb8Ba8Eo+wxfyJ1ltIGFw2Cro
	j6WhD9oLIeLelwnOUK/n1CeSdkg9cxKewcTgV7PxkMb/XleG+ROVb2VQqAQDc9LgqbxMb8swkzP7B
	MGLu8RWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ54-0000000CSXJ-11bB;
	Tue, 13 Oct 2026 09:45:58 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4t-0000000CSRd-1MMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:50 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRvuRuILNq/yWoa/NRjDFom6P+NjTUbwcwNhaaI2vJw=;
	b=URZieJOzf2PGaw4fALxQV5hq/IUG1Fk/9VmZ2wYiuUFFKXgIn768XI7LPiyd6BHviOdIZR
	/eg6hFUHcQcZh00KjetK2DWmohla2vGy8/yWP0cbHJOW4Igflzg/t8wuGUrJQ1N8piL7SR
	5XatkH/tKtm4X145O6LjnoT7vYCZUwtsPx1X+U3kzRf2DQ4L+hsSMYuAyO2F/jdsk3ymBW
	BFB9aKP4cJHJeWcW/trkU38ecBhLulVF8iZdO012JOaG4DgM/JvSCH+zUVCQmCE3PD/CMV
	dWQEZZqwzEOBYoqD7OwgWxSv+PBQO70SEmo+6fsxX4u5kTEir77cDNuD3H/P2w==
Date: Tue, 13 Oct 2026 11:44:48 +0200
Subject: [PATCH 3/8] arm64: dts: imx8mp-kontron: Remove obsolete
 VDD_CARRIER regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-3-94f09ec520ef@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=BlLX2poyrIK+m0d4cirwujiYu4ewF9ZSgcg39h5GqLs=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36OqzJ3vNx4s+db86GTG2tSGwE6ZBznPRM758JepG
 cizHLvdUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJFZpYwMR89GHbot9HHjuU8+
 t9hVP/yMC7LvZqx+VONkl8F9y4y9iJHhp+4VlYd9+/wml5TtjG7+7W8oNYdFitO/+0X1KiHxiYv
 YAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024547_674528_EB04AA36 
X-CRM114-Status: UNSURE (   9.90  )
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

For early prototypes, the CARRIER_PWR_EN signal was controlled
by software. Now, for the regular revisions, this signal is
controlled by hardware. The corresponding pad is now available as
GPIO_C_1. Reflect these changes in the devicetree.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 32 ++--------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

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

-- 
2.55.0


