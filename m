Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17516070CA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KokujDKY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/rN73EK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=; b=KokujDKYqsxiT6
	LMYQ17CDloSeOKQGlc0UlfyvzvKBMMovnegoRLfmwL5HkJoQnr5f8ERgGNiASPEz6K3j5MMjI5Dxu
	rDFqhupSccJZmwm1bcZrwYrWZ1ADNde/drrFWsW/dBUibsxRe69wdwFijr42YgilNR3sQ+4KrsyE0
	lfWFrj5WFv8aHZCL4B2cYip/AYs13PBts78rBsySQCfisOUCB4HY8fL8DnJFzgq4FOZ7X9dv9R8J0
	wlPQpo5wmwuoNiEEBqKahFuLQsYmnIbgrzCilqcuvTEt/Jnii5ytdv8xxOB5zAKee1umyQrb4cDAJ
	lI4rHw2wQPS5PdknGP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRW-0000000HONb-0PgH;
	Mon, 02 Nov 2026 17:03:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRR-0000000HOEK-131x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4395d31228so499093066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639007; x=1794243807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=v/rN73EKQ7Zvv6tTI3+6lZ+LPayDadPwCYMa16sFCZ4kYYlmPM5ljA89BMTUpjuVyd
         iMyefGvC4BhfAtaTmVhA6dhbci8yDqtGtNXzOeBt/nIjgOWmY9KSGPK+putkhPwxE7ZY
         ejkirROiIgvYaHx2dUNbfxUbBarjAn+1gZjsRQXsdJTpEyYHJtUuWVWkf792wRtTK/II
         z0idu6Xru2hxnN1h9MF3ohLGk/lKuA4Of8+7hsWES4OPBE3x+Clj3B1hDX4j9gKWR9tX
         sjKF8q8RFoAV86FtnxipKFNbukNRAarLsRr+3IxBTkRzdgkUbO2hYzCfn3VEgl5wv/MP
         46hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639007; x=1794243807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=n7ACNNd+hgIbhM4etqqgQRf1H4tQsWMnm9Sngpy+Oy8yIJAC+rx+a1KmVxmS8kOCoT
         BJgeuuI3fWuO9dVyHpplc12mcr/P/Hs8ysSbfQElTVL1pm6EfboNUJrhvi8Z7vYasC35
         Edz54PZts1phn4k8b9g+a3SziQkiIxzDY7QU6YeU95zzrRT99aFvqVBk8CFe/N4qjdQi
         xkgwWV4tvl51DDVFfhmIfm2LNtSHwpxznPwFkohvtPIoHk6D/Ug+lg/4jo4sUPmiDE0I
         X5slMCFkz+GFcbRce4+M9kErSpaMnJ+T0sFzE7lmviwkW5fGEn7E5Fj5sga9BJ25BXf/
         gtVQ==
X-Forwarded-Encrypted: i=1; AKwUvByEQ+Cgfo1Z5tsy3TzJROCcXHBFkouoh6S8J7hggDdgiT8GoRPQ08lPrAvxF2yctgszInLi0xpEtqmxC/EoHPqS@lists.infradead.org
X-Gm-Message-State: APuU4Z86RtId9hWUJG5nToZ5GvYHAvqDryRK+4bda01/m96vdYZzI8uT
	gQ8TZiR8COiscVmmkFMuRfGmBa1cR5LETT/mzWzV9OBGDcV1Ky0BzOOt
X-Gm-Gg: AYBFou0bZfgjgGVFJkA9tfJ2O5nJyHtqOkPqnbInHhBPHwbmPZzZttRRnVmOTK6G12y
	QDN4zj6+qbu2QELq/PwfhtU3jNW7fIx07Y4SVElu7cjwvZm3WaHwdL3W01eqrObTo4W5PVRpkf4
	Iaepbf19oEqybooys2/bHEsHwE66BsWfBA5ZZZFQFxVdWAWGo3UtkEVSiVH3sUd8N0nakMb9auG
	wTlSZMUlVGH3osYDSouuJTx/lLdQ6uV3nX5g86IMv2Q86X3vhQBYp1NAQ3LwUwiBGZ+4DPJFNih
	0hTD44+mJXsyR/hkXns/RsVo+fdtl8zexjRWoot60E5vZrfQLtOzDPhKvuJ8QqZEr/Yp2CZQ9FJ
	pYcXzspHXDyhMQkajtiifxTgBGySnYW4krVrFzRSS3ScxcXQXJVSDuauVsOvOvDwWqGw5qx3yG7
	hkkGEl+emXr0fs9/6OVVXLMFQBWYek+/by+c89dkcXrWNywquMx3qAmvCep+fre0XK3bpzMq+j9
	si5HYFVjXe7qJCEyc/LKXXG5ArdOaD8ZY5sKVe9AP54mxexsNzAYJaU8Qe9/wuFEuG5Qvg+b4lq
	s9BsM/GyjYzB3yMjCbdCLcIfyHOeMhQZjKyDsOSaLI4vrlE6A8bW+Li7pQ4+DsaQeKw/j0X9GkM
	p3bAf9yxVMeRkTjs4gVQjjaGeUdIcrJaoiX8E4jogO/uoLzljW1xTsDDhDN+QC9Y3X4dDDPR8oX
	zzM4D0+yeVOYCa5ACQe3Pm5iu3UiFEFftETPxOUmh8XA33eRX4gKxTHbJjlezgLwBnLwm4TT0aQ
	rrQQqvn7wrJL0hALDVM+4fN59p6u8eAMRqdwMfvLHx0rJU7MA==
X-Received: by 2002:a17:906:ef0a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4ca7a1997amr921711866b.12.1793639006912;
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
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
Subject: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  2 Nov 2026 18:02:59 +0100
Message-ID: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090329_636890_477C3D6F 
X-CRM114-Status: GOOD (  17.64  )
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 4c8accee5389..0a2f8e77fb29 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0


