Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1734FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iCq2MXA/vXpgJ0fvFRRMsy1wxQNXh9t+w+xWQb2a5nQ=; b=DvXgjnsnHmc/Hu7B2UltVNwniY
	hyqB1Tm3zsalSQMgHe+Hqp9jtGmJMSc3+kCMj8Ik4XX0T+lQYU2YQqOjJi6hLmM/sDNZKbPWFVsxS
	siZnDpoGgwjyvVsZB35An6HAil4uhSNIz5+q61VuYmjBHWQCUcMx+xdHrLLhE8F+17miLDDw0qONQ
	7e4y1XsRzbcdTXKeYEEFjcceVo2PbUHIQCdfazxM9bp6CDF+w98AF8esipGsKSf5yhX4E+CTvfz+K
	le0Z9ZVqKOa0KJhYnYPnL44zuZ6AR0c61UhBV/nlSpsoOHUMoTObzwdJxBG16+Ub6eHufHZpWk822
	emOdhAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVeA-0000000AY0Y-47xK;
	Sun, 01 Mar 2026 01:31:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVe6-0000000AXtq-2ROq;
	Sun, 01 Mar 2026 01:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43738401F3;
	Sun,  1 Mar 2026 01:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48724C19421;
	Sun,  1 Mar 2026 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328658;
	bh=BxNeqP8cU8tj8jwijO1wKYNCYi0T3XxDYn9+O1aDONE=;
	h=From:To:Cc:Subject:Date:From;
	b=q6mK4hM+RA3jlvp5Yn0DDQ9bcIRbujisDTxJhjUGYttoNMqkEdrTQ8QYlby6/AUrN
	 Zo0QrReqcJ3yDi6/voqTXwdfynILbI4qn+yIAZo/cIqsdmYFK+Te3nG0nMM4ifzdgq
	 to2Mg80Roi5s+9hfUn/tSCzPAeLqzXU2Qn7F6GJFWD9KWMxEDpTlDw7OI42HX+HeLl
	 9VwVnkdVCJUkID71Cxk9mDS8/2ywLpyybc1Bh79MG7J7miWsUdgfq6oZGR9OkfmoKJ
	 iqMPq2edwm9bf6YnlcW7GBGRLQvPok2/3XpFaeN8ppmEPdEBhIokHHkGbVENSJI9HQ
	 TVvLeil8xcMrA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	irui.wang@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mediatek: encoder: Fix uninitialized scalar variable issue" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:55 -0500
Message-ID: <20260301013056.1689285-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173059_055189_BC070446 
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

The patch below does not apply to the 6.6-stable tree.
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





