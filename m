Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08F2D49794
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 02:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv7Lo64shXUiOTVZ3lNRi83j9wfoRMVYgoedQduattM=; b=eeBnnOfYlDn2vSgowbqQXc6cFg
	QzJYucugyO+OD53U4hG+iWhFdvb5Px8M0HctpITigTUzJw2sRNLhIRMgkqZpGk1OKCQUkAq5X4l4T
	3U3E4JYI4S97cB87k5EOUNACjMwprJdySIA6tA+TT9/FN10BUz7IzepZ3mNyuGnpwHWW3cHdP/m09
	kvik99cIqPtDSE4ynIHFxCzQ0WNHBt1tMDd4/0I7Gn5s0N8pwDlL23J7LvCs5WlMoHpUzdDRJRfzk
	DJFYIk+lox87b4goN3usU9dNB5Uvm40kWD5ALoxyFcKLP+Aon44KgCNLHcJ1GHgXD+g7NXk+Be4Sm
	QRjtuudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvwr-00000004mOr-1Ptp;
	Mon, 02 Dec 2024 02:14:05 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvvr-00000004mIb-0Z7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 02:13:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y1nMS0vQWz21mGv;
	Mon,  2 Dec 2024 10:11:16 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D5D801402CB;
	Mon,  2 Dec 2024 10:12:50 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Dec 2024 10:12:50 +0800
Message-ID: <79fd4520-f974-76f7-f538-0c72dc8acd40@huawei.com>
Date: Mon, 2 Dec 2024 10:12:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 0/6] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <bobo.shaobowang@huawei.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
 <Zzyvbx9uubrLNv1C@e133380.arm.com>
 <c5c5de75-151b-e6bd-952e-606326b46e9a@huawei.com>
 <Z0SaMZ00MZ6288v8@e133380.arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z0SaMZ00MZ6288v8@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_181303_475517_6A6D32F4 
X-CRM114-Status: GOOD (  57.82  )
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



On 2024/11/25 23:39, Dave Martin wrote:

>> The advantages of doing this are:
>>
>>    1. There is no need to modify or disrupt the existing resctrl layer
>>
>>     interface, ensuring that each control group has same resource
>>
>>     control functionality;
> 
> I don't think this is guaranteed.
> 
> If there is some MSC that does not have PARTID Narrowing support, and
> this MSC has a memory bandwidth control that the MPAM driver exposes
> through resctrl, then there is no way to configure that MSC that
> exhibits the behaviour that the resctrl user expects.
> 
> For a concrete example:
> 
> Suppose that n=8, and the user asks for P1 to be given 30% of system
> memory bandwidth.
> 
> On the affected MSC, P1 maps to eight PARTIDs, each with its own memory
> bandwidth regulation.
> 
> If the work that happens to be in M1_1 dominates P1's bandwith
> requirment, then PARTID_1_1 needs to be given 30% of total memory bandwidth.
> 
> If the work in P1 is evenly spread across M1_1, M1_2 ... M1_m, then
> they would each need to be given 30% / 8 = 3.75% of total memory
> bandwidth so that the total allocated bandwidth is 30%.
> 
> But we don't know how memory bandwidth consumption is distributed among
> M1_1, M2_2 etc., so there is no way to program the memory bandiwdth
> regulation on that MSC that guarantees the expected result of P1
> receiving 30% of the total available bandwidth.
> 
> 
> This means that on some hardware, a choice needs to be made: should the
> MPAM driver hide from resctrl any controls that have this problem, or
> should it disable the use of PARTID Narrowing for providing additional
> monitoring groups.
> 
> My concern is that the correct choice is likely to be use-case-
> dependent.
> 
> Do you have a view on this?

I understand your meaning and concerns, and this is indeed a problem.

 From a software perspective, I think the use cases should be limited. 
For scenarios where mata does not support narrow-partid, I tend to favor
disabling the narrow-partid feature in the driver for such scenarios.

 From a hardware perspective, MSCs, such as L2/L3, are designed with area
considerations in mind and choose to implement the narrow-partid feature.

MATA, on the other hand, is located on a different die and does not have 
similar concerns, often not considering the implementation of the 
narrow-partid feature, which makes this a rather thorny issue.

>>    2. MSCs that support narrow-partid (including intPARTID and reqPARTID)
>>
>>     and MSCs that do not support (only including PARTID) can share the
>>
>>     same PARTID space;
> 
> This seems like it may be problematic on some hardware, as I tried to
> explain above for point 1.
> 
> Note though, if the non-Narrowing MSCs only have bitmap-type controls,
> then sharing the PARTID space is harmless.  This comes about because
> because these controls explicitly allow contention: cache way 0 for
> example is contended between all the work that is allowed by MPAM to
> use this cache way.  Breaking up the work arbitrarily under different
> PARTIDs makes no difference in this case: the amount of work allocated
> to that cache way, and the amount of contention is still the same.
> 

