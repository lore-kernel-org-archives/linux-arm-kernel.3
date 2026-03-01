Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A336CFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4g2FZpXhfruqyYAtQhLTTVW8LA18Nu1j06fHRK1mbvc=; b=G2RzTX7on8WqVAm3e+dKV4fruw
	aVK5RAuI8DiyZyLX7xN9KoVw7GRxntdrHULKF0a92/IbuGY/6Nk36Kxz5RnDxMGL4qBT3Odv/U0xL
	tORpZP/EWHl9O9kh2V0B2qefheqdeUnrpcVNaqkkAKTTPmJ+iSfL0/3jDLrpWGR69N3qRuLmS98lg
	pHJDaUibUnTNa1uCOPDomPbCXpMSIv9a7neOgk0/iXFh7VcB6aAaVtUQtffvi07mVfziR8Bzq1dXA
	w8Du79bhQRTmxltkJgqsCmNboUVvQrCHt0ejtz1yT2d0RVpWKQiMvBoNCDHBCtsm8Qkm8Eg6AQFMm
	igOXVZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSh-0000000ATE6-27RG;
	Sun, 01 Mar 2026 01:19:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSg-0000000ATDF-2rOd;
	Sun, 01 Mar 2026 01:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F7CE6012A;
	Sun,  1 Mar 2026 01:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E29C19424;
	Sun,  1 Mar 2026 01:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327949;
	bh=6Q2k0VkWDP09CJ3dNoRJSfIB+gFGrjgsHsSzV4bQdA4=;
	h=From:To:Cc:Subject:Date:From;
	b=mcEg4D75HROXAAKfHenSKt6j/n3MuOZHAod7A1fj0EMLiHy9/Z4a3jgv1jit+gEE6
	 /xxg9vVVtR+huEVtmPuBd4hx9hsSncZ4WqGJzo8EUStkdgvd622nV3qy5xx6HQmlJI
	 9opkRORaYui1307dbtdSy6JVQSBBcF4/7nmYnWC9bSK3AxNXATBQDvBWTgrOxm8DAE
	 2hjcSwVjl5rBc3OvBA3IgKnPB9qkvWs+X+TN9SbhLZug+KZQHwP6p13RLGSy9HJ7+q
	 IuQJMyo8SoT+CK1nTnAUXHBrvfvRn7CEtmZkt6Kw7jKUfckEo4Dg4vB+qTLiEuGTCO
	 I998G2P6KZU9w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix tx mode bit setting" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:07 -0500
Message-ID: <20260301011908.1673777-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
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





