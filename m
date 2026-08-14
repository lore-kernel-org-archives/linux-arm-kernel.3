Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5CAC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2hz43XKj7n1KrMCeWOSWMBnwwUs4OGpk7TTnuxnJR8=; b=YbCloNcc3qrGxEHoDANzKD4jsZ
	+1YthOVEBJ+Xsb6/vqVCL9BbmUDcQG3hpVIPJGDhkqBPZg8c3YhnsqPKxscQwia9k0D7lVgM6jD/e
	s0QFrtJJEnwg4QEscfFzzKyWXPf3zwfh5hm9L3L6V7T2TpXZ8+Ll3gA9tSkkgF9G4JMdzwglejdUw
	M+SKQWjAEz0jZqdDB8X8dYhnN4oy05xjFhXFqlf9iFhxW9JvkgqpOAlOts14mqx6RJaRMJ5e9TDCz
	bGZKAydtlIfNJsYPMMfun6w8dAW8slNxmhjC5lG7MUVtlmA0u4yWQumqK0telnvl6r2WKcsJR5TMI
	rIiaFomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulTP-000000022XY-1vYQ;
	Fri, 14 Aug 2026 06:32:59 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulTN-000000022We-0vNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:32:58 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 25F761A00F2;
	Fri, 14 Aug 2026 08:32:53 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DC21E1A0153;
	Fri, 14 Aug 2026 08:32:52 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1925D18000B5;
	Fri, 14 Aug 2026 14:32:51 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 14 Aug 2026 15:32:38 +0900
Subject: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIW2fmoC/x3MTQqAIBBA4avErBtQsd+rRIvKMWdhhkYI0d2Tl
 t/ivQcSRaYEY/VApJsTh6NA1hVsbjl2QjbFoIRqRS81riFcp0MbjUf2eWhw0VJp061kSEPpzki
 W8/+c5vf9AP5wmXdjAAAA
X-Change-ID: 20260814-bootph-frdm-imx95-a4124d7bede4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 qijian.guo@oss.nxp.com, Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786689170; l=3612;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=XHpL4UPy+zpKTpJzlG0smCgtp+vHZatvag28j6x5Hfc=;
 b=TOgrspMoWBdhzLv/eeUze6wGkKIhcXR7zPobZjjvg2CaNFohuMm0TKad25QfoueJXKuzzCZB0
 pUyBDWTSkOBB2BO0QUsSvIhfI3wsN3EC+UKeUqMMSrz99eS7gFH7bKr
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_233257_543085_6535B47A 
X-CRM114-Status: UNSURE (   7.54  )
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

Add boot phase properties to essential resources during boot phase.

FRDM-IMX95 need UART, SD-Card, eMMC access during boot process.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be70589532763f65f1699f31dd361cc841..ba17d87f197a3d3498a815fb82547bd810b3e57d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -140,6 +140,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-name = "VDD_SD2_3V3";
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		bootph-pre-ram;
 	};
 
 	reg_usdhc3_vmmc: regulator-usdhc3 {
@@ -445,6 +446,7 @@ led_backlight1: led@1 {
 &lpuart1 {
 	pinctrl-0 = <&pinctrl_uart1>;
 	pinctrl-names = "default";
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -721,6 +723,7 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart1: uart1grp {
@@ -728,6 +731,7 @@ pinctrl_uart1: uart1grp {
 			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
 			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart5: uart5grp {
@@ -753,6 +757,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
@@ -769,6 +774,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
@@ -785,12 +791,14 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -803,6 +811,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -815,6 +824,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -827,6 +837,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
@@ -1001,6 +1012,7 @@ &usdhc1 {
 	pinctrl-3 = <&pinctrl_usdhc1>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	fsl,tuning-step = <1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -1014,6 +1026,7 @@ &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	fsl,tuning-step = <1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 

---
base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
change-id: 20260814-bootph-frdm-imx95-a4124d7bede4

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


