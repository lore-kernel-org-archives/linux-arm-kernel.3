Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9DCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPyo6yazjyUnhJj+joZfTPzFqELUcAwTIbrDY0AFd8k=; b=mDZLJdAX85/CSJIxUC5PCQDLB/
	STxf+53ipIXKN/QsMTb/NGtpAPXpYqT6zxR3XSVXTgwwFMtp/JHi7nX1mtEcf96cnGkwAtJYGNoes
	TriuIN43cAqZWuAUYGhIELRLb+Ir2ync67te1x+RXyK9PQby/Cw4bOeHt1N9z+9VfFSC8Kyq9N7bl
	i07+giSJvsTu9zAjRbW5TathG/34GvrhSJznDYUqDKl2GKKNlaXN6tluEl87n0NMUN1+u1lr8VUa8
	TNY7Lii/jwN7F1yAFgjLOSY3NzN5qKsMUbRgwOcGDTftEKKHviZt0vGmVYx/v07jvSZZFzPye1MZs
	hvkU8DdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNjZ-00000003fCs-37J7;
	Tue, 04 Mar 2025 08:34:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNb4-00000003cwG-06xm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 08:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BPyo6yazjyUnhJj+joZfTPzFqELUcAwTIbrDY0AFd8k=; b=bS6H40DA9nMI8ZpclYxzzPO4CM
	dMpt8uNSTCMvJeJw3WsxuBo/M1ttieYd9bI+v79CIzTPUPa8fTa1vpVO8TV+4n9w5j9qb8SKAo9Rr
	4U/0n3OQbgIFhVCkgGW/vp9Jyw/q80rb0zHByeLaJqNxWfwv0ILH50MkxPw76U5eyXc+FgCtuGAbt
	mjJD4pBBCICl2FYKO6JAkoFKT6vCKj/fAevmrWs7s7zpS2URP5P3//FlfS9vLSOi1jme4/2F7pH/t
	6zU6XoVsF+ne3CyV0pLVE41cYFW4QXVO1MyvnFxQ7jl6Y3WkXA2q5RIwMOthg+5aW9RzJgZdUWGhK
	1kHHMB7A==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNb1-00000000RAh-0Xwu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:25:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 634871063;
	Tue,  4 Mar 2025 00:25:27 -0800 (PST)
Received: from [10.34.129.29] (unknown [10.34.129.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5ACD3F66E;
	Tue,  4 Mar 2025 00:25:08 -0800 (PST)
Message-ID: <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com>
Date: Tue, 4 Mar 2025 09:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Yicong Yang <yangyicong@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: yangyicong@hisilicon.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
 sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
 <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_082547_301016_D87D8FE0 
X-CRM114-Status: GOOD (  14.08  )
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



On 3/3/25 15:40, Yicong Yang wrote:
> On 2025/3/3 19:16, Sudeep Holla wrote:
>> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>>
>>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>>
>>>>>
>>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>>
>>>>> smt/active:0
>>>>> smt/control:-1
>>>>>
>>>>> If cpu_smt_set_num_threads() is called:
>>>>> active:0
>>>>> control:notsupported
>>>>>
>>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>>
>>>>
>>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>>> that is what needed anyways and the above code does that now.
>>>>
>>>> Why not start with initialised to 1 instead ?
>>>> Of course some current logic needs to change around testing it for zero.
>>>>
>>>
>>> I think there would still be a way to check against the default value.
>>> If we have:
>>> unsigned int max_smt_thread_num = 1;
>>>
>>> then on a platform with 2 threads, the detection condition would trigger:
>>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>>      if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>>          pr_warn_once("Heterogeneous SMT topology is partly
>>>                        supported by SMT control\n");
>>>
>>> so we would need an additional variable:
>>> bool is_initialized = false;
>>
>> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
>>
>> I mean
>> 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
>>

I think it will be problematic if we parse:
- first a CPU with 1 thread
- then a CPU with 2 threads

in that case we should detect the 'Heterogeneous SMT topology',
but we cannot because we don't know whether max_smt_thread_num=1
because 1 is the default value or we found a CPU with one thread.

