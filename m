Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUxWm/z7xLtLP5dz8f8UFkQB4ImA8Yg4bPohYdRPwwA=; b=c+xn+k7ganpnYW3jcO4ouNhPmz
	lPmVLY3C2/wfRQNRiTnwyS25E2MPOBcpAg5rNWCSFWUC93A3vjtQzwthMlcYRyDrKdgd2RuYtbVOP
	jJfs8H9355+hU1NFZJcVNw/jsOUehEJp3dj9RQ8dX5EDvKEK38Bzj2w9s0U0KNG6yL86WuzDEBe24
	IMU4XCa+skDeUoC051YR6HqUUc1Ylb1afuOpuIz0Ne6e/Cp54yEV2YVgehg4rR6Dl3fp0smXs6yTc
	KlmAu+CrqQXJoCPj67HvF1rMtJKUUpgWeJQcvUly5vbvNGgy4ZBUXfYvCrj9upopI3MADgRfLb1ga
	5RVy35fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22WB-0000000Gkio-1Zw5;
	Thu, 03 Sep 2026 08:09:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22W8-0000000Gki0-3FKd;
	Thu, 03 Sep 2026 08:09:53 +0000
X-UUID: d49ef420a76e11f1afed4741b24580c9-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VUxWm/z7xLtLP5dz8f8UFkQB4ImA8Yg4bPohYdRPwwA=;
	b=DoIW6Beanz9UUrohSgtAE20Yt8bqRnCP0s9LaYALJjcM6rCEEQEWPURhB2rC2n48TuXtC45iA1DA3TP+tOhzPCv4ayXcFtu0YEs/z7CpIW6XlSIR+VarBUkdDSmydgfevGrIVov3EoeCI5fJLIwp2J+ehSj9oZ74o879es1te3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:75a444b6-7643-4d8b-be45-631f6c7c0564,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:63846df2-6b5d-4016-ba8d-9f799a78b7e4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d49ef420a76e11f1afed4741b24580c9-20260903
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_jingcheng.ji@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2145275854; Thu, 03 Sep 2026 01:09:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 16:09:45 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 16:09:45 +0800
From: Jingcheng Ji <ot_jingcheng.ji@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jingcheng Ji
	<ot_jingcheng.ji@mediatek.com>
Subject: [PATCH v2] spi: spi-mtk-nor: Get clocks from devicetree in bulk
Date: Thu, 3 Sep 2026 16:09:32 +0800
Message-ID: <20260903080932.3049888-1-ot_jingcheng.ji@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821090046.2353986-1-ot_jingcheng.ji@mediatek.com>
References: <20260821090046.2353986-1-ot_jingcheng.ji@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_010952_814955_463B5668 
X-CRM114-Status: GOOD (  20.46  )
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

The driver currently gets a fixed set of clock inputs by name. This ties
the driver to the clock names used by existing devicetrees. It also means
that a future binding extension which adds controller clock inputs needs a
matching driver change to enable them.

Get every clock described by the devicetree with
devm_clk_bulk_get_all() and enable the resulting set as a group. Keep
looking up the "spi" input to derive the transfer rate, and verify that
the required "sf" input is present. Obtain the clock inputs before
allocating the SPI controller so a deferred clock probe fails early.

For non-DT platform devices, retain the existing named clock lookups so
clkdev users continue to work.

This prepares the driver for future binding extensions without requiring
another driver change. Existing platforms' behavior is unchanged.

Signed-off-by: Jingcheng Ji <ot_jingcheng.ji@mediatek.com>
---
v2:
- Rebase onto current spi/for-next and reuse its existing IRQ error cleanup
  path.
- Preserve named clock lookup for non-DT platform devices.
- Clarify that this prepares for a future binding extension.

 drivers/spi/spi-mtk-nor.c | 151 +++++++++++++++++++++++---------------
 1 file changed, 91 insertions(+), 60 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 63f5139176c8..c0a47f3a8dbd 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/string.h>
