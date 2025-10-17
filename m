Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB8CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUhhIOZQl1LmuwLSXSpqUy/3rFv/MJFTCRm/41SsmT4=; b=cyTTFSgjLkWPXg9Ez6BW6Ku/b+
	VdBAeJ1RLjmVu2UOTcZ9PSdK50918grsuyFQ6Xl1JHXUJlM85N3mjDrKZGkFrlOmVaK+rL4Ye6uEe
	uVgjcYXEQfxzolq0JU+9po75iN5akRamAicDrjdVwSBGQM0PCYiEBmIRQejWYtoaCfa/FRr7bckcs
	1y/PIaG4+XoUpVTFff8lhhj8xd0ctNAsnYh/uXKacgoLZeFrMpLalAGfW2BjizfrSa7Pl0omkHl0c
	MJzC1ESCfu3hiYd89QY8pHmSc2x1CWNqFJbpdSHEWYs9eBa87DvWXquJvj/EzVRVOI4Ejv2v6CZuJ
	1V636pTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOs-00000006CY9-29mR;
	Fri, 17 Oct 2025 00:32:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOo-00000006CUh-0IkH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:32:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1155802a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661168; x=1761265968; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUhhIOZQl1LmuwLSXSpqUy/3rFv/MJFTCRm/41SsmT4=;
        b=xwoGGUOaxlI1IKi0AmlXkS5ODeCF6zzEbc5ePI3f2lj+aU+M9WvVL3HNNHJZqqgA8u
         BgZ1i7L1BrH10hEG6Ry+KDoxGzEVazQm8TLdl+gONj7dpGdXgxiMsszUwU4hdaGrgGyW
         y9ch9EPftCIFeC9jgLKWTj26ieUVkAtkRSMRcSdtzE90gK1mlfb/W45fQrPvoHthYgmx
         TDNFS3PX6YwXxpakvEYDgohdhG/GiQlCSh//vHUi9QtC6lHGT7Ws2OFdtx+aedXMIeg/
         ypfuSGIJuaZ72E96e/zfVv3jiMDdTn7dmrqMULghwc2PYTtKTXquKtKjpBNm2eK9jg1O
         vNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661168; x=1761265968;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUhhIOZQl1LmuwLSXSpqUy/3rFv/MJFTCRm/41SsmT4=;
        b=Hr/Lre0AiEh6NzFTDoWdzhaxIEP4aAgv1YU9IPg7fshe+mM1ilU6Djpr3i/ba52n4F
         F7pRIYUKeiAXp3zYu6Q4uFcVmol4iMRBEm5RliQoR9845xCHkR4cS/lm2z0w1x1LmkeG
         g1wgilU770GECh09DEsvyELV06Vwp5EqErhnWM62sUPBuH5BrXINeFRuhEP7RpqWNCY4
         DGb/Mbf78uFS/cF2UPl1oXf+udilduhluUdmNWnX0/7PI1MVhsMqtQuG9zQ+g7MQB61D
         kjHJk3F2qpTl01FFsPkhGVY5U9ctTOKQbG5ShaZmIkhUqfaWkvfdPa/D/Iwdlwf96imH
         IQMA==
X-Gm-Message-State: AOJu0Yyy4L8pKayJWZvizuA1yriWWaGB+y5cDP89u5seqp0QDNf8wLj8
	sDlbxUN/LR5KYa7Z9H9JCMYco9rKA+ayf7Ft/g6Bnm3VLSFuUgtau1Rm2CybooAmJ1fSmrD5NnW
	aUsdxtg==
