Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F95C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wRZUR2IjGCL+rcX+4c9gdy0Bo0LNFltoKDAwmk03aI=; b=qocJneUomT+vPs05mhnnrL8Ooo
	OJ4u+Nrod3W6dci7qXsigCoWFzNw/i7Vsjg6TzPwF2I/hNraNNGiRSVYG+TDg1sBXxs1RMtZRlsfM
	c10p9xG7BWs5SVoZCopI0WCN3vYVtCnuG8mVDXZBr7YfobNRyp9URFQQ5/MH7czpxiu8hOzXyAM0z
	Qa9a/zu2lPr+XTBiiXzw/7PIje6UmKnGis+LoRjC55aiA9Glq6/dnqg8VdR6YFRdDWlSYcdSGpjoQ
	84T1LMWcaXiY0KNIfEcZYYFz/bxcghgx1j9YjXWFFO1vAja8HYnc/aFXL/qFY1bbfY1fyYupDiNFn
	PnxBZPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ5A-00000003Agx-3xII;
	Mon, 09 Jun 2025 00:09:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPuo-00000003ABH-2c7H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:03 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6C1A198D;
	Mon,  9 Jun 2025 01:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427134;
	bh=d+3wkzFPvcrGr7hxjxQVj6RgLD2xZOiVBMczbU+OCjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVk4G6IXsI7Zembur0w1iAWphUFedNrEOzW/GwJp+9oWzrM19ksuIXgaTWHLAoUow
	 X/1YlBPm4wSPyBL9Cw+/38VnRgtUNo/cnWlRdgaRDuBpoi9P03gQr5kljhTis6rG/O
	 ItCFFiKXGS2tvYHvISlG2T8i4dMxOkU+7nghm0+E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/8] dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprecated
Date: Mon,  9 Jun 2025 02:58:37 +0300
Message-ID: <20250608235840.23871-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_165902_803615_D215F152 
X-CRM114-Status: UNSURE (   8.88  )
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


