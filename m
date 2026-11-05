Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC34606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUyZoUHM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkpbX2s0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=; b=NUyZoUHM95WJId
	tvJCj7UZl2t+Mv9mgie3w8yenMa878cWy35b+JmTxNFAGpP9xDdcBVOvu6WVUeS3c3IUj7Zi08M/n
	GYp+kuK46DhooPgEaI/psCw1UnFYFO2zwgTbX/EvTvh2Ps7JpKcyKPHm5n62Y1Zuq4E1Vn22aHPp+
	wNEcLkDjJA2srzoP61NEyYp+w+MzIrh536WXNHqQkfvoVPlFiod6HHILM+jzo8M/siQYf3nDbDOP2
	bGNzfVwJgTHTDkWrwuzZowuKRO5kfbYkPpf2Ao5q6xZVRlRHG4K74gHHwMi7W+G8lfBdMzwESllVU
	nUW7/S6/Gc9UKiJwDELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6o5-0000000ArYr-3rUe;
	Thu, 05 Nov 2026 23:23:45 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6o0-0000000ArTA-3Mgf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:23:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso13837a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921020; x=1794525820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=lkpbX2s0EVIflZ9Tvh8njs/SHvIwA46Aiu0ZDBk+WYhjz99Lw/WxZh/4zhfCHRjZSl
         epFmnPGyvBm2eoHvUkq9yAvH0ymqgmsYy733BtfBc/dNgyBNsUOR+uVPplXadC3tiWSD
         25zSKQtBx+Uv/EmgreOvR44WN7GoySinRjKKZhHi9Xo6KImkO2LGJH6gRgVYenoPlgey
         cjre1dyuspUGd97UQwHVeGJ0ZrK1qTCpJOG50F9v8uc8+ihmCy/skge1iIw6xm1ATSO4
         9o2PRivCyeeQr2kXmaiY+OB0jx/RZKFGAsJ/TPK05idxbKMz0Eo2ZuTWtzgD3pa+ckys
         ktqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921020; x=1794525820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=sPgPsDF4E5QiYxOSttxYak2tW51Pa8m6Te0yVpuZIpylHtGarzUXA36omgtGTriLyC
         t2WicRJY1XMsJQKnIkpmqyljLwRtGkH5eqyyAh2MTdjvGzQAtO/OyQm1LjqzaX31fGQS
         0CISM3T7YPnVv1U2p7urm+rvq1Hj/RBZor8ImFAr4hf19NravNLJqpmztoUewxQ1JB+e
         zTkFLax0qnWN7roqx5N69GqLQoF6FMD+1ofuLex56Qr1PMKvXbQiEkSEmhGGfvB52Zk8
         gsctRZ84eopFkdcNtQ69Dgbo+L5HISsyTMSX+I4oiXvvOq657np0wOb0suECt7EY2HIu
         wVLA==
X-Forwarded-Encrypted: i=1; AKwUvBzPCdnZxjtZUZFFv/NM2BA+N917Gp1AGf1yMzR2fJDmRRkMxoOX8Qleoa4S3ehX2uT1mMzsuEjT0fuByIv9yv/0@lists.infradead.org
X-Gm-Message-State: APuU4Z9crZApKG7CHMAOJ2wmgXu9Ub+8W/P/At6eDObFyRr/3S4FRH7c
	ZcIFPBf/RlrlpOaVs9mo/qpDt0oeSYYHi/gvlq7GE6jXBtMx093DkHmR
X-Gm-Gg: AYBFou22Bi1Ho8KkT/d7fpBAnQ657czYSYPjhrFN9qTMKUeHBX9om+49HcStGaHcffm
	5j+JASdcnY3ZT/s8nBsUjdHkOhsvym20jjLqbjP0tGeEn+K0lh0DStRwF8vR3A34N6oMJBWsYAm
	ZkkioUljKHJIh/0heL9UchGO29Bb5tV6fKFtzIDXtNRRDTe+GKKHcwDHnEFFtwISpJ/H9OtQATJ
	SE7MZjwG8uT+sOgnX1y7z4tAdQrIFsEfJtd71GwkaM40y2c5Ix8wiH2faRm8/vVoibdbkreIpIj
	0fu1SILM369wYlqTcFjxQrSBD0AL6HEWigTw15ePU+UBlfpL3NJg2w2EEpnzxdYx3bw0HMqdSkM
	+HtL927cOeUpEUu9+NrNfNUQYA/JeGSU4juFTlVqD4ulDIO1w605SRvE7RtBI/HS0vHH1lRvwyt
	ESp+aMp975jGGmprVs+peQvZNXqgsyEvMA5BN5RUi+zfwwUub1lF16VKJLmMY3alWVHPD3FyNWf
	6gj6O6HkXZFcFOHI5FdlW+OI4LHFtK1H+JJt5azB3VfwCZt0+Uj3NmDRgbU3XOP8T4vBjfzjJWd
	P/e5GIT7T+kgrNquiBnxwblnQwG6y47f+bzAsPrpihOHviTDmU0JXSCThU1GqA==
X-Received: by 2002:a17:90b:1e4f:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b0db62690dmr1018448a91.2.1793921019958;
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 2/2] media: rockchip: rkcif: Honour the requested bytesperline on MIPI
Date: Thu,  5 Nov 2026 16:23:10 -0700
Message-ID: <20261105232310.385463-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_152340_850402_F37161C6 
X-CRM114-Status: GOOD (  16.49  )
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

The MIPI DMA uses bytesperline as the line stride, which must be a
multiple of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it.
Any larger bytesperline requested by userspace is also replaced with
the minimum.

Align bytesperline to 8 bytes and honour a larger requested value, up
to the limit of the line width register. This allows DMA-BUF importers
that need a larger stride alignment to use the buffers directly.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c    | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index f2a24832a8cf..e50f20e40f7a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -23,6 +23,7 @@
 #define CIF_MIN_HEIGHT	 64
 #define CIF_MAX_WIDTH	 8192
 #define CIF_MAX_HEIGHT	 8192
+#define CIF_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits, 8-byte aligned */
 
 static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
 {
@@ -334,20 +335,39 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
 	.stop_streaming = rkcif_stream_stop_streaming,
 };
 
+static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
+					  u32 req_bpl)
+{
+	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
+	u32 max_bpl = min_t(u32, CIF_MAX_BYTESPERLINE,
+			    ALIGN_DOWN(U32_MAX / pix->height, 8));
+	u32 bpl = min_bpl;
+
+	if (req_bpl > min_bpl && req_bpl <= max_bpl)
+		bpl = ALIGN(req_bpl, 8);
+
+	pix->plane_fmt[0].bytesperline = bpl;
+	pix->plane_fmt[0].sizeimage = bpl * pix->height;
+}
+
 static int rkcif_stream_fill_format(struct rkcif_stream *stream,
 				    struct v4l2_pix_format_mplane *pix)
 {
 	const struct rkcif_output_fmt *fmt;
-	u32 height, width;
+	u32 height, width, req_bpl;
 	int ret;
 
 	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
 	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
 	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
+	req_bpl = pix->plane_fmt[0].bytesperline;
 	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
 	if (ret)
 		return ret;
 
+	if (stream->interface->type == RKCIF_IF_MIPI)
+		rkcif_stream_set_bytesperline(pix, req_bpl);
+
 	pix->field = V4L2_FIELD_NONE;
 
 	return 0;
-- 
2.43.0


