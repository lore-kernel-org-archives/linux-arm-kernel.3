Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB5CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hZTy5PSuTM5rEw0pIf6nxs+pKdYAXNk6URBgB/E9ySA=; b=Ca3prLyH3TKaaEHDRfpPkhSGGq
	UrVKUBBPurr8DBjjIcIjKKeXwEpdI55qcc4IxTkp08oH7yJ7BeXY0mEbeh7LzHgdMxwAIzokotBmG
	G5NXiyQEw7LGj5EA13y8Ra1lZRFv8puE8Jd9K3Zi0DClyFYrN8CsiWk8TuoebIkeKwdtqNYd05LuK
	4lyvH/tMQ608nnCZtVdCwaP7/8pGXye79bOrApgUfSTtKTqbqqrcVNZ8DBTF+d9YDXeHe85jQtfnX
	CygWMUkmg6WQwYfLei4vKCUl4rm8S8BDkGxrB9o4K0+syeIXSjwZItXrETNDc9wi4SlfKmXlOQrne
	wXnmdOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjyp-00000005xbA-0gOA;
	Wed, 03 Sep 2025 09:40:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiWS-00000005Pf3-2RIt;
	Wed, 03 Sep 2025 08:07:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b76a30584so1267255e9.1;
        Wed, 03 Sep 2025 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756886835; x=1757491635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZTy5PSuTM5rEw0pIf6nxs+pKdYAXNk6URBgB/E9ySA=;
        b=YNzawDtyubX0Dz+EbC+hoD/GsknkC+Ogo4m3hG4r7XYlxkRKQY1g+1OPpNbyzOBTsl
         UBE77ZWJ4LTqf5gZZcyzN2UGu0gCt8qU038Pgpwr8Zep8b7sCRre4iwlF1jxdJJWyPpn
         TpV10CowUYYgVdtKdEpwykQYhnEbKKiG09gZvReX78n99JFalwuf59VeG77+huRkzm8+
         UB3sgaYJTHqW/eFt4MxUTA0ef+f6IB1oFN49R/hJC9I4dbRO5cT0wRokm28bDD9aU9tG
         nrBlowC/BoAMq4UnUeU1Z0FEmLpNyJIW9jqeVbTHZQPB+JR+7lwdia5hN9CJ2S8iRoFX
         fzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886835; x=1757491635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZTy5PSuTM5rEw0pIf6nxs+pKdYAXNk6URBgB/E9ySA=;
        b=OXJ5qHP7IF0dLORnC6LGxb1JgC2IsULMxvNyTOBM28KJ3Avo8k1iACvz1ob2THQHHk
         sulU8okq8MA3uXiixhAjWR3+jtBD+2/6vaBK2F3d+VriyK5mvpCOfUz5kcWelC60cj10
         bQcZDHCzGuHGd56AuhYcwcEdTtNDvWvE5e9JMzi5c1z53tBY07rgkTUWM+PmBfGj01Ud
         ybsm8Rc/SAbEBuc47oltI5/7neGQ72DiW/+EWBrZZGrTmVeKfymDbOJTtQUofGok5Pq4
         ZYTnBnTrtzh9rvpYbPip5R9tqORBTQgvh4iqq92mO5zo76liPW82YGJ/ttjjmEiu8UJF
         ZOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUYIwZ+TybPosEfUZ25Ppg1DV7ZySmUbIvMXH00I806obIgN+pHfk790+pH+r/lKsSS0HuWaiWUahm2ybuhAYA=@lists.infradead.org, AJvYcCXm2AY5Cqr1nqPPTx5zmcH6TAE9pZ5hOblUZBC96mZFdQbLRlXML9lCfoVN2lVWoEhYKYfH5CTpJLe6vdNotAo1@lists.infradead.org
X-Gm-Message-State: AOJu0YzRI87k1LcEyeVQeZo4yAnmMwp3Nwvd5gbN/SwTQhndIpOQbkYK
	QeoTFCR/4vjLNOo53B/zIgV3RY/6ZQdKEBjPO7Y0be2QvPgO/UC1NuMu
X-Gm-Gg: ASbGncuH8LFmlaNI5IFiR6juaYVDLZCWW2WAvHSx8kxhmRDY5P7Z240BqmCBoItuvPc
	qldMZbN4RjNalZUMhokG7puOytfBGA+OUg6BczzBf5dPpBk1NOxwd0z+pwzz1g0I2yGO5L8IX6+
	znh7UyKMpTLJZbtDcyyHsSLCD9K1de8kteBzUUNBe+H0WEqm2bbyLP8GzWydOWSV17QI5WsO1X4
	nn+hc9cn/n0+y//QQcgp0mcX6Wc/JG+HEnSfLZci37d/GqZr7EnYqWaCPyMFt9mqnOTRd/rCprb
	cLapwOON7x1kWcICalzAy1SC4RDyZy89tQFyNsKYjZVSJbDsX5GuCqiYD7Z3gAA1PwkA1YmBUJ6
	1MVEyjXIRH5a0H3lWY4NrMJOuHGDXKoAYwiKPmdiactXCOouiKhiYOPtnDcSxBA==
X-Google-Smtp-Source: AGHT+IEpGBOP1B1Jph5fgexU4vMmswDuYQqgA49JGWQuOcwTIUvg6AkoYPsE1hTfBRhrYgvcN4/h2A==
X-Received: by 2002:a05:6000:2883:b0:3cb:9930:78bd with SMTP id ffacd0b85a97d-3d064dfe9camr6000577f8f.5.1756886834510;
        Wed, 03 Sep 2025 01:07:14 -0700 (PDT)
Received: from thomas-precision3591.u-ga.fr ([2001:660:5301:24:6179:26f2:8797:e6a9])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d3a7492001sm17768599f8f.42.2025.09.03.01.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:07:14 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>,
	John Keeping <john@keeping.me.uk>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: rockchip - Fix dma_unmap_sg() nents value
Date: Wed,  3 Sep 2025 10:06:46 +0200
Message-ID: <20250903080648.614539-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010716_618782_7A074714 
X-CRM114-Status: GOOD (  12.48  )
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

The dma_unmap_sg() functions should be called with the same nents as the
dma_map_sg(), not the value the map function returned.

Fixes: 57d67c6e8219 ("crypto: rockchip - rework by using crypto_engine")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index d6928ebe9526..b9f5a8b42e66 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -254,7 +254,7 @@ static void rk_hash_unprepare(struct crypto_engine *engine, void *breq)
 	struct rk_ahash_rctx *rctx = ahash_request_ctx(areq);
 	struct rk_crypto_info *rkc = rctx->dev;
 
-	dma_unmap_sg(rkc->dev, areq->src, rctx->nrsg, DMA_TO_DEVICE);
+	dma_unmap_sg(rkc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
 }
 
 static int rk_hash_run(struct crypto_engine *engine, void *breq)
-- 
2.43.0


