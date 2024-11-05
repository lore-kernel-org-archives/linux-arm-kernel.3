Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79661D3E773
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eP2/dmGZ6upd0meydOq+bVFxjAFfyWnPqjTOOaybaFY=; b=OvBkHmcT1Dcb+oiKD/R4KL6FYX
	aK97cI6DnR5B8OPJKCgSWYnmYcMevmBsUUnqHSDySAtI4oa69y432LaWWQr6UbJ27xP+RkPU8QmjC
	4lbxCFTNBCzCQAUzbg+dO4/I8Z3FS//QUI+0s7+0W+8h/CrYhdv8hpJGVK4nkIqG4z6cpCGFx+D9M
	EtAADDwjlFqpLYW01Au7mng0theFPnmWHhA3Pc8iCZVavL4q/vVZf62MIzQijTmqI/QhB6M+QCem3
	vAVDyFZIEK45dVbJXO5pli9XXpuqmKbX9NzDNbBVd1lPo4e92iZFoxGWzgpcySOSu2lBzDATviykd
	IaLC7gGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8R8O-00000000rrA-2eBe;
	Tue, 05 Nov 2024 21:30:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8R6e-00000000rY7-4605
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:28:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so373220a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730842134; x=1731446934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eP2/dmGZ6upd0meydOq+bVFxjAFfyWnPqjTOOaybaFY=;
        b=N1CnlCxvzXuDji5xyRXsJfkOEdSmDsIXhXaJdwqbTjAHJ0pgIHpn/iiQb9RaUXZJ6v
         pm+p3Tp3gKwH19iFRGWhhTp3w83ACoRt8FflK5kvkktIu5OJfHEkmkPvZVdjEQ/HE6oG
         f3KK6jB+1ijblxPN1B6QMCMDzkHgmZRN9JfyllWE7w+IeFcTaByQIKWDuEhDG/jpS14w
         ZjjEYk0K9ujyOGDFfmym0fLyco/XlKDsny/dzfyJgcj3Oyc2Oe2LZj08244h0Qf2k7Y+
         tZMgtLb3W5z9gXJ1pLqoY/aHZGMA0klnoD4CHII+ZvbSitC5SEEJigz/wLOVBBANsDoU
         yzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730842134; x=1731446934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eP2/dmGZ6upd0meydOq+bVFxjAFfyWnPqjTOOaybaFY=;
        b=tIGUH7cg2Sk8UZVw6ixhTshbg0EKo8U7ejRId4nsFKFVlc2amDI7oScQ5ptS8QLWhS
         PPf8NYbk0UBOSlxqJhZQI1g8HU14pXlL7Dsa3MkLQPneDfEn6nIrCWngJWGb1lY7FQqj
         5Ttv8Ky/GG9xUGDUjZGA0HQq7x1r9h7xPEyfChAtHy7hY80BjBQUbDW5e55feCFoHPdO
         4rvVMPsIPO2lyFWEgz4+++42HUPxZbYuRIO5X0cDkK6HJt3DXQkC5Ah7MbmBAEi2yfnS
         lJpQnLgopSluxeHWOr53cMVUFAvTBMamwRRYsPN9kyUSw96By4DaHWX2Rj56DNHMPVA8
         ch9Q==
X-Gm-Message-State: AOJu0YyARNL7tMNE/7pXWVntd2RJZoKChITi/emJBiA5tXe0Q+LisOka
	0i21GX+O6eRvy703r1aUbg8S4L40q6NM3E7YleXrD9vvoZR1tzLd
X-Google-Smtp-Source: AGHT+IHUZAxiDAWEcZd5uQeTbY5C3HluVgi/eb5cOKQYEX/QkwtA0Jhcn5FY5SM7HLsTN2r4FykKig==
X-Received: by 2002:a05:6402:2709:b0:5ce:c7b1:e052 with SMTP id 4fb4d7f45d1cf-5cef55266f9mr306262a12.9.1730842133414;
        Tue, 05 Nov 2024 13:28:53 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6ac09edsm1785846a12.40.2024.11.05.13.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 13:28:52 -0800 (PST)
Message-ID: <a2c66875-490f-9b8e-5683-fa4ad1fba6da@gmail.com>
Date: Tue, 5 Nov 2024 22:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: platform: samsung: s5p-jpeg: Remove deadcode
To: linux@treblig.org, andrzejtp2010@gmail.com, s.nawrocki@samsung.com,
 mchehab@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241103192315.288743-1-linux@treblig.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20241103192315.288743-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_132857_075865_7B3EB875 
