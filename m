Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BDCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CZnsvP01glKjwdemi6tZHkw96EFSsMs6nsVrVNq+N18=; b=pmb3Baq5e+Cw8uImbvvjg2ok/f
	joUrLw+g6NONTYfBPxyR0qCFb5NmJd0I0er37gmxj2WcZk8uyxeHzu/blGso1XYmCKDDZDvvc5dNw
	wS5sNE/S7KKITriU1WxsyInWQYG0iDIs30rrPKmiArstkPa1yhibaXKqiYEkaQFTQBnv4lNWRS6zv
	xffIzPHZdN0z8deR3LZ5PZxdOGPjkehehtnNnFVg8Rkn2kT6y0unVWSbz/BpLRIje7XGLHEKBNGpj
	MiH6sewPpDdk9mPUYfgSnGXDU0leBc6r0cTvrmH0CNh122L4zHGYjZx6zsCs8KuwP7XL933Nq82/a
	sGHXjYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9vL-00000009mF9-0a8k;
	Mon, 12 Oct 2026 06:54:15 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9vJ-00000009mEO-0T56
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:54:14 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 861EA200141;
	Mon, 12 Oct 2026 08:54:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 51BDD20010E;
	Mon, 12 Oct 2026 08:54:09 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A1E6D180006C;
	Mon, 12 Oct 2026 14:54:07 +0800 (+08)
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Date: Mon, 12 Oct 2026 15:54:06 +0900
Subject: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
X-B4-Tracking: v=1; b=H4sIAA2EzGoC/x3MPQqAMAxA4atIZgNt/UG9ijioTTWDtqQiQvHuF
 sdveC9BJGGKMBQJhG6O7M8MXRaw7vO5EbLNBqNMq5U2uHh/hR2d2AP5ePoGg3hsyTpV93XVdAS
 5DUKOn/87Tu/7AQbONc5nAAAA
X-Change-ID: 20261012-bootph-frdm-imx95-pro-6edf0494358e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788047; l=3678;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=T+rRMEHcGNOjswqqiijOmdJK9cCyXurOqzLoJPYfDBM=;
 b=joEyfLlMputGo/6PnO31LjUBvTRea/hUFN1YiXx+PERr/tQBkfeTl5ebpL7aTz1znUl5Imlld
 p7NHVREfdVkDB9+FEs/flnxUP0fvWa99WTCMRmruxs+LHIvIu7ywGUi
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_235413_430026_2415F159 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Joseph Guo <qijian.guo@nxp.com>

Add boot phase properties to essential resources during boot phase.

FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index 1f62d729a5e7778e570fe2a66d1b2cb70ec6feec..8dc1134f8d24d3ac4928b63ce21d328295cb2ba7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -180,6 +180,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-min-microvolt = <3300000>;
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		bootph-pre-ram;
 	};
 
 	reg_usdhc3_vmmc: regulator-usdhc3 {
@@ -418,6 +419,7 @@ &lpuart1 {
 	/* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -696,6 +698,7 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_sai5: sai5grp {
@@ -712,6 +715,7 @@ pinctrl_uart1: uart1grp {
 			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
 			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart5: uart5grp {
@@ -737,6 +741,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
@@ -753,6 +758,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
@@ -769,12 +775,14 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
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
@@ -787,6 +795,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -799,6 +808,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -811,6 +821,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
@@ -984,6 +995,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	pinctrl-3 = <&pinctrl_usdhc1>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -996,6 +1008,7 @@ &usdhc2 {
 	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bootph-pre-ram;
 	status = "okay";
 };
 

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20261012-bootph-frdm-imx95-pro-6edf0494358e

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


