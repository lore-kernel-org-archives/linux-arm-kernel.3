Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47649C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vVvhFpNMm1gaepJPyTl7eqomHFcy4+96kafRkAHhwE=; b=OiEPi/4JuqbozPLClsWsWJKHRi
	hLGDhPaYYK/io87gzyCIOT7Ga80BnwsQDQ7vEsaRPuH85v1iA/VDnizcJhXVMkmZb8CQ4BX8BTF1V
	5LHbQO4AOSG10D5jZLQHrfFHW1FLblBKO885WhFNSsXDrE9pqey07HIJuzQdoaHWI0iNaSHd4syut
	UI2soR2fMG7uCGmHY6n5TKz0kbOQq+Brk44ysSXhPMcXQ36DEdQvuWWbFsOmB21W3Lk9mGZV+DkQg
	9AMWgarIBSDli6xfRfkIhkUWVP9LPOUFRuLuMZuMk1AqHz8fwR8bus9ESXxpysLwVxnQcavzeEHS0
	hrPm/3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjde-00000000xON-2oPa;
	Fri, 02 May 2025 06:12:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjbh-00000000xBi-1sLC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:10:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCDB51063;
	Thu,  1 May 2025 23:10:31 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F7D83F66E;
	Thu,  1 May 2025 23:10:35 -0700 (PDT)
Message-ID: <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
Date: Fri, 2 May 2025 11:40:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] coresight: Disable programming clock properly
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-5-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_231045_584122_BB6C806E 
X-CRM114-Status: GOOD (  27.76  )
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

Even though this might seem to be being bike shedding, the subject
line above could be re-organized something like the following for
better clarity.

 coresight: Properly/Appropriately disable programming clocks

On 4/23/25 20:47, Leo Yan wrote:
> Some CoreSight components have programming clocks (pclk) and are enabled
> using clk_get() and clk_prepare_enable().  However, in many cases, these
> clocks are not disabled when modules exit and only released by clk_put().

That is correct, it would be definitely better to disable these clocks
rather than doing a clk_put() that is prevalent for the pclk clocks in
context.

> 
> To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
> by replacing clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() for enabling APB clock.  Callers are updated
> to reuse the returned error value.
> 
> With the change, programming clocks are managed as resources in driver
> model layer, allowing clock cleanup to be handled automatically.  As a
> result, manual cleanup operations are no longer needed and are removed
> from the Coresight drivers.

Looks correct. Although emphasizing the fact that devm_clk_get_enabled()
is the function which gets apb and apb_pclk clocks managed in the driver
model layer there after, might be better.

> 
> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")

Seems right to classify this patch as a "Fixes: " as the clocks were not
handled properly earlier. The commit ID is also correct as it introduced
coresight_get_enable_apb_pclk() function.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       |  9 ++-------
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  6 +-----
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 ++--------
>  drivers/hwtracing/coresight/coresight-etm4x-core.c |  9 ++-------
>  drivers/hwtracing/coresight/coresight-funnel.c     |  6 +-----
>  drivers/hwtracing/coresight/coresight-replicator.c |  6 +-----
>  drivers/hwtracing/coresight/coresight-stm.c        |  4 +---
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  4 +---
>  drivers/hwtracing/coresight/coresight-tpiu.c       |  4 +---

All call sites have been changed.

>  include/linux/coresight.h                          | 16 +++-------------
>  10 files changed, 15 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 9fcda5e49253..c0a51ab0312c 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -627,7 +627,7 @@ static int catu_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);

Returning PTR_ERR() on the clock after detecting a problem via IS_ERR() is correct.

>  
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> @@ -636,11 +636,8 @@ static int catu_platform_probe(struct platform_device *pdev)
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	ret = __catu_probe(&pdev->dev, res);
>  	pm_runtime_put(&pdev->dev);
> -	if (ret) {
> +	if (ret)
>  		pm_runtime_disable(&pdev->dev);
> -		if (!IS_ERR_OR_NULL(drvdata->pclk))
> -			clk_put(drvdata->pclk);
> -	}
>  
>  	return ret;
>  }
> @@ -654,8 +651,6 @@ static void catu_platform_remove(struct platform_device *pdev)
>  
>  	__catu_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);

This kind of error handling is not required any more as it would be
handled in the driver model layer here after.

>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 342c3aaf414d..744b6f9b065e 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -699,7 +699,7 @@ static int debug_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
> @@ -710,8 +710,6 @@ static int debug_platform_probe(struct platform_device *pdev)
>  	if (ret) {
>  		pm_runtime_put_noidle(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
> -		if (!IS_ERR_OR_NULL(drvdata->pclk))
> -			clk_put(drvdata->pclk);
>  	}
>  	return ret;
>  }
> @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
>  
>  	__debug_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?
Because now there could not be a NULL return value.

drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)

#ifdef CONFIG_PM
static int debug_runtime_suspend(struct device *dev)
{
        struct debug_drvdata *drvdata = dev_get_drvdata(dev);

        if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
                clk_disable_unprepare(drvdata->pclk);
        return 0;
}

static int debug_runtime_resume(struct device *dev)
{
        struct debug_drvdata *drvdata = dev_get_drvdata(dev);

        if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
                clk_prepare_enable(drvdata->pclk);
        return 0;
}
#endif

There might more instances like these as well.
	
git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

>  
>  #ifdef CONFIG_ACPI
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db96..de279efe3405 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -209,7 +209,7 @@ static int ctcu_probe(struct platform_device *pdev)
>  
>  	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->apb_clk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->apb_clk);
>  
>  	cfgs = of_device_get_match_data(dev);
>  	if (cfgs) {
> @@ -233,12 +233,8 @@ static int ctcu_probe(struct platform_device *pdev)
>  	desc.access = CSDEV_ACCESS_IOMEM(base);
>  
>  	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> -		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> -			clk_put(drvdata->apb_clk);
> -
> +	if (IS_ERR(drvdata->csdev))
>  		return PTR_ERR(drvdata->csdev);
> -	}
>  
>  	return 0;
>  }
> @@ -275,8 +271,6 @@ static void ctcu_platform_remove(struct platform_device *pdev)
>  
>  	ctcu_remove(pdev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_put(drvdata->apb_clk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 537d57006a25..ff4ac4b686c4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2237,14 +2237,12 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	if (res) {
>  		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(drvdata->base)) {
> -			clk_put(drvdata->pclk);
> +		if (IS_ERR(drvdata->base))
>  			return PTR_ERR(drvdata->base);
> -		}
>  	}
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
> @@ -2351,9 +2349,6 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
>  	if (drvdata)
>  		etm4_remove_dev(drvdata);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  static const struct amba_id etm4_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0541712b2bcb..3fb9d0a37d55 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -240,7 +240,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	/*
>  	 * Map the device base for dynamic-funnel, which has been
> @@ -283,8 +283,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>  		clk_disable_unprepare(drvdata->atclk);
> -	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return ret;
>  }
>  
> @@ -354,8 +352,6 @@ static void funnel_platform_remove(struct platform_device *pdev)
>  
>  	funnel_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  static const struct of_device_id funnel_match[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index ee7ee79f6cf7..87346617b852 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -247,7 +247,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	/*
>  	 * Map the device base for dynamic-replicator, which has been
> @@ -295,8 +295,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>  		clk_disable_unprepare(drvdata->atclk);
> -	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return ret;
>  }
>  
> @@ -334,8 +332,6 @@ static void replicator_platform_remove(struct platform_device *pdev)
>  
>  	replicator_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 26f9339f38b9..c32d0bd92f30 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -851,7 +851,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	base = devm_ioremap_resource(dev, res);
> @@ -1033,8 +1033,6 @@ static void stm_platform_remove(struct platform_device *pdev)
>  
>  	__stm_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_ACPI
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index ddca5ddf4ed2..517850d39a0e 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -990,7 +990,7 @@ static int tmc_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
> @@ -1014,8 +1014,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
>  
>  	__tmc_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 97ef36f03ec2..4b9634941752 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -153,7 +153,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	/* Validity for the resource is already checked by the AMBA core */
> @@ -293,8 +293,6 @@ static void tpiu_platform_remove(struct platform_device *pdev)
>  
>  	__tpiu_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_ACPI
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..b888f6ed59b2 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -476,26 +476,16 @@ static inline bool is_coresight_device(void __iomem *base)
>   * Returns:
>   *
>   * clk   - Clock is found and enabled
> - * NULL  - clock is not found

NULL is not a return value any more.

>   * ERROR - Clock is found but failed to enable
>   */
>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>  {
>  	struct clk *pclk;
> -	int ret;
>  
> -	pclk = clk_get(dev, "apb_pclk");
> -	if (IS_ERR(pclk)) {
> -		pclk = clk_get(dev, "apb");
> -		if (IS_ERR(pclk))
> -			return NULL;
> -	}
> +	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +	if (IS_ERR(pclk))
> +		pclk = devm_clk_get_enabled(dev, "apb");
>  
> -	ret = clk_prepare_enable(pclk);
> -	if (ret) {
> -		clk_put(pclk);
> -		return ERR_PTR(ret);
> -	}
>  	return pclk;
>  }
>  
Updated coresight_get_enable_apb_pclk() LGTM. IS_ERR() on the returned
pclk value can indicate, if there was a problem in finding or enabling
apb/apb_pclk clock.

