Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D4DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbXNlJgJQzs0N0juAvPCRWpCJrrEOPgd6cgVH8qHIV0=; b=RVsBGAsSMyNUG65sIycSNwvJpy
	lurNJ5MlqGC7koZJw5SmcZcsmOJ539cVE/HYJsLik8g83A79bNGG1znlR13zpQ0HunpdPPKi8RV00
	rb+IwifJhHr/uYDRgm6eDNew1N4xiAymh52QxRNXVIOc5+7EbogoEeyOYSnHZl7wFr0p3yxnT/JPo
	iSTmK3lWX4MVCX2NnNUqN67b09ES4jYPmFVfbRSocdsJXLLztsj51wE3HbuIl7iQvVdanY2aevimr
	lZn+qRG3xO/DTaceRIg3RLk0r9R5g6hcT0NUalVR3AHTudujdCtnB88kTLuhNKAs8ijj9tVrCXbzh
	3MnPudcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4y2-00000004I4I-3tLr;
	Fri, 10 Jul 2026 06:44:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4y0-00000004I3d-1iGG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 06:44:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29E7F1682;
	Thu,  9 Jul 2026 23:44:00 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106A63F66F;
	Thu,  9 Jul 2026 23:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783665844; bh=RUI0hFPWUQ+wlVC5kBXZqbX6ZHXl7Xsre0FPPOU8rDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogrNzINHFx6blHrS6Ebu3TmeUPsyjjsrDcKrTLlp0jBwt2T37Hi5yQ/RWOTV5+ZrV
	 k+Sp8OBLmV3UkoqV/7q/jsi4hjzzZ6E0YJVeF2ehOwr5On3wCr/yEj7/fSEEA+eO+2
	 uOOXPF3Bqcy6s98ieI23nyfB66pqAstTkyq2vBU8=
Date: Fri, 10 Jul 2026 07:43:46 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <m637wmil3r2bnhlw2mbj5xy5ahucbykk7b4uc6yfcz3c3dfkkj@z4hkns5sieds>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <akYLdEuPXEGIZx3E@sm-arm-grace07>
 <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
 <akbuIDmd_zH9_m6K@sm-arm-grace07>
 <nzvizmyxj4otyo5itl425vdflimp6pnkuwo4qtwzzsbjobhzco@ygxydualln47>
 <ak9PHJJzjliTeiFB@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9PHJJzjliTeiFB@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_234408_537867_6B5A489B 
X-CRM114-Status: GOOD (  44.56  )
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

