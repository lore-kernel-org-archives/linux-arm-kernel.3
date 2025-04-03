Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDAcpO05TFOWS5zXAfKzrZl6VEQHM4WVrgcTwmN54+Q=; b=roBmHt+cpv5oHDu7S81iZHm9e+
	q8ThJpM3VhlPCXBa5sXx8e/h+mMtubdPkjyGSkuRx4voUa5ZrPa3j2QyYcxdPodts3VOcohbuBpdx
	5enB3m6XDsxJRaKNtNapwcUa8wo3HP4dKfpJX44id0J8yMrFrN+uU6nRkcD3nSS8FosSD20D+DTEX
	RBC8N3rkLwdjQbEu9BWf3sro/Rdph+F9zq5qCuAQt6zmFnSuYhACwVUQQjbNYiQwvbUTiDOFpN6f7
	9yX3cDntFBT9R4S4FiklCvJ+XZdjXT2lee4fUZEN0+6CUdKMQUrxjlCBV6r2UqoxTl+Ygu8GMj3qT
	qTNfeYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0E2h-00000007v3C-15ia;
	Thu, 03 Apr 2025 06:27:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DzS-00000007uhY-3SG5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:23:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81689106F;
	Wed,  2 Apr 2025 23:23:52 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 309253F59E;
	Wed,  2 Apr 2025 23:23:44 -0700 (PDT)
Message-ID: <e5abeb48-daf7-4d07-821e-93ef50a1d403@arm.com>
Date: Thu, 3 Apr 2025 11:53:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] coresight: etm4x: Support atclk
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-4-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-4-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_232350_952561_C36106E2 
X-CRM114-Status: GOOD (  25.92  )
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



On 3/27/25 17:07, Leo Yan wrote:
> The atclk is an optional clock for the CoreSight ETMv4, but the driver
> misses to initialize it.
> 
> This change enables atclk in probe of the ETMv4 driver, and dynamically
> control the clock during suspend and resume.
> 
> No need to check the driver data and clock pointer in the runtime
> suspend and resume, so remove checks.  And add error handling in the
> resume function.
> 
> Add a minor fix to the comment format when adding the atclk field.
> 
> Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 +++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +++-
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..537d57006a25 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2149,6 +2149,10 @@ static int etm4_probe(struct device *dev)
>  	if (WARN_ON(!drvdata))
>  		return -ENOMEM;
>  
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>  	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>  		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>  			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
> @@ -2397,8 +2401,8 @@ static int etm4_runtime_suspend(struct device *dev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
>  	return 0;
>  }
> @@ -2406,11 +2410,17 @@ static int etm4_runtime_suspend(struct device *dev)
>  static int etm4_runtime_resume(struct device *dev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
>  
> -	return 0;
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index bd7db36ba197..0c21832b5d69 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -919,7 +919,8 @@ struct etmv4_save_state {
>  
>  /**
>   * struct etm4_drvdata - specifics associated to an ETM component
> - * @pclk        APB clock if present, otherwise NULL
> + * @pclk:       APB clock if present, otherwise NULL
> + * @atclk:      Optional clock for the core parts of the ETMv4.
>   * @base:       Memory mapped base address for this component.
>   * @csdev:      Component vitals needed by the framework.
>   * @spinlock:   Only one at a time pls.
> @@ -987,6 +988,7 @@ struct etmv4_save_state {
>   */
>  struct etmv4_drvdata {
>  	struct clk			*pclk;
> +	struct clk			*atclk;
>  	void __iomem			*base;
>  	struct coresight_device		*csdev;
>  	raw_spinlock_t			spinlock;

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

