Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75773C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oum73zYOwAW8pcL2qDKDT0klsqriM3sjOw/zj0f1VmU=; b=3U8qe8RliR2dohbZ9Ib1SfnTb9
	HQpwSAFkZ0OXJg+m+XQu8zDki7asrUZ9mf1QqaeAun80bC3tsN6EaoxSphpxjIr2wYF11q5J6pOrc
	dcp30RcBU7oUira+OhIZs6sqDgKk+OL1P7ABFcwEbXPhGJ4c5ZgkVNTcAFTwKNLYucS+ieRbIPyhL
	e18KYJiev5IrMapBYo3wlqGu5kLzbVnr15WH/rCIcO/vU4wpo9SotEUfuPlRzPz90CufTMdYMtKWP
	q0+z5vfSYsC+2sGlHXhjANzAH3AnKTWEf/W3Q6C0qUXW+BY0CE1dwcXjiVJW4scgNRGeQ4Vu/KCea
	KYcrfZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHa4-0000000238b-27Ly;
	Mon, 14 Jul 2025 11:42:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHXc-000000022tq-1BKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:40:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 190571BC0;
	Mon, 14 Jul 2025 04:40:04 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20B393F694;
	Mon, 14 Jul 2025 04:40:10 -0700 (PDT)
Message-ID: <bfc4d1b5-c8c4-45de-b52a-833486368336@arm.com>
Date: Mon, 14 Jul 2025 12:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/36] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-5-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-5-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_044016_414465_82AD3725 
X-CRM114-Status: GOOD (  19.99  )
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

Hi James,

On 7/11/25 19:36, James Morse wrote:
> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until device_initcall().
> 
> Expose the code that generates the cache-id. The parts of the MPAM
> driver that run early can use this to set up the resctrl structures
> before cacheinfo is ready in device_initcall().
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Renamed cache_of_get_id() cache_of_calculate_id().
> ---
>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>   include/linux/cacheinfo.h |  1 +
>   2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 613410705a47..0fdd6358ee73 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -207,8 +207,7 @@ static bool match_cache_node(struct device_node *cpu,
>   #define arch_compact_of_hwid(_x)	(_x)
>   #endif
>   
> -static void cache_of_set_id(struct cacheinfo *this_leaf,
> -			    struct device_node *cache_node)
> +unsigned long cache_of_calculate_id(struct device_node *cache_node)
>   {
>   	struct device_node *cpu;
>   	u32 min_id = ~0;
> @@ -219,15 +218,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>   		id = arch_compact_of_hwid(id);
>   		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>   			of_node_put(cpu);
> -			return;
> +			return ~0UL;
>   		}
>   
>   		if (match_cache_node(cpu, cache_node))
>   			min_id = min(min_id, id);
>   	}
>   
> -	if (min_id != ~0) {
> -		this_leaf->id = min_id;
> +	return min_id;
Looks like some 32bit/64bit confusion. Don't we want to return ~0UL if 
min_id == ~0?
> +}
> +
> +static void cache_of_set_id(struct cacheinfo *this_leaf,
> +			    struct device_node *cache_node)
> +{
> +	unsigned long id = cache_of_calculate_id(cache_node);
> +
> +	if (id != ~0UL) {
> +		this_leaf->id = id;
>   		this_leaf->attributes |= CACHE_ID;
>   	}
>   }
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index c8f4f0a0b874..2dcbb69139e9 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
>   #endif
>   
>   const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
> +unsigned long cache_of_calculate_id(struct device_node *np);
>   
>   /*
>    * Get the cacheinfo structure for the cache associated with @cpu at

Thanks,

Ben


