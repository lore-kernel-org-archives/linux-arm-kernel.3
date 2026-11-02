Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AE6070C95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtNHPQUG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlqlAvOi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=; b=FtNHPQUGvh/5yb
	XkS2OQT51FIQ0VYZtJXKNfO2lOfPEe9+dsR14+JgZZWg4hT1GGHDGNQxpKtgC+aUKBnxcx4bS59lk
	BA3Wm0z9rlYZpT3aEveZUCeyj4whBwxjqYv3gvCgaGydf5kG+Imk5xpHDQH9g3TQfxzjBLyIXPXG8
	6wMBGGxw/0Of/7oyvWITPXVwZ4+2T2vcpI8RrJm/yh/btTomLVS5XumeriYeHEVCyb52ElSAQVRyu
	6F1m+Y0MdjDo5uNhV8xoWzK2cuIr7hPiCL7tsxVmSP3sMXw+R7J16hUAKjvEBrEpX7i64tYor4BxI
	fz8qde8GlAovLh2+Wojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRU-0000000HOLb-3roF;
	Mon, 02 Nov 2026 17:03:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRP-0000000HODt-37cf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e0d885929so2678830f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639006; x=1794243806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=mlqlAvOiOhmtWb+0GQsklDxzMEVXzc4hiC7HBEUraMjpZIX5SxYjjGPiaU3lYdB9XR
         ewzCm/G9VAwDiA+imKL7aTFs23Fq1WwO+iaIUUwGi9jGA6ezte1hI1B8V6cJXpS91cuE
         W/RyVG0K+qM1AlD09kTsVRcpOl3sCvhOj3PsuAZjiY6RfNPnYzw5pyl4rvuXvCXirwIn
         Gr4decUUx55G0D2lZDbPYJvTQYWPefsoUM8K+ADL5vdODBDa3+1HbA50pNkmQOTeyBhF
         U/TzBrDw0D52lfPzSPfc7cueREj196wytPAcr1laNd56MWv49D8pL51ljg1IW+/M9oTV
         Sqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639006; x=1794243806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=26FtdJJZSQw8N9AiFreo+H3v3j9mtrSPwogXRCe4g+2Va4EWmgBCA2ZTjLqm5UiStp
         7EPb6atuQ1tcnlX4E+ScMH6adWehiSzOfkommjVlnbIIwTw1PM7IFZ3MXYbbIRCfJ7Kv
         f1DyqtSy8hUgpynVNMaXFw74EQexcph+g0bHXNZfn7MjyuAYUcowgUAWBH7u4G7xJFVq
         nIcua3tjgZs3uRyrTfe7UlMVta1bwB8750saCaAU8/gWDKJhAegoAqyNWVRp7KCHdaU+
         gs2nghLDp5fjDKAvB7lemZPIL9dEBt4bjQsTLpiwwziav4Muu2x/vlf8z2+dFtTT7eVY
         bSUg==
X-Forwarded-Encrypted: i=1; AKwUvBxR6tzEPlvr0u8/dbimh4/uwYlXkzsz8huWKE+PFxscSSUiF1WdnPd9rkK6yj1bwfUHcx3VwVkQQ82EHfcVkXuJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9dWRQkCBIvT9tTvmwHYYPPfT/MIfDQRmj1q8+TdGNx1paOcvxs
	l1wisml58ak0FAI41p4xIeZj/viNvsY59pbHZzzhWj9MFlXU5T84F7Yx
X-Gm-Gg: AYBFou2RS7gOmgYEZ58GoO1I3qUY8z+loJeB6HxpY40wSLgEWmqf4UojRBFafQuP5LK
	IZT+JKq4jFj8tm+jzBVzHYC6WxoqQ65cSnWvOTC6uEe7Gry1VbDP+IyWU3+YV9IDCWZ/behNlKb
	0QenjhvDphhsfeoWzH343y1Y8+EfCAEG1kKzkffkd/85mlvrwJhhkMNDDfQaRkYmVpZLRXeQZZ0
	HY/IG5RzIP5HjehFnzz6YSpXwqo2tywqQofn6LG/tsQaKRqHeIbR8X9N5xP7x/nu+vRIOpLfKBd
	+Hk8Eo0iDh80xpeRvMv9Rl+2sQHl9oGRDFXxH90PbO3cWd0pyeXqHWX3fSLumvN7etWPs9l38sw
	JqIQVTUQLUa4EgG++8P3o8P+/wzyky+zNCyujyIuu7HJsvcSDH0H1/hVdtHPNPfAaxFzxZfhHzs
	ostrp6X9KmUHDYnQgrjkOf4ltTEQ02TPCvBlyKzEeGG2+aYSgySvZ0tfJWipz8+TVVmLW6/fYjQ
	r8WSslfp6/Z8y8MtPoUrJGzQWU+5P/wv4gnjJfT6nZdH+FJLo15G8BwA61L98mKBwCXuapASODr
	zMNXxVHav6yevUWG91Fe/vFUyUC3sTD4ga5BwE0sSeFNYVScAcnd+CeQXyFdIbwNbDydI7+D7B5
	oRMNdL1VgGYABsd+RkFFCZO0q1WJ/abJtBhYWVqsWLCBliMKSxwzLNMGDcPwJXGo9+xH6Xn2M7f
	zQfGOa6bIXHykl1jdEAWBx5gL6CXc0tCpmVYX0Ru4fhqP7wx0xIsjqSHh1XL0N6uheSyKJBy3Qs
	z3/eam0qNpw7qPT1bG+onKlNKaqjLRKdTOeNwm/xXmxzhLv2g==
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e6e4f561bmr25233093f8f.21.1793639005534;
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  2 Nov 2026 18:02:58 +0100
Message-ID: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090328_801308_FAC7D63B 
X-CRM114-Status: GOOD (  20.71  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..a523b56a9b8c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index ca66a3c6b830..4c8accee5389 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0


