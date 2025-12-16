Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F520D609B7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvBIZJXRH0npCfQhDSmPLW559A69xlpARWt5ABuGlN4=; b=G3tcPV9wCpRogezoI9RLVDf8GX
	zcaCpfmH9XBZeV4XZFKyRcqaYwxEKRSyFAHD5il4eQtsDyu0WJ0AVmykdMSKIUDEPTU7zoLUxxmdA
	cL/oxuP+oxBuZft0Rf6iornbuCcWxihfeOC0mklKqWE3pmMCTVNmPja/g+0rZd9ATi8pmexilWNmS
	aE/2rWNjqaeNyOVWq5+Ug1i0wbRKYldki++/YipTByuWTFBgMg5DjBSlvLBULvaC1VBU5uraynoEu
	0qWSjy76OoVyxbZl8tJowB2dF9uMKb5VdBVZahYk8mX9vTxc4oJvMqMhENK325Tm2JMaL1TStLedW
	K/K8Yk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXQ6-00000005UaI-3nQl;
	Tue, 16 Dec 2025 15:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXQ3-00000005UZ5-1LQ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:57:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33C18FEC;
	Tue, 16 Dec 2025 07:56:51 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C71763F73F;
	Tue, 16 Dec 2025 07:56:54 -0800 (PST)
Message-ID: <934ac602-f467-4359-8505-de7879201b7a@arm.com>
Date: Tue, 16 Dec 2025 15:56:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/38] arm_mpam: resctrl: Add support for 'MB'
 resource
To: Gavin Shan <gshan@redhat.com>, James Morse <james.morse@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, rohit.mathew@arm.com,
 reinette.chatre@intel.com, Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
 Zeng Heng <zengheng4@huawei.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-17-james.morse@arm.com>
 <6d257a70-d27f-4741-8fa5-fa765fa10643@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <6d257a70-d27f-4741-8fa5-fa765fa10643@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_075700_918909_887F534F 
X-CRM114-Status: GOOD (  36.17  )
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

Hi Gavin,

