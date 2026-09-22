Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89870C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6RC8riHUj/z0uo+kAIhl1y6Z4X2ZP22huzre+k9AS8=; b=zXt7yhe9UUeHYCOP+e8d1jz+qB
	jpJeyEuSVDzx5y9qh4+CR5GTIiWEGS5cfZsMtR7EevXolUQjHBvQz9u1M4tLFjNQvyNZMcw77F/vT
	6k1oXUwL1HIGhbGn5gv2KSBNVRb8o7hDlyAZkNRNYaerxaTitJRKbRPGYbAwoQyS7b6ZBl8cUwimb
	WoDL1tOQ4JDoLK20APZB09v3/MEEhF9OYazOjHIv/p5jrmdmM/TM8vpQQQty2PfmoqGvodKsa1bl6
	k0U+Ynhzc/kUK1mLgWPGj/rZTSbNuZ2ZjK9u0yqSI1oIPTWzQ+Z+y5qWAzbMN8f/OZzyQ9odrWeXY
	Oi9qUWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wbq-00000004so8-0ZSe;
	Tue, 22 Sep 2026 09:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wbW-00000004sHc-0dHM;
	Tue, 22 Sep 2026 09:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m6RC8riHUj/z0uo+kAIhl1y6Z4X2ZP22huzre+k9AS8=; b=F6fW3lJjBOeclonjOMwvnS5Tf9
	GhLZxGQsb2qhXF7qqbS9X15whwkqhGySK32XO6NsPgNcnquo9DN/8B63gIqLHutqiQFnybHuLf2Wj
	OFE2G7GMiyiSKCUK3xr8VPnceu+hukOIwK+W7eag0RCfVQCmbic8zIUER+f0en0adW72Un4vdmurx
	9I77SlUfBdrAjiYpeWKkF7v8nVX9IZV9j0K5ikfByz+vH4MSLU4/+2AmMR6cKMjTYf91Mn37fTIEZ
	W4G/gnE15//tN0PTvsfcxM+4dAgIgODoESeaA1ClIJsD/f5/5r8zN4GOBD1MkYfppP1sJCRMGezha
	Iuc/otdQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wbQ-0000000DLYZ-0noq;
	Tue, 22 Sep 2026 09:15:55 +0000
X-UUID: 2c86e476b66611f1afed4741b24580c9-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=m6RC8riHUj/z0uo+kAIhl1y6Z4X2ZP22huzre+k9AS8=;
	b=cypsvN82HJ9vpU0lYU2d3gnMdNrYBi7IMA/vr/Hnhbt2ErrEbmmWlE7t4YyG0ffHDX9msk6tk+bVBvi2hRbXilKSdcD7zAitYwxvX3nbNLZFkVqLJP71OTLwufPKCm8TqqPazZzxlJgaCnGJxhTyiaRKIJ6make67HKMY97zcKA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:61ab1acf-62f2-49a5-bd81-4657dce35f63,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:936038b0-a3ec-49ae-a57e-d31264ef3097,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c86e476b66611f1afed4741b24580c9-20260922
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 796396901; Tue, 22 Sep 2026 02:15:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 17:15:35 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 17:15:34 +0800
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
Subject: [PATCH v17 02/12] media: mediatek: jpeg: fix jpeg buffer payload size setting
Date: Tue, 22 Sep 2026 17:15:19 +0800
Message-ID: <20260922091530.241762-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091530.241762-1-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101552_962509_8C602150 
X-CRM114-Status: GOOD (  14.15  )
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

For multi-core jpegdec, if one core gets resolution change event,
the payload size, representing the size of Y/C data, needs to change.
But others are decoding at the same time and it can not be changed
immediately, which results in the payload size not matching the real
buffer length.
The payload size must be less than the real buffer length to avoid
warning logs.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 41c4cf8dc..34135706a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -702,6 +702,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_plane_pix_format plane_fmt = {};
+	size_t max_size;
 	int i;
 
 	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
@@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
+		max_size = plane_fmt.sizeimage;
+
 		if (ctx->enable_exif &&
-		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
-		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
+			max_size += MTK_JPEG_MAX_EXIF_SIZE;
+
+			vb2_set_plane_payload(vb, i,
+					      MIN(vb->planes[i].length,
+						  max_size));
+		} else {
+			vb2_set_plane_payload(vb, i,
+					      MIN(plane_fmt.sizeimage,
+						  vb->planes[i].length));
+		}
 	}
 
 	return 0;
-- 
2.51.0.windows.2


