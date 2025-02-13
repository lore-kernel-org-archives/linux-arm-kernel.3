Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeLebbqDX0WJfyw1CE6wJZuiafL/LoNX99Os8d87jXY=; b=3XFX64u3tTaParTfk5B0KoQyWJ
	umUarbq4peOWGptBNZzzlul7s/mFjU2nYycw7LlzmPW6arwUyTcGWfyAOjl2eGhAxYXCuR0iJJra4
	o05N1sgK8v0bp+vjJlQ+lGCmDGn5y7MRNn7w5FF7XZzgNC0ymVkOOHTiuY+KMJIX1VQaaLJqzuPxg
	nbAc64cvPjp6Tf0jhIYJ8n9fLO7Gj4TgOiURkuLt1gmaFcMhgiSbqtEyiH7pkc5+T70C1ra1LefXE
	LWlSqjaO/WXgmzIBYHPcEllaVcWSwj9xHsLlyURnzH8jG6qG6UzMyF/1mBTEX8KhI/CONhl9EM+Qm
	3IaxM5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXPd-0000000ArFH-2idJ;
	Thu, 13 Feb 2025 11:29:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXJT-0000000ApP0-2eDh;
	Thu, 13 Feb 2025 11:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JeLebbqDX0WJfyw1CE6wJZuiafL/LoNX99Os8d87jXY=; b=CrG0O6IBblpFs+n12fvgI9VWPV
	bOhxdar2wtXt8UWDfKhaZhXXTkLP2icbnws1qMvFtO5BIAM37sFrBEYgwxPuD3qNjiRPyIpfAN1W9
	Jv/HRXMbm1qTSmCeFpjqISitePmboxSZkDTkLnurcNSEr4XTEhIKGHC0u2kYh9zBfgPI1uTDc70jG
	9rE7UzulUoq1aau6782ImgFRAfrk62xo2XKkeEL2uuEnDeEzYqF8W2bQC4xor76eNM/m58DohGv0k
	BzsPhSIP+2BfMo71XSK+2b3rd9CHQjnJNwXgr2NsiyBvlgsnqKIkf2MQpjAKZOwLpjNJoEuFo8Stt
	6cBgmb5w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXJQ-00000000yEw-2Thf;
	Thu, 13 Feb 2025 11:23:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84F7226A4;
	Thu, 13 Feb 2025 03:23:40 -0800 (PST)
Received: from [10.1.32.44] (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE743F6A8;
	Thu, 13 Feb 2025 03:23:14 -0800 (PST)
Message-ID: <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
Date: Thu, 13 Feb 2025 11:23:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: christophe.leroy@csgroup.eu, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250213040934.3245750-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_112321_017202_9962B75A 
X-CRM114-Status: GOOD (  17.51  )
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

On 13/02/2025 04:09, Anshuman Khandual wrote:
> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
> is confusing as they sound very similar and does not differentiate between
> platform's feature subscription and feature enablement for ptdump. Rename
> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
> readability.

I'm not going to bikeshed over the naming, but a few points below.

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
>  Documentation/arch/arm64/ptdump.rst       |  4 ++--
>  arch/arm64/Kconfig                        |  2 +-
>  arch/arm64/include/asm/ptdump.h           |  4 ++--
>  arch/arm64/kvm/Kconfig                    |  4 ++--
>  arch/arm64/mm/Makefile                    |  2 +-
>  arch/powerpc/Kconfig                      |  2 +-
>  arch/powerpc/configs/mpc885_ads_defconfig |  2 +-
>  arch/powerpc/mm/Makefile                  |  2 +-
>  arch/riscv/Kconfig                        |  2 +-
>  arch/riscv/mm/Makefile                    |  2 +-
>  arch/s390/Kconfig                         |  2 +-
>  arch/s390/mm/Makefile                     |  2 +-
>  arch/x86/Kconfig                          |  2 +-
>  arch/x86/Kconfig.debug                    |  2 +-
>  arch/x86/mm/Makefile                      |  2 +-
>  mm/Kconfig.debug                          | 12 ++++++------
>  mm/Makefile                               |  2 +-
>  17 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
> index 5dcfc5d7cddf..a2e527377da3 100644
> --- a/Documentation/arch/arm64/ptdump.rst
> +++ b/Documentation/arch/arm64/ptdump.rst
> @@ -22,8 +22,8 @@ offlining of memory being accessed by the ptdump code.
>  In order to dump the kernel page tables, enable the following
>  configurations and mount debugfs::
>  
> - CONFIG_GENERIC_PTDUMP=y
> - CONFIG_PTDUMP_CORE=y
> + CONFIG_ARCH_HAS_PTDUMP=y
> + CONFIG_PTDUMP=y
>   CONFIG_PTDUMP_DEBUGFS=y

I think we should drop CONFIG_GENERIC_PTDUMP/CONFIG_ARCH_HAS_PTDUMP from
this list. It's not a user-selectable symbol so there's no need to be
documenting it here.

>  
>   mount -t debugfs nodev /sys/kernel/debug
[...]
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index 77306be62e9e..db005618690b 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>  CONFIG_DETECT_HUNG_TASK=y
>  CONFIG_BDI_SWITCH=y
>  CONFIG_PPC_EARLY_DEBUG=y
> -CONFIG_GENERIC_PTDUMP=y
> +CONFIG_PTDUMP=y

I'd suggest dropp this from the defconfig too, just like patch 1 dropped
it from debug.config.

Steve


