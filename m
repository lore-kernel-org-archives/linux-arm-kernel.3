Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D68C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZzB0X2FsBXzqI5HGqH1OR/QsRNZjrSGBBRmka+LrH0=; b=2J3cd56y7czZHF5CPRJQ/Bscs5
	YptZEtFvZUtJPwiuLwnbYiptcLp3BAJzrbTM+3e3fshi1BdVdoaGUfv9da2MwTG7fYJHBfE3Z80kT
	gAr1LRHS4C10h/UtGQWLxkXWL6ur0/Vm72bi4/5C3Ui8rYhsY6xI8o3wdyLdA8lMhdjoG6Ippjskb
	uUJHjPf4gGC7wbW00U2CkHCnvJN2YIq9bv3sVgr85/sCaY4B8UYOzqWktbam0Hp1CIIpjOOL4elY0
	FHWyO3AaSx9itQzCwecMfQ96Gh83QXhzgNnVITF1JQwP6YFakFs/h+x2JTHkiABLo/8sX9KE8gtol
	NHNUcy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEH9-00000006Q24-3pnW;
	Tue, 08 Jul 2025 19:46:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDBM-00000006GEc-0IGF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:36:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so34049405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751999802; x=1752604602; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZzB0X2FsBXzqI5HGqH1OR/QsRNZjrSGBBRmka+LrH0=;
        b=cSPKrOH6nb0F6ZFQHPmthI8LF2j3PrBpF9mz/cjPvyjfraezX95mPeVaRwG3YtMtp8
         yrj1tr7Mmx/cNNGySSUTng8IBuh9IJ6wFNSkhFwsql8vM3sIZ056kZCzc5o0/0Oc3pfV
         50v7tw5sBO2FqJ8zlpu653rddZs9VP/WATOlnsrCr+AqkFLsyocIuu3m7fIY9ng2eZLG
         KKAUNDE8QTA9jamVjiCFzEVhJ4XOnqrSg4jAlOeuPMIXO7Y6MDd75VGYix0scqajlxtU
         Y6NrgnX/vYqxoRvbspyPyA+eCzuu4ul0DO8hmVVrng/rJ8T/6T4VwQwNQl/OdmqbmseA
         xEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751999802; x=1752604602;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZzB0X2FsBXzqI5HGqH1OR/QsRNZjrSGBBRmka+LrH0=;
        b=fSn74I2TWYOaKGYq/qk10I+qFGolfyLyLiRXKRcv21DWvriV0HMugG5EYs52Sa0EBt
         71t1qG/gYec0QRRysXz6a5xYMiSl9RbcEEb8wxo+IAaHg8GHLE0gRG6VNI6Rm+z59Z0j
         mD9ADa6O5Wj2bHpqAm7BgPE7BsWx1yovDpJkAV4A/Gsue0kRqotvSt7y9W4VNNnSkyg1
         G4YYTCcMI5z+ZPjqkzf4eCWL9a5XAUZjQ2a2unHviO5FKN/fJYDSxtmL1cjt81vG0twa
         /ZpBDY/dgxCdW5ZAHlZuedTxs2SIftrQ42b2USuPkU3Oy/tGCbbyNp8FO612yeQoGmSV
         E+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4MgsN9gYIArzk7ykih/IGnnr2sRgGIeRkW8W11XnDHEl785Jt7o+vApgY5CyLJ4Or+Cj3otQP2FcM5EDhWAmz@lists.infradead.org
X-Gm-Message-State: AOJu0YyzMPecPhIFUvx7aNJUCYTj3bOpaXyio7xEfOHWjpdfTBsVHhkL
	/1veQSc91gWLFy83EN2s6htydN0YorDTLBhtfMZ2uVeekocoCvDiXP0x
X-Gm-Gg: ASbGncsCpIMSa6iM0E/thUTeSlo4NpNJgOBQYsqyYavP630l8wmftO4+qJ/vK/rKsw4
	/8lhfcNZFrBBJ8B4R/AtuuGempa/O4TSSLRB05mP/OwsTuYCMMCYPpjCLrREV8dGCsVoHA/tL6j
	+fz1d5VTyFWt7OeyDEmR2rRFwq0Sk6LfKiw5t+tqko1+2NYN9v75gWZL4RUchb44b6mXkv69Ch4
	uxs/CNiHpZXoJAMLu/q27fKW96+hYUSihzUqCHJhe/F9wsrbI0/WDLgO14dSkkeGI4idQ0e2KBH
	+QoI6L2z9W84c01/Op7J37kj9eDefbpBwExFvOAV4VqUOtKlu/9D/JoME24hxrUHRd4oW6LInA=
	=
X-Google-Smtp-Source: AGHT+IGzirJ3lcOZbMfjaWTE+B8TfpMfBT54EdWIh7tTV0hajxIMDDBeGmh91j5QzxZyK7lYKyBaXw==
X-Received: by 2002:a05:600c:4683:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-454cd5447a2mr53481945e9.30.1751999801979;
        Tue, 08 Jul 2025 11:36:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5dfd4657dsm2083334f8f.17.2025.07.08.11.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:36:41 -0700 (PDT)
