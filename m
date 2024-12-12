Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE352E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVZyXWvZ0ZUWwKRxrffFJ+ogGMmpm536zQYeTlUZTt8=; b=zZnv7gva2298HUl4tSEiPOcukl
	iVijO+p/JMwFUil5TQ8/vmDWFDPJ9LuRA4RdGsQz5H+cckCICF46KkKlTQEXph2hTO2KupQPJIieM
	2AqVuXIjAr/z4XRH6SM7RcfPMCHzg+M6IG5bjxLkkLddZ+6QiMPgWSM9hslTvJfEY2tZ1GXrJuz4A
	ICSZmQavNk44aD3lqI2WY7JE2ZrAZt4MYNmEI2NkDNsZCn8lko+1P9UjQ4Sy6ReZ+JJW5lhQMEP9v
	1b0P02ws5O9FZovm7I+C6bA6mN35kf5VuW7SDE9HlT1a4sLZKRhHHYe2cGH+5pX/k+MsEBqLEZFUT
	oLkkVqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmeY-000000016gV-3cv3;
	Thu, 12 Dec 2024 17:07:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlfP-00000000sa5-4B27
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77C6B1762;
	Thu, 12 Dec 2024 08:04:23 -0800 (PST)
Received: from [10.1.27.173] (XHFQ2J9959.cambridge.arm.com [10.1.27.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D92EE3F720;
	Thu, 12 Dec 2024 08:03:53 -0800 (PST)
Message-ID: <5c551e43-78e9-4336-ab16-b55c0d6c7f92@arm.com>
Date: Thu, 12 Dec 2024 16:03:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org> <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
 <86ikrprn7w.wl-maz@kernel.org> <2b1cc228-a8d5-4383-ab25-abbbcccd2e2c@arm.com>
 <86h678sy00.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <86h678sy00.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080356_125738_9EE94C58 
X-CRM114-Status: GOOD (  35.79  )
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

On 12/12/2024 15:48, Marc Zyngier wrote:
> On Thu, 12 Dec 2024 15:05:24 +0000,
> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 12/12/2024 14:26, Marc Zyngier wrote:
>>> On Thu, 12 Dec 2024 10:55:45 +0000,
>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 12/12/2024 08:25, Marc Zyngier wrote:
>>>>>> +
>>>>>> +	local_flush_tlb_all();
>>>>>
>>>>> The elephant in the room: if TLBs are in such a sorry state, what
>>>>> guarantees we can make it this far?
>>>>
>>>> I'll leave Miko to respond to your other comments, but I wanted to address this
>>>> one, since it's pretty fundamental. We went around this loop internally and
>>>> concluded that what we are doing is architecturally sound.
>>>>
>>>> The expectation is that a conflict abort can only be generated as a result of
>>>> the change in patch 4 (and patch 5). That change makes it possible for the TLB
>>>> to end up with a multihit. But crucially that can only happen for user space
>>>> memory because that change only operates on user memory. And while the TLB may
>>>> detect the conflict at any time, the conflict abort is only permitted to be
>>>> reported when an architectural access is prevented by the conflict. So we never
>>>> do anything that would allow a conflict for a kernel memory access and a user
>>>> memory conflict abort can never be triggered as a result of accessing kernel memory.
>>>>
>>>> Copy/pasting comment from AlexC on the topic, which explains it better than I can:
>>>>
>>>> """
>>>> The intent is certainly that in cases where the hardware detects a TLB conflict
>>>> abort, it is only permitted to report it (by generating an exception) if it
>>>> applies to an access that is being attempted architecturally. ... that property
>>>> can be built from the following two properties:
>>>>
>>>> 1. The TLB conflict can only be reported as an Instruction Abort or a Data Abort
>>>>
>>>> 2. Those two exception types must be reported synchronously and precisely.
>>>> """
>>>
>>> I totally agree with this. The issue is that nothing says that the
>>> abort is in any way related to userspace.
>>>
>>>>>
>>>>> I honestly don't think you can reliably handle a TLB Conflict abort in
>>>>> the same translation regime as the original fault, given that we don't
>>>>> know the scope of that fault. You are probably making an educated
>>>>> guess that it is good enough on the CPUs you know of, but I don't see
>>>>> anything in the architecture that indicates the "blast radius" of a
>>>>> TLB conflict.
>>>>
>>>> OK, so I'm claiming that the blast radius is limited to the region of memory
>>>> that we are operating on in contpte_collapse() in patch 4. Perhaps we need to go
>>>> re-read the ARM and come back with the specific statements that led us to that
>>>> conclusion?
>>
>> From the ARM:
>> """
>> RFCPSG: If level 1 or level 2 is supported and the Contiguous bit in a set of
>> Block descriptors or Page descriptors is changed, then a TLB conflict abort can
>> be generated because multiple translation table entries might exist within a TLB
>> that translates the same IA.
>> """
>>
>> Although I guess it's not totally explicit, I've interpretted that as saying
>> that conflicting TLB entries can only arise for the IA range for which the
>> contiguous bits have been modified in the translation tables.
> 
> Right, that's reassuring, thanks for digging that one.
> 
>> Given we are only fiddling with the contiguous bits for user space mappings in
>> this way, that's why I'm asserting we will only get a conflict abort for user
>> space mappings... assuming the absence of kernel bugs, anyway...
> 
> For now. But if you dare scanning the list, you'll find a lot of
> people willing to do far more than just that. Including changing the
> shape of the linear map.

Ahh. Sorry I don't do a good job of monitoring the lists. But was just having a
conversation with Catalin about exactly this.

> 
>>
>>>
>>> But we don't know for sure what caused this conflict by the time we
>>> arrive in the handler. It could equally be because we have a glaring
>>> bug somewhere on the kernel side, even if you are *now* only concerned
>>> with userspace.
>>
>> OK I see what you are saying; previously a conflict abort would have led to
>> calling do_bad(), which returns 1, which causes do_mem_abort() to either kill
>> the kernel or the process depending on the origin of the abort. (although if it
>> came from kernel due to bug, we're just hoping that the conflict doesn't affect
>> the path through the handler). With this change, we always assume we can fix it
>> with the TLBI.
>>
>> How about this change to ensure we still die for issues originating from the kernel?
>>
>> if (!user_mode(regs) || !system_supports_bbml2())
>> 		return do_bad(far, esr, regs);
> 
> That wouldn't catch a TLB conflict on get_user(), would it?

Oh good point.

> 
>>> If anything, this should absolutely check for FAR_EL1 and assert that
>>> this is indeed caused by such change.
>>
>> I'm not really sure how we would check this reliably? Without patch 5, the
>> problem is somewhat constrained; we could have as many changes in flight as
>> there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
>> being modified. But if patch 5 is confirmed to be architecturally sound, then
>> there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
>> VA-range}'s that could legitimately cause a conflict abort.
> 
> I didn't mean to imply that we should identify the exact cause of the
> abort. I was hoping to simply check that FAR_EL1 reports a userspace
> VA. Why wouldn't that work?

Ahh gottya! Yes agreed, this sounds like the right approach.

> 
> 	M.
> 


