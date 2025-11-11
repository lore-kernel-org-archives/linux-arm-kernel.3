Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D6CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00SPYdNfFzMVDX8aY6xca5dsOiNYHs2KScVEZqFAilU=; b=moGNY20bg46W6IM2A+4MAZnvJB
	EjYme+kF/aR/M+i1nTNWmpEd1WHgmOVL4DNL4spFKwmJHnxYll45M5BV/ZEDQndRQPxNNe8pAP2Oz
	C38iVlxdln3n1GOYQTvi2rjadQA8mvm4KE4rpetzsioKu4QOqytmgDQjFAg8352+b33EhLNuT9tBD
	Vf5fzABgfL1VcHcPKE0/tFgBsXkMWdrIik+Pn5eveztHcBV+/xIV+nnfLIzWj0W0qiYk0pA5J1gE1
	xrmwBRGkjWIv0fu0A1CmfVbLXh1xbGaWofCWMQfRh9uAKZR+MKyusChgP8ErgLaOQwfYKHjVSEhS6
	xKtndC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInFp-000000079EB-0zc9;
	Tue, 11 Nov 2025 12:13:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInFn-000000079Dq-1ywk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:13:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C00592F;
	Tue, 11 Nov 2025 04:13:34 -0800 (PST)
Received: from [10.57.72.204] (unknown [10.57.72.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773AE3F63F;
	Tue, 11 Nov 2025 04:13:40 -0800 (PST)
Message-ID: <003c77cd-aee4-4ffe-8e62-304241759edc@arm.com>
Date: Tue, 11 Nov 2025 12:13:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] coresight: Register CPU PM notifier in core
 layer
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-3-3d4bba674709@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-3-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_041343_610134_BA73B4B4 
X-CRM114-Status: GOOD (  27.00  )
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

On 04/11/2025 15:21, Leo Yan wrote:
> The current implementation only saves and restores the context for ETM
> sources while ignoring the context of links.  However, if funnels or
> replicators on a linked path resides in a CPU or cluster power domain,
> the hardware context for the link will be lost after resuming from low
> power states.
> 
> To support context management for links during CPU low power modes, a
> better way is to implement CPU PM callbacks in the Arm CoreSight core
> layer.  As the core layer has sufficient information for linked paths,
> from tracers to links, which can be used for power management.
> 
> As a first step, this patch registers CPU PM notifier in the core layer.
> If a source device provides callbacks for saving and restoring context,
> these callbacks will be invoked in CPU suspend and resume.
> 
> Further changes will extend for controlling path.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 70 ++++++++++++++++++++++++++++
>   include/linux/coresight.h                    |  2 +
>   2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 25a530cde8938b366bbb144fdcc107271ebae276..f642190740b93555084584abbc1d9426cc87ec7c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -6,6 +6,7 @@
>   #include <linux/acpi.h>
>   #include <linux/bitfield.h>
>   #include <linux/build_bug.h>
> +#include <linux/cpu_pm.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/types.h>
> @@ -1575,6 +1576,68 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
>   }
>   EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
>   
> +static bool coresight_pm_is_needed(struct coresight_device *csdev)
> +{
> +	if (!csdev)
> +		return false;
> +
> +	/* pm_save_disable() and pm_restore_enable() must be paired */
> +	if (!coresight_ops(csdev)->pm_save_disable ||
> +	    !coresight_ops(csdev)->pm_restore_enable)
> +		return false;
> +
> +	return true;
> +}
> +
> +static int coresight_pm_save(struct coresight_device *csdev)
> +{
> +	return coresight_ops(csdev)->pm_save_disable(csdev);
> +}
> +
> +static void coresight_pm_restore(struct coresight_device *csdev)
> +{
> +	coresight_ops(csdev)->pm_restore_enable(csdev);
> +}
> +
> +static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> +				   void *v)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> +
> +	if (!coresight_pm_is_needed(source))
> +		return NOTIFY_OK;
> +
> +	switch (cmd) {
> +	case CPU_PM_ENTER:
> +		if (coresight_pm_save(source))

Unless we do the "set_per_cpu_source" *ON the CPU*, what guarantees that
this will vanish while we do the PM save ? e.g., UNLOAD coresight_etm4x
driver

Rest looks fine to me.

Suzuki


> +			return NOTIFY_BAD;
> +		break;
> +	case CPU_PM_EXIT:
> +	case CPU_PM_ENTER_FAILED:
> +		coresight_pm_restore(source);
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block coresight_cpu_pm_nb = {
> +	.notifier_call = coresight_cpu_pm_notify,
> +};
> +
> +static int __init coresight_pm_setup(void)
> +{
> +	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
> +}
> +
> +static void coresight_pm_cleanup(void)
> +{
> +	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
> +}
> +
>   const struct bus_type coresight_bustype = {
>   	.name	= "coresight",
>   };
> @@ -1629,9 +1692,15 @@ static int __init coresight_init(void)
>   
>   	/* initialise the coresight syscfg API */
>   	ret = cscfg_init();
> +	if (ret)
> +		goto exit_notifier;
> +
> +	ret = coresight_pm_setup();
>   	if (!ret)
>   		return 0;
>   
> +	cscfg_exit();
> +exit_notifier:
>   	atomic_notifier_chain_unregister(&panic_notifier_list,
>   					     &coresight_notifier);
>   exit_perf:
> @@ -1643,6 +1712,7 @@ static int __init coresight_init(void)
>   
>   static void __exit coresight_exit(void)
>   {
> +	coresight_pm_cleanup();
>   	cscfg_exit();
>   	atomic_notifier_chain_unregister(&panic_notifier_list,
>   					     &coresight_notifier);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 222597ec7a089e10ad763df206917e90f34bb5c2..b10ef4fa17a76b4d11223cc8fd43e5544b6ea8b9 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -439,6 +439,8 @@ struct coresight_ops_panic {
>   struct coresight_ops {
>   	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>   			struct coresight_device *sink);
> +	int (*pm_save_disable)(struct coresight_device *csdev);
> +	void (*pm_restore_enable)(struct coresight_device *csdev);
>   	const struct coresight_ops_sink *sink_ops;
>   	const struct coresight_ops_link *link_ops;
>   	const struct coresight_ops_source *source_ops;
> 


