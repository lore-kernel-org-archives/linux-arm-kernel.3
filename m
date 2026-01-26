Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1033D13C28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEFllRlaft9XDyrCEtt4mCp9tiGaSLEBNcfs8QMhq4w=; b=B/R9l8e3ERo9p9zbXVF/VByfU7
	5zUQXfcXvcSJPitFlCtjlwu7sXtZV8nXU84JH4aV7Fwen0kwpMVCQf4QluQ9gUIwDbDe3rZ7Tgqgh
	22IEblkHO6ihbhFABF0gFfLZaWW7ujBN0fuS249kmhex4Jnvbo1D2tqny+ewfdZgVhlWE48fbs/De
	p3p3lqrFCP+tbxwyIQG/6gPzzL6kYR2v/tASrOQt2YwggG7Arrsd+NOt5lfeJdnthljTuFAUuffV7
	iz6ZGfifGP4CUM+h34Iu+1U8eWan1YQWVkK60rwVwwFo1LJBm6NJonvNe8FqIVKYFvg7eZp2Ucdke
	z/vIGMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNv5-0000000Cinh-22wn;
	Mon, 26 Jan 2026 14:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNv2-0000000Cimw-0T6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:50:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F283339;
	Mon, 26 Jan 2026 06:50:12 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ACA33F632;
	Mon, 26 Jan 2026 06:50:14 -0800 (PST)
Message-ID: <555723b6-b4b1-436b-830a-464b9710fd8f@arm.com>
Date: Mon, 26 Jan 2026 14:50:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
From: Ben Horgan <ben.horgan@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-7-ben.horgan@arm.com> <aWkqt37FJ5l6QD0E@arm.com>
 <f19cab15-0626-4d13-b25e-1c194294e62f@arm.com> <aXOF1gYB_HEK8QPX@arm.com>
 <b79b74ed-8d52-45a9-80fd-47ed030f362f@arm.com>
Content-Language: en-US
In-Reply-To: <b79b74ed-8d52-45a9-80fd-47ed030f362f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065020_255996_1D969ACB 
X-CRM114-Status: GOOD (  39.60  )
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