@@ -116,10 +117,8 @@ struct mtk_nor {
 	void __iomem *base;
 	u8 *buffer;
 	dma_addr_t buffer_dma;
-	struct clk *spi_clk;
-	struct clk *ctlr_clk;
-	struct clk *axi_clk;
-	struct clk *axi_s_clk;
+	struct clk_bulk_data *clks;
+	int num_clks;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -703,42 +702,12 @@ static int mtk_nor_transfer_one_message(struct spi_controller *host,
 
 static void mtk_nor_disable_clk(struct mtk_nor *sp)
 {
-	clk_disable_unprepare(sp->spi_clk);
-	clk_disable_unprepare(sp->ctlr_clk);
-	clk_disable_unprepare(sp->axi_clk);
-	clk_disable_unprepare(sp->axi_s_clk);
+	clk_bulk_disable_unprepare(sp->num_clks, sp->clks);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
 {
-	int ret;
-
-	ret = clk_prepare_enable(sp->spi_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(sp->ctlr_clk);
-	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(sp->axi_clk);
-	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
-		clk_disable_unprepare(sp->ctlr_clk);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(sp->axi_s_clk);
-	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
-		clk_disable_unprepare(sp->ctlr_clk);
-		clk_disable_unprepare(sp->axi_clk);
-		return ret;
-	}
-
-	return 0;
+	return clk_bulk_prepare_enable(sp->num_clks, sp->clks);
 }
 
 static void mtk_nor_init(struct mtk_nor *sp)
@@ -807,34 +776,92 @@ static const struct of_device_id mtk_nor_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
 
+static struct clk *mtk_nor_get_clk(struct clk_bulk_data *clks, int num_clks,
+				   const char *id)
+{
+	int i;
+
+	for (i = 0; i < num_clks; i++) {
+		if (clks[i].id && !strcmp(clks[i].id, id))
+			return clks[i].clk;
+	}
+
+	return NULL;
+}
+
+static int mtk_nor_get_named_clks(struct device *dev,
+				  struct clk_bulk_data **clks)
+{
+	struct clk_bulk_data *bulk;
+	struct clk *clk;
+	int num_clks = 2;
+
+	bulk = devm_kcalloc(dev, 4, sizeof(*bulk), GFP_KERNEL);
+	if (!bulk)
+		return -ENOMEM;
+
+	bulk[0].id = "spi";
+	bulk[0].clk = devm_clk_get(dev, bulk[0].id);
+	if (IS_ERR(bulk[0].clk))
+		return PTR_ERR(bulk[0].clk);
+
+	bulk[1].id = "sf";
+	bulk[1].clk = devm_clk_get(dev, bulk[1].id);
+	if (IS_ERR(bulk[1].clk))
+		return PTR_ERR(bulk[1].clk);
+
+	clk = devm_clk_get_optional(dev, "axi");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	if (clk) {
+		bulk[num_clks].id = "axi";
+		bulk[num_clks++].clk = clk;
+	}
+
+	clk = devm_clk_get_optional(dev, "axi_s");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	if (clk) {
+		bulk[num_clks].id = "axi_s";
+		bulk[num_clks++].clk = clk;
+	}
+
+	*clks = bulk;
+
+	return num_clks;
+}
+
 static int mtk_nor_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct mtk_nor *sp;
 	struct mtk_nor_caps *caps;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk, *axi_clk, *axi_s_clk;
-	int ret, irq;
+	struct clk_bulk_data *clks;
+	struct clk *spi_clk;
+	int num_clks, ret, irq;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	spi_clk = devm_clk_get(&pdev->dev, "spi");
-	if (IS_ERR(spi_clk))
-		return PTR_ERR(spi_clk);
-
-	ctlr_clk = devm_clk_get(&pdev->dev, "sf");
-	if (IS_ERR(ctlr_clk))
-		return PTR_ERR(ctlr_clk);
-
-	axi_clk = devm_clk_get_optional(&pdev->dev, "axi");
-	if (IS_ERR(axi_clk))
-		return PTR_ERR(axi_clk);
-
-	axi_s_clk = devm_clk_get_optional(&pdev->dev, "axi_s");
-	if (IS_ERR(axi_s_clk))
-		return PTR_ERR(axi_s_clk);
+	if (dev_of_node(&pdev->dev))
+		num_clks = devm_clk_bulk_get_all(&pdev->dev, &clks);
+	else
+		num_clks = mtk_nor_get_named_clks(&pdev->dev, &clks);
+	if (num_clks < 0)
+		return dev_err_probe(&pdev->dev, num_clks,
+				     "failed to get clocks\n");
+	if (!num_clks)
+		return dev_err_probe(&pdev->dev, -EINVAL, "no clocks defined\n");
+
+	spi_clk = mtk_nor_get_clk(clks, num_clks, "spi");
+	if (!spi_clk)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "missing \"spi\" clock\n");
+	if (!mtk_nor_get_clk(clks, num_clks, "sf"))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "missing \"sf\" clock\n");
 
 	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
 
@@ -867,10 +894,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->wbuf_en = false;
 	sp->ctlr = ctlr;
 	sp->dev = &pdev->dev;
-	sp->spi_clk = spi_clk;
-	sp->ctlr_clk = ctlr_clk;
-	sp->axi_clk = axi_clk;
-	sp->axi_s_clk = axi_s_clk;
+	sp->clks = clks;
+	sp->num_clks = num_clks;
 	sp->caps = caps;
 	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
@@ -886,9 +911,15 @@ static int mtk_nor_probe(struct platform_device *pdev)
 
 	ret = mtk_nor_enable_clk(sp);
 	if (ret < 0)
-		return ret;
-
-	sp->spi_freq = clk_get_rate(sp->spi_clk);
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable clocks\n");
+
+	sp->spi_freq = clk_get_rate(spi_clk);
+	if (!sp->spi_freq) {
+		dev_err(&pdev->dev, "invalid spi clock rate\n");
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
 
 	mtk_nor_init(sp);
 
-- 
2.45.2