On Thu, Jul 09, 2026 at 04:34:52PM +0900, Itaru Kitayama wrote:
> On Fri, Jul 03, 2026 at 11:24:53AM +0100, Wei-Lin Chang wrote:
> > On Fri, Jul 03, 2026 at 08:02:56AM +0900, Itaru Kitayama wrote:
> > > On Thu, Jul 02, 2026 at 08:41:43AM +0100, Wei-Lin Chang wrote:
> > > > On Thu, Jul 02, 2026 at 03:55:48PM +0900, Itaru Kitayama wrote:
> > > > > Hi Wei-Lin,
> > > > > On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> > > > > > per mmu ptdump files work after all, mainly because there isn't a clean way to
> > > > > > locate the specific nested mmu for each ptdump file as the nested mmus could be
> > > > > > freed when the file gets opened. Therefore in this series a single file
> > > > > > "shadow_page_tables" is created that dumps all valid mmus' page table
> > > > > > information.
> > > > > > 
> > > > > > An advantage of this is that this new ptdump file have a lifetime identical to
> > > > > > other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> > > > > > dentry UAF found last time [1].
> > > > > > 
> > > > > > With this all ptdump files are only removed when the last kvm reference gets
> > > > > > dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> > > > > > functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> > > > > > prevent UAF.
> > > > > > 
> > > > > > Patch 1-2: Undo previous shadow ptdump implementation.
> > > > > > Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
> > > > > >            mmu->pgt is freed.
> > > > > > Patch 4-5: Preparation for the shadow page table dump file.
> > > > > > Patch 6:   Implementation of the shadow page table dump file.
> > > > > > 
> > > > > > The fixes are tested with CONFIG_PROVE_LOCKING,
> > > > > > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > > > > > 
> > > > > > Thanks!
> > > > > 
> > > > > Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
> > > > > for shadow stage 2 translation tables are built with ia_bits = 52 and
> > > > > start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
> > > > > out that's 3 levels. Is this fully expected?
> > > > 
> > > > Where is this level information you are seeing from? If it is
> > > > "stage2_level", that only reports the number of levels for the canonical
> > > > stage-2 (non nested). For nested mmus only the page tables are dumped in
> > > > nested/shadow_page_tables.
> > > 
> > > Yes I know. The initial stage 2 translation table structure information is obtained by 
> > > instrumenting the kernel using eBPF fexit to __kvm_pgtable_stage2_init().
> > > 
> > > Since you're correctly loopin over nested_mmus array, and the output is
> > > correctly shown using the kvm_pgtable information via the kvm_s2_mmu for
> > > them, I am confused at this moment.
> > 
> > Two things here:
> > 
> > Firstly ia_bits being 52 is not expected to me, as I didn't change the
> > VM's IPA size via KVM_VM_TYPE_ARM_IPA_SIZE in the selftest, to me I
> > would expect ia_bits to be 40 (the default). Start level being 0 looks
> > normal.
> 
> Instrumenting the ptdump code you're proposing I see the shadow stage 2
> translation tables are constructed with the max 52-bit IPA; irrespective
> of the IPA bits set in the init_s2_mmu() helper for the guest hypervisor
> setup in the selftest, I am guessing here to me fixed? 52-bit IPA size 
> because it's awkward if nestd guest's IPA size is larger than the shadow 
> stage 2's IPA size.

Sorry, I got it wrong. It is correct that shadow stage-2 translation
tables are constructed with 52-bit IPA, irrespective of what L1 sets in
init_s2_mmu(). This is because L1 is free to decide what memory map it
exposes to its guest, so we only constrain it with the PARange exposed
to the guest. Please see the comments in init_nested_s2_mmu().

> 
> I confirmed using the __vm_create() helper with various guest modes
> supported that canonical stage 2's "ipa_range" changes according to the 
> guest (L1) PA size so I wonder if it is a good idea to create something like
> shadow_ipa_range and shadow_stage2_levels files under nested directoy.

I guess shadow_ipa_range and shadow_stage2_levels can be added if there
are explicit demand for it. Although right now they aren't too difficult
to infer from the PARange exposed to the guest.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 
> > Second thing is I still can't get what you are confused about, if it's
> > not about the first point. Note that the "3" in ptdump means it is a
> > level 3 mapping, not saying the page tables are using 3 levels.
> > 
> > Happy to discuss more if you clarify. I'll also check the ia_bits when I
> > get to it.
> > 
> > Thanks,
> > Wei-Lin Chang
> > 
> > > 
> > > Thanks,
> > > Itaru.
> > > 
> > > > 
> > > > Thanks,
> > > > Wei-Lin Chang
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Itaru.
> > > > > 
> > > > > > 
> > > > > > * Changes from v1 ([2]):
> > > > > > 
> > > > > >   - Move from per mmu ptdump files to one file that will dump all shadow page
> > > > > >     tables.
> > > > > > 
> > > > > > [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> > > > > > [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> > > > > > 
> > > > > > Wei-Lin Chang (6):
> > > > > >   KVM: arm64: ptdump: Remove shadow ptdump files
> > > > > >   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
> > > > > >   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
> > > > > >   KVM: arm64: ptdump: Factor out initialization of
> > > > > >     kvm_ptdump_guest_state
> > > > > >   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
> > > > > >     ptdump path
> > > > > >   KVM: arm64: ptdump: Introduce the shadow ptdump file
> > > > > > 
> > > > > >  arch/arm64/include/asm/kvm_host.h |   5 +-
> > > > > >  arch/arm64/include/asm/kvm_mmu.h  |   4 -
> > > > > >  arch/arm64/kvm/nested.c           |  18 +--
> > > > > >  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
> > > > > >  4 files changed, 135 insertions(+), 77 deletions(-)
> > > > > > 
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 

