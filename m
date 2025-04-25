Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560F9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=; b=dsYwe+E8jpI8yAEP5XoEJ68jez
	PI5Jr4x6xX2w8Y05QSXM5vHZ8gk09a5nQvgOd2MFEj0HtDU8yOf53kjWvGKbc5leSNfWkt1jtRPZx
	Z1baDbEJJOtuKVcpUent30Tedv8ux1wMzFHV25Xrd6FZKeLPEBPaWhwXRObmdTepvAWUIy+akLcnt
	cEsBLhZCASWP2gWyq9Sz4Y4AgjrzihlbkKvgTao3X6t3ugApf1ZqeHC6x+KT1BE/Em9wOFKyueCZ3
	UyU8JwhQ82COTNXsUDujL3eak/jdHpcrHTM4dDLVhksQ5kYK1J8bwQzJVNM2wTNRKsBm2vXflJ0aR
	/H6K0r7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KDj-0000000HTEU-40rZ;
	Fri, 25 Apr 2025 14:40:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J8X-0000000HHmK-2Cop
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 13:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=; b=l/PA8YQWitXKWa0+6ZaTaSp4do
	WfeZuWom+FcU6g4sn/7Mc8eiesixSnKsGJ+4G1iRR6B3Xe4E6cs3FJEMkKm9nkGr8JQy13j2ZNeo1
	d9FceL1gjRlrIakAv95e/M3aFyRK9eqBYCocayc+8vit2nMeZmHjcwUttL+poRmNs4qlQB3XU4kko
	XHc9ydb8lhmXP/c5okbzfANAsKpdF8vVQIiuRS2zmvFE160c3GxpdaGgNr/XY0nx+rA+WRqRWy1AO
	LbUUGiE+8n1iFGJtDkS9HGZNn9ERve8zfmxVILMeiMj4dB0xqj7iLfK0fRyggEGbS3nuYZ1ByD5ih
	rVQVXONg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8J8U-0000000C36P-0L08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:30:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edb40f357so15730295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587831; x=1746192631; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=;
        b=W5E9ifaiPfsmyFKD7617nO4SsnBY5nqZvpsd4rflFVwlef7y8y3QBQVyrOR46LGNDQ
         MzyfO0CO/CsmKBFh9eQhWHYCWk3zBa3iAwdBnGcDAAn73ZfdrXEWXD9kOOQb+WLnimQf
         xDPn9PV3AImSJ0OjWJS4YpwEYb6e3FX+zredoTBKYB4gvy8u/1/hMW7FwaiQfS2iT2eo
         MfxQBS4r/yJ9/08UYxUKK/T9cBhtlyt4lAw/64+a23r14IafCB+Xw7f1klLRfQazWDto
         R8RxiExATErih+EOGIhXPWA8v1AZEg6QL4UQvscRnlq2arTCAk+SKe02c0H2/nvwrJsp
         R1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587831; x=1746192631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=;
        b=EAVMe1yguF6laQV/MkKDMZNqL+OI9deBJV8Mf44YzZc1wLpX4Tp1M4fOMbZrniCAtl
         ILNDsLy29ofQkPXswsYfdMw0CCqUFmoig21DTYEoPaZlDYX641uQJScUCzsXHJGHV92C
         dspG3QjprD+oqw7kUwLlo0YCr84IyamPX23IgDf8IX3UqRgkRgJ+o2BPfRm24uDNOaHu
         AGRLZoHrJBGyv+CYtIvwoYG8WBzre4irXpyRjRHibrZdCk/DJmr2KRDspq+ch1UVljS8
         AJnTGp8oyMK4NCG4T4rWtVwbsncPUF50JmHlxz6KKoFb+PCWqAaLfKo0gcD2Z9lKbwmV
         mYRw==
X-Forwarded-Encrypted: i=1; AJvYcCXQdI8ncYy+FhicFDBA5HDb0XdZYvWoc9gTlFdP9rBUKsWPfQuk5MzXp6KUfxYM6TfZc4obvjPvYFtCEgV4bAdz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxka0JL/Ir+lgB/8DIAUtl53Fw/bC+yMeO6HM9ssEw7NUh2Tb6N
	S7PWrfCvzrpkev86mhDJb4s/7hCFRt4derwJW3etDjLVaQLTTtASvH4ZEw==
X-Gm-Gg: ASbGncuoo/pJZ4hPRaTt2dXhFuvO6f1T9g1LoZe4RDIof5JGQ4lGMi0zUyaAGVH+OfM
	GB7kttUZY7bmt4u1LTmK1V8uAzHGWapInfUYHQ5sFbVugF3SY00X9F81nWjxUSR1NfyQMdoontt
	S5BQ3gY8wiL/5JDSnhZzp3zlLFlh5wYX/623+/tC/o/0TmXevbGrovpCOS3V+hCztd/3i4byEgK
	eewLKhRNgdPsRKbESHqBETkg7JPq64/M3C0OrRS6S+1aeFkVB387NPRWBRAffljGvfdbapZdS7n
	9pzFIHbfrGCBgZrUKW6XbmrOWIXH6q6ss+v3GyTh
X-Google-Smtp-Source: AGHT+IH4MAUOUOX1z32Y5YjXpUZYGNNANOzJfIUTq3LFTRzfoVT+ERQaNUzYocvxmVzREj0gMHwqtw==
X-Received: by 2002:a05:600c:1c0a:b0:440:68db:a045 with SMTP id 5b1f17b1804b1-440a66abaffmr18515515e9.26.1745587831225;
        Fri, 25 Apr 2025 06:30:31 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm58831505e9.14.2025.04.25.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:30:30 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:30:28 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks
 for debugfs stats
Message-ID: <aAuOdDhpnLE5bM_y@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_143034_245418_0C1436A6 
X-CRM114-Status: GOOD (  17.67  )
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

Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
> fallback counter updates to make sure the code is not included when
> debugfs statistics support is not enabled.
> 
> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index f03a8fa7bfa2..433cd18f0b5b 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  
>  	if (sg_nents_for_len(areq->src, areq->cryptlen) > MAX_SG ||
>  	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG) {
> -		algt->stat_fb_maxsg++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_maxsg++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen < crypto_skcipher_ivsize(tfm)) {
> -		algt->stat_fb_leniv++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_leniv++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen == 0) {
> -		algt->stat_fb_len0++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_len0++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen % 16) {
> -		algt->stat_fb_mod16++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_mod16++;
> +
>  		return true;
>  	}
>  
> @@ -57,12 +65,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  	sg = areq->src;
>  	while (sg) {
>  		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -			algt->stat_fb_srcali++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_srcali++;
> +
>  			return true;
>  		}
>  		todo = min(len, sg->length);
>  		if (todo % 4) {
> -			algt->stat_fb_srclen++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_srclen++;
> +
>  			return true;
>  		}
>  		len -= todo;
> @@ -73,12 +85,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  	sg = areq->dst;
>  	while (sg) {
>  		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -			algt->stat_fb_dstali++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_dstali++;
> +
>  			return true;
>  		}
>  		todo = min(len, sg->length);
>  		if (todo % 4) {
> -			algt->stat_fb_dstlen++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_dstlen++;
> +
>  			return true;
>  		}
>  		len -= todo;
> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
>  		algt = container_of(alg, struct sun8i_ce_alg_template,
>  				    alg.skcipher.base);
>  
> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>  		algt->stat_fb++;
> -#endif

Hello

You put IS_ENABLED everywhere, but here you remove it, why ?
I think you forgot it.

Thanks
Regards