X-CRM114-Status: GOOD (  19.10  )
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

Hi David,

Thank you for the patch.

On 11/3/24 20:23, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> exynos3250_jpeg_operating() has been unused since it was added in 2014's
> commit 3246fdaa0ac2 ("[media] s5p-jpeg: Add support for Exynos3250 SoC")
> 
> exynos4_jpeg_get_fifo_status(), exynos4_jpeg_get_frame_size(), and
> exynos4_jpeg_set_timer_count() have been unused since they were added by
> commit 80529ae5c137 ("[media] s5p-jpeg:  JPEG codec")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   .../samsung/s5p-jpeg/jpeg-hw-exynos3250.c     |  5 -----
>   .../samsung/s5p-jpeg/jpeg-hw-exynos3250.h     |  1 -
>   .../samsung/s5p-jpeg/jpeg-hw-exynos4.c        | 19 -------------------
>   .../samsung/s5p-jpeg/jpeg-hw-exynos4.h        |  4 ----
>   4 files changed, 29 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> index 637a5104d948..6657d294c10a 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> @@ -427,11 +427,6 @@ void exynos3250_jpeg_clear_int_status(void __iomem *regs,
>   	writel(value, regs + EXYNOS3250_JPGINTST);
>   }
>   
> -unsigned int exynos3250_jpeg_operating(void __iomem *regs)
> -{
> -	return readl(regs + S5P_JPGOPR) & EXYNOS3250_JPGOPR_MASK;
> -}
> -
>   unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs)
>   {
>   	return readl(regs + EXYNOS3250_JPGCNT) & EXYNOS3250_JPGCNT_MASK;
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> index 15af928fad76..709c61ae322c 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> @@ -45,7 +45,6 @@ void exynos3250_jpeg_rstart(void __iomem *regs);
>   unsigned int exynos3250_jpeg_get_int_status(void __iomem *regs);
>   void exynos3250_jpeg_clear_int_status(void __iomem *regs,
>   						unsigned int value);
> -unsigned int exynos3250_jpeg_operating(void __iomem *regs);
>   unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs);
>   void exynos3250_jpeg_dec_stream_size(void __iomem *regs, unsigned int size);
>   void exynos3250_jpeg_dec_scaling_ratio(void __iomem *regs, unsigned int sratio);
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> index 0828cfa783fe..479288fc8c77 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> @@ -185,11 +185,6 @@ unsigned int exynos4_jpeg_get_int_status(void __iomem *base)
>   	return readl(base + EXYNOS4_INT_STATUS_REG);
>   }
>   
> -unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base)
> -{
> -	return readl(base + EXYNOS4_FIFO_STATUS_REG);
> -}
> -
>   void exynos4_jpeg_set_huf_table_enable(void __iomem *base, int value)
>   {
>   	unsigned int	reg;
> @@ -300,22 +295,8 @@ void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size)
>   	writel(size, base + EXYNOS4_BITSTREAM_SIZE_REG);
>   }
>   
> -void exynos4_jpeg_get_frame_size(void __iomem *base,
> -			unsigned int *width, unsigned int *height)
> -{
> -	*width = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) &
> -				EXYNOS4_DECODED_SIZE_MASK);
> -	*height = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) >> 16) &
> -				EXYNOS4_DECODED_SIZE_MASK;
> -}
> -
>   unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base)
>   {
>   	return readl(base + EXYNOS4_DECODE_IMG_FMT_REG) &
>   				EXYNOS4_JPEG_DECODED_IMG_FMT_MASK;
>   }
> -
> -void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size)
> -{
> -	writel(size, base + EXYNOS4_INT_TIMER_COUNT_REG);
> -}
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> index 3e2887526960..b941cc89e4ba 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> @@ -35,10 +35,6 @@ void exynos4_jpeg_select_dec_h_tbl(void __iomem *base, char c, char x);
>   void exynos4_jpeg_set_encode_hoff_cnt(void __iomem *base, unsigned int fmt);
>   void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size);
>   unsigned int exynos4_jpeg_get_stream_size(void __iomem *base);
> -void exynos4_jpeg_get_frame_size(void __iomem *base,
> -			unsigned int *width, unsigned int *height);
>   unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base);
> -unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base);
> -void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size);
>   
>   #endif /* JPEG_HW_EXYNOS4_H_ */

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

