Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D007E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTUZvAfC3HuCxdGqCAQ+0ClPvsf5FRg9P5yGUQG8KrA=; b=YarPEpSOoeSDyGRP4y9kggog8/
	wlcYerb8Jjv4Ee912bxIqjMrf58INLa3QbQ7S/xrEOkqFiCWY2RVCYaDzcZiOpnF4eND6b47YLxcl
	M+8rFbfpsnu/YykTeu/16hNuAphT00Jp/PFMK8DHMX5VEs1yhxSjgY2+YFmkXTWIR24GwrFoUEooR
	hKjKZ+4Txz/SJSjyRIh7lCgL0F8N2eyStBKKyoOihReuDhJLgfk2gdEOc2a9GMk7zSFeqO8Lg6ei5
	GkQ0++0fykyKyrOCAEcCDm/quhB/dQtU5UNVwuBslSUwLQNbZNDKWebeqj0Oizo9OEftoBjiCFZLn
	nyJR3qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVitW-0000000AY2L-3OMV;
	Thu, 09 Jan 2025 03:07:38 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVisJ-0000000AXwM-05LA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 03:06:24 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-844eac51429so35087639f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736391980; x=1736996780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTUZvAfC3HuCxdGqCAQ+0ClPvsf5FRg9P5yGUQG8KrA=;
        b=WYCV//3rUulZjKiEJYHdEuPTrA1KDvbTHz5UOXRg9x0xp/2ASZ6BxoSFDya95+QcKs
         vDasjgTCexWgLP6kVBemaHkAzBKo5fpwIiiitmMioQ+l/gNoZVdfbuROPeAC+oR10AJS
         S0LoYoA324FTaZk3D4+7OOjU+Sj6l4Sma8k7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391980; x=1736996780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTUZvAfC3HuCxdGqCAQ+0ClPvsf5FRg9P5yGUQG8KrA=;
        b=e2Ceg/zPG0hCbLz0VcsT0P1bA12JAQwFq2rtt3KJyR5B1iqLMHsJ0FKan+KpplIgWm
         Y5XHp0T1OGyHdqBlJFxfj5MKOBZ23XeP8KGcx4+5j6B/PveT+a7GDawMWuANatQhL2QH
         1sYp1enjKMvUX9jbdKQkfB4aZBYXNty96aKb10WKOfjFC+owwkbqptnrAqG1Bl7qOfYX
         nmSiMjgTOJ2TW6w2MAGn3gQGnaFZ/Bec6tQMUWNCecjaOxQKt/2LrgAxSCjA58BPKiIn
         VErHMIy+Qv4YQ9i9xIwZT4hc7wVbqilkIjOXJ0aN1NxECbcWBiYwf6xfCdsg9+8/uH8P
         jG7g==
X-Gm-Message-State: AOJu0Yxrn3CQoSLarWW+0eTSlMR29NXX3+8TW1diWZ356QSBCE9QeC8+
	NxUDuoq8iWauABFsNGwk56EesjGOGZ6aMmDDg1f29K6clZ7SYMAlBM5kLsGokA==
X-Gm-Gg: ASbGncvFvk7lSQH5yDaOpBJJCHtlxIa83iYq0/YaxZXac4KZfRRfhIIeth4PWuH6bfL
	uRE0+rJKalqzbTu4wdn1oKGxe5NbKngDYnJG6xOnqsMIseXAkwCvXmKauNg8v3722GwKx2958LD
	NMjkKhoQ4+tL7ckPWkrhfxyzdE/8p0T0eCee9ssLVsui8x/Fz/bfMElKOFqlw4WnX3BJj6dxsOC
	DjNJ4SmJHV0gk+/gYkC8B0O3W2WRc3Aoy9tYM1mZ6XpXHYH2wtX84F70syMaeoAV0k4RZjpLCwO
	p3tXrdaTVtCzzK1ra1uMlDwc
X-Google-Smtp-Source: AGHT+IHDD0mFIm+x2FLllMlTBSOrRH1d0iM6GMX0L6u7f+zIeXK21APePMyl/UJrekX3J3HBVwuUUw==
X-Received: by 2002:a05:6e02:1f09:b0:3a7:e0c0:5f27 with SMTP id e9e14a558f8ab-3ce3a86a220mr41193365ab.2.1736391979775;
        Wed, 08 Jan 2025 19:06:19 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3ce4adbbdaesm1202825ab.29.2025.01.08.19.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 19:06:18 -0800 (PST)
Message-ID: <229506bf-e675-4f17-b1fa-f9f7d62fcd45@ieee.org>
Date: Wed, 8 Jan 2025 21:06:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] [ARM] fix reference leak in locomo_init_one_child()
To: Ma Ke <make24@iscas.ac.cn>, linux@armlinux.org.uk, sumit.garg@linaro.org,
 gregkh@linuxfoundation.org, elder@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250108033049.1206055-1-make24@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250108033049.1206055-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_190623_065719_AD1A59E0 
X-CRM114-Status: GOOD (  20.21  )
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

On 1/7/25 9:30 PM, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> 
> device_register() includes device_add(). As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.

And above device_register() it says:

  * NOTE: _Never_ directly free @dev after calling this function, even
  * if it returned an error! Always use put_device() to give up the
  * reference initialized in this function instead.

> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Looks good to me.  Much cleaner result.

Reviewed-by: Alex Elder <elder@kernel.org>

> ---
> Changes in v4:
> - deleted the redundant initialization;
> Changes in v3:
> - modified the patch as suggestions;
> Changes in v2:
> - modified the patch as suggestions.
> ---
>   arch/arm/common/locomo.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index cb6ef449b987..45106066a17f 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>   	int ret;
>   
>   	dev = kzalloc(sizeof(struct locomo_dev), GFP_KERNEL);
> -	if (!dev) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	if (!dev)
> +		return -ENOMEM;
>   
>   	/*
>   	 * If the parent device has a DMA mask associated with it,
> @@ -254,10 +252,9 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>   			NO_IRQ : lchip->irq_base + info->irq[0];
>   
>   	ret = device_register(&dev->dev);
> -	if (ret) {
> - out:
> -		kfree(dev);
> -	}
> +	if (ret)
> +		put_device(&dev->dev);
> +
>   	return ret;
>   }
>   


