Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A50CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vKGd3v+/MNTZFBly663z0CRc24GoxcHKINEmL/tLaUE=; b=Huedfuz681h7T3oH5UZtYkXHf7
	Pf31QLGut3CkCVws2PPqSRG1wO59JFx3PQB9Ary0eY0wPM9o9Syjm2OrAJkAeH1gGyNbla3VPZ3xw
	T+09pdhFhFgj71Kh41SkDFqxdnmJc6QnXToMHKbRFr+0Ni5DmVfYaX4z2cUH6AE9EGh2cAFD1PizR
	cW+E/bdk9+bj3GvUg1fIokT5PCBZ8qo1UB663HhWl+k+vcy2qX92thL0GsnRhxq8oHRR5TkG5IF1x
	GQOSCsAQRXxksWwHU4zM5I4Y6OA+L/gyrRnwDBNvdwBo71M4OBjOqxJw5/m+08ojICm5Iaw0O0pAz
	bmOyVv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQrC-000000079S3-37vw;
	Tue, 16 Sep 2025 08:16:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQr8-000000079RP-0Nto;
	Tue, 16 Sep 2025 08:16:09 +0000
X-UUID: 60f6482e92d511f09eb0dd999d3936bf-20250916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vKGd3v+/MNTZFBly663z0CRc24GoxcHKINEmL/tLaUE=;
	b=JvebwpEc9DQL1i5ZpV+gvhvFltmlSGOqe2iA0co1i35kJb7GgUT2nvDUZg6e9L/KVztFTviAt8L/ySeg20w6Rk/nYy3OkROwzOTqsHIoKt1DZJ45CvrX//8z9oumtIWIrtvx3xxORYGJKkaJe8f5myK001cFG8TdiM4GqLz4jTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:7fc7debf-6d10-4061-9423-a3c40ef6cda0,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:a9085fa9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60f6482e92d511f09eb0dd999d3936bf-20250916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 172188675; Tue, 16 Sep 2025 01:16:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 16 Sep 2025 16:15:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 16 Sep 2025 16:15:56 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Steven Liu <Steven.Liu@mediatek.com>, Sky Huang <Skylake.Huang@mediatek.com>,
	Tim Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH] spi: mt65xx: add dual and quad mode for standard spi device
Date: Tue, 16 Sep 2025 16:15:15 +0800
Message-ID: <20250916081515.324130-1-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_011606_172412_9540C08B 
X-CRM114-Status: GOOD (  13.51  )
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

From: "Tim Kuo" <Tim.Kuo@mediatek.com>

Mediatek SPI hardware natively supports dual and quad modes, and these
modes are already enabled for SPI flash devices under spi-mem framework
in MTK SPI controller spi-mt65xx. However, other SPI devices, such as
touch panels, are limited to single mode because spi-mt65xx lacks SPI
mode argument parsing from SPI framework for these SPI devices outside
spi-mem framework.

This patch adds dual and quad mode support for these SPI devices by
introducing a new API, mtk_spi_set_nbits, for SPI mode argument parsing.

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8a3c00c3af42..591740805740 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -563,6 +563,27 @@ static void mtk_spi_setup_packet(struct spi_controller *host)
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 }
 
+inline u32 mtk_spi_set_nbit(u32 nbit)
+{
+	u32 ret = 0;
+
+	switch (nbit) {
+	case SPI_NBITS_SINGLE:
+		ret = 0x0;
+		break;
+	case SPI_NBITS_DUAL:
+		ret = 0x1;
+		break;
+	case SPI_NBITS_QUAD:
+		ret = 0x2;
+		break;
+	default:
+		pr_info("unknown spi nbit mode, use single mode!");
+		break;
+	}
+	return ret;
+}
+
 static void mtk_spi_enable_transfer(struct spi_controller *host)
 {
 	u32 cmd;
@@ -729,10 +750,16 @@ static int mtk_spi_transfer_one(struct spi_controller *host,
 
 	/* prepare xfer direction and duplex mode */
 	if (mdata->dev_comp->ipm_design) {
-		if (!xfer->tx_buf || !xfer->rx_buf) {
+		if (xfer->tx_buf && xfer->rx_buf) {
+			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_EN;
+		} else if (xfer->tx_buf) {
+			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
+			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= mtk_spi_set_nbit(xfer->tx_nbits);
+		} else {
 			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
-			if (xfer->rx_buf)
-				reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= mtk_spi_set_nbit(xfer->rx_nbits);
 		}
 		writel(reg_val, mdata->base + SPI_CFG3_IPM_REG);
 	}
-- 
2.45.2


