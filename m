Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD3CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBnhIbHjdOOsrxpXTYLWxY/uaYjyEsXHWiNAp9HHrec=; b=ecmyYXKciLu04LV+o/P7UqPm5O
	sgH6Ru67pqa7D5cEGnb7YcdCBuaHCTeUnbF/cC+F//M19SzKUvbajvJC/8jJdv3InVbK5VWTGdN8i
	uIL1mg3fr0pp2aPiMWnnwxIJcEu4+cMTwM2YfeQdRp1A3vdq1/TWesGjUKSjCmjOseCcMbxIW+8S5
	INDfCcM+SQNaAr7sRpuoCANu9P+22qrosAHE7Q4hKODOvkS0z/hWAX3xOSYAVZJlpWoCL8D3OgNIg
	SfH60Vbm4MVZS7AJpQFfg7ho/ClasyZtY473T48MYM31zjgh7xaIkrU9wp/dqzjsPP1O3EvqWAL8S
	u0bBQYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoI3-00000001ztp-2ZRE;
	Mon, 19 Jan 2026 12:23:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoHz-00000001zs1-0Tfn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:23:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367A5339;
	Mon, 19 Jan 2026 04:23:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0635F3F632;
	Mon, 19 Jan 2026 04:23:14 -0800 (PST)
Message-ID: <f19cab15-0626-4d13-b25e-1c194294e62f@arm.com>
Date: Mon, 19 Jan 2026 12:23:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
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
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aWkqt37FJ5l6QD0E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_042323_828067_89110A3F 
X-CRM114-Status: GOOD (  34.58  )
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

Hi Catalin,

On 1/15/26 17:58, Catalin Marinas wrote:
> On Mon, Jan 12, 2026 at 04:58:33PM +0000, Ben Horgan wrote:
>>  menu "ARMv8.5 architectural features"
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> new file mode 100644
>> index 000000000000..14011e5970ce
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -0,0 +1,67 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Copyright (C) 2025 Arm Ltd. */
>> +
>> +#ifndef __ASM__MPAM_H
>> +#define __ASM__MPAM_H
>> +
>> +#include <linux/jump_label.h>
>> +#include <linux/percpu.h>
>> +#include <linux/sched.h>
>> +
>> +#include <asm/sysreg.h>
>> +
>> +DECLARE_STATIC_KEY_FALSE(mpam_enabled);
>> +DECLARE_PER_CPU(u64, arm64_mpam_default);
>> +DECLARE_PER_CPU(u64, arm64_mpam_current);
>> +
>> +/*
>> + * The value of the MPAM0_EL1 sysreg when a task is in resctrl's default group.
>> + * This is used by the context switch code to use the resctrl CPU property
>> + * instead. The value is modified when CDP is enabled/disabled by mounting
>> + * the resctrl filesystem.
>> + */
>> +extern u64 arm64_mpam_global_default;
>> +
>> +/*
>> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
>> + * which may race with reads in mpam_thread_switch(). Ensure only one of the old
>> + * or new values are used. Particular care should be taken with the pmg field as
>> + * mpam_thread_switch() may read a partid and pmg that don't match, causing this
>> + * value to be stored with cache allocations, despite being considered 'free' by
>> + * resctrl.
>> + */
>> +#ifdef CONFIG_ARM64_MPAM
>> +static inline u64 mpam_get_regval(struct task_struct *tsk)
>> +{
>> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>> +}
>> +
>> +static inline void mpam_thread_switch(struct task_struct *tsk)
>> +{
>> +	u64 oldregval;
>> +	int cpu = smp_processor_id();
>> +	u64 regval = mpam_get_regval(tsk);
>> +
>> +	if (!static_branch_likely(&mpam_enabled))
>> +		return;
>> +
>> +	if (regval == READ_ONCE(arm64_mpam_global_default))
>> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
>> +
>> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>> +	if (oldregval == regval)
>> +		return;
>> +
>> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +	isb();
>> +
>> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
>> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
> 
> Since we have an isb() already, does it make any difference if we write
> MPAM0 before the barrier? Similar question for other places where we
> write these two registers.

The reason for the isb() placement is to document that it's not required
for the MPAM0_EL1. All instructions running at EL1take their MPAM
configuration from MPAM1_EL1. This includes LDTR and STTR as you asked
about in a different thread.

> 
> At some point, we should go through __switch_to() and coalesce the isbs
> into fewer as we keep accumulating them (e.g. all those switch function
> setting some sync variable if needed).
> 
>> +
>> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
> 
> Is it too expensive to read the MPAM sysregs and avoid carrying around
> another per-CPU state? You use it for pm restoring but we could just
> save it in cpu_do_suspend() like other sysregs. Not a big issue, it just
> feels like this function got unnecessarily complicated (it took me a bit
> to figure out what it all does).

It's done this way as it matches what's done in x86. I expect it would
be cheap enough to read the register to check whether a write is required.

> 
> A related question - is resctrl_arch_set_cdp_enabled() always called in
> non-preemptible contexts? We potentially have a race between setting
> current->mpam_partid_msg and arm64_mpam_global_default, so the check in
> mpam_thread_switch() can get confused.

The resctrl filesystem can only ever get mounted once and
resctrl_arch_set_cdp_enabled() is always called in mount. In
rdt_get_tree(), rdt_enable_ctx() calls resctrl_arch_set_cdp_enabled().
This is done while holding the rdtgroup_mutex and the user can't change
the mpam configuration from the default until the mutex is released and
it can claim it.

> 
> And I couldn't figure out where the MPAMx_EL1 registers are written. If
> any global/per-cpu/per-task value is changed, does the kernel wait until
> the next thread switch to write the sysreg? The only places I can found
> touching these sysregs are the thread switch, pm notifiers and KVM.
> 

If the task configuration is changed then the MPAM sysreg will only be
updated the next time it goes into the kernel. So, just eventually
consistent. For cpu configuration, update_closid_rmid() gets called
which ipis the cpus and ends up calling mpam_thread_switch() from
resctrl_arch_sched_in().

Thanks,

Ben


