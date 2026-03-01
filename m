Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D1EFD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZbC4A0pPmCJWHFFwQkGFakENUYerIBT2kwlmMd4kBJQ=; b=ANJu2L/D1g7+TwJF8CY3Ou8teO
	VKvlvUQJKDCxJ0BtW0VFviIOF8YGntzaUTGrcQW9i9gBMeJ4OEZcX4TsEHZHNlCpIw0DpioPk/G0t
	pfGXpekPLH3xuh9ZVQGBipreL20J9sLPOCuxMOHEQ147TzKUKbQEWQtecILNCmwGzZe9nvLgrOcC9
	U3aoCttsV6hZ7wKiCztRqUnkc7RsOJzz6BhfHqLrurnOYTt3VWZyxrQ5/0Rt03osh1mLspgdVREGy
	2urxhoRQf1Z5EN2arn54n5AhN+nj1fbhSzkFuJgLvXf5GVV2TCNSLPxvWmj0z/K/OJ5uee6t2on12
	SvrkX8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVTG-0000000ATrJ-47yB;
	Sun, 01 Mar 2026 01:19:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVTE-0000000ATn1-0Sid;
	Sun, 01 Mar 2026 01:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B12360008;
	Sun,  1 Mar 2026 01:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A342C19421;
	Sun,  1 Mar 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327983;
	bh=uw9RgIhh+6BpeHM1xiuV08tSbCTpRmPdq2PidWCzaOU=;
	h=From:To:Cc:Subject:Date:From;
	b=H5CWQUw8by/ybMyb0/JCjhjL7T9RS87xM/ZjHHaOr5Qq64Z7uboE4qbApBR/M2dd7
	 Mm0uNrr7bQY7qDU/NfgaxLNbgBpC5o/cV2wmUBo9r1CFqUSCQAfhRvYcP3G579iYRw
	 Dsfk5oSAb+tEitPCmLqEKfZxHzrqQE3HIYUrJpFeoGjrXTusjvmAF9prwkf24F1eSS
	 S2XYNLYvNmTiSefELgsUdg+KToB94BkPADAtOAjp9emd9kMNB0A4+QCKrjnyh0CAjT
	 GEuJeUSRJJWrTPKWab/JFhX0u1ivE/sbCaIolZRE2vIjLbNaNa7tlVcxckB+Rd3z4x
	 TNT0krapltALg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alperyasinak1@gmail.com
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:40 -0500
Message-ID: <20260301011941.1674849-1-sashal@kernel.org>
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

From 81f8e0e6a2e115df9274d0289779f8fca694479c Mon Sep 17 00:00:00 2001
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 27 Dec 2025 11:40:37 +0300
Subject: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference in
 rga_buf_init()

rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
unsupported or invalid. rga_buf_init() does not check the return value
and unconditionally dereferences the pointer when accessing f->size.

Add proper ERR_PTR checking and return the error to prevent
dereferencing an invalid pointer.

Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 730bdf98565a5..bb575873f2b24 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
 
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
-- 
2.51.0





