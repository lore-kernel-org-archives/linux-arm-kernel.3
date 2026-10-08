Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C231DCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGdz7yLAg+mrvuFLQWM7yy6NK755mXWFHUSIqMTw69A=; b=LjfaLlsof6MGJMPM99Z7lytqM2
	ih/j0AjUHl9x52cqa/OpgqZafxL83ELs5Kl8+/l5vafimul4GX0hTp8lQyw+Bwm6ukn1Fe0wQteIU
	rtltjqG6tskwRRrJ0T3MeNSdZFkKQX1ENuIyi7kfql+cbVrh7+EfNnUrM7kqLoTjuFSos6zYVUIES
	Cj9JiYuqonGMJIGR/haNAb1oD/MywNDLLLayWhbCm0jQTDLoRz9P/HhoSs2YnhqDpayKAlMsWBqG/
	OY6pW2A2GEn1ja3MUG7Luod7XCNtvY8pRYjtVz8boGdhUVwv5np6VqQc4JJg05fvxR/U+k5zY6bVK
	mUYLK6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjsn-00000003vgQ-3hdA;
	Thu, 08 Oct 2026 08:53:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjsl-00000003vf0-1kwL;
	Thu, 08 Oct 2026 08:53:44 +0000
X-UUID: bfd5e240c2f511f1acbe4559397dec65-20261008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jGdz7yLAg+mrvuFLQWM7yy6NK755mXWFHUSIqMTw69A=;
	b=DIVk3fhoVRf5HnQ8d5hgar0cfOevqlZAGccPWHa9c3fxyLYfs2zb9gnDriRHSzvY4sg4OyGLjAFs6qiYNCycMiY884Mx5UX17psRWtX/KwkvQjYK4OrNQOLB9fdf3WMY5rqfhhJ8hLhLI1KM8gMiqrw5vel+m8/VWgUpk/BeeiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:44d65cbe-3bf0-4182-bcfe-deeeae570941,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:829b59ec-a538-4631-9c6c-6898e3cb1d37,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bfd5e240c2f511f1acbe4559397dec65-20261008
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1801533946; Thu, 08 Oct 2026 01:53:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Oct 2026 16:53:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 8 Oct 2026 16:53:34 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, Tim
 Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH v3 2/2] spi: mt65xx: support wider tick delay field on MT7987/MT7989
Date: Thu, 8 Oct 2026 16:53:32 +0800
Message-ID: <20261008085332.802898-2-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
References: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_015343_464748_3D1F10BB 
X-CRM114-Status: GOOD (  17.27  )
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

The MT7987 and MT7989 SPI IPs widen the tick delay field in SPI_CMD_REG
from 3 bits (bits 24:22) to 7 bits (bits 28:22), so the field width can
no longer be hardcoded in mtk_spi_hw_init().

Add a tick_dly_mask member to struct mtk_spi_compatible and use
field_prep() with the per-SoC mask instead of the open-coded
mask-and-shift, then add a mt7987_compat entry carrying the wider mask
and match it against both "mediatek,mt7987-spi" and
"mediatek,mt7989-spi".

Existing IPM designs keep GENMASK(24, 22) and are functionally
unchanged.

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
v2: remove unused tickdly offset deadcode
v3: 
  - remove spi-ipm-v59 compatible
  - add mt7987 and mt7989 compatible

 drivers/spi/spi-mt65xx.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b845a599f7c6..0603c9f051a8 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -4,6 +4,7 @@
  * Author: Leilk Liu <leilk.liu@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -78,9 +79,9 @@
 #define SPI_CMD_PAUSE_IE		BIT(17)
 #define SPI_CMD_IPM_NONIDLE_MODE	BIT(19)
 #define SPI_CMD_IPM_SPIM_LOOP		BIT(21)
-#define SPI_CMD_IPM_GET_TICKDLY_OFFSET	22
 
 #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
+#define SPI_CMD_IPM_V59_GET_TICKDLY_MASK	GENMASK(28, 22)
 
 #define PIN_MODE_CFG(x)	((x) / 2)
 
@@ -120,6 +121,7 @@
  * @dma_ext:		DMA address extension supported
  * @no_need_unprepare:	Don't unprepare the SPI clk during runtime
  * @ipm_design:		Adjust/extend registers to support IPM design IP features
+ * @tick_dly_mask:	Tick delay field of SPI_CMD_REG, IPM designs only
  */
 struct mtk_spi_compatible {
 	bool need_pad_sel;
@@ -128,6 +130,7 @@ struct mtk_spi_compatible {
 	bool dma_ext;
 	bool no_need_unprepare;
 	bool ipm_design;
+	u32 tick_dly_mask;
 };
 
 /**
@@ -187,6 +190,14 @@ static const struct mtk_spi_compatible mtk_ipm_compat = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_GET_TICKDLY_MASK,
+};
+
+static const struct mtk_spi_compatible mt7987_compat = {
+	.enhance_timing = true,
+	.dma_ext = true,
+	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_V59_GET_TICKDLY_MASK,
 };
 
 static const struct mtk_spi_compatible mt6765_compat = {
@@ -226,6 +237,7 @@ static const struct mtk_spi_compatible mt6991_compat = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_GET_TICKDLY_MASK,
 };
 
 /*
@@ -262,6 +274,12 @@ static const struct of_device_id mtk_spi_of_match[] = {
 	{ .compatible = "mediatek,mt7629-spi",
 		.data = (void *)&mt7622_compat,
 	},
+	{ .compatible = "mediatek,mt7987-spi",
+		.data = (void *)&mt7987_compat,
+	},
+	{ .compatible = "mediatek,mt7989-spi",
+		.data = (void *)&mt7987_compat,
+	},
 	{ .compatible = "mediatek,mt8135-spi",
 		.data = (void *)&mtk_common_compat,
 	},
@@ -366,7 +384,7 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 			   struct spi_device *spi)
 {
 	u16 cpha, cpol;
-	u32 reg_val;
+	u32 reg_val, mask;
 	struct mtk_chip_config *chip_config = spi->controller_data;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
@@ -443,10 +461,10 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 	/* tick delay */
 	if (mdata->dev_comp->enhance_timing) {
 		if (mdata->dev_comp->ipm_design) {
+			mask = mdata->dev_comp->tick_dly_mask;
 			reg_val = readl(mdata->base + SPI_CMD_REG);
-			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
-			reg_val |= ((chip_config->tick_delay & 0x7)
-				    << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
+			reg_val &= ~mask;
+			reg_val |= field_prep(mask, chip_config->tick_delay);
 			writel(reg_val, mdata->base + SPI_CMD_REG);
 		} else {
 			reg_val = readl(mdata->base + SPI_CFG1_REG);
-- 
2.45.2


