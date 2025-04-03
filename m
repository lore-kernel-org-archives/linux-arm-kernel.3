Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35165C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgF7BNlGtwCMkhKnWiD3hIETafD6wS5XsdJgVeoOeNQ=; b=c+ocf0UGUhh8XZ1Hjgb5Zbqnnn
	PP2P+1FIlQSEQmE2xlFQissDcK5d3nCPruC/j+HTE4v0IfQtr0s6vKgTbd0oQSvOvOuPzFNSSFBdk
	+IIuLVrHyzqW0d5PLRh/nfw+g2kW6RpA51agsmcmyfmAIyhhHc2PfqyEMGLcgzgrj27uA7eIVECNy
	+WhyZbu5YJB1nJ6nHrVvek3UgYUJ3Wr2ZZ1Q/AM6P3aWjb+NI3RxU3jyAM8Udl0zQHXjbdUl83MPv
	71CX7oQkbWBFCsKjRks1Va2lP1/vKdQ2IpqvTr3edA8csGzEtebAzCvq47+5W9ppsV2FHoEp4CR7G
	zoDzxA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DgL-00000007sEI-153l;
	Thu, 03 Apr 2025 06:04:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DeZ-00000007s0Q-2eYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45803106F;
	Wed,  2 Apr 2025 23:02:17 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417283F59E;
	Wed,  2 Apr 2025 23:02:09 -0700 (PDT)
Message-ID: <e36c9a12-bfd3-469d-b619-a90229311635@arm.com>
Date: Thu, 3 Apr 2025 11:32:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] coresight: catu: Support atclk
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-3-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-3-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_230215_888928_FE4B9032 
X-CRM114-Status: GOOD (  21.17  )
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
> The atclk is an optional clock for the CoreSight CATU, but the driver
> misses to initialize it.
> 
> This change enables atclk in probe of the CATU driver, and dynamically
> control the clock during suspend and resume.
> 
> The checks for driver data and clocks in suspend and resume are not
> needed, remove them.  Add error handling in the resume function.
> 
> Fixes: fcacb5c154ba ("coresight: Introduce support for Coresight Address Translation Unit")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 22 +++++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..9fcda5e49253 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -513,6 +513,10 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	void __iomem *base;
>  
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>  	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>  	if (!catu_desc.name)
>  		return -ENOMEM;
> @@ -659,18 +663,26 @@ static int catu_runtime_suspend(struct device *dev)
>  {
>  	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
> +
>  	return 0;
>  }
>  
>  static int catu_runtime_resume(struct device *dev)
>  {
>  	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..2fe31fed6cf1 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -62,6 +62,7 @@
>  
>  struct catu_drvdata {
>  	struct clk *pclk;
> +	struct clk *atclk;
>  	void __iomem *base;
>  	struct coresight_device *csdev;
>  	int irq;

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

