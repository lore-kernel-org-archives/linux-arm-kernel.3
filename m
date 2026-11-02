Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1A60AED2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZYQ418b;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYuK5eZ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=; b=XZYQ418bprcJdW
	nqr0pXjEoUnyUX9ybECWdMjqYKQza31uZuuKHW3WaH8tgs2l11c+ZnONAN8CuIkFzkZ20cgaXqJX5
	4M5s4T/8a17xIS6ZQZvYH6PTeBx+/TOuLqpc1NMqJ+HxDoNW1Hyx7sC+DChK+Hmy9sIByjt8IAXtX
	rOX7MP7ShYljKjFI5T4Xi6BPDRlBBoQoS6hf9dTrMU1JvBroUCuJ0XW4LMvgN5ZCfuP3JSbG9ridN
	kYz0250X/BNOaz5WDA/2lxjMHUkiIPXnypVMWlP56Y2fj2kEfRIpG3yxOP4azKxOB10EfvQNOHg6U
	zpFP+UP1IG0TbD22WP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRO-0000000HODx-1o9B;
	Mon, 02 Nov 2026 17:03:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRL-0000000HOA0-47ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1645231f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639002; x=1794243802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=DYuK5eZ01TsXqhzJyttCCs/6MAUJDF0yRhtFNAfwikjUmYi5b3RsU2UeCsJxoFuar8
         D1bfuL7gAjQoprSDfxkAjkqw+EPMI6eTg4UH/ZLFhnQYu8Ie6ENFvOUS01ifkxfG3fzd
         Rop+8bsPojRdkdsmXi0QstnNVrooUTux+olmG/VVKK2NKtb8vRdF1UZonyhCKwYvxuva
         MmLPInvqqYZwjZTNS+gFwg/uV8fRgtjSzzSNhGsh9/G3LIYjBhyKxL0rd6csj4FIx2eC
         occyzVdaYT27ZkOeJ3y4+RRXbw5E/KQzX66215tqsSCrohdTyzShSxi/l6QgdlnKs1zP
         XPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639002; x=1794243802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=cYTB4WzNERAhFeEQe1r68YbKcPNF3V4XWjvYZLseUN9Y9xHIQCG+6Cnu3Nwwqbq6+8
         zD2MQ/n14D3vx5EWFr9E8/nHgJxX6UKSEziC9VIP1V5gGG970lWCjzUo0InUVSlgfN/I
         qKV1pJ1Twh6irlKzw3rOEenj/S05YGztoGH/9hL2YiKbVdVAGauHBZ70igteYIrGZuk1
         /9G7jUtvxmMhRgYUo8eo1fGn/Y2O8Xu85ZugO08OQdQJsJo2v98g3M0KQVyI/NCYt5XM
         1iagc9PjO3P+VuQzG8qRvJ0t5wIzm0k9n4pE3qM8/mkjSNmtihmb8KK2Mz5BhVzBqjxV
         dQ/w==
X-Forwarded-Encrypted: i=1; AKwUvBygAHFIL4QxEBCxSaau1yum0rB6f9dYldALo7YfjR0duMS3KWuZH26dvGA2uqrjmNKHmdyRnmcb1GAZnCwDwDN1@lists.infradead.org
X-Gm-Message-State: APuU4Z8Jv/f1F6bDAOUqcplM5+/sjOQchczkyOcZWWu/nTALMb4mRINb
	9S7nYn2FZqvuVmiJnebcVseBpKu8ZT/QCxjwcwivhiLb/fQLMT7U3eQO
X-Gm-Gg: AYBFou2yAKZYbbNuTUr1NT+lbubGfWxopF5lK+O9NBw7Qq5yMqGsZN5Nt0rj7G063QE
	6YwccEVTjPim69JKSLDo7h6XNbGbC/ybapjle+5NAkh409VT46QkRMv0FQEgjbvFg4ZDqqEP3XQ
	Du0cCPWLVH6u8J8xyIiBMSmb8BfmuTj23J1WHN9TgmFVtOEvuUPq8jJSefPxcmDbCG+EZimlcX8
	WWeXZE1w1QSfbmzuZZpzSpop8s4VfXWUN+WKg/tLAEKQwQER9QOHBXixF39kfG5ONX0h+VoD5r+
	pTT21RCNHbZ28aggUebMA2/6TLV7SOwvx7yG27AV6puFst0NCXUeT98O9NU4aBRm80J3Cv/IGlz
	ZJL6OFJkDtBQTESIFzn4gIEvTMGS3OfulR33ZhrJ+lGMvjepbfUs5HrgxIdbqh36W0n/47eMKLu
	iYspV5gshLUXXouTzxCeAfhIJM+2XqdB71zZj2qdd/vvnMYuEdUxbCvM9syTzXF23+CkZ5gBCfV
	ToFJ4V/dqdVWFqYLad1wGcg2isGcLQzIBz914DAEhAZUcwVmMMirLdAXKN5w7zeA6z29yDn4PGk
	PI63pTRSkYdSadoIBG50LWjy9EPT/5pkf1eDgLgqhjLuqvL/EOAKQUulYZhzVAneLsBcybQn475
	L8GxxKTJhNdxxkVAnup0uQhtF+o+qnJ52k/MX7TkUH4EBhCA6Dlh9Mcty/8hY5vHxz9jDfH3ehC
	Zg00a7TsNkYOiZzr3Z6xDSsv+UfFKOvhYyaDYwCcb27+s2/iJW/eZPIVxvmnZM08StTk0wNXOsN
	w29jKpgJh+QbcxK7AIBb1JqwXz1DoaTX95NrlsH3Ww3j9sMxgRH49Fi9kcty09KVeAYK1o=
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr22985553f8f.41.1793639001832;
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
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
Subject: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  2 Nov 2026 18:02:56 +0100
Message-ID: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090324_056145_BAAD65E6 
X-CRM114-Status: GOOD (  17.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..a716955655f7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				bool long_term,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info, ref_type;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	ref_type = long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
+			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
 				    &pic_list[position]);
 	}
 
@@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    false,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0


