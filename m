Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A5BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uZzqhCahlVfqcFthz9qU+jop3TfjpxZG2sSxnFVDbQ=; b=E7u705vVVVV+L2Fmwq4QkdXStn
	LzhywjT7cc7/Azh+/YBeKg6mwH6E0h+lAkKmChOL5ew8zYIf6tJ6Q/6fcCA9G2v8Sx6ipamtV+HK/
	Ohfdr0i4MNq1vjPLQC6D3Jt/6Kqvx5ghRlxzlVkMwdagD11v4u8YjigEytmYTM7H1BKC9k1wO4qjI
	wAGLInoI9pGUB/JoCy0AGm5zFF/pJLRFqDeeMo4yNa4zssGkFDu0lrVCdPC89IyGu9+HkHrfPfjtA
	UuqPw8idIXXAXrMz0RXUCsVjgKHAvnbJqfUantFogiF2y/WplPsIP1G7iA0ENqM5q4L4lJfdsutnb
	zqMBxpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdX6-00000004E5D-0i2l;
	Wed, 20 May 2026 09:48:08 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdX0-00000004E48-1BNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:48:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gL6By35k2zYQtH4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:47:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 991F940574
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:47:50 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgBnL1tDgw1qhE_pCw--.7651S3;
	Wed, 20 May 2026 17:47:48 +0800 (CST)
Message-ID: <5f14f3b5-fe4b-8157-07d6-ca62d00396be@huaweicloud.com>
Date: Wed, 20 May 2026 17:47:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Zeng Heng <zengheng@huaweicloud.com>
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
To: James Morse <james.morse@arm.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
 zengheng4@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com>
Content-Language: en-US
In-Reply-To: <ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgBnL1tDgw1qhE_pCw--.7651S3
X-Coremail-Antispam: 1UD129KBjvAXoWfJw1ftrWrCF45Jr1Uuw1DAwb_yoW8JF4xWo
	WfZrZxZw47tr13XFZ0kr4DG347Wa95ur1Yvr4qgr1UGFn0vFyayw13Cw47W343tr4rJFy7
	X34rJ345KF43JF1fn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYk7kC6x804xWl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUIbyZUUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_024802_684410_A6C3256B 
X-CRM114-Status: GOOD (  73.66  )
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

On 2026/5/15 1:06, James Morse wrote:
> Hi Zeng,
> 
> (beware this is the first version I've seen - arm have been silently deleting your mail,
>   it looks like a problem with DKIM signatures)
> 

Thanks for your informing. I will try to send community mails using
huaweicloud email to avoid DKIM signature issues.

Hope it works.

> On 13/04/2026 09:53, Zeng Heng wrote:
>> Background
>> ==========
>>
>> On x86, the resctrl allows creating up to num_rmids monitoring groups
>> under parent control group. However, ARM64 MPAM is currently limited by
>> the PMG (Performance Monitoring Group) count, which is typically much
>> smaller than the theoretical RMID limit.
> 
> The MPAM PMG limit is 255. Is that not enough?
> 
> I think the real problem is the CHI interconnect protocol is forcing people
> to only have 1 bit of PMG - regardless of what the architecture says. This
> isn't an MPAM problem as such - its an implementation issue.
> 
> (but we can try and work around it)
> 

Yes, the architecture theoretically allows PMG to be up to 8 bits wide,
but many platforms I've worked with (not just Kunpeng) implement far
fewer bits in practice.

> 
>> This creates a significant
>> scalability gap: users expecting fine-grained per-process or per-thread
>> monitoring quickly exhaust the PMG space, even when plenty of reqPARTIDs
>> remain available.
> 
> This is more about MPAM's philosophical stance that PMG extents PARTID, whereas
> on x86 RMID is an independent number.
> 

No value judgment here. ARM seeks to expand the number of monitoring
groups by combining PARTID and PMG within limited bit-width constraints,
which inherently introduces coupling between the two.

> Please don't muddle these - it results in muddled patches!
> If we want to try and attack both with narrowing, we should do them separately.
> 
> 
>> The Narrow-PARTID feature, defined in the ARM MPAM architecture,
>> addresses this by associating reqPARTIDs with intPARTIDs through a
>> programmable many-to-one mapping. This allows the kernel to present more
>> logical monitoring contexts.
> 
> I'd put this as "can be abused to avoid this problem"! We still have a problem with
> controls that don't alias and need to be removed from MSC that don't support narrowing.
> This isn't what the feature was designed for - but it is a really cool trick, it works
> for some real platforms, and solves a problem seen in user-space.
> 
> However - throughout this series you seem to be discarding all the control-group support
> for a monitoring-only setup that allocates intPARTID for everything. This might work for
> your use-case on your platform, but it doesn't generalise to platforms without narrowing
> or where multiple control-groups are needed.
> 

