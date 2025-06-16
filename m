Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56578C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nZqtQTLeOYbnqu0abudmiQcGUr0ju9f3acyv6u1yWA=; b=whhRh6HzNlRkQU
	OihuV3bK5vGCOsfrDlXPLYt3StI37p7HH+FTjeGOK+WSqjA+gmdD5HTjk+ObRZaZt8DY7IRV14sYe
	g43oevfclIyviL3cNz2zEaJ2kMppGZQzF/Z5jzSQX/gNdkykFKDGgRNW+FGV6jeDShi4dvq2Iqkd5
	JAUpLlX/aiVDo+quQfE9itd244o22GN67b9XF5MgatibF8Rb2ath41TF6Wz7VrVTDrrgdMimRNhHu
	9R3aCR4T2E2PEl2P/jzbltgMKg064c1FhiOO3HzGpaDke9t8aZFZh0bf7ANNH6wpJRVz94gq9+YTX
	VTHSvH14xZKrB0zNON5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLX-0000000557l-2cNL;
	Mon, 16 Jun 2025 17:10:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA41-00000004ZfT-2wIc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2nZqtQTLeOYbnqu0abudmiQcGUr0ju9f3acyv6u1yWA=; b=Cu5BgmLfEz7go7fcFhCYYUYSad
	Fb9R6KF9I+vuRCRuFyOPsp/rpFaljWwCW2UR+/pYxZuuKXe1lAMExQo0n89mLxZ/FVs04vvQKZXGV
	cWbyISxClaTxGoH0h93vX4rfPKdpbD2StL6FQkVYOC//os/DmEtlS87EFREUWVlrIHIBOpX6oD8Oz
	xsskgXAgr33zAZovA97jBmnk+Rmop2j2IL23wweRNW9klWXwXpiv0zI/GR2SdFTv31Tf1fGs7BkA1
	2eitsHLLSi9cwD2HmUlAHNd+yORbtVzZ0Cs1VcP/Up4F5tIuqAVSENst9Gvq1GTW0fXOV+UmnX8Zw
	i4zal3aA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA3z-00000003bQk-0NjM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:39:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81B15150C;
	Mon, 16 Jun 2025 06:39:25 -0700 (PDT)
Received: from [10.1.26.178] (e137867.arm.com [10.1.26.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BFC23F673;
	Mon, 16 Jun 2025 06:39:45 -0700 (PDT)
Message-ID: <fc95e262-b63c-4b19-a571-ee59268ffdef@arm.com>
Date: Mon, 16 Jun 2025 14:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] arm64: debug: call step handlers statically
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-5-ada.coupriediaz@arm.com>
 <831db1e9-ed27-4116-b43b-ac580603d7ac@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <831db1e9-ed27-4116-b43b-ac580603d7ac@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_143951_463519_38429547 
X-CRM114-Status: GOOD (  19.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/06/2025 08:47, Anshuman Khandual wrote:

> On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
>> [...]
>>
>> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
>> index b5a3b9c85a65..8f6ce2ea005c 100644
>> --- a/arch/arm64/kernel/kgdb.c
>> +++ b/arch/arm64/kernel/kgdb.c
>> @@ -250,7 +250,7 @@ int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr)
>>   }
>>   NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
>>   
>> -static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
>> +int kgdb_singlestep_handler(struct pt_regs *regs, unsigned long esr)
> This rename makes sense but as mentioned later kgdb_single_step_handler()
> might save some changes in uprobes callback function.

That's fair. I think I would prefer the `_single_step_` version now as 
well, so I'll go for it.

As per the other patch, would it make sense to split the rename here as 
well ? Would it be OK if it were in the same commit as the breakpoint 
exception handlers ?

>>   {
>>   	if (!kgdb_single_step)
>>   		return DBG_HOOK_ERROR;
>> @@ -258,11 +258,7 @@ static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
>>   	kgdb_handle_exception(0, SIGTRAP, 0, regs);
>>   	return DBG_HOOK_HANDLED;
>>   }
>> -NOKPROBE_SYMBOL(kgdb_step_brk_fn);
>> -
>> -static struct step_hook kgdb_step_hook = {
>> -	.fn		= kgdb_step_brk_fn
>> -};
>> +NOKPROBE_SYMBOL(kgdb_singlestep_handler);
>>   
>>   static int __kgdb_notify(struct die_args *args, unsigned long cmd)
>>   {
>> @@ -301,13 +297,7 @@ static struct notifier_block kgdb_notifier = {
>>    */
>>   int kgdb_arch_init(void)
>>   {
>> -	int ret = register_die_notifier(&kgdb_notifier);
>> -
>> -	if (ret != 0)
>> -		return ret;
>> -
>> -	register_kernel_step_hook(&kgdb_step_hook);
>> -	return 0;
>> +	return register_die_notifier(&kgdb_notifier);
>>   }
>>   
>>   /*
>> @@ -317,7 +307,6 @@ int kgdb_arch_init(void)
>>    */
>>   void kgdb_arch_exit(void)
>>   {
>> -	unregister_kernel_step_hook(&kgdb_step_hook);
>>   	unregister_die_notifier(&kgdb_notifier);
>>   }
> kgdb_arch_init()/_exit() now deals only with kgdb_notifier registration
> and un-registration only.
That is correct, however is there something you want me to do/change 
regarding this ? It feels like those would still be the best places for 
the `kgdb_notifier` (un)registration.
>> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
>> index ad68b4a5974d..fefc990860bc 100644
>> --- a/arch/arm64/kernel/probes/uprobes.c
>> +++ b/arch/arm64/kernel/probes/uprobes.c
>> @@ -182,7 +182,7 @@ int uprobe_brk_handler(struct pt_regs *regs,
>>   	return DBG_HOOK_ERROR;
>>   }
>>   
>> -static int uprobe_single_step_handler(struct pt_regs *regs,
>> +int uprobe_singlestep_handler(struct pt_regs *regs,
>>   				      unsigned long esr)
> A small nit - if the kgdb handler be changed as kgdb_single_step_handler()
> the above rename can be skipped.
ACK above.
>>   {
>>
>>   	struct uprobe_task *utask = current->utask;
>> @@ -194,15 +194,8 @@ static int uprobe_single_step_handler(struct pt_regs *regs,
>>   	return DBG_HOOK_ERROR;
>>   }
>>   
>> -/* uprobe single step handler hook */
>> -static struct step_hook uprobes_step_hook = {
>> -	.fn = uprobe_single_step_handler,
>> -};
>> -
>>   static int __init arch_init_uprobes(void)
>>   {
>> -	register_user_step_hook(&uprobes_step_hook);
>> -
>>   	return 0;
>>   }
>>   
> The arch hook arch_init_uprobes() is redundant now and can be dropped.
>
> static int __init arch_init_uprobes(void)
> {
>          return 0;
> }
> device_initcall(arch_init_uprobes);
>
> git grep arch_init_uprobes
> arch/arm64/kernel/probes/uprobes.c:static int __init arch_init_uprobes(void)
> arch/arm64/kernel/probes/uprobes.c:device_initcall(arch_init_uprobes);
Absolutely right, I did miss that. I will clean up in v4.
> Otherwise LGTM.
Thanks for the comments,
Ada