On 1/26/26 14:30, Ben Horgan wrote:
> Hi Catalin,
> 
> On 1/23/26 14:29, Catalin Marinas wrote:
>> Hi Ben,
>>
>> On Mon, Jan 19, 2026 at 12:23:13PM +0000, Ben Horgan wrote:
>>> On 1/15/26 17:58, Catalin Marinas wrote:
>>>> On Mon, Jan 12, 2026 at 04:58:33PM +0000, Ben Horgan wrote:
>>>>> +static inline void mpam_thread_switch(struct task_struct *tsk)
>>>>> +{
>>>>> +	u64 oldregval;
>>>>> +	int cpu = smp_processor_id();
>>>>> +	u64 regval = mpam_get_regval(tsk);
>>>>> +
>>>>> +	if (!static_branch_likely(&mpam_enabled))
>>>>> +		return;
>>>>> +
>>>>> +	if (regval == READ_ONCE(arm64_mpam_global_default))
>>>>> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
>>>>> +
>>>>> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>>>>> +	if (oldregval == regval)
>>>>> +		return;
>>>>> +
>>>>> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
>>>>> +	isb();
>>>>> +
>>>>> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
>>>>> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
>>>>
>>>> Since we have an isb() already, does it make any difference if we write
>>>> MPAM0 before the barrier? Similar question for other places where we
>>>> write these two registers.
>>>
>>> The reason for the isb() placement is to document that it's not required
>>> for the MPAM0_EL1. All instructions running at EL1take their MPAM
>>> configuration from MPAM1_EL1. This includes LDTR and STTR as you asked
>>> about in a different thread.
>>
>> It's fine to keep it this way if LDTR/STTR are not affected by the MPAM0
>> register.
>>
>>>>> +
>>>>> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
>>>>
>>>> Is it too expensive to read the MPAM sysregs and avoid carrying around
>>>> another per-CPU state? You use it for pm restoring but we could just
>>>> save it in cpu_do_suspend() like other sysregs. Not a big issue, it just
>>>> feels like this function got unnecessarily complicated (it took me a bit
>>>> to figure out what it all does).
>>>
>>> It's done this way as it matches what's done in x86. I expect it would
>>> be cheap enough to read the register to check whether a write is required.
>>
>> Since you use it for CPU suspend/resume, I guess it's fine, it saves us
>> from having to preserve it in the low-level asm sleep code. I don't have
>> a strong preference either way.
>>
>>>> A related question - is resctrl_arch_set_cdp_enabled() always called in
>>>> non-preemptible contexts? We potentially have a race between setting
>>>> current->mpam_partid_msg and arm64_mpam_global_default, so the check in
>>>> mpam_thread_switch() can get confused.
>>>
>>> The resctrl filesystem can only ever get mounted once and
>>> resctrl_arch_set_cdp_enabled() is always called in mount. In
>>> rdt_get_tree(), rdt_enable_ctx() calls resctrl_arch_set_cdp_enabled().
>>> This is done while holding the rdtgroup_mutex and the user can't change
>>> the mpam configuration from the default until the mutex is released and
>>> it can claim it.
>>
>> What if resctrl_arch_set_cdp_enabled() gets preempted between updating
>> current task partid and setting arm64_mpam_global_default? The mutex
>> doesn't help.
> 
> I see, I had misinterpreted your question.
> 
> When looking into this I spotted that the per-cpu default,
> arm64_mpam_default, is not updated on the cdp enable and so the default
> tasks carry on running with the non-cdp default pmg/partid configuration.
> 
> On the race itself, if current->mpam_partid_pmg is set but not
> arm64_mpam_global_default then if the current task is preempted at that
> point there is a discrepancy. When the task gets context switched back
> in then the comparison in mpam_thread_switch() will be false when true
> would be expected.
> 
> In order to update arm64_mpam_default and make sure the mpam variables
> and registers for the online cpus are in the right state by the end of
> resctrl_arch_set_cdp_enabled() I'll add a per cpu call to
> resctrl_arch_sync_cpu_closid_rmid(). I'll also add something in the
> resume path so that arm64_mpam_default gets set correctly for the cpus
> that were offline.

Rather than the resume path I'll just set all the arm64_mpam_default in
resctrl_arch_set_cdp_enabled(). In code:

--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -193,6 +193,7 @@ static void resctrl_reset_task_closids(void)
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool
enable)
 {
        u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d =
RESCTRL_RESERVED_CLOSID;
+       int cpu;

        cdp_enabled = enable;

@@ -209,6 +210,10 @@ int resctrl_arch_set_cdp_enabled(enum
resctrl_res_level ignored, bool enable)

        resctrl_reset_task_closids();

+       for_each_possible_cpu(cpu)
+               mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
+       on_each_cpu(resctrl_arch_sync_cpu_closid_rmid, NULL, 1);
+
        return 0;
 }

> 
>>
>>>> And I couldn't figure out where the MPAMx_EL1 registers are written. If
>>>> any global/per-cpu/per-task value is changed, does the kernel wait until
>>>> the next thread switch to write the sysreg? The only places I can found
>>>> touching these sysregs are the thread switch, pm notifiers and KVM.
>>>
>>> If the task configuration is changed then the MPAM sysreg will only be
>>> updated the next time it goes into the kernel.
>>
>> Is it updated when it goes into the kernel or when we have a context
>> switch? If you have a long-running user thread that is never scheduled
>> out, it may not notice the update even if it entered the kernel (but no
>> context switch).
> 
> Yes, only on context switch.
> 
>>
>>> So, just eventually
>>> consistent. For cpu configuration, update_closid_rmid() gets called
>>> which ipis the cpus and ends up calling mpam_thread_switch() from
>>> resctrl_arch_sched_in().
>>
>> I see, it should be fine.
>>
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


