Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB131CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSfdDk+VTfIX7boVZRFel6Zufzs70p2JHe1lWi2bfsk=; b=U5yhlXsQW9FiV0WCsVVD277QcC
	MZRBcXYCiOJ17tX/s0wl+0688peYp+o6xgBNnvO5Ps0csxU24vHnAndZNWkvYKtZVW23h4XzA6RWk
	sw85nIn0Xo1yTHhu8FATq2LYiLmPtAX7xu4pnWntkxlnEOXwumZVJW+Zwzy+4n/+md/24o3AbP5nu
	NqtYonNSag0Bh3up9w6dmblIYzOXTeN3JyEchFwc+pxsH4f9+RuD22hctaq+b9Ykw+msY599qx4cy
	YA+3YlQT+Ch7KqXgpy+g34DM/UQt2p2UfkawWSdcXbex8/O0Pk9VtTKP/jxqRNA9l2Q7ey5b4mY1x
	k5Lfj4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb7-00000003XE1-2LnX;
	Fri, 22 Aug 2025 21:46:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNwQ-000000021kd-1wc7;
	Fri, 22 Aug 2025 09:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6201544E04;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2834DC19423;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755854409;
	bh=ZylEyDi98Z35TcvrppRd4qANA6h13aRuwFsZau22r7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SA6SLlHcNUIkrOLR+vSz+x6rwispT/nvDcFcmOWrsy0n4DFLaQEhH2/Nl6l3qz3UR
	 1Nal5Gli/ATgNv57N3bqRC/qQPdtxKMIzprJiiZmktnCXhrokfprIAp9nJFbBjc/2Y
	 6groYqvkwsffDVhc/tQhq8SwSlQVgDXZzEoHJYYGfcVKcEa3Hzl/+55e5At6IMoe98
	 TnslnoheTjRQe9kHgVR/OYFhDAiUG5wN1ufkW7s37mTKWtaLuO+tBc8ioiBeLxIZYM
	 wamr4EI1hlv/t2h/ZJBhWc7200+J6JyxHAtAR4AVWVc92o5xsF1Tg8Y1DPT/H4eDQ+
	 os/NjRNA21UxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA52CA0FE7;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 22 Aug 2025 11:20:06 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx8mp-moduline-display-106:
 Use phys to replace xceiver-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-can_phy3-v1-2-73b3ba1690ee@gocontroll.com>
References: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
In-Reply-To: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755854408; l=3211;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=3qC9ijohg7RvMYciIPYZcn8wTBRyjIFHSL6DEIr3OxU=;
 b=etRLer/PNIwaB1X431+vRlpBjcg9LUm8EiVCrz7CK1y4hesXitJfyrd9pcRa7f5lbqI0qYT+E
 c5x7VddteCgD6MmYywIbqzzkgLHv9mu28Lq9wywz0Jmsfk32wkWEmK9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022010_559140_5073F02B 
X-CRM114-Status: GOOD (  10.22  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Fix the can tranceivers to actually use the new phy description instead
of the regulator tweak.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 46 +++++++++++-----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index afd886dd590ff6f125d1d0e91aa71ae0063b5fd1..88ad422c27603b77c1099f2efe61953999c35f77 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -36,6 +36,24 @@ external-sensor-supply {
 		vout-supply = <&reg_5v0_sensor>;
 	};
 
+	flexcan1_phy: can-phy0 {
+		compatible = "ti,tcan1051", "ti,tcan1042";
+		#phy-cells = <0>;
+		pinctrl-0 = <&pinctrl_flexcan1_stby>;
+		pinctrl-names = "default";
+		max-bitrate = <5000000>;
+		standby-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan2_phy: can-phy1 {
+		compatible = "ti,tcan1051", "ti,tcan1042";
+		#phy-cells = <0>;
+		pinctrl-0 = <&pinctrl_flexcan2_stby>;
+		pinctrl-names = "default";
+		max-bitrate = <5000000>;
+		standby-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_1v8_per: regulator-1v8-per {
 		compatible = "regulator-fixed";
 		pinctrl-0 = <&pinctrl_reg_1v8>;
@@ -85,26 +103,6 @@ reg_6v4: regulator-6v4 {
 		regulator-name = "6v4";
 	};
 
-	reg_can1_stby: regulator-can1-stby {
-		compatible = "regulator-fixed";
-		pinctrl-0 = <&pinctrl_flexcan1_reg>;
-		pinctrl-names = "default";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "can1-stby";
-		gpio = <&gpio4 3 GPIO_ACTIVE_LOW>;
-	};
-
-	reg_can2_stby: regulator-can2-stby {
-		compatible = "regulator-fixed";
-		pinctrl-0 = <&pinctrl_flexcan2_reg>;
-		pinctrl-names = "default";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "can2-stby";
-		gpio = <&gpio5 9 GPIO_ACTIVE_LOW>;
-	};
-
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&cpudai>;
@@ -180,16 +178,16 @@ adc@2 {
 };
 
 &flexcan1 {
+	phys = <&flexcan1_phy>;
 	pinctrl-0 = <&pinctrl_flexcan1>;
 	pinctrl-names = "default";
-	xceiver-supply = <&reg_can1_stby>;
 	status = "okay";
 };
 
 &flexcan2 {
+	phys = <&flexcan2_phy>;
 	pinctrl-0 = <&pinctrl_flexcan2>;
 	pinctrl-names = "default";
-	xceiver-supply = <&reg_can2_stby>;
 	status = "okay";
 };
 
@@ -278,7 +276,7 @@ MX8MP_IOMUXC_SPDIF_TX__CAN1_TX
 		>;
 	};
 
-	pinctrl_flexcan1_reg: flexcan1reggrp {
+	pinctrl_flexcan1_stby: flexcan1stbygrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03
 				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
@@ -294,7 +292,7 @@ MX8MP_IOMUXC_UART3_RXD__CAN2_TX
 		>;
 	};
 
-	pinctrl_flexcan2_reg: flexcan2reggrp {
+	pinctrl_flexcan2_stby: flexcan2stbygrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09
 				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)

-- 
2.50.1



