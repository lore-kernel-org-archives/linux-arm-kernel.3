Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75D3CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHrbfJsFTJtcfhWQl6NCYp9f9xBnKlKEDQu9bt20xOk=; b=holEynQaWdYGwZsgzXg9vElvKc
	hCmeRw+8Qy1vPznti/Zsge9CO+BYqviou/7awz5PLWNP2QRe2eg8nKB7rMZeXjqYIbgnbk8yoRyr/
	6mEnGKNKsx4ZG8+0cJf6fqgIXqyGjHn8usKsKfMVt+IO7dzo8FLsPyYzg361EmmtAQ5yQclusxym8
	f15a/PQpjcJPR4cH1ONjESJTA2QDp8xY1DNcH2M/uvRbZwM9muoSfvAeXipuYz+WIhDLBti8dr3FY
	4Vb5A7jXmsHC/bMcudsUQaCassr7u/fntsd6mz8Scmj+xthkB87xX6j3S3gBp0ahTxhRCtX844E+4
	EnBMaquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub1Z-00000003k9l-2dFk;
	Fri, 05 Sep 2025 18:19:02 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuX2Q-00000002AY8-06mT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 14:03:39 +0000
Date: Fri, 5 Sep 2025 16:03:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757081012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHrbfJsFTJtcfhWQl6NCYp9f9xBnKlKEDQu9bt20xOk=;
	b=Y7XQg9kdnXVjuWUHRzKxV63SoEx/duSSyJs0vjanJAObcAX0hS9bYMSlhZVt7oXu4aV2Hk
	rKgxeHzndAoiDqJb4/+tFqgS/CpqoWL42h8ep36RUHPJiOJqhtIYrNoQwGLnarzARSmao5
	0hPAmCX41cnODwZl5tuYAFh+1VtiWIQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com
Subject: Re: [PATCH v3 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Message-ID: <20250905140318.GA14745@grimfrac.localdomain>
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
 <CGME20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43@epcas5p3.samsung.com>
 <20250905110554.2212304-3-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905110554.2212304-3-dev.tailor@samsung.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_070338_669538_2ED7EB78 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Devang,

On Fri, Sep 05, 2025 at 04:35:53PM +0530, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous version of
> SoCs except for S3C2410_TICNT tick time counter, which is used in this
> driver but not applicable for exynosautov9. So re-use the existing driver
> skipping disablement of S3C2410_TICNT in s3c24xx_rtc_disable() callback
> via a new boolean member of s3c_rtc_data.
> 
> This has been tested with 'hwclock' & 'date' utilities
> 
> Suggested-by: Henrik Grimler <henrik@grimler.se>
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Thank you, looks good!

Best regards,
Henrik Grimler

> ---
>  drivers/rtc/rtc-s3c.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 79b2a16f15ad..8fc5b4582b6d 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -48,6 +48,7 @@ struct s3c_rtc {
>  
>  struct s3c_rtc_data {
>  	bool needs_src_clk;
> +	bool use_s3c2410_ticnt;
>  
>  	void (*irq_handler) (struct s3c_rtc *info, int mask);
>  	void (*enable) (struct s3c_rtc *info);
> @@ -369,9 +370,11 @@ static void s3c24xx_rtc_disable(struct s3c_rtc *info)
>  	con &= ~S3C2410_RTCCON_RTCEN;
>  	writew(con, info->base + S3C2410_RTCCON);
>  
> -	con = readb(info->base + S3C2410_TICNT);
> -	con &= ~S3C2410_TICNT_ENABLE;
> -	writeb(con, info->base + S3C2410_TICNT);
> +	if (info->data->use_s3c2410_ticnt) {
> +		con = readb(info->base + S3C2410_TICNT);
> +		con &= ~S3C2410_TICNT_ENABLE;
> +		writeb(con, info->base + S3C2410_TICNT);
> +	}
>  }
>  
>  static void s3c6410_rtc_disable(struct s3c_rtc *info)
> @@ -550,18 +553,21 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
>  }
>  
>  static const struct s3c_rtc_data s3c2410_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
>  };
>  
>  static const struct s3c_rtc_data s3c2416_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
>  };
>  
>  static const struct s3c_rtc_data s3c2443_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
> @@ -574,6 +580,12 @@ static const struct s3c_rtc_data s3c6410_rtc_data = {
>  	.disable		= s3c6410_rtc_disable,
>  };
>  
> +static const struct s3c_rtc_data exynosautov9_rtc_data = {
> +	.irq_handler		= s3c6410_rtc_irq,
> +	.enable			= s3c24xx_rtc_enable,
> +	.disable		= s3c24xx_rtc_disable,
> +};
> +
>  static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	{
>  		.compatible = "samsung,s3c2410-rtc",
> @@ -590,6 +602,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos3250-rtc",
>  		.data = &s3c6410_rtc_data,
> +	}, {
> +		.compatible = "samsung,exynosautov9-rtc",
> +		.data = &exynosautov9_rtc_data,
>  	},
>  	{ /* sentinel */ },
>  };
> -- 
> 2.34.1
> 

