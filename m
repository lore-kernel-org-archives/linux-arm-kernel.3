Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A98C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKYXe62kLy/PK+NiFHwGFhROYiWY2U4thO9lzKIe64I=; b=SvfXQ0xpM1j83FF4oy38wdMdlS
	P8byuPSsGpR2HCujzE7ZTvf3e2nRcYie9V0gnYoVNvjcBW1iWN4sW+fJLmtjBIckJSgZvYlYxYpao
	zzXk33rWapWwiuOC6hoL0bVzV0LkE6IVg8iLFet7EHcVWMy6AbR84r4HkfoFjfjf+7n6WcVHIV6jc
	OFmrlmPCYI7dENSEF339B9YsgQiXaw5WNwTxKBk5UX1EbNx+BJo4CbykUT0AkB8VvLMVsaJtq9+LV
	umoWuz7oPertb3V7QvtObuiScS+bBG92pLzPYPERKOJGPM36gMScBzlQzjFeatEgx5cCA/jRrkHNZ
	BXc9WzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Jpr-0000000HOsL-3JHN;
	Fri, 25 Apr 2025 14:15:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J25-0000000HGdS-36Rn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:23:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2680559f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587436; x=1746192236; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKYXe62kLy/PK+NiFHwGFhROYiWY2U4thO9lzKIe64I=;
        b=TJNivo5Mok1rUIGD3kfVYAyDRaIl90LfzzfyVUxr9qU9Ztyti9nKLWbBvfPjNgkknF
         wyYon6dW4xQ+NobfWaGUCF6lkTrefjS6iWcQwHb1Gj1GZRt1EU1FhywfVYFDZ8FySZxP
         y3JUbBJ8q0JgsdJjwPUBqf4yNYEoKXOvVuZM3xYxLGEiNgAOf618wcDJ9ccdNJdznxlk
         /I/sy1psyiyQosfIoWbptCZvTjkG7mvlw/htlf09dfyAqjzdJ4oc6NIHcCzzNy4CT0/0
         yDVHzfUCGfTkS/o86zJW1F8yvYMyJ50e3oaSUqXNfWh1167/jWZRDLuod0AF/MF3Drc4
         Bq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587436; x=1746192236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKYXe62kLy/PK+NiFHwGFhROYiWY2U4thO9lzKIe64I=;
        b=VILxOlnnWUISdMMvNKaBTEvsmulZeBVZHqMrGZbP2udD6cilEGWC7qUg9ZihGbv+Vl
         aZrBMH7yz/WAoYnf3M4G4FhhejC65ewZrT7QH29z2jeZkg28YRWOtwCSZadSagM6x2rj
         cQw7BedrJNNVXofTwhMDxYE5X5HAnpz+NEA3SdHyWF+rUqdT2tQswtzbX0o0mVdW/njr
         OgUBNu389DZIxE5LXZ6zwI+lXFr/tHbH2vveL+0isghHnmp4tf5YsMhBrdkUe1rmJeNa
         iSyETK2BcMitkucDTXkZ6j1A6miIG796y7FfSIvvqQrTJs5fLah9R3lykmSaV5Ob9rSM
         xvlA==
X-Forwarded-Encrypted: i=1; AJvYcCWIeFueWnTVtwOR4RIEX4rkEzRZi85jQCMZ5NXNo3x+l4uryIRjhggqQnhkpv0V6JvxX1SMxSIb2X5ok2K8RWcc@lists.infradead.org
X-Gm-Message-State: AOJu0YyB1Wd7ZN+TKMy8OgIvyqsnwxPR2gW8g9M1gHIn8mQdGdTsuy1T
	LdmrPwhxvWo8WumplVCkWiCW0vAGwhI5sRrvwX/wugAHvkMIlEF2
X-Gm-Gg: ASbGnct3Ylwehv3+BUsQYernybb7dQDFEst4OZ99cObEqmgiISa7S2Vc/J4Tm1JmkfF
	xZiC60Dika5fnVLHWtxYglCu9alYGbnFn/bpyMkG8Ox25xo6FrQVMS6MIcQaZr6Pm0MlZbx4SJW
	LzXqbwphv7UNNP3DWvKKJeFMAMgJfVS6ODXDm1iO+OXLMP/Ct/FccvAWN0USoGR+0ZZutlh70WC
	JfQNOxby6LVoL/Nfae1TRml2PvwjlamE/J7MQOZF4+Lu99Jg8oYVO2wzOtK9ahj05OycyB1EfV0
	n+UkKJ6tvP/RAd/nYqYDKemIrPGt+3JKkEAYqdbd
X-Google-Smtp-Source: AGHT+IFII0EqynEWPZzvrGLmpKWfS7u49UoGkuCQiAlKncT8hgoImF1ZrCzzJCNwbFrIyYmCHxOPfw==
X-Received: by 2002:a05:6000:400f:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-3a074e2e6a3mr2130241f8f.13.1745587436006;
        Fri, 25 Apr 2025 06:23:56 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5d4b0sm2320381f8f.89.2025.04.25.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:23:55 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:23:53 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] crypto: sun8i-ce-cipher - use
 crypto_skcipher_driver_name()
Message-ID: <aAuM6SmS4Dhsdxfo@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062357_777061_BBD73246 
X-CRM114-Status: GOOD (  14.56  )
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

Le Fri, Apr 25, 2025 at 03:45:15PM +0300, Ovidiu Panait a écrit :
> Use crypto_skcipher_driver_name() helper from <crypto/skcipher.h>, instead
> of accessing struct crypto_alg directly.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 05f67661553c..f03a8fa7bfa2 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/pm_runtime.h>
>  #include <crypto/scatterwalk.h>
> +#include <crypto/skcipher.h>
>  #include <crypto/internal/des.h>
>  #include <crypto/internal/skcipher.h>
>  #include "sun8i-ce.h"
> @@ -438,7 +439,7 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
>  				    crypto_skcipher_reqsize(op->fallback_tfm));
>  
>  	memcpy(algt->fbname,
> -	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
> +	       crypto_skcipher_driver_name(op->fallback_tfm),
>  	       CRYPTO_MAX_ALG_NAME);
>  
>  	err = pm_runtime_get_sync(op->ce->dev);
> -- 
> 2.48.1
> 

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks

