Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3157EFD5307
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeSGj5Dm4pJG5BITfxYeiMkJ31GOO56vEhVegrdik1Y=; b=dTYUFfkF3dFdJAT+ztUkn9fzn6
	pp5dgDcYqgTsrF8KyRZaROalI4VGJR6GPegVSMnz+ViA4aWOMbu7FAU6NtmDRGc6gh0eJiUfcECPl
	p0K7dtb7LQYApiFsWsfkCfRYyrOflfyaTzvQsiHU/O5nREisYeYE+4uUcwuTn/lPMqxmYNYtjzjvf
	YNuzQ+tRLxjmSQhvLXllIByK5vdGNx2BqfOuHzs0Eoch5Ahio60z3ysMs3s0Jo41D7tfrGcO5NTbq
	0gV9WYVSwxW8i7Y2XeUBJWCl/LCrVSI9KhMvF4fdAz5wdwuyCD7LHkhJNMDy0XJjcgeRONpXfylaS
	AujZ4kXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsei-00000007uy9-0Dic;
	Fri, 27 Feb 2026 07:53:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsee-00000007uxk-3ATF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:52:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B17F71A199B;
	Fri, 27 Feb 2026 07:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76D035FE46;
	Fri, 27 Feb 2026 07:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 334181036921D;
	Fri, 27 Feb 2026 08:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772178770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=XeSGj5Dm4pJG5BITfxYeiMkJ31GOO56vEhVegrdik1Y=;
	b=GDsbHRpskTwbgPCwbTo43xynJyZkgTgFYfyHpCTsnpwEHZpZCegYn4WbFulSq7CjsIYAYK
	mJrzWuXbigpntKfAPj/UMVo8J+bpYYQjVnMRYUtSKdcFYeA2AoHrZ3MQ7wRLJZUYlvHE83
	VVXalmgapClSSjRbBdOTDLXJNfyYdt+1da79GtxntUpwxIEQVoaEcmX8siASRnWz4o/GZD
	4/3b2U3gJzPmfUv7oebo/n/KCI5PB/Z7QTQIPnGaquuEEuv5bnIjQEH69WjFBhRzqFmGTZ
	iLkR4odNOe2XKtAClS6o6i0258v24jEmGHC1PZwoxvdiq4hwCo/EE9M9jP/RGQ==
Date: Fri, 27 Feb 2026 08:52:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Message-ID: <202602270752399219b90c@mail.local>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <20260227073116.30447-2-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227073116.30447-2-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235256_953973_253475C1 
X-CRM114-Status: GOOD (  21.55  )
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

On 27/02/2026 13:01:14+0530, Balakrishnan Sambath wrote:
> From: Andrei Simion <andrei.simion@microchip.com>
> 
> This patch reorganizes the header file by renaming the registers using
> a general pattern also this patch simplifies the watchdog disable logic
> in the at91sam9_wdt.h header by differentiating between modern
> (SAM9X60, SAMA7G5, SAM9X7) and legacy (SAMA5, AT91SAM9261) chips based
> on the watchdog disable bit.
> For modern chips, the disable bit is at bit 12, while for legacy chips
> it is at bit 15.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> [Remove Kconfig-based WDDIS selection and define explicit legacy and
> modern masks]
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/watchdog/at91sam9_wdt.h | 65 ++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 298d545df1a1..1e0aeecb489f 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -3,59 +3,58 @@
>   * drivers/watchdog/at91sam9_wdt.h
>   *
>   * Copyright (C) 2007 Andrew Victor
>   * Copyright (C) 2007 Atmel Corporation.
>   * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
>   *
>   * Watchdog Timer (WDT) - System peripherals regsters.
>   * Based on AT91SAM9261 datasheet revision D.
>   * Based on SAM9X60 datasheet.
> + * Based on SAMA7G5 datasheet.
> + * Based on SAM9X75 datasheet.
>   *
>   */
>  
>  #ifndef AT91_WDT_H
>  #define AT91_WDT_H
>  
>  #include <linux/bits.h>
>  
> -#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
> -#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
> -#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
> -
> -#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
> -#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
> -#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> -#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> -#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
> +#define AT91_WDT_CR		0x00		/* Watchdog Control Register */
> +#define  AT91_WDT_WDRSTT	BIT(0)		/* Restart */
> +#define  AT91_WDT_KEY		(0xa5UL << 24)	/* KEY Password */
> +#define AT91_WDT_MR		0x04		/* Watchdog Mode Register */
> +#define  AT91_WDT_WDV		(0xfffUL << 0)	/* Counter Value */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> -#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
> -#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
> -#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> -#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> -#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
> -#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
> -#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
> -#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
> -
> +#define  AT91_WDT_WDRSTEN	BIT(13)
> +#define  AT91_WDT_WDRPROC	BIT(14)
> +#define  AT91_WDT_WDD		(0xfffUL << 16)
> +#define  AT91_WDT_WDDBGHLT	BIT(28)
> +#define  AT91_WDT_WDIDLEHLT	BIT(29)
>  #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> -/* Watchdog Timer Value Register */
> -#define AT91_SAM9X60_VR		0x08
> +#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
>  
> -/* Watchdog Window Level Register */
> -#define AT91_SAM9X60_WLR	0x0c
> -/* Watchdog Period Value */
> -#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)
> -#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +#define AT91_WDT_VR		0x08	/* Watchdog Timer Value Register */
> +#define AT91_WDT_ISR		0x1c	/* Interrupt Status Register */
> +#define AT91_WDT_IER		0x14	/* Interrupt Enable Register */
> +#define AT91_WDT_IDR		0x18	/* Interrupt Disable Register */
> +#define AT91_WDT_WLR		0x0c	/* Watchdog Window Level Register */
> +#define AT91_WDT_PERIODRST	BIT(4)	/* Period Reset */
> +#define AT91_WDT_RPTHRST	BIT(5)		/* Minimum Restart Period */
> +#define  AT91_WDT_PERINT	BIT(0)	/* Period Interrupt Enable */
> +#define  AT91_WDT_COUNTER	(0xfffUL << 0)	/* Watchdog Period Value */
> +#define  AT91_WDT_SET_COUNTER(x)	((x) & AT91_WDT_COUNTER)
>  
> -/* Interrupt Enable Register */
> -#define AT91_SAM9X60_IER	0x14
> -/* Period Interrupt Enable */
> -#define  AT91_SAM9X60_PERINT	BIT(0)
> -/* Interrupt Disable Register */
> -#define AT91_SAM9X60_IDR	0x18
> -/* Interrupt Status Register */
> -#define AT91_SAM9X60_ISR	0x1c
> +/*
> + * WDDIS bit differs by SoC:
> + *   - SAMA5, AT91SAM9261: bit 15
> + *   - SAM9X60, SAMA7G5, SAM9X75: bit 12
> + * Select at runtime via compatible string.
> + */
> +#define AT91_WDT_WDDIS_LEGACY   BIT(15)
> +#define AT91_WDT_WDDIS_MODERN   BIT(12)

This is bad naming, we are going to end up with
AT91_WDT_WDDIS_LEGACY_LEGACY, AT91_WDT_WDDIS_MODERN_LEGACY and
AT91_WDT_WDDIS_MODERN next time. The proper name would use the name of
the SoC introducing the new position.

>  
>  #endif
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

