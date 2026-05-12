Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3594CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGAqF9KOnXCUPVKDUSozZVeXf1lc4fF3RLr2ygVQtdI=; b=Db6lpa7fNjr0OiMG0I3nwBrLy/
	MtPV+1wFhtRf0h8LnXVOl2uQazAFNWqdsNfomakGNC3Q/oIpbysBLc5t1akDUhE0IO0BAWyJNQ96W
	LnK/HkxRz//99okTP8ko8kNUVTqgg8I35Y8uHr9fQCFLVWAkjpOTGivs0Ep6miD0dO6SUViDCgPoV
	C+mRFlKYaBBhFIpIx616iJ4CgUqfakvqU8sjluwvQgq4A8n/6aR5q8cf3qWevMTaKarH+bwuamlJI
	hnBwgCgTCxnGK4ut8+DBN08iNmwwSTZP+4OCd1mJx6QxnZ8v/QrnVyRkKQ44amZLtveGG3AcVvtPP
	4jzYZq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjJ6-0000000GF8t-0c8Q;
	Tue, 12 May 2026 09:21:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjJ2-0000000GF8C-3ZNd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:21:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49460165C;
	Tue, 12 May 2026 02:21:30 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4603F85F;
	Tue, 12 May 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778577695; bh=rVHI0g1ZXeZzYdn5JRy6TJgzmy5LHmX8Hr/6NJELCx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iJoHbZECxITCq+1qSOISt9fBQzwnTyo8fJEyXhjd3jbXeLqgqcdR1VEaZhI0wWvKL
	 JKWy7H0sOsX6sbmo7fICK6XyaMRhLmjyzBWYwnc0cAFlhFKa4E920dzjFt41vFeXoR
	 j8vAfhf06srV3B+jD2Z4lFNZ4rq6lCiBchvKDEnk=
Message-ID: <63f74d29-aa75-43f2-8198-88e21821df12@arm.com>
Date: Tue, 12 May 2026 10:21:29 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 1/5] arm_mpam: resctrl: Pick classes for use as mbm
 counters
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "zengheng4@huawei.com" <zengheng4@huawei.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20260511154147.557481-1-ben.horgan@arm.com>
 <20260511154147.557481-2-ben.horgan@arm.com>
 <TY4PR01MB1693044EDBBF023317F9059A98B392@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <TY4PR01MB1693044EDBBF023317F9059A98B392@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_022137_154191_E674FAB5 
X-CRM114-Status: GOOD (  40.49  )
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

Hi Shaopeng,

On 5/12/26 07:50, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has two types of counters, NUMA-local and global. MPAM can only
>> count global either using MSC at the L3 cache or in the memory controllers.
>> When global and local equate to the same thing continue just to call it
>> global.
>>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc v1:
>> Move finding any_mon_comp into monitor boilerplate patch
>> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
>> Remove free running check
>> Trim commit message
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 226ff6f532fa..f70fa65d39e4 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -606,6 +606,16 @@ static bool cache_has_usable_csu(struct mpam_class *class)
>>          return true;
>>  }
>>  
>> +static bool class_has_usable_mbwu(struct mpam_class *class)
>> +{
>> +       struct mpam_props *cprops = &class->props;
>> +
>> +       if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>> +               return false;
>> +
>> +       return true;
>> +}
>> +
>>  /*
>>   * Calculate the worst-case percentage change from each implemented step
>>   * in the control.
>> @@ -983,6 +993,22 @@ static void mpam_resctrl_pick_counters(void)
>>                                  break;
>>                          }
>>                  }
>> +
>> +               if (class_has_usable_mbwu(class) &&
>> +                   topology_matches_l3(class) &&
>> +                   traffic_matches_l3(class)) {
>> +                       pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
>> +                                class->level);
>> +
>> +                       /*
>> +                        * We can't distinguish traffic by destination so
>> +                        * we don't know if it's staying on the same NUMA
>> +                        * node. Hence, we can't calculate mbm_local except
>> +                        * when we only have one L3 and it's equivalent to
>> +                        * mbm_total and so always use mbm_total.
>> +                        */
>> +                       counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
>> +               }
>>          }
>>  }
>>  
>> -- 
>> 2.43.0
> 
> https://lore.kernel.org/lkml/599617aa-aade-4fde-9efa-79d592f1ff3f@arm.com/
> 
> This concerns the comment I received last time. 
> I may not have fully understood it, so I'd like to clarify it once more.

