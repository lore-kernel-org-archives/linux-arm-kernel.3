Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC4C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6txE4rq4DejgZXO4t8snccp58rTsg1gB4hzLLFSoYE=; b=W+r2TFbrR+jtn7McaDHq0U1pht
	5smbkm1RpfEgNdQPgmx/Du+lAD4jKpgYfVx3NPqGnt045+JqrMmGuvXRdDSMkTRnlm30ExRaza2xa
	2vH6MHaDl7ECMyay86TGb14HTvN5K+4DHHd7KND18CE0TJpapedih/f+57dSFWPkjXY4Hno8j8AZd
	+ovf6Xqw6zz74+nyTfe3AcXMo4/G196WMO2Ho1lzhtYdHD0Rmkhk/zbDSXdfBGdSmGBLzLYi+68Gf
	+ijZxxMG04lDY39LNIKd7dBTkkCKCf3YbrwN7YqeLObocI8/eJPKOnGXVsQaz1mE+FD4fgjCOr9pY
	hHeYzoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wbh-00000004sba-2nCB;
	Tue, 22 Sep 2026 09:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wbS-00000004sBC-2znc;
	Tue, 22 Sep 2026 09:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s6txE4rq4DejgZXO4t8snccp58rTsg1gB4hzLLFSoYE=; b=R4CFmK9CcdqLekd86zpCgn2uC6
	lHr0VG9Z8qh7IiRds0eS8Erx5KgfuHeKakxFWq2EJDnivYfaOuFt5mAaGGSfoLwuHDgO7J3Zc9LEH
	I7e8bIlAGPwJKEBjtm7dHsnIBuhvezjcmoWOsdhZz5qvkOrICjGBwIiuL303d8snF/AVrCyOJkBUg
	CmeokQ7GUJDBgnCrJ4vfIxeZFefgfWPaUHQfp9BYxeLTA4/vrjc2/KffSOFaszl92hd4GJI0Ulgs8
	sKUjJHhACbaxroRJuKb7EzPO+EiCeGGI3akGbFYAGrFeylI0Phveb+RIwVog04TnG685ksNQon19N
	i6K1ls9g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wbP-0000000DLYw-0H7u;
	Tue, 22 Sep 2026 09:15:53 +0000
X-UUID: 2be8f022b66611f1afed4741b24580c9-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s6txE4rq4DejgZXO4t8snccp58rTsg1gB4hzLLFSoYE=;
	b=j7coAG3C2gPNNKRe+lY04YcXKTD6Gn5oqEW/omLY2FwQRbQGyEAf5K+LvSp0jp3hc0f24eGON6U2JiaX7oQlaVHIp7DKJg2vRUdMFAOIJbO0Xl5zFoNR9SpuBnl1coMJL8F8jjcgUrme5ihqYODnBWTdtlMcCv217YNVS6+17R8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f3f43465-35ba-4aa7-adeb-18a3ab00f512,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:6c842288-aaf2-49f3-a068-8dcbe2bfd851,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2be8f022b66611f1afed4741b24580c9-20260922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 323422865; Tue, 22 Sep 2026 02:15:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 17:15:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 17:15:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v17 01/12] media: mediatek: jpeg: fix jpeg cores' amounts setting
Date: Tue, 22 Sep 2026 17:15:18 +0800
Message-ID: <20260922091530.241762-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091530.241762-1-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101551_985312_7B8F7CFC 
X-CRM114-Status: GOOD (  16.11  )
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

Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c  | 11 ++++++-----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h  |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c    |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c    |  2 ++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483..41c4cf8dc 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1325,7 +1325,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		for_each_child_of_node(pdev->dev.of_node, child)
 			num_child++;
 
-		atomic_set(&jpeg->hw_rdy, num_child);
+		jpeg->max_hw_count = num_child;
+		atomic_set(&jpeg->hw_rdy, 0);
 		atomic_set(&jpeg->hw_index, 0);
 
 		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
@@ -1462,7 +1463,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1509,7 +1510,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1592,7 +1593,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1687,7 +1688,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	struct mtk_jpeg_fb fb;
 	unsigned long flags;
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->dec_hw_dev[i];
 	i = 0;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed5b..6be5cf30d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:	jpg decode hardware device
  * @hw_index:		jpg hw index
+ * @max_hw_count:	jpeg hw-core count
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
 	atomic_t hw_index;
+	u32 max_hw_count;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 32372781d..9ca68cde4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -668,6 +668,8 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index b312a15d7..44a064dc7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -389,6 +389,8 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
-- 
2.51.0.windows.2


