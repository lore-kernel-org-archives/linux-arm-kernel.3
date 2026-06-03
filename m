Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03F7CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYWp/taIIWLlTLiDi0UdP1i4nJMhM660bDQtgNioPAQ=; b=lJtx6DY1Jzp1YQZ9XPRKK7onxm
	cwB7n+S4f1QcaCRFQB+Dm7eG+34DNd34An3x581myMT8UQ4YITIvNDR5yQB1RbqNXPM14D0A/043M
	nJD55TOvNVZ6v4XUIBshQ+UI94TLs9PrvVHEdgEGClJznr0N+GeHZsmS757u+8B8gdx8yrga9dTlA
	RasDS+EI0Tkb6B0xbymcSlQOE0wf4iJJExHaRnwB4T23J6RAXuiP76nOBwQuv2RiVLU2buDR0E1zG
	3CaRF6SczuYnpE/6k4aibytSBCN0XEpq/yux+tQlmpFh7I7OVVey5zhCRD08F90Xl2FTz0pGeNoTI
	du1XmHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhP2-0000000EeCU-226g;
	Wed, 03 Jun 2026 08:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhOy-0000000Ee6B-1CC0;
	Wed, 03 Jun 2026 08:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mYWp/taIIWLlTLiDi0UdP1i4nJMhM660bDQtgNioPAQ=; b=HbpIB7qSiNw8ltpzL8NjvYLQxq
	n1r9MUgPf96TapfuHxSAcKlCOPvhdw33gNOTdtu/8HzVJikskjKDKDhBIjmBCA6JE5NQ5Rt/eGLCg
	yACRpuCSkz1tMOb1RUX/9VPsp87dQVg1JLgTCbsc3w1AvjxkSNeUoC1Ipx//3/EcwO9KJaR9sR/z7
	6kiR6cMwS/s7BPJeGPGeAaBw8qKOZuiLlbpC9o8FbnZudoxMuiJjRHR4mnZFzmZLG68WiY7d/6U0j
	qBqGbzODVNsJkqfDX1mMPPVcxq66nWMIl9YztW1NnalRfqxVS47b1JR2QVY3hbk3iWtKxIN5FThur
	uEQJriuA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhOt-0000000Bdzu-44TF;
	Wed, 03 Jun 2026 08:56:38 +0000
X-UUID: f966f35a5f2711f1acbe4559397dec65-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mYWp/taIIWLlTLiDi0UdP1i4nJMhM660bDQtgNioPAQ=;
	b=MId+0SqERWsGgTWBoJlrQQPEjrzx4of5rCOm2+5vF78b87BIgvH3C7+nqT8oLqZwZkqVgGEQyQBYdZJzOCSQz/BRIhJtI3iSrPrkZe7XlnkeKj6yZnb643RYDcIWVj5e9qcg2O1pTWwN8Vk9ZZF/serc5kr5L6pr2yhWtmRA1Kc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:bf723e0c-e5f7-43e9-b16e-def8ff9d205b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:8fb36dff-ece9-4b61-b051-0e792034d0bc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f966f35a5f2711f1acbe4559397dec65-20260603
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1057298583; Wed, 03 Jun 2026 01:41:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:07 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 03/14] media: mediatek: vcodec: add driver to support vcp encoder
Date: Wed, 3 Jun 2026 16:40:33 +0800
Message-ID: <20260603084045.17488-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_095636_505268_999E8465 
X-CRM114-Status: GOOD (  18.18  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 50 +++++++++++++++----
 .../vcodec/common/mtk_vcodec_fw_vcp.h         |  1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |  2 +
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 2f3bfcd97958..ee3838daf5a7 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -13,6 +13,8 @@
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../decoder/vdec_ipi_msg.h"
+#include "../encoder/mtk_vcodec_enc.h"
+#include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
 #define IPI_SEND_TIMEOUT_MS  100U
@@ -226,8 +228,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *b
 	}
 
 	mutex_lock(&vcp->ipi_mutex);
-	feature_id = VDEC_FEATURE_ID;
-	mailbox_id = IPI_OUT_VDEC_1;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VDEC_1;
+	}
 
 	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
 	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
@@ -351,10 +358,17 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 
 	vcp_device = fw->vcp->vcp_device;
 
-	feature_id = VDEC_FEATURE_ID;
-	mem_id = VDEC_MEM_ID;
-	mailbox_id = IPI_IN_VDEC_1;
-	ipi_id = VCP_IPI_LAT_DECODER;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mem_id = VENC_MEM_ID;
+		mailbox_id = IPI_IN_VENC_0;
+		ipi_id = VCP_IPI_ENCODER;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mem_id = VDEC_MEM_ID;
+		mailbox_id = IPI_IN_VDEC_1;
+		ipi_id = VCP_IPI_LAT_DECODER;
+	}
 
 	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
 					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
@@ -383,6 +397,20 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
 	mutex_init(&fw->vcp->ipi_mutex);
 
+	if (fw->fw_use == ENCODER) {
+		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread");
+
+		fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
+		fw->vcp->vsi_size = vcp_device->ops->vcp_get_mem_size(mem_id);
+		fw->vcp->iova_addr = vcp_device->ops->vcp_get_mem_iova(mem_id);
+
+		dev_dbg(&fw->pdev->dev, "enc vcp init done => va: %p size:0x%x iova:%pad.\n",
+			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
+		return 0;
+	}
+
 	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread");
 
 	fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
@@ -438,8 +466,8 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 	if (!fw->vcp->is_register_done)
 		return;
 
-	feature_id = VDEC_FEATURE_ID;
-	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATURE_ID);
+	feature_id = fw->fw_use == ENCODER ? VENC_FEATURE_ID : VDEC_FEATURE_ID;
+	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, feature_id);
 	if (ret < 0) {
 		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
 		return;
@@ -464,7 +492,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use
 	struct mtk_vcodec_fw *fw;
 	int i;
 
-	if (fw_use == DECODER) {
+	if (fw_use == ENCODER) {
+		struct mtk_vcodec_enc_dev *enc_dev = priv;
+
+		plat_dev = enc_dev->plat_dev;
+	} else if (fw_use == DECODER) {
 		struct mtk_vcodec_dec_dev *dec_dev = priv;
 
 		plat_dev = dec_dev->plat_dev;
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index 1072c37078f4..acf8f3e87bd0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -16,6 +16,7 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
+	VCP_IPI_ENCODER,
 	VCP_IPI_LAT_DECODER,
 	VCP_IPI_CORE_DECODER,
 	VCP_IPI_MAX,
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 0d4e94463685..48cb5dded70a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -26,7 +26,6 @@
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
-#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 908d8179b2d2..84156c102d8d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
@@ -23,6 +23,8 @@
 #define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
 #define MTK_VENC_IRQ_ACK_OFFSET	0x060
 
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
+
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
-- 
2.45.2


