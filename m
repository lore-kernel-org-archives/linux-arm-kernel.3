Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE758CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+WbW2/AMhXZdEubCnrJgm7dbLwFj9qtF+7pjh0jU2E=; b=rw08eyNPdeeHj9DrzY4lIQnAC7
	Y9psak20bmCi6LW90WcuwmjumaeJnsdqVnUVb5WL7La1136I61XCldZD/q8mQmaBmLQv5ZECIBxDk
	KEh07nqugHTrQ944/sloHhHc5ILIExN8UNwla2YQvaM+QMmJU9mTerup54CQypYd7f07PYN79FgEL
	pnawbk5giah2V/buRD0Ue8ukdoe3W2mKd5N0RHm1DxDu4ErxXYPfnyQFopXufwWjqlnECCTkpVz45
	FzDlAL392Y3D4Frkl5fFWx624IWpXjOFraVjp9hoNXm+AU8l8Cn7H6+9RGd/evQPjoknMgqldJBMm
	McsVkW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMd1-00000000Puf-1PnK;
	Thu, 15 Oct 2026 14:40:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMcz-00000000Ptv-497O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:40:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C91B60120;
	Thu, 15 Oct 2026 14:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73BE1F000C4;
	Thu, 15 Oct 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075216;
	bh=x+WbW2/AMhXZdEubCnrJgm7dbLwFj9qtF+7pjh0jU2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=apf57+B3qo2bNygvN+Rge7NO4qF6q6JofjpUvYbWCm1IoR71qccfsx7EqtONodgIo
	 wXK6Ag2NlWGx4zGWGABznTEexPi0A66v71B6r/PN7dqlJypF3w1wtlNxemZxiafXsV
	 e6tlZ5R36fSJNjRaNooV5u45XuIEqlODGHrUnWb5tYdNGT5SBN7xLIwyusgN7vbdZ5
	 MFivwOGSTDU/wUTwsWRcLeKarHj2H+ATjw4SA1b/ETeMBE6xLP4MmtWZzlKQ4QDDtU
	 E15YNSxPiGeb+pvPG2MjQIHHUtfds0IZpVM2At6bBU6kogrLPL/aMb/cfyCKk7vTNU
	 N+nd1M4bdZDtQ==
Date: Thu, 15 Oct 2026 15:40:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 04/28] perf: arm_spe_pmu: Move struct arm_spe_pmu
 to a separate header file
Message-ID: <atDgBR0WOGHUsLaF@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-5-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-5-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:05:59PM +0100, Alexandru Elisei wrote:
> KVM will soon want to make use of struct arm_spe_pmu, move it to a separate
> header where it will be easily accessible.
>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Looks to be a straightforward mechanical change, couple nits below but with
those addressed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  drivers/perf/arm_spe_pmu.c       | 33 +--------------------
>  include/linux/perf/arm_spe_pmu.h | 50 ++++++++++++++++++++++++++++++++

This should be added to MAINTAINERS too I think?

>  2 files changed, 51 insertions(+), 32 deletions(-)
>  create mode 100644 include/linux/perf/arm_spe_pmu.h
>
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index b70f3fedf028..79c571a649d5 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -28,6 +28,7 @@
>  #include <linux/of.h>
>  #include <linux/perf_event.h>
>  #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_spe_pmu.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
>  #include <linux/slab.h>
> @@ -67,38 +68,6 @@ struct arm_spe_pmu_buf {
>  	void					*base;
>  };
>
> -struct arm_spe_pmu {
> -	struct pmu				pmu;
> -	struct platform_device			*pdev;
> -	cpumask_t				supported_cpus;
> -	struct hlist_node			hotplug_node;
> -
> -	int					irq; /* PPI */
> -	u16					pmsver;
> -	u16					min_period;
> -	u16					counter_sz;
> -
> -#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> -#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> -#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> -#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> -#define SPE_PMU_FEAT_LDS			(1UL << 4)
> -#define SPE_PMU_FEAT_ERND			(1UL << 5)
> -#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> -#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> -#define SPE_PMU_FEAT_EFT			(1UL << 8)
> -#define SPE_PMU_FEAT_FDS			(1UL << 9)
> -#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> -	u64					features;
> -
> -	u64					pmsevfr_res0;
> -	u16					max_record_sz;
> -	u16					align;
> -	struct perf_output_handle __percpu	*handle;
> -};
> -
> -#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> -
>  /* Convert a free-running index from perf into an SPE buffer offset */
>  #define PERF_IDX2OFF(idx, buf) \
>  	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
> diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
> new file mode 100644
> index 000000000000..af86fd184050
> --- /dev/null
> +++ b/include/linux/perf/arm_spe_pmu.h
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0

Pedantic I know, sorry :P but as per Documentation/process/license-rules.rst:

      C source:	// SPDX-License-Identifier: <SPDX License Expression>
      C header:	/* SPDX-License-Identifier: <SPDX License Expression> */
      ...

So should be /* */ here.

> +/*
> + * Split from driver/perf/arm_spe_pmu.c

NIT: should be drivers/...

> + *
> + * Copyright (C) 2016 ARM Limited
> + */
> +
> +#ifndef __PERF_ARM_SPE_PMU_H__
> +#define __PERF_ARM_SPE_PMU_H__
> +
> +#include <linux/cpumask.h>
> +#include <linux/container_of.h>
> +#include <linux/list.h>
> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +struct arm_spe_pmu {
> +	struct pmu				pmu;
> +	struct platform_device			*pdev;
> +	cpumask_t				supported_cpus;
> +	struct hlist_node			hotplug_node;
> +
> +	int					irq; /* PPI */
> +	u16					pmsver;
> +	u16					min_period;
> +	u16					counter_sz;
> +
> +#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> +#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> +#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> +#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> +#define SPE_PMU_FEAT_LDS			(1UL << 4)
> +#define SPE_PMU_FEAT_ERND			(1UL << 5)
> +#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> +#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> +#define SPE_PMU_FEAT_EFT			(1UL << 8)
> +#define SPE_PMU_FEAT_FDS			(1UL << 9)
> +#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> +	u64					features;
> +
> +	u64					pmsevfr_res0;
> +	u16					max_record_sz;
> +	u16					align;
> +	struct perf_output_handle __percpu	*handle;
> +};
> +
> +#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> +
> +#endif /* __PERF_ARM_SPE_PMU_H__ */
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

