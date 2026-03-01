Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30051FD004B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LV+YKhm0IT9VYfo88h106c7QAS5m+aQ8HUwgaMbi1Ls=; b=S+7F1eY2zvXWbTZXdYJM1r3n1S
	ntGawQuZWfHOawEK6AqWxHkQYhhskdridPwbofNQ/m2fmo8cTnYjOO6OYP1k85aM0/BroayIn9LR+
	6nknYdPDKCcsBa2ChdDDW4u+3AvYsRBZhe+TmjjJB3xaMaP5cBJMX+9HDv8WQfwPIcl3VpNqiQv0V
	tfrsgaqJB9F2bU3E1OPlTWcJh8utMZb0qsf3fPGigcBMPc4hpSH8jqhgccoSQ29I1LHjRDE/9nlgR
	6IaPSUM2Ku0g+wMaCD40zPYNnBPJGIpMMIsbuoFxWa8Fu/AGkopVpUZ3h3enLf1C0i4U1J7ghxMVo
	/3IlRlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVe7-0000000AXv0-1SUW;
	Sun, 01 Mar 2026 01:30:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVe4-0000000AXsA-1wMA;
	Sun, 01 Mar 2026 01:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C2260126;
	Sun,  1 Mar 2026 01:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA02FC19421;
	Sun,  1 Mar 2026 01:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328655;
	bh=/DA37+Hf7sJ+rlGkNUToe112J/LF9yM23uSueEqaDgc=;
	h=From:To:Cc:Subject:Date:From;
	b=NPaW/rhNn49j8onPmXHHz49DbT9mpmNI07Cq6Bc3cCF9j3ANsPpQaivvUdhd4smZA
	 onbbHfq1CoB4DtFnXdO5ZqO+JDX9NPV/3yk7rPKVkuJfOVkAfMhDbyrrTlKsR0M8sE
	 cbRhAApex+1bwh7hJr8d2CWEm0J8ED3aTKdL+ILR9akHvcf1FZLmapdzXt/WG+fGWL
	 DR5xpeTijKLHa+fukoNF10ScQtmHXqMeUsvK9bQQ0Sx63YHM4kYV++yqRaTtgWeyTD
	 Si9DnSEH4Q4YXtmJ9fcXqBIny/zrJCM/D46i23UDxklKh/shtlqEVJzxgA2+7oxLdI
	 /XQBdyLDYO2/w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix tx mode bit setting" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:53 -0500
Message-ID: <20260301013053.1689229-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

From cb3f945c012ab152fd2323e0df34c2b640071738 Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Tue, 9 Dec 2025 11:34:17 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix tx mode bit setting

AV1 specification describes 3 possibles tx modes: 4x4 only, largest and
select. The hardware allows 5 possibles tx modes: 4x4 only, 8x8, 16x16,
32x32 and select. Since the both aren't exactly matching we need to add
a mapping function to set the correct mode on hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f4f7cb45b1f1b..f52b8208e6b93 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -72,6 +72,14 @@
 		: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
 })
 
+enum rockchip_av1_tx_mode {
+	ROCKCHIP_AV1_TX_MODE_ONLY_4X4	= 0,
+	ROCKCHIP_AV1_TX_MODE_8X8	= 1,
+	ROCKCHIP_AV1_TX_MODE_16x16	= 2,
+	ROCKCHIP_AV1_TX_MODE_32x32	= 3,
+	ROCKCHIP_AV1_TX_MODE_SELECT	= 4,
+};
+
 struct rockchip_av1_film_grain {
 	u8 scaling_lut_y[256];
 	u8 scaling_lut_cb[256];
@@ -1935,11 +1943,26 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_set_other_frames(ctx);
 }
 
+static int rockchip_vpu981_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode)
+{
+	switch (tx_mode) {
+	case V4L2_AV1_TX_MODE_ONLY_4X4:
+		return ROCKCHIP_AV1_TX_MODE_ONLY_4X4;
+	case V4L2_AV1_TX_MODE_LARGEST:
+		return ROCKCHIP_AV1_TX_MODE_32x32;
+	case V4L2_AV1_TX_MODE_SELECT:
+		return ROCKCHIP_AV1_TX_MODE_SELECT;
+	}
+
+	return ROCKCHIP_AV1_TX_MODE_32x32;
+}
+
 static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	int tx_mode;
 
 	hantro_reg_write(vpu, &av1_skip_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT));
@@ -2005,7 +2028,9 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
 	hantro_reg_write(vpu, &av1_comp_pred_mode,
 			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
-	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode == 1) ? 3 : 4);
+
+	tx_mode = rockchip_vpu981_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
+	hantro_reg_write(vpu, &av1_transform_mode, tx_mode);
 	hantro_reg_write(vpu, &av1_max_cb_size,
 			 (ctrls->sequence->flags
 			  & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ? 7 : 6);
-- 
2.51.0