I'll try and explain better.

> 
> Even if the system as a whole has multiple L3 caches and multiple NUMA nodes,
> ABMC will be enabled as long as there is a single L3 cache and a single corresponding NUMA node.
> Is my understanding correct?
> If my understanding is correct, within the 'traffic_matches_l3()' function,
> ABMC is enabled only when the entire system has a single NUMA node and a single L3 cache.


These restrictions only apply when the MSC containing the bandwidth counters is
at the memory, as advertised by ACPI. When the counters are on the L3 cache
there can be multiple L3 and multiple NUMA nodes and a domain with AMBC memory
bandwidth counters will be exposed for each instance of the L3 cache.

As resctrl, currently, expects all monitors to be on the L3 cache we can only
use counters if they can be considered to be at the L3. The user just sees an
L3_MON directory. When the monitors/counters are at the memory we can only
pretend they are at the L3 when there is a single L3 and a single NUMA node.
This is because the topology needs to match, the same cpus are affine to the L3
instance and corresponding NUMA instance and the traffic measured also needs to
match. If there is multiple NUMA and L3 then cross NUMA traffic means that the
traffic seen at the NUMA node is different from what is seen at the L3.

If a workload runs on cpus affine to the L3, instance A, but allows cross NUMA
traffic then the memory bandwidth leaving the L3, instance A, will be different
from that entering NUMA instance A.

L3_A --> NUMA_A
     \
      \
       🡖
L3_B     NUMA_B

This is still the case if the traffic goes via the L3 to the other NUMA node.

L3_A --> NUMA_A
   |
   |
   ⌄
L3_B --> NUMA_B

The future plan, is to add support for monitoring scoped to the NUMA node in
resctrl. This means we can we can more accurately expose the counters later on
without being held back by inaccurate descriptions. Ideally, we would have added
proper support for monitors at the memory scoped by NUMA node rather than adding
traffic_matches_l3() and topology_matches_l3(), which are there to allow us to
support platforms where the traffic entering the memory controller is the same
as that leaving the L3. To cope with the case when memory is powered down we
need to introduce memory hotplug locking to resctrl as well as the support for
understanding the NUMA scope.

> 
>  870 static bool traffic_matches_l3(struct mpam_class *class)
>  871 {
> ...
>  901
>  902         if (!cpumask_equal(tmp_cpumask, cpu_possible_mask)) {
>  903                 pr_debug("There is more than one L3\n");
>  904                 return false; *
>  905         }
> ...
>  912
>  913         if (num_possible_nodes() > 1) {
>  914                 pr_debug("There is more than one numa node\n");
>  915                 return false;  *
>  916         }
>  917
> ...
>  926 }
> 
> 
> Also, I'd also like to confirm one more thing.
> The mpam_resctrl_pick_mba() function also calls traffic_matches_l3(). 
> This suggests that, except in scenarios where the entire system has a single L3 cache and a single NUMA node (ABMC is disabled),
> the Memory Bandwidth allocation will also be disabled.
> Is this the intended behavior? If so, could you explain why?

Yes, but only when the memory allocation control, mbw_max, is on the memory
controller and not the L3 cache. There is no restriction when the MSC is on the
L3 cache. This is for the same reasons as for the memory bandwidth counters. The
traffic that we say is coming from the L3 may not be the same as that entering
the memory controller and resctrl assumes that the MBA is at the L3. Memory
hotplug locking in resctrl would also be needed here.

Reinete is creating a proof of concept for a structured way to add new schemata
into resctrl, some discussion of initial ideas [1]. I'm also looking to see how
the generic schemata ideas can fit with MPAM and what resctrl support we'd require.

Zeng has indicated [2] that he might look into adding the MB support at NUMA nodes.

I hope this makes things a bit clearer.

[1] https://lore.kernel.org/lkml/fb1e2686-237b-4536-acd6-15159abafcba@intel.com/
[2]
https://lore.kernel.org/linux-arm-kernel/f6f865bc-319c-8944-9989-4fd83a59d4b8@huawei.com/

Thanks,

Ben

> 
> Best regards,
> Shaopeng TAN
> 
> 
> 
> 


