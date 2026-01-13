Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E616AD2F33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q3ravDG1w5SjgMDo2WRXLnVcRNkSoxT344OuV9m7l8=; b=PGkSAGl5sCPdTe0pnt4o6FL+Z2
	uNFxzhcvJcGRCO2PlPUGIiJEcdg/24hH7b9Rg6R1mKNdquzEDxpVwl/48lnjq64/IlNEIAs5MNXfU
	ONyIbFb3jAFWJx4WIfURrc7wy5LlEAN/FFEwMFeNEHMQpxuOOyZ95Jp2wDNT8oxsy9NVq1epW4LcN
	FFxLSqSs/+4NiGwKStWv3C0mQmZot96If15pTrlBxQLW93ZRBPgbzfhxo2rTNPrGVZZqab5RZoKRK
	HMqdGIqW4Bo5ZT7AltJOMXBn2TuePONQOkGLSnLP61rgP/HgBTrLJO6fVdZc2G8b2sps6uFpVAasg
	FQeSHjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOh-00000007ODU-0MU2;
	Tue, 13 Jan 2026 15:33:31 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOc-00000007O9y-34Ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5q3ravDG1w5SjgMDo2WRXLnVcRNkSoxT344OuV9m7l8=; b=QuTCv7UY7QvdlY5fCbXlDrOV2F
	BrDH8t1i7MngriXWn5K/I7GyEaP6HXhwtZhss5yBl6ukAB1isJy+uYBgNADRPAyH7FyP8YHM7+1xO
	eb7x6QRCOexMy87pQK6ciObCBVoPlrBkIO/jalrCkZfV1feFbb/uEJPgDWSzS2reXI/1huIfKgP+J
	HcP836/B4hcGnFsWUQC5d7riV6FEUsdcRAS+kGcIzUVI37AWI5RzQyhOQMpjM4wChn7mMqaexz8/c
	IsMe/Z6OpmmpS+EIYM4/2HbRS2C3hCietFOGHvuGZWMcl0fZq52Q1eI6Y7+7QmRVjxwnUEhiMNo56
	9AMT2/9w==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 13 Jan 2026 16:31:34 +0100
Subject: [PATCH 1/3] ARM: dts: imx: tolino-shine2: add tps65185
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-tps65185-dt-v1-1-66d376ba5f65@kemnade.info>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=n17zCB2DY7rtD9EKlgtwvWjqoDBFr/HFyM+J9npiiZk=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqbPUuW3jrxfpqpwLFvRc/GRvoajG4YM3VMT2TL/qd
 uZR+TyWjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACayq56RYVcEl49fdOKLzdsf
 PPz8O1447MT1aqnZbm/3bfidppTlE87I8K/Gd7d09SON9BiHi93FwX79DrlHi2/b+xyw3rGx0t2
 DEwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073326_791922_E18F07AF 
X-CRM114-Status: GOOD (  10.25  )
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

Wire up the TPS65185 regulator needed for the display.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    | 55 +++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
index b6c336e3079e..4c655579f43e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
@@ -37,6 +37,16 @@ chosen {
 		stdout-path = &uart1;
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
+
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -147,8 +157,35 @@ zforce: touchscreen@50 {
 		touchscreen-inverted-x;
 	};
 
-	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+	tps65185: pmic@68 {
+		compatible = "ti,tps65185";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tps65185_gpio>;
+		reg = <0x68>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+		vin-supply = <&epd_pmic_supply>;
+		pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vcom_reg: vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg_reg: vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
 
+			v3p3_reg: v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -328,6 +365,12 @@ MX6SL_PAD_EPDC_PWRCTRL3__GPIO2_IO10 0x10059
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epdc-pmic-supplygrp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14 0x40010059 /* pwrall */
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD1_DAT1__GPIO5_IO08  0x17059
@@ -425,6 +468,16 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28	0x1b8b1 /* ricoh619 bat_low_int */
 		>;
 	};
 
+	pinctrl_tps65185_gpio: tps65185-gpio-grp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03	0x40010059 /* vcom_ctrl */
+			MX6SL_PAD_EPDC_PWRCTRL0__GPIO2_IO07	0x40010059 /* wakeup */
+			MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08	0x40010059 /* enable */
+			MX6SL_PAD_EPDC_PWRCTRL2__GPIO2_IO09	0x17059 /* nINT */
+			MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13	0x17059 /* pwr-good */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1

-- 
2.47.3


