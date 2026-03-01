Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFBAFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LMxNdYDmwAGCpFmVUfa8xGeNFiFObbkj71UXXnlsh2s=; b=kqs+hY7wS0SPpS7+O53vc0lNGk
	M1bhbNZD+TO1daA79mWxK6wQg19SgNZLIteQ08vgOat8QvUlKMedb41HgTUiJ/EKA84ixEXmhbiDM
	LZRyz6ntTzlLl7CuDYzSDg/kYzJuLx2q0AyoeRSm9+2PmwI48u80sXuofvuULQ82hOD61itNDJ44C
	l9gBoPvQwkcRtaWe7CSqc4zfwRbKMNd3471CUQLbfS+dWjJ9Y/OyssihL/59zL0RWHLx4Nej18nnw
	lhFcyZyUQLyzJ/xz2xj1VaTECh75bzaFhSv80Y0Gk7hLJlP36uSpg8jW7vVMbk/+HhYwgeBoDqmDx
	fpPMfldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVTO-0000000ATzP-3MNz;
	Sun, 01 Mar 2026 01:19:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVTL-0000000ATvQ-1enn;
	Sun, 01 Mar 2026 01:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5AF860008;
	Sun,  1 Mar 2026 01:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933D9C19424;
	Sun,  1 Mar 2026 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327990;
	bh=8HWlHUoKFmh3jh8W3WSGJzHOoxrEt60poeRlUEbtgv8=;
	h=From:To:Cc:Subject:Date:From;
	b=fCFfuGnv80H9u02Qyapooka2u7VN+CzhNkMoK0dlh7ZTOXZclsRrnYYxZoQtNmZWv
	 635wBqFr/Jb4Jtg2BGudedbeCpmaxRRQDxRxVwXBBQPe4PqYzJf51ukq2tLUU9LtHr
	 sNWINNXs59Pbs6BMkaANZrrY81Qdu27Cr+A/9eOMYGNY8rYVeUPAueQTpyXSl/7YiZ
	 C/c1ZA2QzrjCjtWeyLeuS6KUtFr2VMJuIpHDbsXj0tXrwSJ9ZVhEGPZgI13uk3c+0t
	 VC55zcVM3Dx9fGqTABgpP2LyfhKRi/kwYDTGq9P14t04up0Wcpvt4UKwaAzHHiImcy
	 MGWQiOMDWJZ6Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Set IDR flag for intra_only frame type" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:48 -0500
Message-ID: <20260301011948.1675062-1-sashal@kernel.org>
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

From 1c1b79f40ee4444fa1ac96079751608b724c6b2b Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Thu, 8 Jan 2026 14:29:46 +0100
Subject: [PATCH] media: verisilicon: AV1: Set IDR flag for intra_only frame
 type

Intra_only frame could be considered as a key frame so Instantaneous
Decoding Refresh (IDR) flag must be set of the both case and not only
for key frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f52b8208e6b93..500e94bcb0293 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2018,7 +2018,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->quantization.flags
 			    & V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT));
 
-	hantro_reg_write(vpu, &av1_idr_pic_e, !ctrls->frame->frame_type);
+	hantro_reg_write(vpu, &av1_idr_pic_e, IS_INTRA(ctrls->frame->frame_type));
 	hantro_reg_write(vpu, &av1_quant_base_qindex, ctrls->frame->quantization.base_q_idx);
 	hantro_reg_write(vpu, &av1_bit_depth_y_minus8, ctx->bit_depth - 8);
 	hantro_reg_write(vpu, &av1_bit_depth_c_minus8, ctx->bit_depth - 8);
-- 
2.51.0





