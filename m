Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC4BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cuqpMzoScnH3gfBbyigTWLf89YSQtUbp2zE0GS3jxs=; b=odKaZX7oJ8ihL/Sr7fHr1dLyYw
	gxO+t5CC3bTg80Fj8dmrDlc4YiImWY0CkZBrCL2v4aSv+1smj3Yw+9Gh1/lpe5wZPfrYSiFZaFG2E
	uI0vraRs8t1YzNIaA4BMQwBQfDH+XilzW674xpPiw28/8NrfnvnH6fMaA/g/ld1bDijHtucUabbIC
	gsIDfLOu8B0hDgzrUVr3+ikzuuxNcQW4hcrtXO1rgYFIizrEzavH2QByrNhtccD7btxC6lE17QXLm
	HcEFajnbiXOj5SyOZZXqo13813JVlt/rbSkOX1SbXKBZOe+kIEbiP5mv5+KtGSZszaD6nyv996pZR
	SRH/igVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yme-0000000APmL-2mnV;
	Wed, 23 Apr 2025 12:00:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XpK-0000000AFNy-11KE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:59:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C11EF1063;
	Wed, 23 Apr 2025 03:59:32 -0700 (PDT)
Received: from [10.57.74.63] (unknown [10.57.74.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C64E3F66E;
	Wed, 23 Apr 2025 03:59:36 -0700 (PDT)
Message-ID: <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
Date: Wed, 23 Apr 2025 11:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035938_335457_E1FF45E0 
X-CRM114-Status: GOOD (  15.42  )
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

On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> The Arm DMA-350 controller is only present on Arm-based SoCs.

Do you know that for sure? I certainly don't. This is a licensable, 
self-contained DMA controller IP with no relationship whatsoever to any 
particular CPU ISA - our other system IP products have turned up in the 
wild paired with non-Arm CPUs, so I don't see any reason that DMA-350 
wouldn't either.

Would you propose making all the DesignWare drivers depend on ARC 
because those happen to come from the same company too? ;)

Thanks,
Robin.

>  Hence add
> dependencies on ARM and ARM64, to prevent asking the user about this
> driver when configuring a kernel for a non-Arm architecture.
> 
> Fixes: 5d099706449d54b4 ("dmaengine: Add Arm DMA-350 driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/dma/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 8109f73baf10fc3b..db87dd2a07f7606e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -95,6 +95,7 @@ config APPLE_ADMAC
>   
>   config ARM_DMA350
>   	tristate "Arm DMA-350 support"
> +	depends on ARM || ARM64 || COMPILE_TEST
>   	select DMA_ENGINE
>   	select DMA_VIRTUAL_CHANNELS
>   	help


