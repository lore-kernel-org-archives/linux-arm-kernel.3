Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CBC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTEthrAA6LwUJ539D4ECKjt7zqyGUxoBnrgaPMytwWY=; b=ylShP5+MifLiV0J0fQzIXLPRpI
	V841kL5ugrR4vjFY+R24HTRVPBEwzOO6mNda1p+y71j0rusfaWsx47+y/bckBymQubtC6vL0IFwEq
	ITDRqvJDxj46SaBNiij+Q5491jzj6cs+3/F7e6C3uTKuX5ZTvZcMic7EWJd8g0MWFX4k2NpSAsM5Q
	Cwj210FCklWK3j/RWj57cUm+EXNSdjrUDvDjFRUiaw76AsdQb2KLPPhcEH3PE2wpHOdd3F2hUGlyt
	lVGlaJaT4l3MQl5Rl1s0IwiL38ldMtcotCWpb9Oe3eQNztC3NPj8AUZdzO33K6HtLGUf+2NhJkojr
	7AzqvABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671b-00000003q9K-4Bwe;
	Mon, 14 Sep 2026 13:47:12 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671S-00000003q0N-03nY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTEthrAA6LwUJ539D4ECKjt7zqyGUxoBnrgaPMytwWY=;
	b=kJGA+2WCG8Tyubro58MiFXcW/L0kOB7gRGAmuW2V7+MQ9uoo0xeg5W3EBTVz3290LP1NV2
	KcdyobPXmr7d6WoQ5d6wi490729dh+wQPKiwEvGX33Idnlpm0u5p+M4pj0LZU+3Y82qkz/
	CO2+BTPDASsPtuDhX1lGaIpDgABJIYFiESF9tM1p7QBHFzxdWqW9BZXoOPIA7H5IXhpgn/
	LrkM5fKNvb4JXh/3WuL/mwr1QrZljJ8Mo1V1bY8UeY+UN+FHEnFJ3jFStX6M7PKUzdeUet
	FINGRCyMbZ83toypKmXCOhGrPZM6509k1d5EwIIilbSRW2aHUzQr93ThdBI1FQ==
Date: Mon, 14 Sep 2026 15:46:17 +0200
Subject: [PATCH v2 9/9] arm64: dts: imx8mp-kontron: Fix LVDS clock
 frequency for DL device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-9-8e12bc5f1f10@kontron.de>
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JflSEapFC6tCDik1Iz5jWuT+Z2BejGAThr2/ZivZJV0=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1OHzvCa3wswrbacv1oglFW+j8HEivPg4eDvHzMNj
 x/qEH7QUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBGXBkaGO5E8fidFrxrOd1px
 /XRsxLXAHHWph8VZm3p0uB8whp19w8hwbeuSF2szmQOcJ7XOEPaYk+KS9Jd94zxt39NKTyMOXRX
 mAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064702_222938_07D914B5 
X-CRM114-Status: GOOD (  10.75  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

The panel needs a pixel clock of 50 MHz, which means the LDB
serializer has to run at 50 MHz * 7 = 350 MHz. The LDB rate itself
is set by the fsl-ldb driver, but VIDEO_PLL1 needs to be pinned to
700 MHz, so that both the LDB clock (/2) and the pixel clock (/14)
can be derived from it exactly.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 41a2bb74f156..88b30ca66adf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -6,6 +6,7 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "imx8mp-pinfunc.h"
@@ -99,6 +100,16 @@ &ldb_lvds_ch0 {
 
 &lvds_bridge {
 	status = "okay";
+	/*
+	 * The video PLL clock frequency needs to be configured manually.
+	 * The panel needs a LVDS clock of 50 MHz * 7 = 350 MHz.
+	 * IMX8MP_CLK_MEDIA_LDB = IMX8MP_CLK_MEDIA_DISP2_PIX * 7
+	 * IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB * 2
+	 */
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <0>, <700000000>;
 };
 
 /* redefine to remove touch controller GPIOs */

-- 
2.55.0


