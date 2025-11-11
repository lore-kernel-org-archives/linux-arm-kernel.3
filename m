Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBACCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VhCwkWqs7qRmBitEcrF0VtlHe8n9xxU+b39QH1QQj8=; b=4+3uUwI4ESkkSWF586odFdliNS
	6odFr8ylXPg8d12TOqwRNKhjJPC2XZnD2wIk8t01T3uIFyW1HYrNjtdG/EtXWy+5HHtDP4rAwwfBq
	GjuIdE4UEBftY2vsLlWFv3YigzhILKJZxGKvFUjQDJyMjQ52p7Rzgpy7D+CeYYyp7+4BG7U+vjpHn
	n1cyiJCHOMo1RTAxJLK15/1laOiswR4EHVbqvnDRLf/BsfTEJg6xqru8McBQL2eJ51oaVrRHahUUn
	h/7NScMzZJUEWZQKN+QllSw1mzxif8vk2bvAUKPMcmFUsBful9V6Vp5EhsnOb5XoAJnIdF/oMfqGh
	xkKbOR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIp4b-00000007IEJ-4BmM;
	Tue, 11 Nov 2025 14:10:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIp4Z-00000007IDS-0DT9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:10:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 339842F;
	Tue, 11 Nov 2025 06:10:06 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DA653F63F;
	Tue, 11 Nov 2025 06:10:12 -0800 (PST)
Message-ID: <24baf1ba-f3a1-4cbe-a942-c5dae7318047@arm.com>
Date: Tue, 11 Nov 2025 14:10:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] coresight: Save activated path into source
 device
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_061015_212479_5CDD8DFD 
X-CRM114-Status: GOOD (  28.06  )
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
> Save activated path into the source device's coresight_device structure.
> The path pointer will be used by later changes for controlling the path
> during CPU idle.
> 
> The path pointer is assigned before setting the source device mode to
> active, and it is cleared after the device is changed to an inactive
> mode. So safe access to path pointers is guaranteed when the device is
> in an active mode.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 39 +++++++++++++++++++++++++++-
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c28f3d255b0e19b3d982de95b8e34d0fc2954b95..3ea31ed121f7b59d7822fba4df4c43efb1c76fe7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -399,13 +399,50 @@ int coresight_enable_source(struct coresight_device *csdev,
>   			    struct perf_event *event, enum cs_mode mode,
>   			    struct coresight_path *path)
>   {
> -	return source_ops(csdev)->enable(csdev, event, mode, path);
> +	int ret;
> +
> +	/*
> +	 * Record the path in the source device. The path pointer is first
> +	 * assigned, followed by transitioning from DISABLED mode to an enabled
> +	 * state on the target CPU. Conversely, during the disable flow, the
> +	 * device mode is set to DISABLED before the path pointer is cleared.
> +	 *
> +	 * This ordering ensures the path pointer to be safely access under the
> +	 * following race condition:
> +	 *
> +	 *  CPU(a)                          CPU(b)
> +	 *
> +	 *  coresight_enable_source()
> +	 *    STORE source->path;
> +	 *    smp_mb();
> +	 *    source_ops(csdev)->enable();
> +	 *                              `-> etm4_enable_sysfs_smp_call()
> +	 *                                    STORE source->mode;
> +	 *
> +	 * This sequence ensures that accessing the path pointer is safe when
> +	 * the device is in enabled mode.
> +	 */
> +	csdev->path = path;
> +
> +	/* Synchronization between csdev->path and csdev->mode */
> +	smp_mb();
> +
> +	ret = source_ops(csdev)->enable(csdev, event, mode, path);

What happens if the csdev is already enabled ? We corrupt the 
csdev->path ? Can we not move this into the source devices and let them
handle it gracefully, as they do for the "mode" ?

To address James' comment on reusing the sysfs path, I think we could
make this a global thing for all types of source/mode.

Suzuki


> +	if (ret)
> +		csdev->path = NULL;
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(coresight_enable_source);
>   
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> +
> +	/* Synchronization between csdev->path and csdev->mode */
> +	smp_mb();
> +	csdev->path = NULL;
> +
>   	coresight_disable_helpers(csdev, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 3d59be214dd25dfa7ad9148a6688628e0d1a98dd..58484c225e58a68dd74739a48c08a409ce9ddd73 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -264,6 +264,7 @@ struct coresight_trace_id_map {
>    *		spinlock.
>    * @orphan:	true if the component has connections that haven't been linked.
>    * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
> + * @path:	Activated path pointer (only used for source device).
>    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>    *		by writing a 1 to the 'enable_sink' file.  A sink can be
>    *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -291,6 +292,7 @@ struct coresight_device {
>   	int refcnt;
>   	bool orphan;
>   	int cpu;
> +	struct coresight_path *path;
>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
>   	struct dev_ext_attribute *ea;
> 


