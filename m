Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20216070D82
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIMk5PSJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kw4YpZmU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=; b=jIMk5PSJiM29E8
	blOK/agu+fjhjHPsrku6JJwK+1XBjzDkAPc9Sn1UuSWQ8SaZG7AQNJU11n6b1qoM+J0sQjU6cUby4
	KTCDkuiKIPmFlgZ96uTfOJJpUHKIXDD5bcRhzepeWKAAMq0tS77m2Ev/4StWGT3hz0toZA5cmNtiD
	nzjOIvi2XS00sbdwYdby9B6NrVZqCFuJ43WFW7wwFxEPe5H6Tf/yz6+Aud5TvxwH6OVVpW1YHgMLS
	aNOI7Gkaww3aTYJBdNT9PL8hxqVrrQgXm+Qx+B6x3Mk8aXooDmVDNO8nrV+g5vXtTnsF/54LmGmJ0
	1b7mzhu6c/KARIp4VA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRb-0000000HOVJ-11sv;
	Mon, 02 Nov 2026 17:03:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRX-0000000HOMu-0Ldb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso20784995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639013; x=1794243813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=kw4YpZmUNfzgJni+j7siWkAOGrkgFFwQ92YWifYNkx3DCR2JwzWIbRIOALZgym+KW+
         AT1nEj0RARL52xKl72jFgLdCQkxFPGTFRFAKJXat9nvIfu/JL5WvGlEqgBTTpE7DveEB
         NFFiaAKq6grvyvmBYeve3ymIsjwOEN7a6mEplSCm5sCOpufnfmi0KatIq0Khj8eKEYMN
         UUkeJAh4CjF22PGL5KOZzrVxDKMMHEDMEX54Gkg5BTAuYiSAYmJ9Ckam9WMLB2uVLB5W
         R6mSR/DrCC4fi5gERKdjDJeVFdrcLH75jCpmXjUDC/UAS2W4NTDVLgKYWLR6/iAEgRWg
         Ut/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639013; x=1794243813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=KoM46JG51vfEQW6UUNeLyQPXLyYBJg79yDrqix2nPM1AEIB0fwP7e03jSdP+DZT+pJ
         5ClmJetEUeK1Dp3sdnU+lrsjJaQMEJ18BLKi5BF611AQI0uFAW6Sp9tBqEHVGz4eVeqv
         R7VHrior+546LUFennApuERrI3TAJowo4Li01l86dy08CLoJguj3caP9hDxZETz0XLEO
         dHlY2yE3J6QLROYW8JqJRgMQ061x9UCPjobVPC1cyBGTp7H9NnsWv11znLGeBNyWlmBZ
         1+RZaqScQYusWWHuj/e2fCrEoNUljEUp7iTYajLFbvDZL97k2k/bzYXBEAUfrK0tziCK
         U+sg==
X-Forwarded-Encrypted: i=1; AKwUvBxQve73ns+XgGZrKZp+XIALo3twFp0PSNPd76oRn083r9SrrEInmYNgBTS42H4dI6e7x07rzJmYG6rDwGtSO6TX@lists.infradead.org
X-Gm-Message-State: AFq9FYKhkJHam9q6dOvd4ioZ8DuTYvYnFl1EimFbguzkQutgfq7YdOzs
	OUIu9UKelJOjogj3Pj9it3gAbee2Z07nbOKcZbjwAqOTsgFtmQIMfTB0
X-Gm-Gg: AYBFou2bXjRDNdoxcLvvwZqAV8E8JHBqaYxJdSNFahTu0qcHDLv7l5nNSNQB4PChfbE
	p5w9OJVOaucWGzYG+xszVLUPTu2yWbTWL9KV3CwrCwPSMzUsAhG/pEiwnW/UNgKx8ltD+EKp+ys
	Pq4dLF6aTRu1VzPpP3eGM1mRTqHEO4ITqVCLH6mv9t3I/fG2Bt904CbBc5DED8hANOQ09Hg6kJc
	VIffANpl9w+rtJa064P1DlRRPs89Ab3IATzI0PfPkT8V/calNh681urEtIwR+3BfXWITo2iKSW3
	FwdMNwScL5zY0139d/Sex9fTcDzF6V9Figz/ePgBcwfk/WggBRCsTycTvB2H2XVTdsM4qa2axaH
	2vkmEYNjYvDP/Igd6Mr0m+SjIjINxBySzyqnL++pZZIHEjMuqAbZeSjvalwy3MyG8b7A5jraYW2
	FjMt/3Ldg2+wF2HWUK61gLdRkjsbQq76QGwTbbJigLFdOIwEuNY99YEu1Ux+8/7dn7JXUD2sC/d
	CPsQEbzblrGS99cSZiU5EVLSyRbM8xEJ7Ccd6yISDi2XFs80ArDM7hieAfNDf1T6CricDUOcNaT
	S8j60Zo5hltZx5yn9XYS4iu1wr6uCAk/aG+HxjT4hpkWGODoCRXMgm+rvgil1qGCgf7tCZLulyE
	N1RnpM4uhWzZKl4Tgz14igpg0Pvad9pl6KeIyy+qmXC5vTtaA29OzvzUh1Ix9CX4e4b71yUKB9l
	EYk9zeMhWICyNknpF+JtCEaoZHGtfp5rpQTxRxOQ3QjlZNMVgUuWaui3muc7kmihqi8zID/zA2W
	hI/wGK4nodX3hVkb+GjFWFlo9nC0S9+yR2nakiJG02/SolrHw==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr244438125e9.17.1793639012878;
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
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
Subject: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  2 Nov 2026 18:03:03 +0100
Message-ID: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090335_305077_5A0205F3 
X-CRM114-Status: GOOD (  15.17  )
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d28fe91562d1..ca4efa9302fc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 6b00efa77c22..954c0ceb98ed 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.vp8.deblk_buf_size =
+			ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		ctx->codec.vp8.intra_pred_buf_size =
+			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.vp8.intra_pred_buf_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	ctx->codec.vp8.deblk_buf_size = 0;
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0


