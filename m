Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB5ECD983
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYWctZuk9caxRUHADLc37fFl0EqjUJ+DzdoAqlPWH0c=; b=f8xeYF1kLE3O1+gQ55pupCMDy/
	bRc9zAmK6m/LtFNgQIBmGq+VCL9gd/qs6beIYh8UhvPrrcMMrFRGgr7mjN610WLtgPXTvK9wCTVn+
	LMcgnsQSSUWE5vcCRXGyT2o+pdXVsDmJbqQI9YTuiuB+p4BoOfcxexpAYTEXykjyDY8B17DZoHxo0
	ahTU13jyb765pxlTFR0FGlxXcKSBR5zfXznVqD3A8m7b/bU2mEJMMOUfoYLmPaPJEbL1Gqu4XPtCQ
	3bRlaGDlvFJZiIKrQDPO17LnThHVihNl/Wd5qznfafcf/pnzm8SSdp7NeAbe9jWF9xWlOgUE6I7Xf
	Gt1vMbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2Yq-0000000AFMM-0Rf2;
	Thu, 05 Feb 2026 16:50:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2Yn-0000000AFLz-1e6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 16:50:31 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f6NVN0NNdzJ467c;
	Fri,  6 Feb 2026 00:49:32 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id F095B40584;
	Fri,  6 Feb 2026 00:50:22 +0800 (CST)
Received: from localhost (10.48.151.164) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Feb
 2026 16:50:21 +0000
Date: Thu, 5 Feb 2026 16:50:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 26/41] arm_mpam: resctrl: Add support for 'MB'
 resource
Message-ID: <20260205165018.0000089c@huawei.com>
In-Reply-To: <20260203214342.584712-27-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
	<20260203214342.584712-27-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.151.164]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_085029_738401_048E28E7 
X-CRM114-Status: GOOD (  40.26  )
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

On Tue, 3 Feb 2026 21:43:27 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> resctrl supports 'MB', as a percentage throttling of traffic from the
> L3. This is the control that mba_sc uses, so ideally the class chosen
> should be as close as possible to the counters used for mbm_total. If
> there is a single L3 and the topology of the memory matches then the
> traffic at the memory controller will be equivalent to that at egress of
> the L3. If these conditions are met allow the memory class to back MB.
> 
> MB's percentage control should be backed either with the fixed point
> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
> bitmaps is not used as its tricky to pick which bits to use to avoid
> contention, and may be possible to expose this as something other than a
> percentage in the future.

I'm very curious to know whether this heuristic is actually useful on many
systems or whether many / most of them fail this 'shape' heuristic.

Otherwise, just comments on the placement of __free related declarations.
See the guidance in cleanup.h for that.

With those moved, 
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> 
> CC: Zeng Heng <zengheng4@huawei.com>
> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Code flow change
> Commit message 'or'
> 
> Changes since v3:
> initialise tmp_cpumask
> update commit message
> check the traffic matches l3
> update comment on candidate_class update, only mbm_total
> drop tags due to rework
> ---
>  drivers/resctrl/mpam_resctrl.c | 275 ++++++++++++++++++++++++++++++++-
>  1 file changed, 274 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 25950e667077..4cca3694978d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> +/*
> + * topology_matches_l3() - Is the provided class the same shape as L3
> + * @victim:		The class we'd like to pretend is L3.
> + *
> + * resctrl expects all the world's a Xeon, and all counters are on the
> + * L3. We allow some mapping counters on other classes. This requires
> + * that the CPU->domain mapping is the same kind of shape.
> + *
> + * Using cacheinfo directly would make this work even if resctrl can't
> + * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
> + * Using the L3 resctrl domain list also depends on CPUs being online.
> + * Using the mpam_class we picked for L3 so we can use its domain list
> + * assumes that there are MPAM controls on the L3.
> + * Instead, this path eventually uses the mpam_get_cpumask_from_cache_id()
> + * helper which can tell us about offline CPUs ... but getting the cache_id
> + * to start with relies on at least one CPU per L3 cache being online at
> + * boot.
> + *
> + * Walk the victim component list and compare the affinity mask with the
> + * corresponding L3. The topology matches if each victim:component's affinity
> + * mask is the same as the CPU's corresponding L3's. These lists/masks are
> + * computed from firmware tables so don't change at runtime.
> + */
> +static bool topology_matches_l3(struct mpam_class *victim)
> +{
> +	int cpu, err;
> +	struct mpam_component *victim_iter;
> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;

Same as below.  Move it down right next to the alloc.

> +
> +	lockdep_assert_cpus_held();
> +
> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
> +		return false;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(victim_iter, &victim->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (cpumask_empty(&victim_iter->affinity)) {
> +			pr_debug("class %u has CPU-less component %u - can't match L3!\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
> +		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +			return false;
> +
> +		cpumask_clear(tmp_cpumask);
> +		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +		if (err) {
> +			pr_debug("Failed to find L3's equivalent component to class %u component %u\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		/* Any differing bits in the affinity mask? */
> +		if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
> +			pr_debug("class %u component %u has Mismatched CPU mask with L3 equivalent\n"
> +				 "L3:%*pbl != victim:%*pbl\n",
> +				 victim->level, victim_iter->comp_id,
> +				 cpumask_pr_args(tmp_cpumask),
> +				 cpumask_pr_args(&victim_iter->affinity));
> +
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Test if the traffic for a class matches that at egress from the L3. For
> + * MSC at memory controllers this is only possible if there is a single L3
> + * as otherwise the counters at the memory can include bandwidth from the
> + * non-local L3.
> + */
> +static bool traffic_matches_l3(struct mpam_class *class) {
> +	int err, cpu;
> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +
> +	lockdep_assert_cpus_held();
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level == 3)
> +		return true;
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
> +		pr_debug("class %u is a different cache from L3\n", class->level);
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n", class->level);
> +		return false;
> +	}
> +

I would suggest following guidance in cleanup.h to put declaration of
destructor and constructor together. That would mean bringing declaration
of tmp_cpumask down here.  The set it NULL at the top pattern got some
firm push back from Linus a while back.

> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL)) {
> +		pr_debug("cpumask allocation failed\n");
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n",
> +			 class->level);
> +		return false;
> +	}
> +
> +	cpu = cpumask_any_and(&class->affinity, cpu_online_mask);
> +	err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +	if (err) {
> +		pr_debug("Failed to find L3 downstream to cpu %d\n", cpu);
> +		return false;
> +	}
> +
> +	if (!cpumask_equal(tmp_cpumask, cpu_possible_mask)) {
> +		pr_debug("There is more than one L3\n");
> +		return false;
> +	}
> +
> +	/* Be strict; the traffic might stop in the intermediate cache. */
> +	if (get_cpu_cacheinfo_id(cpu, 4) != -1) {
> +		pr_debug("L3 isn't the last level of cache\n");
> +		return false;
> +	}
> +
> +	return true;
> +}


