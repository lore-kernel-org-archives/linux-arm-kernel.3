Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FBBC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6Z9zgK/N3a/oWp1pz88cw7urkbX2EqTLSufEFZe38o=; b=rXJ0u4PGfjOBeph3tesll86Wry
	NdDMTgBd+5ch6aMX4NPZkd90zfNXfT850mlxJyoM/Hvg1ug6BhC7suz0W8Jy5koRdNY9xevlandbC
	ZtL3I7A9VVOjk4laHqs52gdDDXbvCb/sSQNEeZxy5bveCtqR9cMotSJb0gjnjPHXtQaWXolB/FajV
	hAwLWw2Xl4vINAlcNMcAb8Lii69RU+L16mxgxamxpaNYB+sJ+tP+9HlLJaG7ju6bCxNMlfz+BQDHX
	G4b+JNuNj4aW0AIPj3DlYjZudMfpT61FbfQR1o8Y8EUvgJKdSvctzgAxD/zpi5WhbtZiaeBpW6V9+
	Feb9/d3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYsV-0000000DyaJ-0w41;
	Mon, 24 Feb 2025 13:52:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYqL-0000000Dxy1-0mUN;
	Mon, 24 Feb 2025 13:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ACCB1515;
	Mon, 24 Feb 2025 05:50:13 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D913F5A1;
	Mon, 24 Feb 2025 05:49:47 -0800 (PST)
Message-ID: <137a241a-324a-45a9-a60b-d65f27dc4fc2@arm.com>
Date: Mon, 24 Feb 2025 19:19:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-6-anshuman.khandual@arm.com>
 <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054957_309997_78BF1A9B 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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



On 2/24/25 17:31, Christophe Leroy wrote:
> 
> 
> Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>> is confusing as they sound very similar and does not differentiate between
>> platform's feature subscription and feature enablement for ptdump. Rename
>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>> readability.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7612c52e9b1e..5aef2aa4103c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -43,6 +43,7 @@ config RISCV
>>       select ARCH_HAS_PMEM_API
>>       select ARCH_HAS_PREEMPT_LAZY
>>       select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>> +    select ARCH_HAS_PTDUMP
> 
> Is it OK to drop the 'if MMU' from below ?

Sure, will add it back.

> 
>>       select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
>>       select ARCH_HAS_PTE_SPECIAL
>>       select ARCH_HAS_SET_DIRECT_MAP if MMU
>> @@ -112,7 +113,6 @@ config RISCV
>>       select GENERIC_IRQ_SHOW_LEVEL
>>       select GENERIC_LIB_DEVMEM_IS_ALLOWED
>>       select GENERIC_PCI_IOMAP
>> -    select GENERIC_PTDUMP if MMU
>>       select GENERIC_SCHED_CLOCK
>>       select GENERIC_SMP_IDLE_THREAD
>>       select GENERIC_TIME_VSYSCALL if MMU && 64BIT

