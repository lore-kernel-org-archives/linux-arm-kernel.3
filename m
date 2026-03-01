Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EA0FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DUiElcOSOAAIThvZkx1W1aBaDS6Jv43CC4Y1LnsWDqI=; b=nyYXSN1yGL8e6fXhhuuGv6RnCY
	/FDK5a6+tpyFRHGMkzhOHhSK5kZbFTbeEwRnRBlx4n+dc1kiKnpu4ffEWz7KWJXigDIrNPl/7aM3R
	7ipWg7jJ4+oAxXtCY5xl5rKBuATdiXwm8Di4dAGfyZo3YVM5EJ7CE81dRCDZ1FAaTOJvFaWhT/1TO
	5Q1VQmkg7xumlstHIGu4vUNGnTckXsySnPw9gs9HxM+mSjtMhgOPW1tlPEJNdKBxCtFzkcKD5igee
	1h0hI3/5dDzsfhE0ejF992kdxYFq3C78MNf1dR4Q/hRm7J4v0bplglb2avRqO+c2v49mL8BYfMUro
	H7+Mx0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSY-0000000AT7Z-3i4A;
	Sun, 01 Mar 2026 01:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSW-0000000AT5y-0a2v;
	Sun, 01 Mar 2026 01:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F3C443B28;
	Sun,  1 Mar 2026 01:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC441C19421;
	Sun,  1 Mar 2026 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327939;
	bh=Ro6Z7KBUjHow4F9zwtKSLIVB7zKCwWulCgr+e1Ggkts=;
	h=From:To:Cc:Subject:Date:From;
	b=qbSjK7fu6xFeZlTit386GKXxOfkEnVQXFTUuMBOw2+uDLo8UG+94kSB4szSngQRmN
	 /1Bb0UGISb563lFkN6/EBIzLnDbxAqlmItwe+sHROZZ5GFagyAtDmwrn0UV8Io6d9e
	 kR4rDc0prruOmOlBkQxeJQ6vpZ/650f4MWmfloL2ff9QcDE9rEhPFQiDOUdVbFjCSO
	 bBRoLzMWmJwrpjy+VjGzh01fXZs0aQzm1PbXvySMuUAKTqxfu72zRgY0eCMMgEradP
	 w1WBgKB8a+JolEG/6PNMPXYHdPPfQlGrF78nXzln1OR35Zz5dx4nkwDF332DX3MNBs
	 IsSCnO+wFc+pQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix enable cdef computation" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:57 -0500
Message-ID: <20260301011857.1673450-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_171900_224233_79A5368C 
X-CRM114-Status: GOOD (  13.13  )
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

From e0f99b810e1181374370f91cd996d761549e147f Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Tue, 9 Dec 2025 11:34:01 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix enable cdef computation

If all the fields of the CDEF parameters are zero (which is the default),
then av1_enable_cdef register needs to be unset
(despite the V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF possibly being set).

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4786
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
[hverkuil: dropped Link tag since it just duplicated the Closes: URL]
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c1..f4f7cb45b1f1b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -1396,8 +1396,16 @@ static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
 	u16 luma_sec_strength = 0;
 	u32 chroma_pri_strength = 0;
 	u16 chroma_sec_strength = 0;
+	bool enable_cdef;
 	int i;
 
+	enable_cdef = !(cdef->bits == 0 &&
+			cdef->damping_minus_3 == 0 &&
+			cdef->y_pri_strength[0] == 0 &&
+			cdef->y_sec_strength[0] == 0 &&
+			cdef->uv_pri_strength[0] == 0 &&
+			cdef->uv_sec_strength[0] == 0);
+	hantro_reg_write(vpu, &av1_enable_cdef, enable_cdef);
 	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
 	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
 
@@ -1953,8 +1961,6 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
 	hantro_reg_write(vpu, &av1_switchable_motion_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE));
-	hantro_reg_write(vpu, &av1_enable_cdef,
-			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
 	hantro_reg_write(vpu, &av1_allow_masked_compound,
 			 !!(ctrls->sequence->flags
 			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND));
-- 
2.51.0





