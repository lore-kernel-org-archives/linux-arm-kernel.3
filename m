Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C9BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=; b=dCeiaCljV4T+uBbojsjchr/ZHx
	gov+mUxgy+iKW9afbo5X5jqvUQmcgh0MLZaCOGxWt2sohAiKddC/0zK/XLfj0Ok4elqG+Iyr672kq
	4hv/jBe6x5V8LseidsQRdq9YKtnyB5DHIuR4vs01h7pU3y4MpGLgFATzeUoVxe/vd0+m85n6skviY
	eshneHh8glEogt+atv40eSZCppCBoBocCK/M6VkfEyNbT2ouvA16YRfZjc+wYyo53HJJsR0gIB1B0
	JXSv/e6VCkhRYdKMFvyjNqAFeo5ARjSgh8yh1YRr2NFYLOwRmlf+dlC2yLJwaDhiZlRMYaL8iMaz3
	GFczLgCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieW8-000000091uj-2pua;
	Sun, 03 Aug 2025 19:37:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie70-00000008zZL-37BP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-458c063baeaso7306565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248273; x=1754853073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=RMOwQmufGDeRvAFXecI7xW1QqQp6v4lMJ0+JQPRhFRKTUtCGc4GI/olt5wYI728r1o
         L76sbj45pvPAFHU2/9Qy51LEaGplehuEhRi+9rhEN9JAdn23WqB650KoyHBsVkrVE59Y
         MYTcy03zgou9+5T2fW6BhUJxreLsEpTiGM2IQXXucJC3XBGy8KqiM+aUgy8BL3d+mUYT
         90vhTumxlnbMrlUSphrxQ8OA34SPIHkoYzv2fQz4Lk4XrhSyXnpVfbE60apUZnR+Rrvl
         /sb6BifGwa6RdQbc4wxhkHt5DixWySjWKKkzF8qJ4HcvVQFHUT45yXoyqnL8fzujOOEk
         QkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248273; x=1754853073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=IWslrxm0yrnS5ZYC63AYd1VyrL1kmCV7i9y25sGKULl10Eq4EQ09dGFzRpT8vl//kB
         BIITHwH61S6ErXCTCxoghLf8j8OBuv8/UVwzrkKyBfrAcsHHRiee5tRPYJUhTTd40/fR
         wDAy3gTkA7SRL6q45eRbs3/z5KWZMqGUWy9t3RAo6F44XjBg3TrHdObbbIa2br4k1mfT
         wUd8CPhkKjo0phnPtEmmmok58bzjNBrnIbj27ns3M3uW68/k+0XekmBdzAf5pJ111Wxv
         Xg9RJQDTkK6tPtjC3AT6YCRg/Gk1cEzBwtvkMdPwX8VnCIzwkwTEoeXWCmpkcIk9RdFy
         Civg==
X-Forwarded-Encrypted: i=1; AJvYcCXTcz/IhTV9cuWF+feuJGFzaMTQe34upRdU3nwqVJKv/tohlYbJVzZ0obF4v9RTiIsB9e8kCpgoRmuls4PzIk+Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1og4dlC+MnRP2h3PhDpJDCeFcxytR2YZb1GHbzRnUQ6JrA8hO
	75CCwgfMn/3MQT9f/TFP+tLqOPly0GwyYi8mv4WrW98xYNyX9oTIWSXy
X-Gm-Gg: ASbGnct8wW3NmiU1unWyLgyA/tmnvBAl4oSr1xBWP4m4y6PBhlOgR5Ste3bny1ocuwc
	gqXNu73Ka14i0zvbsipDIf8lq42iem1RIVe9FXX3CJXc6kceUSf6wPgrqXOu/ya6cy8njt58LA7
	j20EPYmI+V4cADvQFpxUh4bZvvfbYIcC1R5vZG2FXfghCVdiAu3uXWJ7jH1Th34rPwGimDp09sl
	O30ykHUKnbpb2nsqtw+NyzG+qoZL3W9cZCwlYkfT2PC3txLEkCQTFndRjcZMulHlht9gGaQgoY1
	SnyLMVe6hZWi9QF+Ifi3M9wGuRIlDtuuNuU+AxkLT5wLgA8Kj7UACzq0ewlj0pxD04928R7OL+J
	CrhARrvWNQFNd0hBpmY0PO1ulEoY6pX8hiuECL3ksfb72
X-Google-Smtp-Source: AGHT+IGpjk4CRmkJ8M4LqTsc8/ENOgpA5it89IFM3cfJG0O++/wGGjyhzDfblVGHm0OKLzdq4SaUOQ==
X-Received: by 2002:a05:6000:2f85:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3b8d94c4caamr5017378f8f.47.1754248273270;
        Sun, 03 Aug 2025 12:11:13 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:12 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v2 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Sun,  3 Aug 2025 22:10:29 +0300
Message-ID: <20250803191029.3592987-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121114_806174_58562BF2 
X-CRM114-Status: GOOD (  13.66  )
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

In order to make the ahash code more clear and modular, split the
monolithic sun8i_ce_hash_run() callback into two parts, prepare and
unprepare (therefore aligning it with the sun8i-ce skcipher code).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 62 ++++++++++++++-----
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index e28100c07b86..70c761baf847 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -312,18 +312,15 @@ static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count,
 	return j;
 }
 
-int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
+static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet)
 {
-	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
-	int nr_sgs, flow, err;
+	int nr_sgs, err;
 	unsigned int len;
 	u32 common;
 	u64 byte_count;
@@ -344,18 +341,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	bf = (__le32 *)rctx->pad;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
 	dev_dbg(ce->dev, "%s %s len=%d\n", __func__, crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
 
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_hash[algt->ce_algo_id];
 	common |= CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -433,22 +426,59 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
-
-	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	return 0;
 
 err_unmap_result:
 	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
 			 DMA_FROM_DEVICE);
-	if (!err)
-		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
 	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
+	return err;
+}
+
+static void sun8i_ce_hash_unprepare(struct ahash_request *areq,
+				    struct ce_task *cet)
+{
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
+}
+
+int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
+{
+	struct ahash_request *areq = ahash_request_cast(async_req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	int err;
+
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_hash_prepare(areq, chan->tl);
+	if (err)
+		return err;
+
+	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
+
+	sun8i_ce_hash_unprepare(areq, chan->tl);
+
+	if (!err)
+		memcpy(areq->result, rctx->result,
+		       crypto_ahash_digestsize(tfm));
+
 	local_bh_disable();
-	crypto_finalize_hash_request(engine, breq, err);
+	crypto_finalize_hash_request(engine, async_req, err);
 	local_bh_enable();
 
 	return 0;
-- 
2.50.0