X-Google-Smtp-Source: AGHT+IGuHGQyD51mVtQEohHO8NdP+zAwWbn/b6u+mCKYmFM3Ij1iHsaMWgJCqF8QAg/mESpyN5uCXlDFqHE=
X-Received: from pjblk6.prod.google.com ([2002:a17:90b:33c6:b0:33b:51fe:1a74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a81:b0:32e:ddbc:9bd6
 with SMTP id 98e67ed59e1d1-33bcf8f9431mr1768955a91.27.1760661168259; Thu, 16
 Oct 2025 17:32:48 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:18 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-1-seanjc@google.com>
Subject: [PATCH v3 00/25] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173250_110622_3D8995B1 
X-CRM114-Status: GOOD (  15.14  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Non-x86 folks, patches 1 and 2 are likely the only thing of interest here.
They make kvm_arch_vcpu_async_ioctl() mandatory and then rename it to
kvm_arch_vcpu_unlocked_ioctl().  Hopefully they're boring?

As for the x86 side...

Clean up the TDX post-populate paths (and many tangentially related paths) to
address locking issues between gmem and TDX's post-populate hook[*], and
within KVM itself (KVM doesn't ensure full mutual exclusivity between paths
that for all intents and purposes the TDX-Module requires to be serialized).

Compile tested only again on my end, but Rick and Yan took v2 for a spin, so I
dropped the RFC.

[*] http://lore.kernel.org/all/aG_pLUlHdYIZ2luh@google.com

v3:
 - Collect more reviews.
 - Add the async_ioctl() => unlocked_ioctl() patches, and use the "unlocked"
   variant in the TDX vCPU sub-ioctls so they can take kvm->lock outside of
   vcpu->mutex.
 - Add a patch to document that vcpu->mutex is taken *outside* kvm->slots_lock.
 - Add the tdx_vm_state_guard CLASS() to take kvm->lock, all vcpu->mutex locks,
   and kvm->slots_lock, in order to make tdx_td_init(), tdx_td_finalize(),
   tdx_vcpu_init_mem_region(), and tdx_vcpu_init() mutually exclusive with
   each other, and mutually exclusvie with basically anything that can result
   in contending one of the TDX-Module locks (can't remember which one).
 - Refine the changelog for the "Drop PROVE_MMU=y" patch. [Binbin]

v2:
 - Collect a few reviews (and ignore some because the patches went away).
   [Rick, Kai, Ira]
 - Move TDH_MEM_PAGE_ADD under mmu_lock and drop nr_premapped. [Yan, Rick]
 - Force max_level = PG_LEVEL_4K straightaway. [Yan]
 - s/kvm_tdp_prefault_page/kvm_tdp_page_prefault. [Rick]
 - Use Yan's version of "Say no to pinning!".  [Yan, Rick]
 - Tidy up helpers and macros to reduce boilerplate and copy+pate code, and
   to eliminate redundant/dead code (e.g. KVM_BUG_ON() the same error
   multiple times).
 - KVM_BUG_ON() if TDH_MR_EXTEND fails (I convinced myself it can't).

v1: https://lore.kernel.org/all/20250827000522.4022426-1-seanjc@google.com

Sean Christopherson (23):
  KVM: Make support for kvm_arch_vcpu_async_ioctl() mandatory
  KVM: Rename kvm_arch_vcpu_async_ioctl() to
    kvm_arch_vcpu_unlocked_ioctl()
  KVM: TDX: Drop PROVE_MMU=y sanity check on to-be-populated mappings
  KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
  Revert "KVM: x86/tdp_mmu: Add a helper function to walk down the TDP
    MMU"
  KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
  KVM: TDX: Return -EIO, not -EINVAL, on a KVM_BUG_ON() condition
  KVM: TDX: Fold tdx_sept_drop_private_spte() into
    tdx_sept_remove_private_spte()
  KVM: x86/mmu: Drop the return code from
    kvm_x86_ops.remove_external_spte()
  KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
  KVM: TDX: Use atomic64_dec_return() instead of a poor equivalent
  KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into its sole caller
  KVM: TDX: Bug the VM if extended the initial measurement fails
  KVM: TDX: ADD pages to the TD image while populating mirror EPT
    entries
  KVM: TDX: Fold tdx_sept_zap_private_spte() into
    tdx_sept_remove_private_spte()
  KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error() into TDX_BUG_ON()
  KVM: TDX: Derive error argument names from the local variable names
  KVM: TDX: Assert that mmu_lock is held for write when removing S-EPT
    entries
  KVM: TDX: Add macro to retry SEAMCALLs when forcing vCPUs out of guest
  KVM: TDX: Add tdx_get_cmd() helper to get and validate sub-ioctl
    command
  KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU to "unlocked" vCPU
    ioctl
  KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
  KVM: TDX: Guard VM state transitions with "all" the locks

Yan Zhao (2):
  KVM: TDX: Drop superfluous page pinning in S-EPT management
  KVM: TDX: Fix list_add corruption during vcpu_load()

 arch/arm64/kvm/arm.c               |   6 +
 arch/loongarch/kvm/Kconfig         |   1 -
 arch/loongarch/kvm/vcpu.c          |   4 +-
 arch/mips/kvm/Kconfig              |   1 -
 arch/mips/kvm/mips.c               |   4 +-
 arch/powerpc/kvm/Kconfig           |   1 -
 arch/powerpc/kvm/powerpc.c         |   4 +-
 arch/riscv/kvm/Kconfig             |   1 -
 arch/riscv/kvm/vcpu.c              |   4 +-
 arch/s390/kvm/Kconfig              |   1 -
 arch/s390/kvm/kvm-s390.c           |   4 +-
 arch/x86/include/asm/kvm-x86-ops.h |   1 +
 arch/x86/include/asm/kvm_host.h    |   5 +-
 arch/x86/kvm/mmu.h                 |   3 +-
 arch/x86/kvm/mmu/mmu.c             |  66 ++-
 arch/x86/kvm/mmu/tdp_mmu.c         |  45 +-
 arch/x86/kvm/vmx/main.c            |   9 +
 arch/x86/kvm/vmx/tdx.c             | 638 ++++++++++++++---------------
 arch/x86/kvm/vmx/tdx.h             |   8 +-
 arch/x86/kvm/vmx/x86_ops.h         |   1 +
 arch/x86/kvm/x86.c                 |  13 +
 include/linux/kvm_host.h           |  14 +-
 virt/kvm/Kconfig                   |   3 -
 virt/kvm/kvm_main.c                |   6 +-
 24 files changed, 422 insertions(+), 421 deletions(-)


base-commit: f222788458c8a7753d43befef2769cd282dc008e
-- 
2.51.0.858.gf9c4a03a3a-goog


