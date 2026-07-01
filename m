Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16885C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeEKeIqkAzA9I1ehzai1IkPWw8igbSUgi83FYOY0/sc=; b=awdG/eZQUsDqatOs6iW3sRuhqA
	81arq3xA0Bqh/okOk3enDud1+RBqRCPTzHeAIXTOi3Rcku3/BiF/7sl5Il3MqaxadJyjkU7MLkCDF
	7D+SEa/d25w6oxOLqeCQkzFrALn8kiu2iIazQMnLqhuvkD8CksGuNvS13WKySiid3+ZPvFN3e/EJY
	2kLbA3ng3JPs5LG3E8A4/97L4HVSLFnkqpu+cs3ihXppCD806nOWa4gs1JbGHmTWHxSRiZTGgqHML
	bogGYOVt94cRPirLQWFRpYcGngNO2mAIIiqj8QqGOeWXrKJM7pHMz11TypuvziC1RXlDsyCjfhanh
	msD+O3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer7P-00000001BHa-0cEh;
	Wed, 01 Jul 2026 09:20:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer7N-00000001BHC-0c0Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UeEKeIqkAzA9I1ehzai1IkPWw8igbSUgi83FYOY0/sc=; b=rAQ8WlW2Lrdjci7a3CczlNFbm7
	8dPu+E9ee6dcZcqS3yTmo9hpOKi60LaqFdOYQPOzZllUtUMZ6yGkaQT4nASrehTh/ekpj0VxZjirQ
	Jjozhpv8glJGQa+MNKB75WenNCneCb6jKhI1Xo4fIXd/pyFmFZYS65T4MEL9SPpYmV4aWfURuj1Wm
	U2mpHFH8BcM4bbJwulvFsivKFEPOc7X9UDWHArqwD3hUrR2aGg6Dp4LVTEk3GNe4Sy60/fkq2JBmC
	Iki5n//CtVuOk3tb5LLr57Psoyq2oBwiIfHCXgMzdHTXkhKBEsznO4fvsdLTu6163duS/9okRyO2G
	S2D33Jyw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wer7J-00000002YoR-1YFB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:20:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E54B1D15;
	Wed,  1 Jul 2026 02:20:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F583F905;
	Wed,  1 Jul 2026 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782897622; bh=iMS7QlGpFIb3nV5N5xKvGc6g2B7VUXc78uu68pn2PyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsOz8qYTQaUth7Od3qXomWYYmuCI0lNYIyXC9Mv7T5zPERdfz95NWbYY5IBsMyKPr
	 3zKBEt/8zO5baNCddUpSyEIIoUkdXgqtXaHwF7+JRdSXFhoq5xZdsmL3HUjJe53tpU
	 JZSeF/Hm8V/53nE5vGKMUYA+4o6ijW7K3VKRJdhc=
Date: Wed, 1 Jul 2026 10:20:17 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
Message-ID: <akTb0WAUvQFclDw6@e129823.arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_102025_951587_DF73A1D2 
X-CRM114-Status: GOOD (  20.11  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:
> coresight_get_enable_clocks() enables the programming clock and the
> optional AT clock through devm_clk_get_optional_enabled(), which also
> registers a devm action to call clk_disable_unprepare() when the driver
> detaches.
> 
> After probe, pm_runtime_put() allows the device to suspend and the
> runtime suspend callback disables the same clocks. During remove the
> device is left runtime suspended, so pm_runtime_disable() freezes it
> with the clocks already disabled. The devm cleanup that runs afterwards
> calls clk_disable_unprepare() a second time, underflowing the clock
> enable refcount.
> 
> Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
> so the clocks are enabled again and balance the devm-managed disable.
> 
> This affects all CoreSight platform drivers that obtain their clocks
> through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
> funnel, replicator, stm, tmc and tpiu.
> 
> Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  | 1 +
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  drivers/hwtracing/coresight/coresight-stm.c        | 1 +
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
>  9 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ad8dafea7d2f..f7e501e6cbd7 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -647,6 +647,7 @@ static void catu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__catu_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 3a806c1d50ea..f7efae5b5ce5 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -711,6 +711,7 @@ static void debug_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__debug_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01..9b6da29d9735 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -266,6 +266,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	ctcu_remove(pdev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 14bb31bd6a0b..147761024c0f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2416,6 +2416,7 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
>  
>  	if (drvdata)
>  		etm4_remove_dev(drvdata);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..4c5b94640e6a 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	funnel_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 2f382de357ee..2d765f1f73b3 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -313,6 +313,7 @@ static void replicator_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	replicator_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 4e860519a73f..a653f1eebeca 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -1026,6 +1026,7 @@ static void stm_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__stm_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e..c9cf486873e2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -989,6 +989,7 @@ static void tmc_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__tmc_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 7b029d2eb389..72ac93749be1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -286,6 +286,7 @@ static void tpiu_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	__tpiu_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
Sincerely,
Yeoreum Yun

