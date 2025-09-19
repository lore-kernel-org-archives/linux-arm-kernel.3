Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D07CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBZPXFh9J0O7QytS2QYGvgTml2Z8qcvqKpyMc1vfI0w=; b=p9O7+j+AexPWA7IiDhhFr83c2P
	Ha2SGF490XEZuGs/TAIEklYwsgRHBwHtuIXOgcKtwOxsQMzrrU1Q7ENEMv9wuJXAEVsxKlVMCLT2d
	YOh8Hpt7YXCx3Y1T81nqTerC9lLtbd5uxif/AoQJI8Mi4QOeCPEs1jjZ6XPjq3v2p2JXEJjE53DGh
	pcxkA0qVc6EiJX9eVt1+sJfp9wUY3rw/O4W3+ipEFO+0Wxao7OtM51GbBpm3dRpKHmJQSpNr+eIcU
	C34fvJs1zxqjqE/nMWg4zMG3Mc2nnGNlsMtwHWRPEVTvdRUHGkm+4KuH2HW4C+a3lTxIYVJJzALBa
	g26uX0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXKO-00000002Mcb-0757;
	Fri, 19 Sep 2025 09:22:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXKL-00000002Mc2-2LV9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C17E4169E;
	Fri, 19 Sep 2025 02:22:38 -0700 (PDT)
Received: from [10.163.44.14] (unknown [10.163.44.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4963F66E;
	Fri, 19 Sep 2025 02:22:43 -0700 (PDT)
Message-ID: <554e507a-1a68-4ae9-9345-5aea0a81ba2b@arm.com>
Date: Fri, 19 Sep 2025 14:52:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] arm64/sysreg: Replace TCR_EL1 field macros
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Mark Brown <broonie@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
 <20250907123000.414181-3-anshuman.khandual@arm.com>
 <aMv2J1hRQm_f4WAP@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aMv2J1hRQm_f4WAP@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_022249_644650_B92C87CF 
X-CRM114-Status: GOOD (  11.38  )
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

On 18/09/25 5:38 PM, Will Deacon wrote:
> On Sun, Sep 07, 2025 at 06:00:00PM +0530, Anshuman Khandual wrote:
>> This just replaces all used TCR_EL1 field macros with tools sysreg variant
>> based fields and subsequently drops them from the header (pgtable-hwdef.h)
>> and moves all required macros into KVM header (asm/kvm_arm.h) for continued
>> usage in KVM.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: kvmarm@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Changes in V4:
>>
>> - Dropped all unused TCR_XXX macros while moving into KVM header
>>
>>  arch/arm64/include/asm/assembler.h     |  6 +-
>>  arch/arm64/include/asm/cputype.h       |  2 +-
>>  arch/arm64/include/asm/kvm_arm.h       | 43 +++++++++++
>>  arch/arm64/include/asm/mmu_context.h   |  4 +-
>>  arch/arm64/include/asm/pgtable-hwdef.h | 98 +-------------------------
>>  arch/arm64/include/asm/pgtable-prot.h  |  2 +-
>>  arch/arm64/kernel/cpufeature.c         |  4 +-
>>  arch/arm64/kernel/pi/map_kernel.c      |  8 +--
>>  arch/arm64/kernel/vmcore_info.c        |  2 +-
>>  arch/arm64/mm/proc.S                   | 36 ++++++----
>>  tools/arch/arm64/include/asm/cputype.h |  2 +-
> 
> Please don't mix tools/ patches with arch patches. You probably want to keep
> the KVM one separate as well.

Sure, will split these changes in the following order.

- arm64 tool sysreg update for TCR_EL1
- Tools header update for TCR_NFD0/1
- Kernel update
- KVM specific update i.e header macro movement