Date: Tue, 8 Jul 2025 20:36:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv
 to request context
Message-ID: <aG1lN94feb4OJVsI@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-4-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-4-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_113644_110862_81A25925 
X-CRM114-Status: GOOD (  27.90  )
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

Le Thu, Jun 26, 2025 at 12:58:06PM +0300, Ovidiu Panait a écrit :
> Currently, the iv buffers are allocated once per flow during driver probe.
> Having a single iv buffer for all requests works with the current setup
> where requests are processed one by one, but it wouldn't work if multiple
> requests are chained together and processed in one go.
> 
> In preparation for introducing request batching, allocate iv buffers per
> request, rather than per flow.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
>  3 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 113a1100f2ae..9963e5962551 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -209,11 +209,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
>  	if (areq->iv && ivsize > 0) {
>  		if (rctx->op_dir & CE_DECRYPTION) {
>  			offset = areq->cryptlen - ivsize;
> -			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
> +			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
>  						 offset, ivsize, 0);
>  		}
> -		memcpy(chan->bounce_iv, areq->iv, ivsize);
> -		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
> +		memcpy(rctx->bounce_iv, areq->iv, ivsize);
> +		rctx->addr_iv = dma_map_single(ce->dev, rctx->bounce_iv, ivsize,
>  					       DMA_TO_DEVICE);
>  		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
>  			dev_err(ce->dev, "Cannot DMA MAP IV\n");
> @@ -299,13 +299,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
>  
>  		offset = areq->cryptlen - ivsize;
>  		if (rctx->op_dir & CE_DECRYPTION) {
> -			memcpy(areq->iv, chan->backup_iv, ivsize);
> -			memzero_explicit(chan->backup_iv, ivsize);
> +			memcpy(areq->iv, rctx->backup_iv, ivsize);
> +			memzero_explicit(rctx->backup_iv, ivsize);
>  		} else {
>  			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
>  						 ivsize, 0);
>  		}
> -		memzero_explicit(chan->bounce_iv, ivsize);
> +		memzero_explicit(rctx->bounce_iv, ivsize);
>  	}
>  
>  	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
> @@ -348,13 +348,13 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  					 DMA_TO_DEVICE);
>  		offset = areq->cryptlen - ivsize;
>  		if (rctx->op_dir & CE_DECRYPTION) {
> -			memcpy(areq->iv, chan->backup_iv, ivsize);
> -			memzero_explicit(chan->backup_iv, ivsize);
> +			memcpy(areq->iv, rctx->backup_iv, ivsize);
> +			memzero_explicit(rctx->backup_iv, ivsize);
>  		} else {
>  			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
>  						 ivsize, 0);
>  		}
> -		memzero_explicit(chan->bounce_iv, ivsize);
> +		memzero_explicit(rctx->bounce_iv, ivsize);
>  	}
>  
>  	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index 79ec172e5c99..930a6579d853 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -757,18 +757,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
>  			err = -ENOMEM;
>  			goto error_engine;
>  		}
> -		ce->chanlist[i].bounce_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
> -							 GFP_KERNEL | GFP_DMA);
> -		if (!ce->chanlist[i].bounce_iv) {
> -			err = -ENOMEM;
> -			goto error_engine;
> -		}
> -		ce->chanlist[i].backup_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
> -							 GFP_KERNEL);
> -		if (!ce->chanlist[i].backup_iv) {
> -			err = -ENOMEM;
> -			goto error_engine;
> -		}
>  	}
>  	return 0;
>  error_engine:
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> index f12c32d1843f..0d46531c475c 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> @@ -188,8 +188,6 @@ struct ce_task {
>   * @status:	set to 1 by interrupt if task is done
>   * @t_phy:	Physical address of task
>   * @tl:		pointer to the current ce_task for this flow
> - * @backup_iv:		buffer which contain the next IV to store
> - * @bounce_iv:		buffer which contain the IV
>   * @stat_req:	number of request done by this flow
>   */
>  struct sun8i_ce_flow {
> @@ -198,8 +196,6 @@ struct sun8i_ce_flow {
>  	int status;
>  	dma_addr_t t_phy;
>  	struct ce_task *tl;
> -	void *backup_iv;
> -	void *bounce_iv;
>  #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>  	unsigned long stat_req;
>  #endif
> @@ -264,6 +260,8 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
>   * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
>   * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
>   * @addr_key:		The key addr returned by dma_map_single, need to unmap later
> + * @bounce_iv:		Current IV buffer
> + * @backup_iv:		Next IV buffer
>   * @fallback_req:	request struct for invoking the fallback skcipher TFM
>   */
>  struct sun8i_cipher_req_ctx {
> @@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
>  	int nr_sgd;
>  	dma_addr_t addr_iv;
>  	dma_addr_t addr_key;
> +	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
> +	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>  	struct skcipher_request fallback_req;   // keep at the end

Hello

Are you sure you could do DMA on sun8i_cipher_req_ctx ?

Regards

