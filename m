Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eM2tfDLL;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BWYg622k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=; b=eM2tfDLLo/ibom
	nb2ouorlzUp7qWJ+zu5MdgjgQ7OVWs7THJ/qyqS3tS0EinJfOdgcE/TP5douFb+De+AS86Ja6uBc0
	GTjz4nmV/iACDABEQJPIgZ+glrYGpjLZBUw916Ez+J56o+/h7LVYm1MRL3ZPA8/TT65v+CxpSq5Yb
	SgGj7eI0TSFJZ1dvaKtKqgr3fcG8gRRFqCqVwtBFNetipDjNVHzZAsygZYfqdu57E836HZqtN+l6e
	pJRm50D4V7DWRS9jfGSKRpPOmduXmSoV/umj19HVcwDuLsPCCbqBfsu+wAHeV0KZCKMe9MJQAJ+YS
	5Ze/9Lg86Fd4dNJGIi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA9B-0000000FpZ7-2wIi;
	Fri, 23 Oct 2026 07:57:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA94-0000000FpRj-1TnR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso371361a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742217; x=1793347017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=BWYg622k1PSaf70JhHJVQ3d8uRvABGu/fnsE8TMTjMcWZPLLGMi4t/ZYisFzkaSvu3
         EyfZEYa633GQ5gOn+wRucSypjSrn/96vJkbbW4OFRz8J/k/+zgrFiDuR037KgFEa+IOw
         weJcYuYlg5FzsRXS6hW5GtEfu4hTTB15eVijQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742217; x=1793347017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=xR40LJ+zQHaIAKZGpEs93Q7yM1COLNa9e7nLcTojwtbjZwHNHwMfrH3UmIrGgiFza8
         5EMhDrTXfYHGoRazaQUEnThKhiB9TUU74fWyZu6lwkCpnI4RLC9BOj0ZPa6XNa4HiR8q
         A4Tm6ktm6NckDL3PqWzSxLWsQuDgQ8BwZr2Bz9xib4W4tpW6eMSvr16uZB+/KXT+xB7A
         gev2aAH8KdHzUnQiskJLYUFZYOsZ0CSR5Bil0RAsnWIH2Eq5dspnpCO4OTIVvBtJybQo
         EziIG6JTH7NCtns003ezKNIHr2jKbrw0/mtTRlbLHgAt6d6va3WhR32nxuqahbcRDoEI
         eS0A==
X-Forwarded-Encrypted: i=1; AKwUvByrM/Rb76zoNMNzRqLRcpxY+Fys7+GwGj9CQ3EKAWgCXqvqfTnP8n4YBADiOyhEnhIfKgLSVDZsfKvM+4mqawUk@lists.infradead.org
X-Gm-Message-State: AFq9FYL/h76O5d0wRNbr05jGqxsa9tk+sY2pUAysX8qUTTXPBqXHUCHZ
	P5IJ36u4LteNkOFOxoEjEuMVkfT9tX2PBPK+iE7ahx5FJLvgHqNUd7+UlxNIBIvE0A==
X-Gm-Gg: AYBFou1zQvEEPOoWyQuquBivvpBO6h6HFIN9KezVVIEASao9V3Azu4zwiLkjmHTOj4X
	8f0fFRrESCOZxvPBCQvhS7O5vYlj+QBS2S+jm5fYWPhoN6+QC6TPun0kUugVy6ES3H4FDlTXWPC
	I4uR1PI0CTkuYS3+65z05v3q3UgzHRW3lVcAUuu99tjHXvLTN7RiLHqcT4WdoQhp+zuvEgJjy8q
	udPC/BlWBbuMiNT+4rglMcIEyfeAZMHvt0ohG25ioM1ekDlYUsus6mviJxktYiFuGNxT5fHpcbW
	pUF9fvulBXCfJdYKP+AR8qrroivd3s1qDxETKCdF52BgIUGz+lTm/iTVvzh5hVCNs2ictBL9GCu
	5JzHnnrGKzdgjOhZP9wDXYLUEdAyiNJmR8n+RvtOmdF+yvEn4jpDkbxw3T8t2H8lfwdAgL0ou5T
	NZQybTUA1fdvkgOX7u2hgaFojf5EZdMTZlmI0s8HJL1YWMwkbO0228p9lkg65lgujQiBjXgBJYI
	BIMdj7kpBiNj08WHqu6fuiWQfC12gOnY5hgKJ97BHlYorzInQNUsIoQpIcwk4aT5HlyFqyDHiqz
	/up2IE3jCmXAs5pSdOYYkdlEZqVwfxQPVj4nGI1vwEM7Bh8LkKcI9mew91zq
X-Received: by 2002:a17:90b:3143:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3adce135020mr1195926a91.63.1792742217327;
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Fri, 23 Oct 2026 15:55:19 +0800
Message-ID: <20261023075642.3671805-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005658_445901_CECDA2E2 
X-CRM114-Status: GOOD (  13.67  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
If vb2_plane_vaddr() returns NULL because the buffer has no kernel
mapping, the worker finishes the m2m job with the buffer still at the
head of the ready list. v4l2_m2m_job_finish() then schedules the same
job again, which fails the same way, so the decoder never makes
progress.

Remove the buffer from the ready list so that the job is not scheduled
again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
back. Print the error before that, as the buffer must not be touched
once it is returned.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

(no changes since v1)

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..a4cbb7c76998 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
 	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
 				  src_buf->vb2_buf.index);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-- 
2.56.0.257.gf7497c7d27-goog


