Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC4C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=; b=uKWb7xd6C4KegdAypBKyM+PFYV
	/apma6uAzLgSPbRgUFbWasdIMxf6tF7hqDbxvOzIyf6Xw0dhBGzoVp29s9H7P2at+Ny7U5+dMkeuO
	/AA4yRBSS/q8r6NE+yULzveJDtIKvjLG4vACM61TMw08kEuuMSZfLvAwkV5wwxSaRZODThrc3hhX/
	B0RO4jOxfLdZcYe7MmwTqcq6oeidxwgE4a78M4PArA6kYWIkBpofcVu1q7qdJ8BzLI421CII1fMPi
	XdwwaBGZsbCg6vLyvuHGpk1jzpyz+s6svRdTEkHZrONYRzvQK9iFtMz7D1GTd7LjYVpS3E5hrUq07
	Lf1q21nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw5V-0000000AmjS-0Mb7;
	Wed, 18 Jun 2025 16:56:37 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuLA-0000000AXwV-1y4r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:04:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7481600130eso7738822b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750259079; x=1750863879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
        b=h6aEeHIHRad+IONIC5FvKBUMvQyW7rSfL0DIZuh6Nn70HRi4LuiQhiihhX5WwCuV+s
         FS0WYeivod9KgwqLNXaYwNRoKSzQRTnIk5ba9LZplyHReYqgmHiYjFTjCwVYZAFNBoj/
         7F3+L9KfpHH0VBp+L+33Y0EUhxZS67OfTMtXRz5sQF1bXgAlDHz5smHYABk74ouZIrjc
         XH8/8EYo+U9EKLwyxwATKsp3SI7r6MTANyuQEs1tvi+LU1wjFZn/getdXUdBmBNaEnyr
         0coB72E8QkqBdPyFnqxFGTz2DL/NzkHKi+zoLlnqNU9Ze/U7kwd0ELAIx3HQiJxNfQIf
         xjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259079; x=1750863879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
        b=LRl1XScKHOFjzyvLUWlRSV8JK/Z/KrIDFqJp4zIC5+T0x4i53ooy6kJcbe3/4Z0D1w
         QAvHAqj4Q+FKMNsLA8u8F9fjnezi81zlLGNEggjnjjP+WmyfVw+/VACXT1T2PEiHBvTz
         RoOe2l0nxikWOyhMF7Fpr2NGxNaJTfwtQkPfOjfnwYMMIjEebrwtY5NAxSWTMx9o4ajO
         P22zOs7b6ejrtEUjJ0T8uWhSAFXeKOQICPBc0K7Ra2AWO8d77PwvZ8q8l0ISJS1+3cUB
         ZGTdFdVtnO+z8o+RNjxYAaoihCsd2Tt9jZISCbWFPQ8U7ZpxtFogw3H8+IJKO+/SKGLs
         pq5A==
X-Forwarded-Encrypted: i=1; AJvYcCW0XPCYqIQEbxN2AXHdcHX41y2KeJNTZW8c593pWNt0ymEoqZXluTi6ongw4mcCbfhY2t5qoEa6EnY94iW8BVo1@lists.infradead.org
X-Gm-Message-State: AOJu0YxDnfaTv8w7wZZ6yb1DV6dmCEXgyklRwNDtt7ULgkvrw8LavUcZ
	6bsGSYqedXwG9cuvSR9sEtIrnwpvvyN0ySyK8WbmTE5iwC7x4QfcOboMLdJ5GA==
X-Gm-Gg: ASbGnctT67x1OYcl4ihY/BPNpN1jySWeBdwFkkYEWn+amzpaWQz4JGTMYGhUeqMTzju
	LaqB9P4DDJj9vHV/xpZ50RVHXTej2uoG+ChiRRz2/kWnTBSUuNAMFT3cSLMiTVFXlavP88SbY6Z
	h6TDFFhud1xTwMhRh3Kcb2QU1fSvijova4Ll/It8hxwpR3Cx7ninyoerOpq+MV8RYe8BtEKVAee
	L90484pKr8L79cZc4Gb3AcUfvQBoM/roJgM8NKBnhPu88heDq8LhTfNKp+rsIZUFvrjA4XTbObk
	GyyweJTM/E1cwjO5bCPjKdl3b03wG/xrxrlW/EjWUY+fD6lDrsbVSYxTaH4XlVsP1UtOQw==
X-Google-Smtp-Source: AGHT+IFbMcB+hSk5+yrphcoXGyxnzipWWHvp4gGJiBPM0m0zxo02a1BcE06EDvrBKZqeUdozbvm2Tw==
X-Received: by 2002:a05:6a00:1790:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-7489d062437mr23210895b3a.14.1750259079025;
        Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecd1esm11106156b3a.25.2025.06.18.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:04:38 -0700 (PDT)
Message-ID: <f5c7dcda-d67d-4da7-9b84-a9d5a760f452@gmail.com>
Date: Wed, 18 Jun 2025 23:04:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] backlight: ktd2801: Include
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-11-tzimmermann@suse.de>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_080440_509504_85BEC62A 
X-CRM114-Status: GOOD (  11.19  )
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



On 18/6/2025 20:16, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/ktd2801-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
> index 0489b0615ceb..17eac1b3bce4 100644
> --- a/drivers/video/backlight/ktd2801-backlight.c
> +++ b/drivers/video/backlight/ktd2801-backlight.c
> @@ -6,6 +6,7 @@
>  #include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/leds-expresswire.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>


