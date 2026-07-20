Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A0DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOpsBLVqc+uJVBy2XaIQpZ01Hi4aRvrpaPdzwgJXp9o=; b=JjAfV/r4yPoaAIz1H+5bmM7wcH
	SC/eGqoQD5PpNUVfOFEAK5xJyh7e9my4/3V49eQV6BiGE/A0PEuYryYtZE+K4o5oTLna1RmLdvY/3
	IwpTSkBk2weOwcRkN9B7MqNZP5iC90TZlEOCWHU7eG/iqcpxcdd4R0G7s4hYgMrNDWCaEHY8DLQCK
	5ZRmjooUiyVuZtmsJapXgqfNcgLktUXJzLCSEOkhsw1Uoih3aay1jthyLfzutD4/SgE60N/hPSzJl
	DiQE/SEOYQV6XgyrMAvxt/I9JHp4roKSCyeLzgmMQo4ueSJs2whLyHNuY1MoTtOK4O17od7YTkGMa
	XF3f4c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo9h-00000006pVz-44sS;
	Mon, 20 Jul 2026 13:35:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo8x-00000006orK-27v0;
	Mon, 20 Jul 2026 13:34:52 +0000
X-UUID: c5739110843f11f1acbe4559397dec65-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fOpsBLVqc+uJVBy2XaIQpZ01Hi4aRvrpaPdzwgJXp9o=;
	b=RCbvaNSICaGlC8aOtVE1qNZhYYccbmjwkrYam5t2UjRU1IY3zYqtxuqxGoVnB3OcS6nNu0lXtU8sB3fxmI1xmxlXwxmQr+CMyoeP3GdEbVarc6VD4uZocpaBLTYykbBs3GPRfDtvqKrvBnKggPFojCGQjdDB9scLJdTPvbIhRSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:55382bc8-7ec5-4641-88d3-799fc73552ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:ab85b35f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5739110843f11f1acbe4559397dec65-20260720
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 296845163; Mon, 20 Jul 2026 06:34:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 21:34:43 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 21:34:42 +0800
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
Subject: [PATCH v16 07/12] media: mediatek: jpeg: fix resolution change event handling in decoder
Date: Mon, 20 Jul 2026 21:34:27 +0800
Message-ID: <20260720133432.1042046-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_063451_571707_21AF7DBC 
X-CRM114-Status: GOOD (  14.05  )
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

This patch refines the handling of resolution change events within
JPEG decoder worker. The `mtk_jpeg_set_queue_data` function is now
called to set up queue data before signaling a source change through
`mtk_jpeg_queue_src_chg_event`. By reorganizing these calls, the
patch ensures that necessary queue information is updated prior to
transitioning the context state to `MTK_JPEG_SOURCE_CHANGE`.
A condition is added to exit early if the context is already in the
`MTK_JPEG_SOURCE_CHANGE` state, preventing redundant operations and
improving processing efficiency.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e152ebae0..edd9e2d0a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
-		mtk_jpeg_queue_src_chg_event(ctx);
+		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
+		mtk_jpeg_queue_src_chg_event(ctx);
 		goto getbuf_fail;
 	}
 
+	if (ctx->state == MTK_JPEG_SOURCE_CHANGE)
+		goto getbuf_fail;
+
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
-- 
2.51.0.windows.2


