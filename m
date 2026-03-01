Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C999FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJL83f8cS0Lz/WOv2T3PTU5omALFvJoW166BCUPl9S8=; b=rOkGYSVvtM5gGi/nOcHP5BSfu4
	S3YGmtc0pC+YM8+mIESOjTZ0TkT8aCKfBnG05tk+MFHc31jSJxy97kchytKFkPQgcivLoR9EU/MIS
	p8CCB6KvU085JlDbZB81kFAC+c7RWJHKqJKhKG9qZrwa2DS9M1St5HdoUcaulxrl7YFilvzojnlVF
	sabDwFVf2UDQxawZY78mn3sOZxMwhd0oLtdxIjfAlbyIB2j+eT2rmeyMR9kIb118o+bE3oRIqC8AS
	hOyQ8meIKEW4YZ+2dnE4LFvYJYPVPoYS/sOMhAT3k7tioHsDdCOHc4c6k7yc8LD+COntZjCoM/9qd
	OzP3i6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVT6-0000000ATeo-3dPR;
	Sun, 01 Mar 2026 01:19:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSt-0000000ATPe-0Y9Y;
	Sun, 01 Mar 2026 01:19:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A913040877;
	Sun,  1 Mar 2026 01:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CD2C19421;
	Sun,  1 Mar 2026 01:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327962;
	bh=LdcG8ETEviyuXaC2W+MfMsfj/WLomJKJaGZKqWIdFj0=;
	h=From:To:Cc:Subject:Date:From;
	b=PLqKCtmQ4pEQ1iXzYwdXkrmUQ9o8lXfboU/YdzR6O6wokpTbKtoJ8JH/VKo2yN9rO
	 ff0ofNOqXnQsfuYuqdQZVf5LVNJKIzENxeTgPDY0D9doMdKi7Gm9cxEwbCP/JLUNcC
	 Gd24uxT0LzRDZ3ZaZdkiVD9y7/QXx73YNs7DE9C+gWuAYYIFrlqQtOIGZM7EykOTCy
	 Ady+ZzteoG1EEh1Q5gTHK2EdYRiYECVyGNhJq9ST5aG/Jip6H+EKhwMrtNHwkXq2W7
	 bZSArM/S5gxAawqSS5GnnfTQkeFm7RIhiT3jt6KwEd6KOULctEiBlrsSCyR0NxmyRK
	 lQRLJ1tQLMu8A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	irui.wang@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mediatek: encoder: Fix uninitialized scalar variable issue" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:20 -0500
Message-ID: <20260301011920.1674351-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_171923_243737_A9A3AFB3 
X-CRM114-Status: GOOD (  14.17  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 88e935de7cf8795d7a6a51385db87ecb361a7050 Mon Sep 17 00:00:00 2001
From: Irui Wang <irui.wang@mediatek.com>
Date: Sun, 7 Sep 2025 17:35:56 +0800
Subject: [PATCH] media: mediatek: encoder: Fix uninitialized scalar variable
 issue

UNINIT checker finds some instances of variables that are used
without being initialized, for example using the uninitialized
value enc_result.is_key_frm can result in unpredictable behavior,
so initialize these variables after declaring.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 6faf3f659e751..b3a0a1d8b7a8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -850,7 +850,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
 static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
-	struct venc_enc_param param;
+	struct venc_enc_param param = { };
 	int ret;
 	int i;
 
@@ -1004,7 +1004,7 @@ static int mtk_venc_encode_header(void *priv)
 	int ret;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 	if (!dst_buf) {
@@ -1125,7 +1125,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct venc_frm_buf frm_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 	int ret, i;
 
 	/* check dst_buf, dst_buf may be removed in device_run
-- 
2.51.0





