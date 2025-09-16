Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61F3CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTX0fC9bIK340fBiAPl8js1dBSBKjx/FRBlnlo5L9NI=; b=WhktqppQwEnPx7J8VXTQXq73MN
	a8t8GKs9o7ZYNQEZ11B4dMKB3GsehEhMLlG2V6jZB/dSBfzHKmCQTYNfo6HJgVGgeLoOq4c+cHIcB
	o0EPuK/jXXILsCD+gibJUd0o8NYwRhs3p3fcq4kQ2NSPCDNW8n6mX0WSgkNC5LslS40IurPbNlEIZ
	Sx7au8SA/YcM5i8vHthiyt6HD0BebNUyv2sZJRq0vDcVDn5e45sEI4r10NW7LI/yS1FK78weKveDy
	fCk3S0VcECV+5p0gYVkZqHt2OGhtd2BL9cWjtA6wgQRLXf1PbS2dD71o3V6jo4QG4sCGMWAmPLAcM
	C4Ty2LvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWyz-00000008BKn-04w6;
	Tue, 16 Sep 2025 14:48:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWyw-00000008BJr-19C4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758034114; x=1789570114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ylED2QmG4z5jpT44UfsD5KLLNSkZmNlT7OtJh7WiFqk=;
  b=Jzy35c3vMXFnCj7YOmJsjtN2YGOk+uFdKtK+GVmCZoHePUzx5z9EKYYV
   sp3wNTE0zCylJxXCkCzi9wAhEFRLQ43K/Gd+br0nxF5et0VkS5EtcdY7U
   jtJCj+6qAS0kUWRPiAABQlRkPhhs9bw4q4TOpX2TfBPvotWxy57L66y3h
   ZNtaieIQpN/FZJOxTvf6dbvaHmjwLv7CD6LFQSEvxlScJEP5M0Hz18apv
   ZR7dTXLWgFyZND0VEoUomrRrvn13ZNkgYAgqr55BzN0/OYCGs/fJiBzl8
   yLHUlwcT1Xsi+tLYsCoEJdaKTwTNlZg/Nma9+Ka24TR3AYpqah9g6giTj
   g==;
X-CSE-ConnectionGUID: L6xQAWeqQP+7SzlmY7FqJQ==
X-CSE-MsgGUID: Y8D2Qpz/SHG2ASa0mfu+2w==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="213953799"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 07:48:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 07:48:21 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 07:48:18 -0700
Message-ID: <36a37379-2ad1-40c5-9c7d-6e05ea74bf84@microchip.com>
Date: Tue, 16 Sep 2025 16:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: at91: pm: Remove 2.5V regulator
To: <Ryan.Wanner@microchip.com>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
 <a6785a40648b315a07152bca261a42bbf0f356af.1757519351.git.Ryan.Wanner@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <a6785a40648b315a07152bca261a42bbf0f356af.1757519351.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_074834_579320_47DEA398 
X-CRM114-Status: GOOD (  13.76  )
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

On 10/09/2025 at 18:20, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Remove 2.5V regulator since enabling and disabling this regulator is no
> longer supported.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

I take this one for at91-soc now. We will come back for the rest.

Regards,
   Nicolas

> ---
>   arch/arm/mach-at91/pm_suspend.S | 29 -----------------------------
>   include/soc/at91/sama7-sfrbu.h  |  7 -------
>   2 files changed, 36 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index 198236bdbbb3..36cae7b1a490 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -87,29 +87,6 @@ tmp3	.req	r6
>   
>   	.endm
>   
> -/**
> - * Set state for 2.5V low power regulator
> - * @ena: 0 - disable regulator
> - *	 1 - enable regulator
> - *
> - * Side effects: overwrites r7, r8, r9, r10
> - */
> -	.macro at91_2_5V_reg_set_low_power ena
> -#ifdef CONFIG_SOC_SAMA7
> -	ldr	r7, .sfrbu
> -	mov	r8, #\ena
> -	ldr	r9, [r7, #AT91_SFRBU_25LDOCR]
> -	orr	r9, r9, #AT91_SFRBU_25LDOCR_LP
> -	cmp	r8, #1
> -	beq	lp_done_\ena
> -	bic	r9, r9, #AT91_SFRBU_25LDOCR_LP
> -lp_done_\ena:
> -	ldr	r10, =AT91_SFRBU_25LDOCR_LDOANAKEY
> -	orr	r9, r9, r10
> -	str	r9, [r7, #AT91_SFRBU_25LDOCR]
> -#endif
> -	.endm
> -
>   /*
>    * Set LPM
>    * @ena: 0 - disable LPM
> @@ -1055,9 +1032,6 @@ save_mck:
>   
>   	at91_plla_disable
>   
> -	/* Enable low power mode for 2.5V regulator. */
> -	at91_2_5V_reg_set_low_power 1
> -
>   	ldr	tmp3, .pm_mode
>   	cmp	tmp3, #AT91_PM_ULP1
>   	beq	ulp1_mode
> @@ -1070,9 +1044,6 @@ ulp1_mode:
>   	b	ulp_exit
>   
>   ulp_exit:
> -	/* Disable low power mode for 2.5V regulator. */
> -	at91_2_5V_reg_set_low_power 0
> -
>   	ldr	pmc, .pmc_base
>   
>   	at91_plla_enable
> diff --git a/include/soc/at91/sama7-sfrbu.h b/include/soc/at91/sama7-sfrbu.h
> index 76b740810d34..8cee48d1ae2c 100644
> --- a/include/soc/at91/sama7-sfrbu.h
> +++ b/include/soc/at91/sama7-sfrbu.h
> @@ -18,13 +18,6 @@
>   #define		AT91_SFRBU_PSWBU_SOFTSWITCH	(1 << 1)	/* Power switch BU source selection */
>   #define		AT91_SFRBU_PSWBU_CTRL		(1 << 0)	/* Power switch BU control */
>   
> -#define AT91_SFRBU_25LDOCR			(0x0C)		/* SFRBU 2.5V LDO Control Register */
> -#define		AT91_SFRBU_25LDOCR_LDOANAKEY	(0x3B6E18 << 8)	/* Specific value mandatory to allow writing of other register bits. */
> -#define		AT91_SFRBU_25LDOCR_STATE	(1 << 3)	/* LDOANA Switch On/Off Control */
> -#define		AT91_SFRBU_25LDOCR_LP		(1 << 2)	/* LDOANA Low-Power Mode Control */
> -#define		AT91_SFRBU_PD_VALUE_MSK		(0x3)
> -#define		AT91_SFRBU_25LDOCR_PD_VALUE(v)	((v) & AT91_SFRBU_PD_VALUE_MSK)	/* LDOANA Pull-down value */
> -
>   #define AT91_FRBU_DDRPWR			(0x10)		/* SFRBU DDR Power Control Register */
>   #define		AT91_FRBU_DDRPWR_STATE		(1 << 0)	/* DDR Power Mode State */
>   


