Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD69D5E156
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB21Xj0tgTEEDsqXpQ4k8UhlK0FsEdusKrMXGRFYO7Y=; b=Gr9Fs+yjPma+Gk31yyCbOwCEve
	sZEGPfVThzEDS3QFT7g8FrDKiTgwHBAWcuGpQuV+Y7TVttzWiw0Yb/Y/v/j8fYuJnummyMlQS70O6
	8jPyztOz0B6ozpqgMvla45pMS0nllOcQ11LNA2WI8d3UyXSvpeTSV19w1lWYkdUVsxwT8MjCy8nmE
	GRnQeO6Fbd7cXeVnxbuhUN4lj30fMSTy3HI9L/WqvL3H6flZiFxqhRfJ2wEfRf4NqDNTWSXhDmnpF
	t0tF8U4lph2ULc7utGTGpD0dJm4burW6oJje+jTDUPnEo/U26xfsBX/Erx3XKxrZ41qJsOxoLuC1P
	6nDT4ztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVWA-00000005IqW-2Kim;
	Tue, 16 Dec 2025 13:55:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVW7-00000005Ipd-1NVI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:55:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA274FEC;
	Tue, 16 Dec 2025 05:54:57 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B4DD3F694;
	Tue, 16 Dec 2025 05:55:01 -0800 (PST)
Message-ID: <192e74d8-f5c7-4214-9749-d60453477bf9@arm.com>
Date: Tue, 16 Dec 2025 13:55:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 18/38] arm_mpam: resctrl: Add support for csu counters
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-19-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-19-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_055507_515350_51220F43 
X-CRM114-Status: GOOD (  24.89  )
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

On 12/5/25 21:58, James Morse wrote:
> resctrl exposes a counter via a file named llc_occupancy. This isn't really
> a counter as its value goes up and down, this is a snapshot of the cache
> storage usage monitor.
> 
> Add some picking code to find a cache as close as possible to the L3 that
> supports the CSU monitor.
> 
> If there is an L3, but it doesn't have any controls, force the L3 resource
> to exist. The existing topology_matches_l3() and
> mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
> even if the class belongs to a later cache.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_internal.h |   6 ++
>  drivers/resctrl/mpam_resctrl.c  | 148 ++++++++++++++++++++++++++++++++
>  2 files changed, 154 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 8684bd35d4ab..f9d2a1004c32 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -348,6 +348,12 @@ struct mpam_resctrl_res {
>  	struct rdt_resource	resctrl_res;
>  };
>  
> +struct mpam_resctrl_mon {
> +	struct mpam_class	*class;
> +
> +	/* per-class data that resctrl needs will live here */
> +};
> +
>  static inline int mpam_alloc_csu_mon(struct mpam_class *class)
>  {
>  	struct mpam_props *cprops = &class->props;
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index fe830524639e..fc1f054f187e 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -31,6 +31,16 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
>  /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
>  static DEFINE_MUTEX(domain_list_lock);
>  
> +/*
> + * The classes we've picked to map to resctrl events.
> + * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
> + * array lets us find the actual class backing the event counters. e.g.
> + * the only memory bandwidth counters may be on the memory controller, but to
> + * make use of them, we pretend they are on L3.
> + * Class pointer may be NULL.
> + */
> +static struct mpam_resctrl_mon mpam_resctrl_counters[QOS_NUM_EVENTS];
> +
>  static bool exposed_alloc_capable;
>  static bool exposed_mon_capable;
>  
> @@ -258,6 +268,28 @@ static bool class_has_usable_mba(struct mpam_props *cprops)
>  	return mba_class_use_mbw_max(cprops);
>  }
>  
> +static bool cache_has_usable_csu(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops;
> +
> +	if (!class)
> +		return false;
> +
> +	cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
> +		return false;
> +
> +	/*
> +	 * CSU counters settle on the value, so we can get away with
> +	 * having only one.
> +	 */
> +	if (!cprops->num_csu_mon)
> +		return false;
> +
> +	return (mpam_partid_max > 1) || (mpam_pmg_max != 0);
> +}

Why not allow csu when partid_max and pmg_max are both zero?

Thanks,

Ben


