Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7FCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTvneGYsgq6RHk1a535QQ8lZNHq/IXk0Ef2nTx0C+Ag=; b=21NLNKawppPY76qcJj/NzZjKX7
	FCptGIBPdBUnoncGyFEOVEsHw3e8bF6kOa5oa53qVjaVlDFWhWtx6Oq1E/ABvhjFjvDR3tK68yTh4
	c8tdeRNQKj1grYuBaiHipQrv4OkTzR8bGyjqf46g1imEqqcBMnEqJ/4t07/reX+N+n2LbLZ9SBk9M
	cB+YhH5OYcB042bgMHINQR0G8hsD2NA3wGJIRCVa0DDgijffA7q/88LocDcIUSSsxn8aBSkFE1Sn5
	EcDRVerKNrXFKx6a4QH0xQdZhA+iCtKjAzargQhUTpwzUrjFR27PA/TWNabyHQDXPx0GOJD4zTvyn
	Nf7RaqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNfa-00000001DLH-2rso;
	Tue, 04 Feb 2025 18:29:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNeE-00000001DB6-2PsI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:27:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tfNe6-0005cn-7j; Tue, 04 Feb 2025 19:27:38 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tfNe5-003Vb6-1p;
	Tue, 04 Feb 2025 19:27:37 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patchwork-lst@pengutronix.de
Subject: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to overdrive rate
Date: Tue,  4 Feb 2025 19:27:37 +0100
Message-Id: <20250204182737.3361431-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102746_614445_2D2C464E 
X-CRM114-Status: GOOD (  11.26  )
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

A lot of other clocks on the i.MX8MP, including the DRAM set up by the
bootloader are already running at overdrive clock rates. While this is a
deviation from the configuration of other i.MX8M* family SoCs, overdrive
is the default for most i.MX8MP boards and only some special purpose
boards will choose to run the SoC at nominal drive rates. Up the GPU and
NPU clock rates to their overdrive level to be consistent with other
clocks set up in the dtsi.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..aeaa6a5c2f56 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -816,12 +816,12 @@ pgc_mlmix: power-domain@4 {
 						assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
 								  <&clk IMX8MP_CLK_ML_AXI>,
 								  <&clk IMX8MP_CLK_ML_AHB>;
-						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+						assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
-						assigned-clock-rates = <800000000>,
+						assigned-clock-rates = <1000000000>,
 								       <800000000>,
-								       <300000000>;
+								       <400000000>;
 					};
 
 					pgc_audio: power-domain@5 {
@@ -2232,9 +2232,9 @@ gpu3d: gpu@38000000 {
 			clock-names = "core", "shader", "bus", "reg";
 			assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
 					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
-						 <&clk IMX8MP_SYS_PLL1_800M>;
-			assigned-clock-rates = <800000000>, <800000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+						 <&clk IMX8MP_SYS_PLL2_1000M>;
+			assigned-clock-rates = <1000000000>, <1000000000>;
 			power-domains = <&pgc_gpu3d>;
 		};
 
@@ -2247,8 +2247,8 @@ gpu2d: gpu@38008000 {
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "bus", "reg";
 			assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
-			assigned-clock-rates = <800000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+			assigned-clock-rates = <1000000000>;
 			power-domains = <&pgc_gpu2d>;
 		};
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5


