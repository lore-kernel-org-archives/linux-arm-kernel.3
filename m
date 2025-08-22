Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63661CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spmaIGONVOGb+9JL6R3ySXp87PaMCEaQ54PHdLi94ag=; b=E3cfWEX0YhI+tEkr4F46U9TqeH
	cSKyrudIy4Yn1w1aZwzt1J57/YWWWmL35Awlz2vJzbvXWv44s1suSL5SOy5S2xrwjKsNN9NwdPseT
	tOgKRHj4Xs+tvy4xTiYllWvutNfY4O768tzUIKA6lhVTvJRd64Qflft9P+0sE7mOkwu6LkafgtrpJ
	LoSnPyoVxrLhiydPjAF4tQ96OJ63w7aHCQdW19vkgbnRmdrDzy/at5DicwUcqMSJ2bSCSjqxM0/HC
	OgMtJ2Ze7/z+j4fNzP2msWRoJl6tDtSUTPt5cYXlrtikEkDcUr9Ob4x841EwdGnsg7k14zMCXaeiT
	O+oK1qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKhn-00000001cwm-2xqs;
	Fri, 22 Aug 2025 05:52:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdf-000000012X4-0f1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65857101F;
	Fri, 22 Aug 2025 02:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822434;
	bh=eKEUI54IDPaYYjYBrflIcSGc/aI6u58J52rbZqG2dDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbqIJryegNBmaheECCfawWgJh3m0zjQkzT6KpV5GViNXgtjb1vkW6mNSUogkCKvL1
	 CRQ03Y8aHyQ/Bl6Jlm6+5ce12uJ3FtN7K9RlLbwNqjh5HuFUsv2vF3NAzoABJVc002
	 1/3WIADcxnQhGt9B4EklOBCx1ltwzYG8TnItWfU8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/13] dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprecated
Date: Fri, 22 Aug 2025 03:27:30 +0300
Message-ID: <20250822002734.23516-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172815_330843_61AD5180 
X-CRM114-Status: UNSURE (   9.16  )
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

Usage of the clock-frequency property, which is already optional, is
discouraged in favour of using assigned-clock-rates (and
assigned-clock-parents where needed). Mark the property as deprecated,
and update the examples accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 03a23a26c4f3..db4889bf881e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -66,6 +66,7 @@ properties:
   clock-frequency:
     description: The desired external clock ("wrap") frequency, in Hz
     default: 166000000
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -147,7 +148,9 @@ examples:
                  <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
                  <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
         clock-names = "pclk", "wrap", "phy";
-        clock-frequency = <166000000>;
+
+        assigned-clocks = <&clks IMX7D_MIPI_CSI_ROOT_CLK>;
+        assigned-clock-rates = <166000000>;
 
         power-domains = <&pgc_mipi_phy>;
         phy-supply = <&reg_1p0d>;
@@ -185,12 +188,16 @@ examples:
         compatible = "fsl,imx8mm-mipi-csi2";
         reg = <0x32e30000 0x1000>;
         interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-        clock-frequency = <333000000>;
+
         clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
                  <&clk IMX8MM_CLK_CSI1_ROOT>,
                  <&clk IMX8MM_CLK_CSI1_PHY_REF>,
                  <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
         clock-names = "pclk", "wrap", "phy", "axi";
+
+        assigned-clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
+        assigned-clock-rates = <250000000>;
+
         power-domains = <&mipi_pd>;
 
         ports {
-- 
Regards,

Laurent Pinchart


