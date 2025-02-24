Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1656AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rltBeeIiJHnpQoRRdWFs7tjBrGlAOLubcOAdWZhwP0=; b=SP43BAbhbE30MEQemoZ8sZRfXR
	08WipDiPxw5cU/sPK6AnK71Ik2N9M+YRPErOL3sFla61bg9NThDqIphXhDOqrom2i8KfJpPaqso5J
	q1KiddRveniNtHDuKTtaH17f2HQn/AUfjpdU4qLBKypHGij+CdKlZ/RPTC0kQf2+x9VcOWeQY+5XD
	tbj5TRPWThIRsp3YdfGcjXkS6Q+LenGr/vYWHJca+sEkZwtbSLr0/jutHFNNEL32Jwoc8qkMFOEiD
	JeDxaJBQVwVYXdw2qMvXYm+1FHuBPUsAsKWQ8DfDl9QzdUZDvJp21UUt0Jj8cxwYE42Nrxd7Bz1lI
	NTzOl+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHe-0000000DnVr-01NI;
	Mon, 24 Feb 2025 13:14:06 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXRM-0000000Dfe6-0qDU;
	Mon, 24 Feb 2025 12:20:05 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1fV21lT7z9sSH;
	Mon, 24 Feb 2025 13:01:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSWOAySpYadf; Mon, 24 Feb 2025 13:01:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1fV20Znwz9sRy;
	Mon, 24 Feb 2025 13:01:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF2E28B775;
	Mon, 24 Feb 2025 13:01:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U8aocdpqgbdH; Mon, 24 Feb 2025 13:01:45 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A584D8B763;
	Mon, 24 Feb 2025 13:01:45 +0100 (CET)
Message-ID: <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Date: Mon, 24 Feb 2025 13:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250217042220.32920-6-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_042004_405398_A7C5A40A 
X-CRM114-Status: GOOD (  11.23  )
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



Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
> is confusing as they sound very similar and does not differentiate between
> platform's feature subscription and feature enablement for ptdump. Rename
> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
> readability.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..5aef2aa4103c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -43,6 +43,7 @@ config RISCV
>   	select ARCH_HAS_PMEM_API
>   	select ARCH_HAS_PREEMPT_LAZY
>   	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> +	select ARCH_HAS_PTDUMP

Is it OK to drop the 'if MMU' from below ?

>   	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SET_DIRECT_MAP if MMU
> @@ -112,7 +113,6 @@ config RISCV
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>   	select GENERIC_PCI_IOMAP
> -	select GENERIC_PTDUMP if MMU
>   	select GENERIC_SCHED_CLOCK
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT

