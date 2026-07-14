Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whTvoIQzFLxg9nWsia/8ifGYSwTXwSJ9Egk0loJM9jI=; b=PPrdG2Ir1ePkBsmKN/sXs1mBIW
	lEDbxqORPyFXruhAHss/AKRYC8Oo773kb+3vF2qjaGl1+k2rHhMlj72E81gwVOBmK3X/7sjfWJkZ7
	8UG4l8GaUFFeJNfLdVbvDhNAK631Vr6hgPNPcuo9KAOa0jyf6vXRSdCbrpqF4YJe9ngMFh1wQgjQo
	Fsk1pWWYXBUbO+59buxP+G5KxcCzpdBrnhR0MAp6gGrBQLcIfjEsFvFIEVFe8rybC0EZNxJVJU76w
	3kgJ6R9LX9pZZcauA0tNlslzuC0s+d+p20+/eRa8cZhIAb1qUXfMGWeLhU+QIa3765WYsacpwKLB3
	LvlSkiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbBR-0000000Bf8U-3NGi;
	Tue, 14 Jul 2026 11:20:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbBP-0000000Bf7V-1Ceg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:20:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 882DA497;
	Tue, 14 Jul 2026 04:20:09 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B8413F93E;
	Tue, 14 Jul 2026 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784028013; bh=mks3puL1y53IZeO82cWCJbGRSmY7s3qDamibiDiISkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWwtbq5lmHVY8rYBg+ntmva4+BGhHhjwM7qGuYcHrB2qwvPBHbbc01OSgcOqfpDdb
	 RDBVy7P0dZd5yhT9CM8E1r7iJt9WcAqE4TnqDaqmGbU5ijmytnxURPU2ozf98RadN2
	 A4r1U75/RUOqt0oZ+zUsx/y4L7RemKsD1nmOLiHk=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 0/6] Support the FEAT_HDBSS introduced in Armv9.5
Date: Tue, 14 Jul 2026 12:20:08 +0100
Message-ID: <alYbaD2sxvkf_0jj@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fcc9e842-a6fd-418e-93ff-0475a542f3df@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <alS-kcwvlASwPIzL@LeoBrasDK> <alUR3ez1EKeWb_pM@LeoBrasDK> <fcc9e842-a6fd-418e-93ff-0475a542f3df@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_042015_426342_E5BCF3E7 
X-CRM114-Status: GOOD (  43.73  )
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