On 12/12/25 04:27, Gavin Shan wrote:
> Hi James and Ben,
> 
> On 12/6/25 7:58 AM, James Morse wrote:
>> resctrl supports 'MB', as a percentage throttling of traffic somewhere
>> after the L3. This is the control that mba_sc uses, so ideally the
>> class chosen should be as close as possible to the counters used for
>> mba_local.
>>
>> MB's percentage control should be backed either with the fixed point
>> fraction MBW_MAX. The bandwidth portion bitmaps is not used as its
>> tricky to pick which bits to use to avoid contention, and may be
>> possible to expose this as something other than a percentage in the
>> future.
>>
>> CC: Zeng Heng <zengheng4@huawei.com>
>> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>>
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 212 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 211 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index 55576d0caf12..b9f3f00d8cad 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -247,6 +247,33 @@ static bool cache_has_usable_cpor(struct
>> mpam_class *class)
>>       return (class->props.cpbm_wd <= 32);
>>   }
>>   +static bool mba_class_use_mbw_max(struct mpam_props *cprops)
>> +{
>> +    return (mpam_has_feature(mpam_feat_mbw_max, cprops) &&
>> +        cprops->bwa_wd);
>> +}
>> +
>> +static bool class_has_usable_mba(struct mpam_props *cprops)
>> +{
>> +    return mba_class_use_mbw_max(cprops);
>> +}
>> +
>> +/*
>> + * Calculate the worst-case percentage change from each implemented step
>> + * in the control.
>> + */
>> +static u32 get_mba_granularity(struct mpam_props *cprops)
>> +{
>> +    if (!mba_class_use_mbw_max(cprops))
>> +        return 0;
>> +
>> +    /*
>> +     * bwa_wd is the number of bits implemented in the 0.xxx
>> +     * fixed point fraction. 1 bit is 50%, 2 is 25% etc.
>> +     */
>> +    return DIV_ROUND_UP(MAX_MBA_BW, 1 << cprops->bwa_wd);
>> +}
>> +
>>   /*
>>    * Each fixed-point hardware value architecturally represents a range
>>    * of values: the full range 0% - 100% is split contiguously into
>> @@ -287,6 +314,96 @@ static u16 percent_to_mbw_max(u8 pc, struct
>> mpam_props *cprops)
>>       return val;
>>   }
>>   +static u32 get_mba_min(struct mpam_props *cprops)
>> +{
>> +    u32 val = 0;
>> +
>> +    if (mba_class_use_mbw_max(cprops))
>> +        val = mbw_max_to_percent(val, cprops);
>> +    else
>> +        WARN_ON_ONCE(1);
>> +
>> +    return val;
>> +}
>> +
>> +/* Find the L3 cache that has affinity with this CPU */
>> +static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t
>> tmp_cpumask)
>> +{
>> +    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +    lockdep_assert_cpus_held();
>> +
>> +    return mpam_get_cpumask_from_cache_id(cache_id, 3, tmp_cpumask);
>> +}
>> +
>> +/*
>> + * topology_matches_l3() - Is the provided class the same shape as L3
>> + * @victim:        The class we'd like to pretend is L3.
>> + *
>> + * resctrl expects all the world's a Xeon, and all counters are on the
>> + * L3. We play fast and loose with this, mapping counters on other
>> + * classes - provided the CPU->domain mapping is the same kind of shape.
>> + *
>> + * Using cacheinfo directly would make this work even if resctrl can't
>> + * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
>> + * Using the L3 resctrl domain list also depends on CPUs being online.
>> + * Using the mpam_class we picked for L3 so we can use its domain list
>> + * assumes that there are MPAM controls on the L3.
>> + * Instead, this path eventually uses the
>> mpam_get_cpumask_from_cache_id()
>> + * helper which can tell us about offline CPUs ... but getting the
>> cache_id
>> + * to start with relies on at least one CPU per L3 cache being online at
>> + * boot.
>> + *
>> + * Walk the victim component list and compare the affinity mask with the
>> + * corresponding L3. The topology matches if each victim:component's
>> affinity
>> + * mask is the same as the CPU's corresponding L3's. These lists/
>> masks are
>> + * computed from firmware tables so don't change at runtime.
>> + */
>> +static bool topology_matches_l3(struct mpam_class *victim)
>> +{
>> +    int cpu, err;
>> +    struct mpam_component *victim_iter;
>> +    cpumask_var_t __free(free_cpumask_var) tmp_cpumask;
>> +
>> +    if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
>> +        return false;
>> +
>> +    guard(srcu)(&mpam_srcu);
>> +    list_for_each_entry_srcu(victim_iter, &victim->components,
>> class_list,
>> +                 srcu_read_lock_held(&mpam_srcu)) {
>> +        if (cpumask_empty(&victim_iter->affinity)) {
>> +            pr_debug("class %u has CPU-less component %u - can't
>> match L3!\n",
>> +                 victim->level, victim_iter->comp_id);
>> +            return false;
>> +        }
>> +
>> +        cpu = cpumask_any(&victim_iter->affinity);
>> +        if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
>> +            return false;
>> +
>> +        cpumask_clear(tmp_cpumask);
>> +        err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
>> +        if (err) {
>> +            pr_debug("Failed to find L3's equivalent component to
>> class %u component %u\n",
>> +                 victim->level, victim_iter->comp_id);
>> +            return false;
>> +        }
>> +
>> +        /* Any differing bits in the affinity mask? */
>> +        if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
>> +            pr_debug("class %u component %u has Mismatched CPU mask
>> with L3 equivalent\n"
>> +                 "L3:%*pbl != victim:%*pbl\n",
>> +                 victim->level, victim_iter->comp_id,
>> +                 cpumask_pr_args(tmp_cpumask),
>> +                 cpumask_pr_args(&victim_iter->affinity));
>> +
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>>   static void mpam_resctrl_pick_caches(void)
>>   {
>> @@ -330,10 +447,63 @@ static void mpam_resctrl_pick_caches(void)
>>       }
>>   }
>>   +static void mpam_resctrl_pick_mba(void)
>> +{
>> +    struct mpam_class *class, *candidate_class = NULL;
>> +    struct mpam_resctrl_res *res;
>> +
>> +    lockdep_assert_cpus_held();
>> +
>> +    guard(srcu)(&mpam_srcu);
>> +    list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>> +                 srcu_read_lock_held(&mpam_srcu)) {
>> +        struct mpam_props *cprops = &class->props;
>> +
>> +        if (class->level < 3) {
>> +            pr_debug("class %u is before L3\n", class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!class_has_usable_mba(cprops)) {
>> +            pr_debug("class %u has no bandwidth control\n",
>> +                 class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
>> +            pr_debug("class %u has missing CPUs\n", class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!topology_matches_l3(class)) {
>> +            pr_debug("class %u topology doesn't match L3\n",
>> +                 class->level);
>> +            continue;
>> +        }
>> +
>> +        /*
>> +         * mba_sc reads the mbm_local counter, and waggles the MBA
>> +         * controls. mbm_local is implicitly part of the L3, pick a
>> +         * resource to be MBA that as close as possible to the L3.
>> +         */
>> +        if (!candidate_class || class->level < candidate_class->level)
>> +            candidate_class = class;
>> +    }
>> +
>> +    if (candidate_class) {
>> +        pr_debug("selected class %u to back MBA\n",
>> +             candidate_class->level);
>> +        res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
>> +        res->class = candidate_class;
>> +        exposed_alloc_capable = true;
>> +    }
>> +}
>> +
>>   static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>>                        enum resctrl_res_level type)
>>   {
>>       struct mpam_class *class = res->class;
>> +    struct mpam_props *cprops = &class->props;
>>       struct rdt_resource *r = &res->resctrl_res;
>>         switch (res->resctrl_res.rid) {
>> @@ -362,6 +532,20 @@ static int mpam_resctrl_control_init(struct
>> mpam_resctrl_res *res,
>>            * 'all the bits' is the correct answer here.
>>            */
>>           r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>> +        break;
>> +    case RDT_RESOURCE_MBA:
>> +        r->alloc_capable = true;
>> +        r->schema_fmt = RESCTRL_SCHEMA_RANGE;
>> +        r->ctrl_scope = RESCTRL_L3_CACHE;
>> +
>> +        r->membw.delay_linear = true;
>> +        r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
>> +        r->membw.min_bw = get_mba_min(cprops);
>> +        r->membw.max_bw = MAX_MBA_BW;
>> +        r->membw.bw_gran = get_mba_granularity(cprops);
>> +
>> +        r->name = "MB";
>> +
>>           break;
>>       default:
>>           break;
>> @@ -377,7 +561,17 @@ static int mpam_resctrl_pick_domain_id(int cpu,
>> struct mpam_component *comp)
>>       if (class->type == MPAM_CLASS_CACHE)
>>           return comp->comp_id;
>>   -    /* TODO: repaint domain ids to match the L3 domain ids */
>> +    if (topology_matches_l3(class)) {
>> +        /* Use the corresponding L3 component ID as the domain ID */
>> +        int id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +        /* Implies topology_matches_l3() made a mistake */
>> +        if (WARN_ON_ONCE(id == -1))
>> +            return comp->comp_id;
>> +
>> +        return id;
>> +    }
>> +
>>       /*
>>        * Otherwise, expose the ID used by the firmware table code.
>>        */
>> @@ -419,6 +613,12 @@ u32 resctrl_arch_get_config(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>       case RDT_RESOURCE_L3:
>>           configured_by = mpam_feat_cpor_part;
>>           break;
>> +    case RDT_RESOURCE_MBA:
>> +        if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
>> +            configured_by = mpam_feat_mbw_max;
>> +            break;
>> +        }
>> +        fallthrough;
>>       default:
>>           return resctrl_get_default_ctrl(r);
>>       }
>> @@ -430,6 +630,8 @@ u32 resctrl_arch_get_config(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>       switch (configured_by) {
>>       case mpam_feat_cpor_part:
>>           return cfg->cpbm;
>> +    case mpam_feat_mbw_max:
>> +        return mbw_max_to_percent(cfg->mbw_max, cprops);
>>       default:
>>           return resctrl_get_default_ctrl(r);
>>       }
>> @@ -474,6 +676,13 @@ int resctrl_arch_update_one(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>           cfg.cpbm = cfg_val;
>>           mpam_set_feature(mpam_feat_cpor_part, &cfg);
>>           break;
>> +    case RDT_RESOURCE_MBA:
>> +        if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
>> +            cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
>> +            mpam_set_feature(mpam_feat_mbw_max, &cfg);
>> +            break;
>> +        }
>> +        fallthrough;
> 
> I think mpam_feat_mbw_min peroperly need to be cleared in '&cfg', whose
> content
> is copied from that of the component. mpam_feat_mbw_min may have been
> existing
> in '&cfg' and struct mpam_config::mbw_min won't be updated correctly in the
> subsequent call mpam_extend_config(). It means register MPAMCFG_MBW_MIN
> isn't
> updated correctly.

Thanks for the report. The suggested fix makes sense too. I'll fix this
in the later patch where mbw_min is introduced.

> 
> On NVidia's grace-hopper machine, I got:
> 
> host$ mount none -tresctrl /sys/fs/resctrl/
> host$ mkdir -p /sys/fs/resctrl/all
> host$ mkdir -p /sys/fs/resctrl/test
> host$ cat /proc/dump_feat_regs
> MPAMF_IDR         0000008057010027
> MAPMF_MBW_IDR     00000c07
> 
> host$ echo "MB:1=98" > /sys/fs/resctrl/test/schemata
> host$ cat /proc/dump_cfg_regs
> MPAMCFG_PART_SEL  00000002
> MPAMCFG_MBW_MAX   0000f9ff
> MPAMCFG_MBW_MIN   0000f000
> 
> host$ echo "MB:1=2" > /sys/fs/resctrl/test/schemata
> host$ cat /proc/dump_cfg_regs
> MPAMCFG_PART_SEL  00000002
> MPAMCFG_MBW_MAX   000005ff
> MPAMCFG_MBW_MIN   0000f000
> 
> With 'mpam_clear_feature(mpam_feat_mbw_min, &cfg);' applied here, the
> register
> can be updated correctly. It also makes my (soft) MBW limiting tests happy.
> 
> host$ echo "MB:1=98" > /sys/fs/resctrl/test/schemata
> host$ cat /proc/dump_cfg_regs
> MPAMCFG_PART_SEL  00000002
> MPAMCFG_MBW_MAX   0000f9ff
> MPAMCFG_MBW_MIN   0000ea00
> 
> host$ echo "MB:1=2" > /sys/fs/resctrl/test/schemata
> host$ cat /proc/dump_cfg_regs
> MPAMCFG_PART_SEL  00000002
> MPAMCFG_MBW_MAX   000005ff
> MPAMCFG_MBW_MIN   00000200
> 
> 
> Thanks,
> Gavin
> 
>>       default:
>>           return -EINVAL;
>>       }
>> @@ -743,6 +952,7 @@ int mpam_resctrl_setup(void)
>>         /* Find some classes to use for controls */
>>       mpam_resctrl_pick_caches();
>> +    mpam_resctrl_pick_mba();
>>         /* Initialise the resctrl structures from the classes */
>>       for (i = 0; i < RDT_NUM_RESOURCES; i++) {
> 

Thanks,

Ben