Completely agree. MSCs without the narrow-partid feature, if they only 
have bitmap-type controls, can be compatible with the shared PARTID 
space scheme.

>>
>>    3. On the premise of ensuring the (1) point, the number of control
>>
>>     groups can be maximized, because users can always choose to make a
>>
>>     control group act as a sub-monitoring group under another control
>>
>>     group;
> 
> What do you mean by "control group" here?
> 
> resctrl's group hierarchy is strict: work is distributed across one or
> more control groups at the top level, and the work in each control
> group is further distributed across one or more monitoring groups
> within that control group.
> 
> There is no way to repurpose a resctrl control group is a monitoring
> group under some other control group.
> 
> Or were you referring to something else here?
> 

Apologies for my miscommunication.

What I meant to say is to use the extra PARTIDs of MSC (which do not support
the narrow-partid feature) as an expansion for number of sub-monitoring 
groups.

>>> 2) The resctrl core code uses CLOSIDs and RMIDs to identify control
>>> groups and monitoring groups.  If a particular driver wants to
>>> translate these into other values (reqPARTID, intPARTID, PMG) then it
>>> can do so, but this mapping logic should be encapsulated in the driver.
>>> This should be better for maintainability, since the details of the
>>> remapping will be arch-specific -- and in general not all arches are
>>> going to require it.  With this in mind, I think that changes in the
>>> resctrl core code would be minimal (perhaps no changes at all).
> 
>>    Yes, maintaining the interface of the resctrl core code unchanged is,
>> in essence, the (first) important constraint of the current MPAM code.
>> We try the best to keep all resctrl interfaces and ensure the existing
>> functionality of x86 RDT.
>>
>>    The only thing that falls short of being ideal (forgive me), is that
>> it introduces the sole new function resctrl_arch_alloc_rmid() into the
>> resctrl code (resctrl_arch_free_rmid() will be optimized away in the next
>> version, and there are no other new functions any more).
>>
>>    The resctrl_arch_alloc_rmid() is the result of several restructuring
>> iterations and it is one of the most critical points in the patch series.
> 
> I was concerned about the changes in patch 6 for example, where the new
> function task_belongs_to_ctrl_group() now has to look at more
> information that just rdtgroup->closid, in order to determine which
> control group a task belongs to.  This is precisely what
> resctrl_arch_match_closid() is supposed to do, using just the closid.
> 
> This suggests that the meaning of "closid" in the core code has been
> changed: if closid is the control group identifier, then each control
> group should have exactly one closid value.
> 
> 
> For comparison, you may want to take a look at the top 3 commits of
> this experimental branch:
> 
> https://git.gitlab.arm.com/linux-arm/linux-dm/-/commits/mpam/partid-pmg-remap/v0.2/head/?ref_type=heads
> 
> which attempts to do all the mapping within the MPAM driver instead.
> Note, the approach is a bit over-complicated and I decided that a
> simpler approach is needed.  But it may help to illustrate what I mean
> about keeping all the remapping out of the resctrl core code.
> 
> 

I understand your suggestion. I will consider refactoring the mapping 
relationships between closid/rmid and partid/reqpartid/intpartid/pmg.

In fact, I prepared a simplified version of v2 as v3. But in light of 
your suggestions, I decide to reconstruct the solution. At present, I'm 
not sure if I can completely isolated the mapping within the MPAM driver 
layer only. If my reconstructed version goes smoothly, I will reply ASAP.

>>> 4) If the mapping between reqPARTIDs and (CLOSID,RMID) pairs is static,
>>> is it necessary to track which reqPARTIDs are in use?  Would it be
>>> simpler to treat all n reqPARTIDs as permanently assigned to the
>>> corresponding CLOSID?
>>>
>>> If reqPARTID usage is not tracked, then every control change on MSCs
>>> that do not support PARTID Narrowing would need to be replicated across
>>> all reqPARTIDs corresponding to the affected resctrl control partition.
>>> But control changes are a relatively rare event, so this approach feels
>>> acceptable as a way of keeping the driver complexity down.  It partly
>>> depends on how large the "n" parameter can become.
>>    Yes, totally agree. I will try to remove the reqPARTID bitmap and
>> the resctrl_arch_free_rmid(). As mentioned, this will simplify the code
>> logic and reduce changes to the resctrl layer code.
>>
>>    Initially, to reduce the number of IPI interrupt, keep this resource
>> tracking until now, and I will prioritize optimization for the next
>> version.
>>   (In fact, the initial version of the patch set was dynamically allocated,
>> and during the code restructuring process, it was inevitable to retain
>> some of the original ideas.)
>>
>> Best regards,
>> Zeng Heng
>>
> 
> OK; fair enough.
> 
> This kind of feature could always be re-added later on if it proves to
> be important for performance in real use-cases, but it is probably best
> to keep things as simple as possible initially.
> 

Many thanks as always for your prompt reply and insightful suggestions.

Best Regards,
Zeng Heng


