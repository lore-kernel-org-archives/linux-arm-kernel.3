Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91779E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJvGq2FKRsfVFdj7qjosfzrOox57x5mEBNoyUl3+KbM=; b=YOqUGSjr0xz/AItYvheysAf/Sz
	miZjJLQupxqlfYIw4bi0cmu4A4tKPdTEpABZKPvWJsA0dRNQaSXTYCKwuZS2YpAWr0BD2twoaWm92
	8Ofqjp/GJlSLblL4gfC3+VEa8dP17rNzpCYHvS+d3BlFgqs7gYYo803BASLJBiKcjXsoo9ULOXJuN
	nxu1s5e3XLoX53VzcMtde7AdUbwmBgcdhSDdsSHOgCL/ullSAOxkDmjPSVdT3/fJNE3arOHI2imZN
	nJpSJVl870epHtCFLT24OfjGqmbJyzITg0iV91PJVk5k5Mx4v3+1lPf/MiQucKauZNoOexj1Wnirt
	ThgBQtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0WT-0000000BBUk-3W4P;
	Thu, 19 Feb 2026 09:40:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0WQ-0000000BBTr-0OTQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 09:40:36 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fGpJV5YvHzJ46Zg;
	Thu, 19 Feb 2026 17:40:10 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id E984340569;
	Thu, 19 Feb 2026 17:40:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Feb
 2026 09:40:23 +0000
Date: Thu, 19 Feb 2026 09:40:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<skelley@nvidia.com>, <ywan@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>
Subject: Re: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Message-ID: <20260219094021.0000465d@huawei.com>
In-Reply-To: <20260218145809.1622856-4-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-4-bwicaksono@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_014034_466867_27384BF0 
X-CRM114-Status: GOOD (  23.68  )
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

On Wed, 18 Feb 2026 14:58:04 +0000
Besar Wicaksono <bwicaksono@nvidia.com> wrote:

> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
Hi Besar,

A drive by review as I was curious.

A few comments inline.
> ---
>  drivers/perf/arm_cspmu/arm_cspmu.c | 22 +++++++++++++++++++++-
>  drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 34430b68f602..ab2479c048bb 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -16,7 +16,7 @@
>   * The user should refer to the vendor technical documentation to get details
>   * about the supported events.
>   *
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>   *
>   */
>  
> @@ -1132,6 +1132,26 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  
>  	return 0;
>  }
> +
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	char hid[16];
> +	char uid[16];

Might as well do
	char hid[16] = { };
	char uid[16] = { };

and drop the memsets below.

> +	const struct acpi_apmt_node *apmt_node;
> +
> +	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
> +	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
> +		return NULL;
> +
> +	memset(hid, 0, sizeof(hid));
> +	memset(uid, 0, sizeof(uid));
> +
> +	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
> +	snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
> +
> +	return acpi_dev_get_first_match_dev(hid, uid, -1);
> +}
> +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
>  #else
>  static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  {
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index cd65a58dbd88..320096673200 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -1,13 +1,14 @@
>  /* SPDX-License-Identifier: GPL-2.0
>   *
>   * ARM CoreSight Architecture PMU driver.
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>   *
>   */
>  
>  #ifndef __ARM_CSPMU_H__
>  #define __ARM_CSPMU_H__
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/cpumask.h>
>  #include <linux/device.h>
> @@ -255,4 +256,18 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
>  /* Unregister vendor backend. */
>  void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>  
> +#if defined(CONFIG_ACPI)
This isn't the same gate as used for whether the function is built. I think that's 
#if defined(CONFIG_ACPI) && defined(CONFIG_ARM64)

Whilst it might work to have them different today I think this is a little more
fragile than would be ideal.

The ARM64 bit seems to be there to allow COMPILE_TEST for
ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU  and to me that smells like a stub or Kconfig
dependency missing.

> +/**
> + * Get ACPI device associated with the PMU.
> + * The caller is responsible for calling acpi_dev_put() on the returned device.
> + */
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
> +#else
> +static inline struct acpi_device *
> +arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #endif /* __ARM_CSPMU_H__ */


