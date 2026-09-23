Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B4C98306
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fyPPjx27HiZYl9sL9EjqcuZ6S+q1wVLjGQYEz0emYc=; b=P+KL07+PgG07oqQ7l6ybhXQ3Cu
	RH2vzmcYTm8rvgrp3R3GffCZXoGXHInlayJ3+oonSDMF2D1sWPLpGCED1MREfNzG+7/SmlDIXK9/D
	CV6csYRNT1hWjQuhvLYHTBchYYCS6+DA3ftm2jdkVE1DEBoW2HN6t74gUJqieJfjaOE878Q0CO5fc
	4pew6L9/9uZ8I4EWpcoigrIJq9tdqe/qfQxrEfvpVs70ediwQQ5nMYV5nxrdDlHdoZuo8iCvmJ6Zg
	xswQG1QUK1WaEVR3jl3nqINUUNzsKOGOTNjWVRYKi2GEQtlsWA/yK8s43K7QRSFx93i1Iv9iGe6Ah
	bltgwYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CyG-00000006yEH-1z6S;
	Wed, 23 Sep 2026 02:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CxN-00000006xdl-1J3h;
	Wed, 23 Sep 2026 02:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4fyPPjx27HiZYl9sL9EjqcuZ6S+q1wVLjGQYEz0emYc=; b=XUtvyMK8ZdQ5DP+D33jIo9nqv6
	Yb9MQZcqRFHATE9fsfLnBMR5uhU898Vovr+2+gYfNJw99teMWqprvTLBJhwb6/M3tJVnPgT7zRCgq
	KHJOXYHZBij4jGypU+kZgwpDJLw3iGnbUR7326J2lv5Mu07Xoy9/8xwUhPdXm9d7LjExLjYob6KK7
	tyObt2AjoXBu1bSCRQcQuSmJnuY04rgoKyA0A8ZdlRiIsjoBSgDFIYfWenXrYB4rI/T/A/OoX87I/
	2R4T/8y5KwSu8yFEBWkn6P5au93x80HUKmp2QycqoRW4+i+WuD+TtCEtWk37UkYDyAwAY5lbYEzO/
	hn2WSs6g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9CxJ-0000000EIDR-3v6Q;
	Wed, 23 Sep 2026 02:43:36 +0000
X-UUID: 8d598d8eb6f811f1afed4741b24580c9-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4fyPPjx27HiZYl9sL9EjqcuZ6S+q1wVLjGQYEz0emYc=;
	b=D0xQN4aNqGaLFDxA9Qby9Qa+A+WSbUU9HEEnJp11oVY3DORTLqi9SYm9HtmvpLwfKzT71wTEN0CXVugy05BMMsjr43lo6E5A942o5/qPraI3fJcuJLtjoKlbyUnR1V2J9FL1EjfbQVF3oePHvZJI+b9BuwAEnwmbrOKFxxgDQ14=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3f657186-0548-4269-8db2-c2d03897a144,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:f6d666b7-52d2-40bb-9845-4be59c9ee2ed,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:2|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d598d8eb6f811f1afed4741b24580c9-20260922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 239485251; Tue, 22 Sep 2026 19:43:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 10:43:23 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 10:43:22 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 14/14] media: mediatek: decoder: support av1 extend vsi
Date: Wed, 23 Sep 2026 10:42:57 +0800
Message-ID: <20260923024258.257846-15-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923024258.257846-1-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034334_506448_811337D8 
X-CRM114-Status: GOOD (  18.94  )
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

The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 59 ++++++++++++++++---
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 14639098f..1ef561dae 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -25,6 +25,9 @@
 
 #define AV1_INVALID_IDX			-1
 