On Tue, Jul 14, 2026 at 06:39:48PM +0800, Tian Zheng wrote:
> 
> On 7/14/2026 12:27 AM, Leonardo Bras wrote:
> > On Mon, Jul 13, 2026 at 11:31:46AM +0100, Leonardo Bras wrote:
> > > On Thu, Jul 09, 2026 at 06:40:20PM +0800, Tian Zheng wrote:
> > > > This series of patches add support to the Hardware Dirty state tracking
> > > > Structure (HDBSS) feature, which is introduced by the ARM architecture
> > > > in the DDI0601 (ID121123) version.
> > > > 
> > > > The HDBSS feature is an extension to the architecture that enhances
> > > > tracking translation table descriptors' dirty state, identified as
> > > > FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> > > > page tracking, aiming to significantly reduce the overhead of scanning
> > > > for dirty pages.
> > > > 
> > > > The purpose of this feature is to make the execution overhead of live
> > > > migration lower to both the guest and the host, compared to existing
> > > > approaches (write-protect or search stage-2 tables).
> > > > 
> > > > The required sysreg definitions for FEAT_HDBSS have been merged into
> > > > arm64 /sysregs:
> > > >    [1/5] arm64/sysreg: Add HDBSS related register information
> > > >          https://git.kernel.org/arm64/c/72f7be0c2e30
> > > > 
> > > > 
> > > > After these patches, the kernel automatically enables HDBSS when dirty
> > > > logging is enabled on any memslot, and disables HDBSS when dirty logging
> > > > is disabled on all memslots. This series does not support dirty ring
> > > > mode.
> > > > 
> > > > Depends-on: "KVM: arm64: Enable eager hugepage splitting if HDBSS is available"
> > > > 	https://lore.kernel.org/linux-arm-kernel/20260629111820.1873540-3-leo.bras@arm.com/
> > > On this, FYI, there have been some discussion on this:
> > > https://lore.kernel.org/all/alETGFD2Ogx6N0HB@LeoBrasDK/
> > > 
> > > Oliver's suggestion is that we don't automatically enable eager splitting,
> > > but instead we have different behaviours if the user enables it.
> > > 
> > > This is still under discussion there, but I think it can be useful reading.
> > > 
> > > > This dependency is mandatory. Unlike v3, where DBM was added lazily on
> > > > the first dirty access via a page fault, v4 injects DBM into pgt->flags
> > > > at stage-2 MMU initialization time. Combined with HDBSS being auto-enabled
> > > > during migration setup, the first dirty access no longer triggers a page
> > > > fault. Consequently, if lazy hugepage splitting were relied upon (which
> > > > requires a page fault to trigger splitting), hugepages would never be
> > > > split, leading to guest hang after migration. Leonardo's patch above
> > > > ensures eager hugepage splitting is enabled (chunk_size != 0) when HDBSS
> > > > is available, guaranteeing that hugepages are properly split before
> > > > migration starts.
> > > > 
> > > > v3: https://lore.kernel.org/linux-arm-kernel/20260225040421.2683931-1-zhengtian10@huawei.com/
> > > > 
> > > > v3->v4 changes:
> > > > - Merge sysreg definitions into the FEAT_HDBSS detection patch (was a
> > > >    separate patch in v3).
> > > > - Add auto DBM (Dirty Bit Modifier) support as a new patch, suggested
> > > >    by Leonardo Bras. DBM is now controlled as a page-table level flag
> > > >    (KVM_PGTABLE_S2_DBM) rather than per-PTE. Note that DBM is injected
> > > >    at stage-2 MMU creation time, not lazily on first dirty access. This
> > > >    means the first write to a dirty-logged page does not generate a
> > > >    page fault, which is a key reason for the mandatory dependency on
> > > >    Leonardo's eager hugepage splitting patch (see Depends-on above).
> > > > - Split the v3 "Enable HDBSS support and handle HDBSSF events" patch
> > > >    into three patches: per-vCPU buffer management, fault handling and
> > > >    buffer flush, and auto enable/disable on dirty logging change. This
> > > >    implements kernel-managed automatic HDBSS enable/disable.
> > > > - Remove the KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl for manual HDBSS
> > > >    on/off. HDBSS is now automatically enabled/disabled based on dirty
> > > >    logging state via kvm_arch_commit_memory_region().
> > > > - Change HDBSS buffer flush triggers to vcpu_put, check_vcpu_requests,
> > > >    and kvm_handle_guest_abort.
> > > > - Store hdbss_order at VM level (kvm->arch.hdbss_order) instead of
> > > >    per-vCPU, since all vCPUs share the same order.
> > > > - Document patch is not included in this version; will be sent in a
> > > >    follow-up series.
> > > > 
> > > > Leonardo Bras (1):
> > > >    KVM: arm64: Enable eager hugepage splitting if HDBSS is available
> > > > 
> > > > Tian Zheng (2):
> > > >    KVM: arm64: Add support for FEAT_HDBSS
> > > >    KVM: arm64: Add auto DBM support for hardware dirty tracking
> > > > 
> > > > eillon (3):
> > > >    KVM: arm64: Add HDBSS per-vCPU buffer management
> > > >    KVM: arm64: Add HDBSS fault handling and buffer flush
> > > >    KVM: arm64: Add auto HDBSS enable/disable on dirty logging change
> > > > 
> > > >   arch/arm64/include/asm/cpufeature.h    |   5 +
> > > >   arch/arm64/include/asm/esr.h           |   5 +
> > > >   arch/arm64/include/asm/kvm_dirty_bit.h |  29 ++++
> > > >   arch/arm64/include/asm/kvm_host.h      |  14 ++
> > > >   arch/arm64/include/asm/kvm_pgtable.h   |   4 +
> > > >   arch/arm64/include/asm/sysreg.h        |  11 ++
> > > >   arch/arm64/kernel/cpufeature.c         |  12 ++
> > > >   arch/arm64/kvm/Makefile                |   1 +
> > > >   arch/arm64/kvm/arm.c                   |  29 ++++
> > > >   arch/arm64/kvm/dirty_bit.c             | 219 +++++++++++++++++++++++++
> > > >   arch/arm64/kvm/hyp/pgtable.c           |  35 +++-
> > > >   arch/arm64/kvm/hyp/vhe/switch.c        |  15 ++
> > > >   arch/arm64/kvm/mmu.c                   |  19 ++-
> > > >   arch/arm64/kvm/reset.c                 |   4 +
> > > >   arch/arm64/tools/cpucaps               |   1 +
> > > >   15 files changed, 399 insertions(+), 4 deletions(-)
> > > >   create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
> > > >   create mode 100644 arch/arm64/kvm/dirty_bit.c
> > > > 
> > > > --
> > > > 2.33.0
> > > > 
> > Also, please remember to include the base commit, so it can be applied for
> > testing/reviewing.
> 
> 
> Thank you for the reminder.
> 
> This patch series is based on:
> - Commit: 0e35b9b6ec0f
> - Description: Merge tag 'mm-hotfixes-stable-2026-07-06-17-49' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> 
> Welcome to test and review — please let me know if you encounter any issues
> or have suggestions for improvement.
> 
> 


Thanks for sharing :)

Tip: for next version, you can automate that by adding 
'--base=<base-commit>' to your git-format-patch command, and it will 
automatically generate a base message at the end of your cover letter, such 
as:

```
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
```

Thanks!
Leo

