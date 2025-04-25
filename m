Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE64C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC5qCt8mPMFjOd0IN3TufN+hresnNEqhnO+6fQbRG2I=; b=Hu/EE2IDxR5k6dDqmQ/KumlhR/
	mxYWPyD18FVSTT88p2MUKpy/H5ZfWpdTyMkT1gH0BuJi+ZItix+Fqhsf2Zl/mz8sp4JjQ/TB41hCo
	FKS25pFvgoIz9i9UqyPcxNw66UvTBulsfcpqDppgvurnJTN97Pi3NkCQLuIMvAcdpqvfx/pmkXY7w
	U8nI03hanorfSL8HiyeaUNOJDe2PZLZ7ouXqMQG+hjqn8Es+Ouhn0/dhYzuNAmqJxVHsBWF7/I0O0
	kCSJpVKGHcXrmHXLVuVhXI83n6uYdUJ0Oc0eHDZ/gcPXjWiujNgV3RZRo+/IPAQNgIwqWG/xp3kjZ
	vdXtda2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L70-000000004Oe-3IsV;
	Fri, 25 Apr 2025 15:37:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JUt-0000000HM1U-2Oql
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:53:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39c30d9085aso1677968f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745589222; x=1746194022; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zC5qCt8mPMFjOd0IN3TufN+hresnNEqhnO+6fQbRG2I=;
        b=nkEuE0mj9IhWClYh/fYjxYOhn1o94rk6iPL0gGPcYAxVV+PlWY22tE6YBdCbUalHvW
         wHw2v0XkGRO6cP/r+GJSfX1rhQ96suL0Gqpzqen+R2c7utfkAJu1l3Y5HlcyCk1zXae7
         X6+ykxCjrF+sT8Q8jI8PzBFGP7+Azj6Gx+QNqvplZ3pSWkydJAd0GfmZ7GnEQGCAi9Uy
         UHCQgdeCvoG5WGO00Of0R5b3q024wDdAdDi3gvZZvoV58ToKr8KvYs3CaMRIm6iSzdbG
         x23YmrJBMtY9r+UfkMKh7GVHVnqT785l81/mJqs+KugJeDd19SF/3kisJiC+gefNdLz0
         7IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589222; x=1746194022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zC5qCt8mPMFjOd0IN3TufN+hresnNEqhnO+6fQbRG2I=;
        b=DDfMUC5ejd1LSJ7lndlxTU5zpdBhXZ/1q5/CZwu4Saa0jPzyh+WueX3SfAx7ogmpf2
         95hjRsYvUvOL243FcMbJdmIKSXdPnGAR5pGgW7ZRrsLmNj9n1bUk2HdmDFTpWFy9BS82
         JhtoSENq37ffAKt5XEofis47a48F8AaTzIQ2GJkc9RTRgbHczCeGxbyzGGNwrChALuDq
         gUCX1W3EBi0tZbrFu8faPmXrw6nEa7TZZhi+bbKxva26dsE9PWSz6MJC5M8+/LDsPMOJ
         LFcyX2VLG7DNMLA+SjvuneAcefz+76osIPdyJcuFvU4ePc9uf7J7VCl2qJv4408vT+EM
         JCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB4Bk6rXf1XgPFxHY7+F4UI4yF7Zn98CsANdiAtxWGyGo5LxV38g1aX+/bdp7cHAKcEyc2eptBeztA/M+0KuUE@lists.infradead.org
X-Gm-Message-State: AOJu0YxGxh7+Ywatk/S3hFiD7lzUdp1TzwN/Aiy17b6pur2K+8NBgwK6
	1LynAQkqHxYJzZUmAnjwBsJyO4p/m6+dkVj39dxcHEubUCqiEd0u
X-Gm-Gg: ASbGncvkEbM9RJ+pxXqEx2sBSKIZGUPEhwp5F+ezMx9ApAjIyAzt0Ha+/V+gZ701Oqk
	pYIxzxhdXTpQcQ5hTqT7+xKTTX9uJVlwiZel383e/Ndnco3GizN1lw02e61NyUWumtf12yHeCvl
	BLTokvWWZfmuxCh29BrpV66RrRnyx2toYZ1EPWERdwVNkjWlN0b7GkJ7x4vwMMGQm2bjG2o67i1
	Gh3zZBPEN2LYlK8QUVbKtaqNOh97P1tT6at9ytJColldQTxfqgOr0gz3QNlZ7l7ApwyvXAmEvcv
	O7NnoCm/fA/m3fTZ00943uTMwRQI+1Y9M/928Gh4
X-Google-Smtp-Source: AGHT+IGIeg9vP39s+96LGPXe7HvCLrwPRTVeAxK0tbQco/f365rtXoIkERRGnWA87K7ViQhH9sGePw==
X-Received: by 2002:a05:6000:1849:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-3a074f398f1mr1823393f8f.37.1745589221600;
        Fri, 25 Apr 2025 06:53:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm2462098f8f.67.2025.04.25.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:53:41 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:53:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks
 for debugfs stats
Message-ID: <aAuT4z3XC2mayIf4@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
 <aAuOdDhpnLE5bM_y@Red>
 <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_065343_607869_36E1658D 
X-CRM114-Status: GOOD (  22.11  )
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

Le Fri, Apr 25, 2025 at 04:47:35PM +0300, Ovidiu Panait a écrit :
> Hi,
> 
> On 4/25/25 4:30 PM, Corentin Labbe wrote:
> > Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
> >> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
> >> fallback counter updates to make sure the code is not included when
> >> debugfs statistics support is not enabled.
> >>
> >> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
> >> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
> >>
> >> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> >> ---
> >>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
> >>  1 file changed, 30 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> index f03a8fa7bfa2..433cd18f0b5b 100644
> >> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
> >>  
> ...
> >> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
> >>  		algt = container_of(alg, struct sun8i_ce_alg_template,
> >>  				    alg.skcipher.base);
> >>  
> >> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> >>  		algt->stat_fb++;
> >> -#endif
> > 
> > Hello
> > 
> > You put IS_ENABLED everywhere, but here you remove it, why ?
> > I think you forgot it.
> > 
> 
> This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)
> block, so no need to add an extra IS_ENABLED() check here. Just the
> ifdef was dropped, as it was not really necessary.
> 
> Original code:
> 
> 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
> 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
> 		struct sun8i_ce_alg_template *algt __maybe_unused;
> 
> 		algt = container_of(alg, struct sun8i_ce_alg_template,
> 				    alg.skcipher.base);
> 
> #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> 		algt->stat_fb++;
> #endif
> 	}
> 

Oups sorry didnt check with enough diff context.

So:
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards

