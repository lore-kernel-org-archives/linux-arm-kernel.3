Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBA2CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IfjdTXTeMtFvfYmSgHgSWxseH4ny8bXUP4IkA9zAgQ=; b=3gKhjQYX9a1YP/n8z+JeU5uAny
	FsmvBT2pdhwE5d3NRqVCLIAVuqmryW9sARSYQF31sgCc/jZuBpO27UZEb3uEyT/BDHMNSFnyxqfe5
	53nuZ+LNV06gDT5PW66moilWNWwEzBlBO7UkAjGQo6iZEaAaQM978AAh/hGFHjbIP8Ne5JlKEd/cR
	cb4x/53F4icMWPmdXENHUSSIuLRPMKfMn9k5W/rEDkyIugEsskRwlnogBDz5hbsDt54g492rMuvaF
	18Bmf7NvmrRFZW3L6n/z9ic01t3l6OfgvnlDLsicXxeHtciDj45ercyNFF870ElKgL7nJyOUB9hhH
	Rk+vCaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEURE-00000002lE3-2bAe;
	Wed, 07 Oct 2026 16:24:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEURB-00000002lDb-10St
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 16:24:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC3C31595;
	Wed,  7 Oct 2026 09:24:05 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ED823F763;
	Wed,  7 Oct 2026 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791390249; bh=yjjIU+Tw4JjtanQbUdQJJ1qJuMR0XZ51UjxvYTHvYtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SALH/rlhsuECLnfRoBi+9Im5qe3uBK7HtkricsHfkXsuI6HZBVSorEjoSjXHhUWmH
	 XZGHhBf4+xmnKy8w8Ko3xjrl7bfy1AWctHvs7Mb5rplMip6eUnodLdhEqt7ZV1WZpq
	 ywmVgf9rDHrGwOxpI6uUu1+9aOjvLy+7d+cGrX/M=
Date: Wed, 7 Oct 2026 17:24:06 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts
 external output 1
Message-ID: <20261007162406.GA26205@e132581.arm.com>
References: <20261001063744.2143819-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001063744.2143819-1-aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092413_452331_CCF83255 
X-CRM114-Status: GOOD (  27.04  )
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

Hi Amir,

Thanks for the patch. I have a few initial comments below. We may have
further feedback after our internal review.

On Wed, Sep 30, 2026 at 11:37:43PM -0700, Amir Ayupov wrote:

[...]

>  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> +/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004

Do we need to tie this capability to TRCEXTOUT1? For example, Neoverse
V2 exposes TRCEXTOUT0 through TRCEXTOUT3 as PMU events.

>  /* flags defining device instance matching - used in config match desc data. */
>  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index e1a59b4345052..2847d2d7f7bed 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>  
>  int etm4_cscfg_register(struct coresight_device *csdev)
>  {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>  	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>  
>  	ops.load_feat = &etm4_cfg_load_feature;
>  
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	if (drvdata->pmu_extout1)
> +		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
> +
> +	return cscfg_register_csdev(csdev, match_flags, &ops);

The current matching logic succeeds if a device and feature share any
flag bit. If the feature sets both CS_CFG_MATCH_CLASS_SRC_ETM4 and
CS_CFG_MATCH_CAP_PMU_EXTOUT1, it will still load on an ETM4 device that
lacks the capability.

Could we check the capability separately when loading the feature,
perhaps in cscfg_load_feat_csdev(), and skip it on unsupported devices?

> +static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
> +{
> +	int pmuver = read_pmuver();
> +
> +	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
> +		return false;

Based on specific CPU variant, we should already have identified
TRCEXTOUT has supported.

So either we only base on MIDR list or we can figure out a reliable
way to detect the feature dynamically.

> +
> +	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
> +		return false;
> +	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
> +				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
> +		return false;
> +
> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
> +	return drvdata->nr_event >= 1;
> +}

[...]

> @@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>  
>  		if (err)
>  			cscfg_config_desc_put(config_desc);
> +	} else {
> +		/*
> +		 * The configuration is active but was not loaded on this
> +		 * device, for example because the device lacks a capability
> +		 * its features require. Fail rather than trace without it.
> +		 */
> +		err = -EINVAL;
>  	}

This fixes a pre-existing issue. It is worther to put it in a separate
patch with fixes tag:

An early return would also avoid the normal enable path's indentation:

	if (!config_csdev_active)
		return -EINVAL;

	err = cscfg_csdev_enable_config(config_csdev_active, preset);
	...

Thanks,
Leo

