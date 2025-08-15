Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3269CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUjURj/ae+gmzvgq67If+VwE06yKrdAtWmry18dhRG8=; b=qnUB/6CjahVDR2Wa+5tuH8gUbP
	OJwg09/0zXS7DPl5OC2UI3DxIVOo26vW1w4wfGEJbXbjp7G6S/XwPa1/jAqsJj4iNcwE/odEhHITP
	QzosUfhYC9Xr7G54kS38zO44sTr7YKonZ3cAmM1FZlHuXXkqc45oisQDsdcZEU9o2W/phvTb/sNGl
	aiEL+tfHTrjHEgYgWhmGTUkaobVZFAyJtZ17ETiOG1NTIMB2jod1e98gWKjIT64ZhDzp8aGlM/JnV
	18dP2dCBMaq2Ty6llrprn0CcKCEBeMZdLa1tLkuzvn2cnUpxrxfN2eQnBlw6mf9GZ0cciAsegwnad
	VwW/pnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrF2-000000028ZP-00yX;
	Fri, 15 Aug 2025 10:00:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqBP-00000001v5h-4BFI;
	Fri, 15 Aug 2025 08:53:09 +0000
X-UUID: 40ab7e1a79b511f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FUjURj/ae+gmzvgq67If+VwE06yKrdAtWmry18dhRG8=;
	b=VAwDY8v9FMsfe5rGx1NYrmwKNAd/dI/j7xC/TmSeNrTaLHgsa/q7eOag6NWwFToNoCUhIoCUZDq0MDJl4rqER92d10JAPCIb4XF0c0fgCaShao/ahun4C3fZQi9uHDdfsVnavEhzJRi5W3gapF8hUu+MqEqhYIQFRB1WC8mDfKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e7108727-b05d-4387-9b61-317de0ca77de,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:a184416d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 40ab7e1a79b511f09f706fa2197c6ceb-20250815
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1187044671; Fri, 15 Aug 2025 01:53:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:59 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 13/14] media: mediatek: decoder: fill av1 buffer size with picinfo
Date: Fri, 15 Aug 2025 16:52:26 +0800
Message-ID: <20250815085232.30240-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015308_038365_74D9E820 
X-CRM114-Status: GOOD (  10.36  )
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

The buffer size of y and c plane has been calculated in vcp/scp,
can fill each frame buffer size with picinfo directly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2b2173062cb0..6070485e26c4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1799,18 +1799,19 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 {
 	struct vb2_buffer *vb;
 	struct vb2_queue *vq;
-	int w, h, plane, size;
+	int plane;
 	int i;
 
 	plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
-	w = vsi->frame.uh.upscaled_width;
-	h = vsi->frame.uh.frame_height;
-	size = ALIGN(w, VCODEC_DEC_ALIGNED_64) * ALIGN(h, VCODEC_DEC_ALIGNED_64);
 
 	/* frame buffer */
 	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
+
+	vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
+	vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
+
 	if (plane == 1)
-		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
+		vsi->fb.c.dma_addr = fb->base_y.dma_addr + vsi->fb.y.size;
 	else
 		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
 
@@ -1835,8 +1836,9 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 		}
 
 		vref->y.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		vref->y.size = vsi->fb.y.size;
 		if (plane == 1)
-			vref->c.dma_addr = vref->y.dma_addr + size;
+			vref->c.dma_addr = vref->y.dma_addr + vsi->fb.y.size;
 		else
 			vref->c.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
 	}
-- 
2.45.2