Currently, for MSCs that have non-aliasing controls but do not support
the Narrow PARTID feature, this solution will directly disable itself,
rather than hiding the non-aliasing control capabilities (Patch 3:
https://lore.kernel.org/all/20260413085405.1166412-4-zengheng4@huawei.com/). 


This does indeed affect the enablement of this solution on MSC systems
without narrowing capability.

On the contrary, the solution attempts to preserve as many intPARTIDs
(i.e., control groups) as original. In principle, I hope that on
systems where narrow PARTID was not previously enabled, this patch set
can create as many monitoring groups as possible without changing any
other functionality.

And also allows users to limit the intpartid_max count via boot
parameters. （Patch 6: 
https://lore.kernel.org/all/20260413085405.1166412-7-zengheng4@huawei.com/）


> 
>> Design Overview
>> ===============
>>
>> The implementation extends the RMID encoding to carry reqPARTID
>> information:
>>
>>    RMID = reqPARTID * NUM_PMG + PMG
>>
>> In this patchset, a monitoring group is uniquely identified by the
>> combination of reqPARTID and PMG. The closid is represented by intPARTID,
>> which is exactly the original PARTID.
> 
> The way I think of this is 'RMID' bits being spilled into PARTID. This
> means each control group has a set of PARTID. For MSC using narrowing,
> CLOSID would be the intPARTID value. But as you note, we need to support
> mismatches:
> 
> 

Yes.

>> For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
>> driver exposes the full reqPARTID range directly. For heterogeneous
>> systems where some MSCs lack Narrow-PARTID support, the driver utilizes
>> PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
>> capability. The sole exception is when any type of MSCs lack Narrow-PARTID
>> support, their percentage-based control mechanism prevents the use of
>> PARTIDs as reqPARTIDs.
> 
> It'd be good to have some discussion about what the interface between the
> mpam_devices code and any other user (like resctrl) should be.
> 
> As a hypothetical system to think about:
>    64 PARTID at the L3, which support CPOR and CCAP
>    64 PARTID and narrowing to 16 at the SLC, which supoprts CPOR
>    64 PARTID and narrowing to 32 at the memory-controller, which support MBWU_MAX
> 

By the way, in this case, the L3 does not support NP and has CCAP, so
the PARTID mapping extension(PME) is not enabled by default.

If we exclude the L3 CCAP, the solution would support 16 control groups
and (64 * PMG) monitoring groups.

> I think whether using intPARTID is a benefit needs to be user-space policy.
> You've likely got a platform where that choice is obvious - but it is a
> trade-off as you lose the non-aliasing controls. In the example above, using
> narrowing on this system means losing the CCAP controls on L3 as they don't alias [*].
> Where its a policy, its likely to be one policy for resctrl, and another for any other
> user.
> We can get the resctrl glue code to turn it on unconditionally if there is no trade off,
> I think that means: no non-aliasing controls in any class that doesn't support narrowing
> - including 'unknown'. (we couldn't add them to resctrl in the future if you already chose
> to enable this).
> 

Currently, after MPAM initialization, the PARTID mapping extension(PME)
is enabled by default unless there exists an MSC that both lacks NP
support and has non-aliasing controls — this is purely beneficial with
no downsides. Going forward, we may consider adding a `force_reqpartid`
option to forcibly enable the feature and disable non-aliasing controls.

> As for the interface with mpam_devices:
> I think this means the resctrl glue code needs to be able to discover which
> classes support intPARTID, and how many controls they actually have. From there
> it can apply to policy to determine whether its better to support fewer features
> in resctrl to get more RMID. (the alternative is always to ignore the MSC with
> narrowing - narrowing lets hardware lie about the features it supports).
> 
> Currently the resctrl glue code has to program a configuration for two PARTID
> when CDP is being hidden on the MB resource. This is ugly and fragile. I'd like
> to explore generalising it as this narrowing stuff will also need to apply a
> configuration to a set of PARTID when that MSC doesn't support narrowing.
> In the example above, we'd need to discard the CCAP controls and write the same
> CPOR bitmap to each PARTID that is mapped together by narrowing.
> 

One option is to expand CDP compatibility by PME: L3DATA and L3CODE
would still be controlled separately, while MB control would be
consolidated via narrow mapping onto a single intPARTID.

Of course, this requires that the MB supports narrowing.

> 
> I think this means the resctrl glue code will need to be able to write a configuration
> to controls using the full partid_max range as it does today. But also be able to set
> the narrowing mapping on classes that support it.
> For the monitors, the resctrl glue code will need to allocate and configure a set of
> monitors, and read and sum them. This will be regardless of whether narrowing is
> supported. >
> I think this means allocating a table of CLOSID to PARTID(s). the intPARTID would
> always match the CLOSID. Monitors and non-narrowing MSC would need to walk the list.
> I'm hoping we can make CDP a subset of this problem.
> Some clever arithmetic may save allocating memory for a table - but if we change resctrl
> to do this dynamically, the numbers become arbitrary forcing it to be a table.
> It might also be possible to support moving monitor-groups between control groups with
> the table driven approach. (see what you think on how complex it ends up ...)
> 

In the current patch series, static allocation employs a
straightforward intPARTID-to-reqPARTID translation, while dynamic
management tracks the mappings via `reqpartid_map` table.

> I'd like to keep that grouping static for now, the table needs creating at setup time,
> (+/- CDP), to avoid problems like you've found with CDP. This means the intpartid mappings
> can be written once at setup time.
> 
> I'd like to avoid exposing user ABI to control this until we get it working, then we can
> talk about whether to try making the grouping dynamically managed by resctrl. (there were
> some proposals in that area - but I can't find them on lore).
> If there are platforms were its certainly not a trade-off, we can enable it
> unconditionally - but I'm wary of this being "what we care about now", requiring user-abi
> to enable features that were detectable.
> e.g. we ignore an unknown MSC, and add a resctrl schema for it later - only we can't
> expose it if we were using narrowing. Now its a trade-off.
> 
> 
>> Capability Improvements
>> =======================
>>
>> --------------------------------------------------------------------------
>> The maximum        |  Sub-monitoring groups            | System-wide
>> number of          |  under a control group            | monitoring groups
>> --------------------------------------------------------------------------
>> Without reqPARTID  |  PMG                              | intPARTID * PMG
>> --------------------------------------------------------------------------
>> reqPARTID          |                                   |
>> static allocation  | (reqPARTID // intPARTID) * PMG    | reqPARTID * PMG
>> --------------------------------------------------------------------------
>> reqPARTID          |                                   |
>> dynamic allocation | (reqPARTID - intPARTID + 1) * PMG | reqPARTID * PMG
>> --------------------------------------------------------------------------
>>
>> Note: The number of intPARTIDs can be capped via the boot parameter
>> mpam.intpartid_max. Under MPAM, reqPARTID count is always greater than
>> or equal to intPARTID count.
>>
>> Series Structure
>> ================
>>
>> Patch 1: Fix pre-existing out-of-range PARTID issue between mount sessions.
>> Patches 2-6: Implement static reqPARTID allocation.
>> Patches 7-10: Implement dynamic reqPARTID allocation.
> 
> I've had  a hard time following this series. You dive in with invasive changes, then
> unbreak things in later patches.
> 
> Please added the needed infrastructure in mpam_devices.c first. This should be free of
> resctrl-isms, and 'only' needs reviewing against the architecture.
> 
> Then add the resctrl glue code stuff. That needs to comply with what resctrl expects.
> 
> I think the cleanest way to think about this is to break the mapping between CLOSID and
> PARTID. We're effectively moving bits of RMID out of PMG into PARTID. Adding helpers
> to explicitly do this early in those patches will make your changes clearer.
> Please avoid spraying the narrowing terms for things everywhere.
> 
> 

Sure, I'll reorder the series to introduce the core infrastructure in
mpam_devices.c first. Should I drop the dynamic allocation part from
this series for now?

> 
> 
> [*] It's terminology from discussing this with Dave, just in case a summary is needed:
>    aliasing controls are like CPOR where two different PARTID with the same bitmap
>    compete for the same resource. If you give them each the same 50% of the portions,
>    they can't exceed that together.
>    non-aliasing controls are like CCAP where to different PARTID with the same fraction
>    compete for different resources. If you give them each 50% of the capacity, it adds
>    up to 100%. You can't represent 'the same' 50% using these controls.
> 
>    Narrowing papers over this problem with its remapping table, which gives you a 'same'
>    property. For MSC that have controls of that shape - and where more monitors are
>    desired - we'd have to drop the controls.
> 
>    I think "more monitors are desired" is going to need to be user-space policy. But
>    we can come back to how to do that later.
> 
> 

I'm not sure if anyone else has formalized these into terminology
before, but I fully agree with the terms "aliasing controls" and "non-
aliasing controls" — they're instantly intuitive for software
developers.


Best regards,
Zeng Heng


