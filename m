Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB9FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=35leeWDAkACY8mrjOBh8zh/YDi5O/guSwDcmYLcsxmc=; b=zOHsnVFWzAI1tVTKZEUCyEoTls
	tf6oF23Nl4GfzCxQ7H1abxoH08m0bsaf6tqa0rjHhjT7Px14iqpQJ7wi7Y2lQNW8iWIORp0XA50YE
	G+TKlNZ4SsbEisBtDbe1RXsbrKNKwxa9DCL93vdidnGo2DpFAvMBoV3c1NCvnIWIr/1aFe4IMmBku
	bE7CKy9tW6yLtbixqGBhKqT9/AETQSOKxKa+052Zex5abXp1HnOW8RJMgjPojPwrZkOT8YkhhxF48
	IfIFYxVO4EPRaIOKqexvXdQvz9nfpU403hw63Hw9I8JPRNrToDvMkmD32sI/XBtD5CUxIL8w58kVX
	OtS7KbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVev-0000000AYkq-1l1a;
	Sun, 01 Mar 2026 01:31:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVed-0000000AYTY-3FhF;
	Sun, 01 Mar 2026 01:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B688441FF;
	Sun,  1 Mar 2026 01:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82511C19424;
	Sun,  1 Mar 2026 01:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328691;
	bh=xqc4gsm8IC0WC7G53rVc9zNa8yoUy6KC05pSWFVjjIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PFsCIFKTI5DKoXC3sdXhdC8EznW31HisGSPiw+Lk3x4vK38XOL8MKhrL/Plw7rb2i
	 S7yOHrpsrFG63rOTFA0RWYHsHuNAlfsn+RUFNrjxZuCly5AlX453MQfUd+4pVuoM5V
	 reR70ja1v5Pk0FLb3xHwFSLyDUF8sp9GSO84tJXvI5V9M4ZV6hUqtDQ+rRtS9EfbmH
	 1wrgqzV8SaZp3kapZCYKp+GJsroyv2Ge5gEimrhTqaX5iqE4CrxOk/sQz/hozHUJOY
	 im9gEi222fG7BK9WCrljb7VED8jKWjFCl6HsetA2uyf0ix7gl8RzVRJXmTOGuuvUCX
	 qR9w6dKsKLaLg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Set IDR flag for intra_only frame type" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:29 -0500
Message-ID: <20260301013129.1690008-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173133_174667_838529BC 
X-CRM114-Status: GOOD (  12.15  )
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





