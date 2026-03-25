Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B359FEA801
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xskrL9INQfPxARGxwOUl2CXsP/NF/qOjwGw8Tn++M6o=; b=GQt2CiU1CPW5LgMdLiI3aEtiaB
	t/YdedQ3CQWb/BuMibo9leaFNnhhIN+RO4LYcvyFisPTfkKLFfV2sltnL9B8snYDtOd8rpXCW0aR6
	8d+paEpn5Hr+w+ua1Gw6PLvHmELBWo2Q0rra8YFB///TC3x9/z6o87Mpg8vbYWYsMbcVAlWc34yT0
	rv4OVg+M3x4Oze0hqSh2mEPEBdzMmcFgpVpQwGhONzX2dOG+QCdpRf6rdOImuJa60P15cdTO4Ua1E
	5/0QTd4WlPH/NADsjsSHeFc1Nh3GsfYUr4XeCoROhzbDyWSz/FM1C3RNSuXS64AkIucQhwDoyAnC5
	7oowBD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Em7-00000002aSl-2FRd;
	Wed, 25 Mar 2026 03:19:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Em4-00000002aRM-1yPG;
	Wed, 25 Mar 2026 03:19:17 +0000
X-UUID: 63b1d7ae27f911f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xskrL9INQfPxARGxwOUl2CXsP/NF/qOjwGw8Tn++M6o=;
	b=qLSIgIEplGTw1eXrL7dtIINilwIMEota4WWArBu2NW/1XH550ZRiJqRfXCpzEERUSmS3pBF2S8eicCnGJaREz2I/TRB5WL0eUzdnQcHYFAspJODLT6m1HP9ih+0ZzJDxJ5AnPWM6UogoI/6/Cu2ydqjcl6YlJERgyzietVqpWT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:47d78c55-939e-4b5e-8817-fc38c5412160,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:39cba98e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 63b1d7ae27f911f19e7563141e833ce8-20260324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1240047136; Tue, 24 Mar 2026 20:19:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:19:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:19:08 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 2/2] spi: spi-mtk-nor: add new clock support
Date: Wed, 25 Mar 2026 11:18:55 +0800
Message-ID: <20260325031900.2099969-3-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
References: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_201916_530552_4208ADE7 
X-CRM114-Status: GOOD (  14.90  )
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

one more clock gate need to be added.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 1e5ec0840174..e34b0414372f 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -118,8 +118,9 @@ struct mtk_nor {
 	dma_addr_t buffer_dma;
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
-	struct clk *axi_clk;
-	struct clk *axi_s_clk;
+	struct clk *axi_f_clk;
+	struct clk *axi_h_clk;
+	struct clk *axi_p_clk;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -705,8 +706,9 @@ static void mtk_nor_disable_clk(struct mtk_nor *sp)
 {
 	clk_disable_unprepare(sp->spi_clk);
 	clk_disable_unprepare(sp->ctlr_clk);
-	clk_disable_unprepare(sp->axi_clk);
-	clk_disable_unprepare(sp->axi_s_clk);
+	clk_disable_unprepare(sp->axi_f_clk);
+	clk_disable_unprepare(sp->axi_h_clk);
+	clk_disable_unprepare(sp->axi_p_clk);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
@@ -723,18 +725,27 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(sp->axi_clk);
+	ret = clk_prepare_enable(sp->axi_f_clk);
 	if (ret) {
 		clk_disable_unprepare(sp->spi_clk);
 		clk_disable_unprepare(sp->ctlr_clk);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(sp->axi_s_clk);
+	ret = clk_prepare_enable(sp->axi_h_clk);
 	if (ret) {
 		clk_disable_unprepare(sp->spi_clk);
 		clk_disable_unprepare(sp->ctlr_clk);
-		clk_disable_unprepare(sp->axi_clk);
+		clk_disable_unprepare(sp->axi_f_clk);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sp->axi_p_clk);
+	if (ret) {
+		clk_disable_unprepare(sp->spi_clk);
+		clk_disable_unprepare(sp->ctlr_clk);
+		clk_disable_unprepare(sp->axi_f_clk);
+		clk_disable_unprepare(sp->axi_h_clk);
 		return ret;
 	}
 
@@ -813,7 +824,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct mtk_nor *sp;
 	struct mtk_nor_caps *caps;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk, *axi_clk, *axi_s_clk;
+	struct clk *spi_clk, *ctlr_clk, *axi_f_clk, *axi_h_clk, *axi_p_clk;
 	int ret, irq;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -828,13 +839,17 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
-	axi_clk = devm_clk_get_optional(&pdev->dev, "axi");
-	if (IS_ERR(axi_clk))
-		return PTR_ERR(axi_clk);
+	axi_f_clk = devm_clk_get_optional(&pdev->dev, "axi_f");
+	if (IS_ERR(axi_f_clk))
+		return PTR_ERR(axi_f_clk);
+
+	axi_h_clk = devm_clk_get_optional(&pdev->dev, "axi_h");
+	if (IS_ERR(axi_h_clk))
+		return PTR_ERR(axi_h_clk);
 
-	axi_s_clk = devm_clk_get_optional(&pdev->dev, "axi_s");
-	if (IS_ERR(axi_s_clk))
-		return PTR_ERR(axi_s_clk);
+	axi_p_clk = devm_clk_get_optional(&pdev->dev, "axi_p");
+	if (IS_ERR(axi_p_clk))
+		return PTR_ERR(axi_p_clk);
 
 	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
 
@@ -869,8 +884,9 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
-	sp->axi_clk = axi_clk;
-	sp->axi_s_clk = axi_s_clk;
+	sp->axi_f_clk = axi_f_clk;
+	sp->axi_h_clk = axi_h_clk;
+	sp->axi_p_clk = axi_p_clk;
 	sp->caps = caps;
 	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
-- 
2.45.2


