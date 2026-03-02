Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA0CEA4E09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfGNkbKgTG/J+johr+2sZrHoxOYXdblvBYXU1VNSY1A=; b=uwQc0YSHemSpl1USDHR8MkdwSX
	SUKZJr3CNEMToRtd0YyQyfM83BkdHH5gUvDxjlhXz/ZO8ERmdVPFJ9AqcCF5lT2Tr60jpQbC+JZHR
	YEkOJRp/nISgPTq4TNv4eW5bsN1U5fTYuVPtTARm/KshvVgSFMNkMQ+5JRDAzdCfOKj08aCFZbbbo
	V0b8132u0oIzt0DoMEMI5QhFxN6Rb1U72gaT6953knul4ecf3xePMXUAVEILHNEgcorqR5hg6FbL4
	bJKkfrFGdxFoT++T1aYOFlX2NvG9XjlUz1VZl0ZyBx6kIckCcTx9xlaUGglC27rGOs7/zeDhL8eGV
	n9wku3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4K8-0000000DF1p-29cg;
	Mon, 02 Mar 2026 14:32:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4K5-0000000DF12-2bCI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:32:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E9A2C40F8F;
	Mon,  2 Mar 2026 14:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BED5FE89;
	Mon,  2 Mar 2026 14:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B6341036957C;
	Mon,  2 Mar 2026 15:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772461953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zfGNkbKgTG/J+johr+2sZrHoxOYXdblvBYXU1VNSY1A=;
	b=2mj8G7QZHcfaxNjWN4ntfTgZIkLlG7iz0c/GowqvqEXEArJITWKXJVwQEdJQZT69bAhG4K
	JLr3p+0UvmXjqU18OkX2RWhdbWabjTIFR5jfEc3QqV3Z6mddZmtxO+3BAanuOHb2Oh3YMx
	Fif4mPQikIjaCeUrBRjjWyg++xITXl3MD2VCVbIgmF119N+qLqU5ynPMnbFNFQi7CJHDzm
	R5MN7xvFMfo7+Ayp46xfjU4n+eKl0tpCyGfLTCF3wM3rezDGUu8I27m8kV/zgqcS6s1wuW
	/QYHEqUcfq8KiuTXXj97kyDM4YXbAqGHXFs1nqOuxmBJJZqBRad5Z82TOtyBXQ==
Date: Mon, 2 Mar 2026 15:32:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, andrei.simion@microchip.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 2/2] watchdog: at91sam9_wdt.h: Document WDDIS bit
 position per SoC family
Message-ID: <20260302143231d1fcff60@mail.local>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <20260302113310.133989-3-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302113310.133989-3-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_063237_805194_B907399B 
X-CRM114-Status: GOOD (  16.47  )
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

On 02/03/2026 17:03:10+0530, Balakrishnan Sambath wrote:
> AT91_WDT_WDDIS (bit 15) applies to SAMA5/AT91SAM9261 and
> AT91_SAM9X60_WDDIS (bit 12) to SAM9X60/SAMA7G5/SAM9X75. Update
> comments to reflect this and add SAMA7G5 and SAM9X75 datasheet
> references to the file header.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/at91sam9_wdt.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 298d545df1a1..2020694f8f6f 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -3,40 +3,42 @@
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
>  #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
>  #define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
>  #define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
>  
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
>  #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
>  #define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
>  #define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> -#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable (SAM9X60, SAMA7G5, SAM9X75) */
>  #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>  #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> -#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> +#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable (SAMA5, AT91SAM9261) */
>  #define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
>  #define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
>  #define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
>  #define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
>  
>  #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