+#define AV1_NON_EXT_VSI_SIZE		0xD50
+#define AV1_TILE_SIZE			64
+
 #define AV1_DIV_ROUND_UP_POW2(value, n)			\
 ({							\
 	typeof(n) _n  = n;				\
@@ -641,6 +644,8 @@ struct vdec_av1_slice_fb {
  * @frame:		current frame info
  * @state:		status after decode done
  * @cur_lst_tile_id:	tile id for large scale
+ * @tile_group:	tile group info
+ * @reserved:		reserved
  */
 struct vdec_av1_slice_vsi {
 	/* lat */
@@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
 	struct vdec_av1_slice_frame frame;
 	struct vdec_av1_slice_state state;
 	u32 cur_lst_tile_id;
+	struct vdec_av1_slice_tile_group tile_group;
+	unsigned int reserved[4];
 };
 
 /**
@@ -1402,17 +1409,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_av1_slice_instance *instance,
 	vdec_av1_slice_setup_tile(frame, &ctrl_fh->tile_info);
 }
 
+static
+struct vdec_av1_slice_tile_group *vdec_av1_get_tile_group(struct vdec_av1_slice_instance *instance,
+							  struct vdec_av1_slice_vsi *vsi)
+{
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		return &vsi->tile_group;
+	else
+		return &instance->tile_group;
+}
+
 static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *instance,
 					   struct vdec_av1_slice_vsi *vsi)
 {
 	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	struct v4l2_ctrl *ctrl;
 	u32 tge_size;
 	int i;
 
+	tile_group = vdec_av1_get_tile_group(instance, vsi);
+
 	ctrl = v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
 	if (!ctrl)
 		return -EINVAL;
@@ -1607,6 +1626,15 @@ static int vdec_av1_slice_setup_pfc(struct vdec_av1_slice_instance *instance,
 	return ret;
 }
 
+static u32 vdec_av1_get_tiles_num(struct vdec_av1_slice_instance *instance,
+				  struct vdec_av1_slice_vsi *vsi)
+{
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		return vsi->tile_group.num_tiles;
+	else
+		return instance->tile_group.num_tiles;
+}
+
 static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *instance,
 					    struct vdec_av1_slice_vsi *vsi,
 					    struct mtk_vcodec_mem *bs,
@@ -1647,12 +1675,18 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 
 	vsi->tile.buf = instance->tile.dma_addr;
 	vsi->tile.size = instance->tile.size;
-	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_group.num_tiles);
 
 	vsi->cdf_table.buf = instance->cdf_table.dma_addr;
 	vsi->cdf_table.size = instance->cdf_table.size;
 	vsi->iq_table.buf = instance->iq_table.dma_addr;
 	vsi->iq_table.size = instance->iq_table.size;
+
+	/* lat_buf is used to share hardware decoder syntax between lat and core,
+	 * there isn't only one. But there is only one tile.va for each instance.
+	 * Need to copy tile information to lat_buf every time.
+	 */
+	memcpy(lat_buf->tile_addr.va, instance->tile.va,
+	       AV1_TILE_SIZE * vdec_av1_get_tiles_num(instance, vsi));
 }
 
 static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *instance,
@@ -1675,7 +1709,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 					     struct vdec_av1_slice_vsi *vsi,
 					     struct mtk_vcodec_mem *bs)
 {
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	u32 tile_num, tile_row, tile_col;
@@ -1686,6 +1720,8 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 *tile_info_buf = instance->tile.va;
 	u64 pa = (u64)bs->dma_addr;
 
+	tile_group = vdec_av1_get_tile_group(instance, vsi);
+
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
 
@@ -1908,7 +1944,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
 	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
-	int ret;
+	int ret, vsi_size = AV1_NON_EXT_VSI_SIZE;
 
 	instance = kzalloc_obj(*instance);
 	if (!instance)
@@ -1942,9 +1978,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 
-	if (vsi->vsi_size != sizeof(struct vdec_av1_slice_vsi))
-		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
-			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
+	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_av1_slice_vsi);
+		vsi->iq_table_size = AV1_IQ_TABLE_SIZE;
+		vsi->cdf_table_size = AV1_CDF_SIZE;
+	}
+
+	if (vsi->vsi_size != vsi_size) {
+		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
+			     vsi->vsi_size, vsi_size);
+		ret = -EINVAL;
+		goto error_vsi;
+	}
 
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
-- 
2.51.0.windows.2


