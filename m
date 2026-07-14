Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75712C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV9UaR4NO/02VSBp05qT9Vmz9xMDQk+3YYbop8A72PI=; b=KVLlYFwJL734C+LlreRMyCoEp/
	E82mlsrWuePmeycIK/fV74s4y+4Wyc3ddDXLekHmksBSKQQDKJ5h/WvQoTrLJ4siZ7Aw+z9ixHwDs
	W9jg8TpVGUuBTwYfzjNVcUXxZcucB/uTkFDKhGzGKEFe3CnOCv2XNMa/4M9f0i2cWbzm6UbMbIoAF
	Lpauli3zvs6qCflbqQViIama9szr2Ge7JYOgYVnn5t5ZGwPqbpufgP0LTTAeUaDRyqBkeo4ML+pkk
	SUDJSMTivMPLw/nEfpYk2qkGsN3IC9NFxAR3ZNSUax/B95PvjuWJ3wgFVOZLYf11hHDqILIi0mHra
	+mNd5OWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZaq-0000000BTha-1aNM;
	Tue, 14 Jul 2026 09:38:24 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZam-0000000BTft-03Zg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:38:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RV9UaR4NO/02VSBp05qT9Vmz9xMDQk+3YYbop8A72PI=;
	b=Bnux4+E7bg7xEesKINA/c0rqmpGNyFpxbjsmn+z8917qknoTbgRCOYbgCUgYCFNfIze0GxOo2
	EmCos8EhIeWJqIykSFij7EiQ4vwj0dTqNZiB1G5NqDAfeavGzfbkaG20tryA2TVkOH9XP7TTJOq
	lhAsE2xaqkMnPttKsXJnV2E=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gzv9w0z8gz12LCc;
	Tue, 14 Jul 2026 17:28:20 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 788B740579;
	Tue, 14 Jul 2026 17:37:58 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 14 Jul 2026 17:37:57 +0800
Message-ID: <8757dfcf-aae4-4716-9ff1-c3140d4cc63e@huawei.com>
Date: Tue, 14 Jul 2026 17:37:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Support the FEAT_HDBSS introduced in Armv9.5
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
 <alS-kcwvlASwPIzL@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <alS-kcwvlASwPIzL@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_023820_653085_64D9AD2C 
X-CRM114-Status: GOOD (  28.11  )
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


On 7/13/2026 6:31 PM, Leonardo Bras wrote:
> On Thu, Jul 09, 2026 at 06:40:20PM +0800, Tian Zheng wrote:
>> This series of patches add support to the Hardware Dirty state tracking
>> Structure (HDBSS) feature, which is introduced by the ARM architecture
>> in the DDI0601 (ID121123) version.
>>
>> The HDBSS feature is an extension to the architecture that enhances
>> tracking translation table descriptors' dirty state, identified as
>> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
>> page tracking, aiming to significantly reduce the overhead of scanning
>> for dirty pages.
>>
>> The purpose of this feature is to make the execution overhead of live
>> migration lower to both the guest and the host, compared to existing
>> approaches (write-protect or search stage-2 tables).
>>
>> The required sysreg definitions for FEAT_HDBSS have been merged into
>> arm64 /sysregs:
>>    [1/5] arm64/sysreg: Add HDBSS related register information
>>          https://git.kernel.org/arm64/c/72f7be0c2e30
>>
>>
>> After these patches, the kernel automatically enables HDBSS when dirty
>> logging is enabled on any memslot, and disables HDBSS when dirty logging
>> is disabled on all memslots. This series does not support dirty ring
>> mode.
>>
>> Depends-on: "KVM: arm64: Enable eager hugepage splitting if HDBSS is available"
>> 	https://lore.kernel.org/linux-arm-kernel/20260629111820.1873540-3-leo.bras@arm.com/
> On this, FYI, there have been some discussion on this:
> https://lore.kernel.org/all/alETGFD2Ogx6N0HB@LeoBrasDK/
>
> Oliver's suggestion is that we don't automatically enable eager splitting,
> but instead we have different behaviours if the user enables it.
>
> This is still under discussion there, but I think it can be useful reading.


Thanks for the pointer — I've read through the discussion between you 
and Oliver, and it's very helpful.


If I understand correctly, the proposed approach is to support both 
modes, with DBM behavior depending

on the user's eager split setting:

- If users enable eager splitting (chunk_size != 0): use the v4 approach 
— DBM is set globally.

- If users do NOT enable eager splitting (chunk_size == 0, i.e., lazy 
split mode): use the v3 approach — DBM

is set lazily in user_mem_abort on the first write fault.


This makes sense to me. It gives users the flexibility to choose.


