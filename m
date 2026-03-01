Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730B1FD006E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chfWZCrwegHuS+IaibQUlGs9qTPZhd3l1r8kvwtttAg=; b=HXkiLmwsF6SL9lBswzLQ/z97bX
	GhGC9nAfEQWPRbw+CorXhc3nFpds+W2aOjH7CqSfXuTm0YmDEH9atqR6QoqS/b4zuBX7X7ys+P6Yr
	UqLmQDP2YKtEBWcoYoOkTWOsvrsHWxZN4ouSuzsutlfllz8Sbnp1uPUnNJGMEP1XIbvn3xRJP12UC
	clyT5LCiM2TZQW3DZ9iVwHtVZZgxURXUo2FRdMeOZCitmEf7XI3enEdDHYSs59lGg8WzwQN+8/3gD
	E4DPVKSNjE9QdO/afv5+4VeVX6WJHM3zZI9fgSn61uJJDGEAsWDOhoMz+uBY+wuiXGwJDYiPFOq9v
	nbzH5A9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjn5-0000000BfIW-2a3z;
	Sun, 01 Mar 2026 16:37:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjn2-0000000BfHy-44ih
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:37:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-389e71756d8so61084051fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772383026; x=1772987826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chfWZCrwegHuS+IaibQUlGs9qTPZhd3l1r8kvwtttAg=;
        b=jQ/MeOTb78w4lHbAdYoaYvLg9a2sN/33DcRcW5HjJC2MOTIHkYvz0dc3yNvGvXp1Qj
         cHk97x9u6KLpIaa/wkjfhf5Scr+SJm6te9b0la0ZVeP5yldM+6nMlXIiW9JP35jUAIxt
         WaNfnpojCVIP6EhicNE3ULpT2IJpwlZUMMhuTG+6/f0H/w38ag65qIcm69JijwzCuX7z
         1t9ItajCQaty93jamXJG377cf8ZGYCLgMeQTFlWR2HCF4chEcb8hc+FiMntEaqSqrFWN
         wFEZl1JRwmu7CAgVrnDqoKgCu6AS1OfvFXAKwAjCahnc2PA7/M6yL11riH64US6oD+oU
         6f4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383026; x=1772987826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chfWZCrwegHuS+IaibQUlGs9qTPZhd3l1r8kvwtttAg=;
        b=HoFazx5Yzvih5kykRBRlUSR1KdAKHd+S6fBoc9dkwbXY4WtPAzf4cgajhShtiFee75
         KcIpsDGgBN+j2QKbY2LZkPWGXfMg78xtydrxHOv9fEMZotZD9GC4kujBH93LLoCe6NNL
         wX1+shDFtSsgFi6URsIlbgUnLf4rXmkr/pghT5aefnuWE5sVWgv1t1r17hN5Og15Wwyd
         hKLIIvVL0/6ZfIVw0af04AX0+mBeg7+Q6rEfevzbIGwTNOzK27NZ9+VsYQOqzoxHM6mZ
         486xGPYWqN5hD7QVxYz+6ZkrNyZLSrDx0iDW0RMBItRlzAdLgAMmDr7PSrgbrRZWHKTH
         evVw==
X-Gm-Message-State: AOJu0YzRIS/ce9yhWifBGmUvd0yO3BEqW8Jx3qyQBYFLe3MifDNptmJI
	9Mg3YqWH5lPSI/5GxRfhNK5YocuiBR6aKP6Lye4Eg6HrwAzUbxzCb1Ha
X-Gm-Gg: ATEYQzxZSHU7D7jXxA5l9Zm0zedkb2RIHD4ltdZtn2lbC+Z2fQH1a4W1LlgPu1eL6Q8
	1tfFQ8+CbaJH3tIODr3B4p0+R2xLHXluBN/8lr/3sbRycbZ2g6SCSMPsQUk23HRVQi0le/5kSOo
	sgBMDGgeTaTb3iKnw36+N1mAZverwTv6eA5tsSmHF/rHNap+f83Kcx4L3bsP5vK525CYkb9L+4t
	lYjl9EYqGgUuSU+g0R+kPL2NiwXkc4ziaTheX43hkzVq83ihTBJWqd4Ctz0sJEZP95/fCdzsaw4
	o54WIF9OXE9qPYohzUoDwMiVUVi6My6cdHZi2cIR1j/8DDIh5qnSADiaaol4S8SmxHMmtJFOJf5
	d5svysIdi2QmL7/4CMLvs9xaiv4iWC7CUSEXqXNcAGQtTTWPpcga0QlqyT4/KSlie6I+puXAE85
	nCV0n39l5fR4wuQBaBxXJ7WwFy5XDJLkYa87AojZCZRLwlt8OOHp5iJ/IXyCr7xuf66TekgHYt5
	WiX
X-Received: by 2002:a2e:914d:0:b0:389:fb69:9e65 with SMTP id 38308e7fff4ca-389ff356058mr42360521fa.31.1772383025715;
        Sun, 01 Mar 2026 08:37:05 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:45b:6e70:24a:6543:9307:8962? ([2a00:1fa0:45b:6e70:24a:6543:9307:8962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd2384sm1095553e87.10.2026.03.01.08.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 08:37:05 -0800 (PST)
Message-ID: <554c1dc9-cb75-4777-ad98-97243808245d@gmail.com>
Date: Sun, 1 Mar 2026 19:37:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: pxa27x_udc: check return value of clk_enable
To: Zhaoyang Yu <2426767509@qq.com>, daniel@zonque.org,
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr, gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_083709_143829_FD67EEFA 
X-CRM114-Status: GOOD (  15.31  )
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

On 3/1/26 7:23 PM, Zhaoyang Yu wrote:

> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value.
> This patch checks the return value and logs an error
> without continuing initialization if clk_enable fails.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..69fcecaf6061 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1696,7 +1696,13 @@ static void udc_enable(struct pxa_udc *udc)
>  	if (udc->enabled)
>  		return;
>  
> -	clk_enable(udc->clk);
> +	int ret;

   Please don't declare variables amidst of a function. IIRC, the Linux coding
style doesn't allow for this C++-ism...

[...]

MBR, Sergey


