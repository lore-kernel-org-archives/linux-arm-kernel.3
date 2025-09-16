Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA0ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9jgtOlTjBRyAH4e4L/7ZOv+7ZIqKmUxfTQRznRoRBM=; b=hJzxFv5gQz05+qdcN37Pm6y17b
	zSQ2PKKt3pya/ETx16wWizXwwLDXd9GH32no8YFxdm4uYcxiFD6xCoYzIjzCh6uG3S6WaYRhiaHQZ
	u+/MeUFxZhyMkmrO70B2OJdYSd3mq5dxbmF1izbtR0inFvz4isL+vf23xn3FlHyLKlhK5miXmCMFH
	iiB67vtK+CMhp5T/Hkp0YVbjQNcEE1H7P/uyRqUNInt9grNmC9Q+bjuw2G6a+NdwzgEGUBMatktAQ
	8Nnt81NRxplKVBo7YL+Cw2LLMuhi7NSEaKyHRhfa93peIlXYmPTVDKJNV+z4GTQOZnzWYmTYyXcke
	ni9abXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfa-00000008Iaq-3jnQ;
	Tue, 16 Sep 2025 15:32:38 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfW-00000008IWx-0ZAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:32:35 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uyXfM-00Aysu-SH;
	Tue, 16 Sep 2025 15:32:24 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 7/7] arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1
Date: Tue, 16 Sep 2025 08:32:16 -0700
Message-Id: <20250916153216.1042625-8-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250916153216.1042625-1-tharvey@gateworks.com>
References: <20250916153216.1042625-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_083234_174039_08C22F70 
X-CRM114-Status: UNSURE (   8.82  )
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

SDHC1 on the GW702x SOM routes to a connector for use on a baseboard
and as such are defined in the baseboard device-trees.

Remove it from the gw702x SOM device-tree.

Fixes: 0d5b288c2110 ("arm64: dts: freescale: Add imx8mp-venice-gw7905-2x")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../dts/freescale/imx8mp-venice-gw702x.dtsi   | 20 -------------------
 .../dts/freescale/imx8mp-venice-gw72xx.dtsi   | 11 ----------
 2 files changed, 31 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
index dba35b3394bc..de852ebff571 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
@@ -403,15 +403,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* off-board */
-&usdhc1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	bus-width = <4>;
-	non-removable;
-	status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -514,17 +505,6 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
-			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
-			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
-			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
-			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
-			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index cf747ec6fa16..76020ef89bf3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -365,17 +365,6 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140
 		>;
 	};
 
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
-			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
-			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
-			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
-			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
-			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.25.1