As I mentioned in my patch 6/6 reply 
(https://lore.kernel.org/all/6e8b23bc-d420-4f5a-a921-5a5d64d84200@huawei.com/),

I do think the lazy DBM approach is safer overall if the first-fault 
overhead is acceptable — it avoids accidentally marking

special mappings and naturally handles lazy split.


I'll keep an eye on the discussion and follow up once a conclusion is 
reached.


Thanks!

Tian

>> This dependency is mandatory. Unlike v3, where DBM was added lazily on
>> the first dirty access via a page fault, v4 injects DBM into pgt->flags
>> at stage-2 MMU initialization time. Combined with HDBSS being auto-enabled
>> during migration setup, the first dirty access no longer triggers a page
>> fault. Consequently, if lazy hugepage splitting were relied upon (which
>> requires a page fault to trigger splitting), hugepages would never be
>> split, leading to guest hang after migration. Leonardo's patch above
>> ensures eager hugepage splitting is enabled (chunk_size != 0) when HDBSS
>> is available, guaranteeing that hugepages are properly split before
>> migration starts.
>>
>> v3: https://lore.kernel.org/linux-arm-kernel/20260225040421.2683931-1-zhengtian10@huawei.com/
>>
>> v3->v4 changes:
>> - Merge sysreg definitions into the FEAT_HDBSS detection patch (was a
>>    separate patch in v3).
>> - Add auto DBM (Dirty Bit Modifier) support as a new patch, suggested
>>    by Leonardo Bras. DBM is now controlled as a page-table level flag
>>    (KVM_PGTABLE_S2_DBM) rather than per-PTE. Note that DBM is injected
>>    at stage-2 MMU creation time, not lazily on first dirty access. This
>>    means the first write to a dirty-logged page does not generate a
>>    page fault, which is a key reason for the mandatory dependency on
>>    Leonardo's eager hugepage splitting patch (see Depends-on above).
>> - Split the v3 "Enable HDBSS support and handle HDBSSF events" patch
>>    into three patches: per-vCPU buffer management, fault handling and
>>    buffer flush, and auto enable/disable on dirty logging change. This
>>    implements kernel-managed automatic HDBSS enable/disable.
>> - Remove the KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl for manual HDBSS
>>    on/off. HDBSS is now automatically enabled/disabled based on dirty
>>    logging state via kvm_arch_commit_memory_region().
>> - Change HDBSS buffer flush triggers to vcpu_put, check_vcpu_requests,
>>    and kvm_handle_guest_abort.
>> - Store hdbss_order at VM level (kvm->arch.hdbss_order) instead of
>>    per-vCPU, since all vCPUs share the same order.
>> - Document patch is not included in this version; will be sent in a
>>    follow-up series.
>>
>> Leonardo Bras (1):
>>    KVM: arm64: Enable eager hugepage splitting if HDBSS is available
>>
>> Tian Zheng (2):
>>    KVM: arm64: Add support for FEAT_HDBSS
>>    KVM: arm64: Add auto DBM support for hardware dirty tracking
>>
>> eillon (3):
>>    KVM: arm64: Add HDBSS per-vCPU buffer management
>>    KVM: arm64: Add HDBSS fault handling and buffer flush
>>    KVM: arm64: Add auto HDBSS enable/disable on dirty logging change
>>
>>   arch/arm64/include/asm/cpufeature.h    |   5 +
>>   arch/arm64/include/asm/esr.h           |   5 +
>>   arch/arm64/include/asm/kvm_dirty_bit.h |  29 ++++
>>   arch/arm64/include/asm/kvm_host.h      |  14 ++
>>   arch/arm64/include/asm/kvm_pgtable.h   |   4 +
>>   arch/arm64/include/asm/sysreg.h        |  11 ++
>>   arch/arm64/kernel/cpufeature.c         |  12 ++
>>   arch/arm64/kvm/Makefile                |   1 +
>>   arch/arm64/kvm/arm.c                   |  29 ++++
>>   arch/arm64/kvm/dirty_bit.c             | 219 +++++++++++++++++++++++++
>>   arch/arm64/kvm/hyp/pgtable.c           |  35 +++-
>>   arch/arm64/kvm/hyp/vhe/switch.c        |  15 ++
>>   arch/arm64/kvm/mmu.c                   |  19 ++-
>>   arch/arm64/kvm/reset.c                 |   4 +
>>   arch/arm64/tools/cpucaps               |   1 +
>>   15 files changed, 399 insertions(+), 4 deletions(-)
>>   create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
>>   create mode 100644 arch/arm64/kvm/dirty_bit.c
>>
>> --
>> 2.33.0
>>

