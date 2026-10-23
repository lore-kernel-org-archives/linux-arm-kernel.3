Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQ2HIxSc;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8IMOZR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=; b=UQ2HIxScb8I6AA
	65zOP5MGpSn5RfwpABOivpUfqrq5zpKURtx9sZU+D8XpJeX2xAS4vObB5nvBxBo9RcAqbefzuloDq
	V2wUeWq5do2JFNvv/GKO27cV9WcTflOoszVGy4c7P/m2IuGc9PLvGcP8pUQr75RlddFDX0BmkRKgl
	r0jVSfk3gUNBxboxKTn5ok50J5qI5Y50qdXNl0BOOO7ic6b6+E7yEc3OJu4+j1uBTE3KQeweDi/xb
	g8SzNlJCKydNONX3TSn53tDNxa7nTfylxmUE8eLaCJKwMDT3xXXRS/gUP7QKJCgveiubUjvh5gnGe
	L+Geg+nzCpXo8oa/QPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA9H-0000000Fpdm-40k0;
	Fri, 23 Oct 2026 07:57:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA97-0000000FpUB-0Pzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:57:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so544467a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742220; x=1793347020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=b8IMOZR3TZ0K4InR2BNOKJYDMJmxWbIVr5LvYDSwNaXBVu8JBrcMFcQF+ouG8u0y1u
         ymFu5zxOiGz6WHHRq5ONz2DSJ4reG7QwkPME9X7GNnv5SMYffD7deAqketaaQUaBnFys
         VSBFViobp8oGVuQDssgFdLDyH4Aa3nBGz/GA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742220; x=1793347020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=oTSS0KxtuFiYaxahouT8n8qA9B54iXs7SPIKaV6E66/Vc6DxPTbNyx/cfYAMRx9N6H
         YWoVKMKSU33I/jVoI+RdZ+dOj3VdBv5t0i4V8PX0iyMfBqcFCvwfBlL04Mk4UCfa62Gm
         j06XVhqeZ7FizOl0wnuby3+z8VzUorUYclJGHPPUec/eN0uRiM3Z/2xykmaQLzsLKvVM
         DEhjA56zhnWvo6KKlDsX12rndPbB8A5kKz4EQnh3IU96jRSS6A4bkZSMC7V5oJLs+Qbb
         fOwWuZzagkOxGi3F0lDUfeKEF+gOR/F0x43+V4s3/8V8kl6nnlCMFZDbSwweW1fsCQkj
         ISmg==
X-Forwarded-Encrypted: i=1; AKwUvBzCBx31gj/o19SZq48SSGDzq3LdTp63I9YZNa9MclDKHXj+Q4VaEPez6dXQK48XJQhkznfR2uVF9+qmDwKGJqUL@lists.infradead.org
X-Gm-Message-State: AFq9FYIABVq7key4Z2jC2TP3pwJIWX2lSc/dt+RhjKRm/ZN6yC2W7wyS
	XkKJGtT2tMvu7+qeqWTe3LFh9x9379I5ezg4aumpBpxWRVIj45Wf6AwIcHnMbmujkg==
X-Gm-Gg: AYBFou0P7cb+qreVSs6Oeyu0YeYjB07qdnssyfnKDw/NUpa7Xdkb4Ih3dAEmMRQSagj
	hklvVndCcO66s6YEw00ya/bjAHqHXxRmMLuB6woYkowJX2Mh//4Utbh7rLooAkdyWQkTWLHdVit
	srbzGA7j3ZmotgI+gt2KtDmKhBtG4AC3lcxlIEJPFTSl0xbLsd9/9GnBOG12hUjwPmTjdYr5SAP
	t7MRM16WPRj4aLcDzvUSEFstsl17hh6vI6v2P8W56wON3xIUv7jP55RwScnKOFxDCeeu/RMHquV
	8a22D6RYGZ6vdQ4mCudaauwWYIZXMLaPEJEE5oITj3DqcJGASgK66BY8aWwUgBRjHcre6kSwK2m
	g0nvTGfGJakA1pjz6D/UF8DJGhz6BUYehbNFklPrxshkGVXfRbVk7bnTW8Pg3kiEZJTxQbtgOqc
	v1dXW5zBM4qI/UMDPyUoa5ylVC4xQWSoq8njTXqpJ5RCcM7kfXN9m/ur4aKbxZ+lCErzrCQGIHp
	Af/fVPQkS5+Rz0T7gQ2q21xWvtHWEncff4Ohbb6ue96iIE9hBSxqUmOAt678amG0lBobwcvPZ1/
	SnY5n9XTaDO08JV4orhqsF/q9zM2F2GNtZluX60=
X-Received: by 2002:a17:90b:4a92:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adce7a6682mr1200815a91.22.1792742220188;
        Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Fri, 23 Oct 2026 15:55:20 +0800
Message-ID: <20261023075642.3671805-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005701_175393_1CF10A5D 
X-CRM114-Status: GOOD (  17.00  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Remove the source buffer from the ready list and return it with
VB2_BUF_STATE_ERROR, complete the request controls, and manually
complete the media request before finishing the job. Look up the
request before the address check and log the error before returning
the buffer.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..402d20572f2d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,23 +342,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
+
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	if (!bs_src->va) {
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
 				  vb2_src->index);
+		v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		media_request_manual_complete(mreq);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
-	/* Apply request controls. */
-	mreq = vb2_src->req_obj.req;
-	if (WARN_ON(!mreq)) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
-		return;
-	}
 
+	/* Apply request controls. */
 	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
 
 	/* Keep a reference so that if the processing completes before this function
-- 
2.56.0.257.gf7497c7d27-goog


