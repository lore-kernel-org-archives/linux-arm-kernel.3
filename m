Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD9AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G+g0OfrAh01X9LwRyhzYOGvgNaAers3h/+McghiIB40=; b=klgrTtAUZ1tS88YGLkD+c82tY4
	F/EzqORtr0ffK5aca4aygYvH6p3OblUmEQnHWG23jmj9v4PY55Ux2cRFLqZB0cn0uBG080/xtrU8T
	mx9ix/L8qpyPTs4X1J6YLOgGnkJF5cVoIhuPr9FOphUsNmXRnGp/7W0AlHWC7y/WZ3wFEzRdY48C3
	IFQ5SBP0X7n4XRv2cG5J4c5sDTeV2sTrnQziFF/tf6tcNehFJ1NmD7TXePDCylI3LXd/6cstSV9OD
	MdAfKItgMtc1I+qgdm7D9zU5QWS3LJkMfz3NhZ5HjleDbO6qD3jeyYA26+8gZ42g2f21CJYcqu+ev
	x7hV5hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirze-0000000EJrj-2aEv;
	Fri, 14 Feb 2025 09:28:18 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiryA-0000000EJGx-2TEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:26:49 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8BA3320065;
	Fri, 14 Feb 2025 10:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739525200;
	bh=G+g0OfrAh01X9LwRyhzYOGvgNaAers3h/+McghiIB40=; h=From:To:Subject;
	b=AmukW2CBRrfj8omVeMRErQo3AsjpN00p0iN162Kslp9UgCnOyfrZToWCNE4Q7CS/q
	 kCqd32ORmH8GRQIl3JZL2tJglARTb6ZFQlfdVIIyLIphSBchRg73JhWO7hNoovOzQO
	 5YvOk0dlOeqj3iieFS5HPycsJsq0bLg7MgmGn9EimnaRQ2JUYHFHlYOi2uQ5OTjP0Y
	 4r1AfwBzfRxhwHArtp7rYgibENZ3OlO2IQMlQLwjh7KvOGGWo7dL1VUIAQUUIqNCcG
	 veBVzRxfM0iM/HPHsBsbSG69atBVe3vGOeprVMdPsuSP/XyzkV7jepGkYaOTYvJapN
	 UDgOCe51FjM0w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Remove LVDS panel and backlight
Date: Fri, 14 Feb 2025 10:26:34 +0100
Message-Id: <20250214092634.12414-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_012647_671458_0267AD2C 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Remove LVDS panel and backlight nodes from the Verdin iMX8M Mini SoM
dtsi file, those two hardware components are not part of the SoM,
therefore they should not be present in this file.

This is solving a dtb checker warning about panel-lvds compatible.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx8mm-verdin.dtsi     | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index c528594ac442..7251ad3a0017 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -18,20 +18,6 @@ aliases {
 		rtc1 = &snvs_rtc;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		brightness-levels = <0 45 63 88 119 158 203 255>;
-		default-brightness-level = <4>;
-		/* Verdin I2S_2_D_OUT (DSI_1_BKL_EN/DSI_1_BKL_EN_LVDS, SODIMM 46) */
-		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
-		power-supply = <&reg_3p3v>;
-		/* Verdin PWM_3_DSI/PWM_3_DSI_LVDS (SODIMM 19) */
-		pwms = <&pwm1 0 6666667 PWM_POLARITY_INVERTED>;
-		status = "disabled";
-	};
-
 	/* Fixed clock dedicated to SPI CAN controller */
 	clk40m: oscillator {
 		compatible = "fixed-clock";
@@ -66,13 +52,6 @@ hdmi_connector: hdmi-connector {
 		status = "disabled";
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		data-mapping = "vesa-24";
-		status = "disabled";
-	};
-
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
-- 
2.39.5


