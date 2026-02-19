Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E069E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33mP6oJT/c38nYsTgy6M6vUs24liTAxmVX4cUV2MI8Y=; b=bmzXvn2jUokuu/VFFIJ/r8Y4jL
	RpeZQwCyavqLcfttv9zT7tYLr+yfjAQi5cw0QnwWQ18ECEl+5tQdyUP4tlcgTAkQDxKtK91D8dxiW
	zIND98ZgIkRsAEk0gzjmVtrbiQc5QnTY36jUtnViefQgVnBIqv+cKc+/8a9Qt668aqJBHIqioeiy8
	NqXD381dXrIJDiZFRP6q8WrMyZbihKtu4X9u4Syc3wTGWmdZ2vqEPCxAIcHbaAihkdb1OSnj1jkby
	bwrq4fWBARqp8OftU4PDUP3f8GKZi/x7cIhVCG0L9utAf3W7fV6LvQxo4XP0J11uwQEzQNX3Y4iJU
	irJc2BiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0ZB-0000000BBhd-3tnJ;
	Thu, 19 Feb 2026 09:43:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0Z9-0000000BBgj-1c81
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 09:43:24 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fGpMw1FBLzJ46XM;
	Thu, 19 Feb 2026 17:43:08 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 577F540565;
	Thu, 19 Feb 2026 17:43:21 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Feb
 2026 09:43:20 +0000
Date: Thu, 19 Feb 2026 09:43:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<skelley@nvidia.com>, <ywan@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>
Subject: Re: [PATCH v2 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
Message-ID: <20260219094318.0000283a@huawei.com>
In-Reply-To: <20260218145809.1622856-3-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-3-bwicaksono@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_014323_739246_E1B0D9CE 
X-CRM114-Status: GOOD (  16.39  )
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

On Wed, 18 Feb 2026 14:58:03 +0000
Besar Wicaksono <bwicaksono@nvidia.com> wrote:

> The Unified Coherence Fabric (UCF) contains last level cache
> and cache coherent interconnect in Tegra410 SOC. The PMU in
> this device can be used to capture events related to access
> to the last level cache and memory from different sources.
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
Trivial stuff inline...


> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index e06a06d3407b..c67667097a3c 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>   *
>   */
>  
> @@ -21,6 +21,13 @@
>  #define NV_CNVL_PORT_COUNT           4ULL
>  #define NV_CNVL_FILTER_ID_MASK       GENMASK_ULL(NV_CNVL_PORT_COUNT - 1, 0)
>  
> +#define NV_UCF_SRC_COUNT             3ULL
> +#define NV_UCF_DST_COUNT             4ULL
> +#define NV_UCF_FILTER_ID_MASK        GENMASK_ULL(11, 0)
> +#define NV_UCF_FILTER_SRC            GENMASK_ULL(2, 0)
> +#define NV_UCF_FILTER_DST            GENMASK_ULL(11, 8)
> +#define NV_UCF_FILTER_DEFAULT        (NV_UCF_FILTER_SRC | NV_UCF_FILTER_DST)
> +
>  #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
>  
>  #define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
> @@ -124,6 +131,37 @@ static struct attribute *mcf_pmu_event_attrs[] = {
>  	NULL,
>  };
>  
> +static struct attribute *ucf_pmu_event_attrs[] = {
> +	ARM_CSPMU_EVENT_ATTR(bus_cycles,            0x1D),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_allocate,          0xF0),
> +	ARM_CSPMU_EVENT_ATTR(slc_wb,                0xF3),
> +	ARM_CSPMU_EVENT_ATTR(slc_refill_rd,         0x109),
> +	ARM_CSPMU_EVENT_ATTR(slc_refill_wr,         0x10A),
> +	ARM_CSPMU_EVENT_ATTR(slc_hit_rd,            0x119),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_access_dataless,   0x183),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_atomic,     0x184),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_access,            0xF2),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_rd,         0x111),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_wr,         0x112),
> +	ARM_CSPMU_EVENT_ATTR(slc_bytes_rd,          0x113),
> +	ARM_CSPMU_EVENT_ATTR(slc_bytes_wr,          0x114),
> +
> +	ARM_CSPMU_EVENT_ATTR(mem_access_rd,         0x121),
> +	ARM_CSPMU_EVENT_ATTR(mem_access_wr,         0x122),
> +	ARM_CSPMU_EVENT_ATTR(mem_bytes_rd,          0x123),
> +	ARM_CSPMU_EVENT_ATTR(mem_bytes_wr,          0x124),
> +
> +	ARM_CSPMU_EVENT_ATTR(local_snoop,           0x180),
> +	ARM_CSPMU_EVENT_ATTR(ext_snp_access,        0x181),
> +	ARM_CSPMU_EVENT_ATTR(ext_snp_evict,         0x182),
> +
> +	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
> +	NULL,
Whilst it's locally consistent.  In general commas after NULL terminators
are something that makes little sense.  The whole point of that terminator
is nothing will ever come after it...

I wouldn't have commented but...
> +};

>  enum nv_cspmu_name_fmt {
>  	NAME_FMT_GENERIC,
> @@ -342,6 +413,23 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
>  		.init_data = NULL
>  	  },
>  	},
> +	{
> +	  .prodid = 0x2CF20000,
> +	  .prodid_mask = NV_PRODID_MASK,
> +	  .name_pattern = "nvidia_ucf_pmu_%u",
> +	  .name_fmt = NAME_FMT_SOCKET,
> +	  .template_ctx = {
> +		.event_attr = ucf_pmu_event_attrs,
> +		.format_attr = ucf_pmu_format_attrs,
> +		.filter_mask = NV_UCF_FILTER_ID_MASK,
> +		.filter_default_val = NV_UCF_FILTER_DEFAULT,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = ucf_pmu_event_filter,
> +		.get_filter2 = NULL,
> +		.init_data = NULL
Also locally consistent but generally considered a bad thing to do.
It is certainly possible that in future the template_ctx will gain another field
so the lack of a trailing comma here will then create unnecessary noise.

For this reason trailing commas are normally used in structure initialization.

Jonathan

> +	  },
> +	},
>  	{
>  	  .prodid = 0,
>  	  .prodid_mask = 0,


