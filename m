Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86719C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4GbBX4m3F40HkG5QMMrGH567MTyfbhtitHqIKhSnmM=; b=qJUsHdLRyoEa/iF+Qwg1HUSUlW
	TnDu/v9sGjRXTDVMDtaItSk6yXeJrAKIB8d9JWlAAd5S6gvRqVB/yXcHK78qKcAnSqykJvg/o9rGY
	PZ8RAtnTDUHImNWmNkmxlhh4cwHitlaT1VCjx+qXHv9jqFYwHJRDZ2o/DQxytW8y5ok2FU1To8bvY
	liVkMcmTx9DcugQW+5THc06YGSxzv096bUaaGYwWTL3ssnjrkjWkigY3Hg8D617KlsAOBqdOlht4M
	Jr8ObtWDWlvh9/3z/EwdJe/4WlJmUzgidNDhW0KVaOVZnZki7xe9ezY6hPdNpaeyfLmTAlW7aqfqK
	ggfGL76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYkf-0000000GNSc-0mvo;
	Thu, 01 May 2025 18:35:17 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYii-0000000GMto-0OXb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 18:33:17 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af5156fbe79so1415036a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 11:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124394; x=1746729194; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V4GbBX4m3F40HkG5QMMrGH567MTyfbhtitHqIKhSnmM=;
        b=qPtf1Bcve1xwBx1zHdiz38ECEGJBAypyzeBTyFR8KSzOfHYXlE5XbruUWmrJHFinsy
         CcljFqKPWIPF2T1JlVjzWVrfvVtpOS9hj9L96bQC1LB1XH+wgiX7rJBhk9Emag7wHdkG
         vHgdJCumjKKX/XmMZPuV2R0V3O2RGApUjhaLfWRGulO7qgKq9jnYv5qo6ua3wW2e4Sv9
         a7kiNsn+AuVOXqQeHPSdjgPoJdS65sDnFJ54UiGlXGItS7oPoNLuqlySiUuavW96zzUe
         wrBa6wBSXreQInGIopOwon33TmfiNOslrjGWsMYhGEkNwkdf+yFImxd2n27imM3fl6CA
         AGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124394; x=1746729194;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4GbBX4m3F40HkG5QMMrGH567MTyfbhtitHqIKhSnmM=;
        b=dpvuWyIf8+OLn1VtcMDECVS4QlqwDnzTJ43grS4i/I2NOSMYSRM8K2JnEhh510qhdv
         8vr+TqVZTCuANvlMXMOveih2TNfZedldvBjTc1ysTEENIw1tsfVwNeXXF+ZRGp4IEQJN
         9R84YqLCUxLnwAL/JQEGwSLmCPXbSN53x5SmZqjdmJIVMLobf8jnT9LcADXBF8n5jGcp
         R1l/0jex/3g8E1y9Aw4+F0QiY7HCOPS8NLLtE1c1MoaYO+Bl+mdTEDPfUEXz6vJ2tAum
         Jp039lGLk49vvf5eqt9Mmj8r6lLKmd5AE9ow9OV4DJbl8FUyc1oEJTFMxGDE7+wSt6RF
         5/QA==
X-Forwarded-Encrypted: i=1; AJvYcCWhKD6X7YrJU0tkMpJ1MkpkH+zqd7REuoo3+2+UBhqNb22+ESL91UG5vktVkZTAS401c1Jn97TCJ4qVl0tzBNt3@lists.infradead.org
X-Gm-Message-State: AOJu0YwNMe/Z36gNG6YwL7e/8QyLTijKdnCdVN01avAk6x8W+Aj863SY
	RJpOBE8bdCLHx15NSKldT3PaKsLx/+KHoe1XQrRoayWCeh3T7iDbfQpMe+zQTDzZZhrrXbKcxSn
	sVIgK3X5YUw==
X-Google-Smtp-Source: AGHT+IGXwYAIoxVS4EV4qeDqzJEpC/WOH4jZUp4diHaNWDhCf+MASol5shMUc/fTmqZrQNaV64K5SlkNqDWjzw==
X-Received: from pgmt15.prod.google.com ([2002:a63:224f:0:b0:af8:cf0d:14cd])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1fc1:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-20cde952c49mr22469637.13.1746124394234;
 Thu, 01 May 2025 11:33:14 -0700 (PDT)
Date: Thu,  1 May 2025 11:32:54 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-1-dmatlack@google.com>
Subject: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113316_125961_221402F0 
X-CRM114-Status: GOOD (  14.11  )
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

This series renames types across all KVM selftests to more align with
types used in the kernel:

  vm_vaddr_t -> gva_t
  vm_paddr_t -> gpa_t

  uint64_t -> u64
  uint32_t -> u32
  uint16_t -> u16
  uint8_t  -> u8

  int64_t -> s64
  int32_t -> s32
  int16_t -> s16
  int8_t  -> s8

The goal of this series is to make the KVM selftests code more concise
(the new type names are shorter) and more similar to the kernel, since
selftests are developed by kernel developers.

I know broad changes like this series can be difficult to merge and also
muddies up the git-blame history, so if there isn't appetite for this we
can drop it. But if there is I would be happy to help with rebasing and
resolving merge conflicts to get it in.

Most of the commits in this series are auto-generated with a single
command (see commit messages), aside from whitespace fixes, so rebasing
onto a different base isn't terrible.

David Matlack (10):
  KVM: selftests: Use gva_t instead of vm_vaddr_t
  KVM: selftests: Use gpa_t instead of vm_paddr_t
  KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
  KVM: selftests: Use u64 instead of uint64_t
  KVM: selftests: Use s64 instead of int64_t
  KVM: selftests: Use u32 instead of uint32_t
  KVM: selftests: Use s32 instead of int32_t
  KVM: selftests: Use u16 instead of uint16_t
  KVM: selftests: Use s16 instead of int16_t
  KVM: selftests: Use u8 instead of uint8_t

 .../selftests/kvm/access_tracking_perf_test.c |  40 +--
 tools/testing/selftests/kvm/arch_timer.c      |   6 +-
 .../selftests/kvm/arm64/aarch32_id_regs.c     |  14 +-
 .../testing/selftests/kvm/arm64/arch_timer.c  |   8 +-
 .../kvm/arm64/arch_timer_edge_cases.c         | 159 +++++----
 .../selftests/kvm/arm64/debug-exceptions.c    |  73 ++--
 .../testing/selftests/kvm/arm64/hypercalls.c  |  24 +-
 .../testing/selftests/kvm/arm64/no-vgic-v3.c  |   6 +-
 .../selftests/kvm/arm64/page_fault_test.c     |  82 ++---
 tools/testing/selftests/kvm/arm64/psci_test.c |  26 +-
 .../testing/selftests/kvm/arm64/set_id_regs.c |  58 ++--
 .../selftests/kvm/arm64/smccc_filter.c        |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_init.c |  56 ++--
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 116 +++----
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  20 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c |  62 ++--
 .../testing/selftests/kvm/coalesced_io_test.c |  38 +--
 .../selftests/kvm/demand_paging_test.c        |  10 +-
 .../selftests/kvm/dirty_log_perf_test.c       |  14 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  82 ++---
 tools/testing/selftests/kvm/get-reg-list.c    |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |   2 +-
 .../testing/selftests/kvm/guest_print_test.c  |  22 +-
 .../selftests/kvm/hardware_disable_test.c     |   6 +-
 .../selftests/kvm/include/arm64/arch_timer.h  |  30 +-
 .../selftests/kvm/include/arm64/delay.h       |   4 +-
 .../testing/selftests/kvm/include/arm64/gic.h |   8 +-
 .../selftests/kvm/include/arm64/gic_v3_its.h  |   8 +-
 .../selftests/kvm/include/arm64/processor.h   |  20 +-
 .../selftests/kvm/include/arm64/ucall.h       |   4 +-
 .../selftests/kvm/include/arm64/vgic.h        |  20 +-
 .../testing/selftests/kvm/include/kvm_util.h  | 311 +++++++++---------
 .../selftests/kvm/include/kvm_util_types.h    |   4 +-
 .../testing/selftests/kvm/include/memstress.h |  30 +-
 .../selftests/kvm/include/riscv/arch_timer.h  |  22 +-
 .../selftests/kvm/include/riscv/processor.h   |   9 +-
 .../selftests/kvm/include/riscv/ucall.h       |   4 +-
 .../kvm/include/s390/diag318_test_handler.h   |   2 +-
 .../selftests/kvm/include/s390/facility.h     |   4 +-
 .../selftests/kvm/include/s390/ucall.h        |   4 +-
 .../testing/selftests/kvm/include/sparsebit.h |   6 +-
 .../testing/selftests/kvm/include/test_util.h |  40 +--
 .../selftests/kvm/include/timer_test.h        |  18 +-
 .../selftests/kvm/include/ucall_common.h      |  22 +-
 .../selftests/kvm/include/userfaultfd_util.h  |   6 +-
 .../testing/selftests/kvm/include/x86/apic.h  |  22 +-
 .../testing/selftests/kvm/include/x86/evmcs.h |  22 +-
 .../selftests/kvm/include/x86/hyperv.h        |  28 +-
 .../selftests/kvm/include/x86/kvm_util_arch.h |  12 +-
 tools/testing/selftests/kvm/include/x86/pmu.h |   6 +-
 .../selftests/kvm/include/x86/processor.h     | 272 ++++++++-------
 tools/testing/selftests/kvm/include/x86/sev.h |  14 +-
 .../selftests/kvm/include/x86/svm_util.h      |  10 +-
 .../testing/selftests/kvm/include/x86/ucall.h |   2 +-
 tools/testing/selftests/kvm/include/x86/vmx.h |  80 ++---
 .../selftests/kvm/kvm_page_table_test.c       |  54 +--
 tools/testing/selftests/kvm/lib/arm64/gic.c   |   6 +-
 .../selftests/kvm/lib/arm64/gic_private.h     |  24 +-
 .../testing/selftests/kvm/lib/arm64/gic_v3.c  |  84 ++---
 .../selftests/kvm/lib/arm64/gic_v3_its.c      |  12 +-
 .../selftests/kvm/lib/arm64/processor.c       | 126 +++----
 tools/testing/selftests/kvm/lib/arm64/ucall.c |  12 +-
 tools/testing/selftests/kvm/lib/arm64/vgic.c  |  38 +--
 tools/testing/selftests/kvm/lib/elf.c         |   8 +-
 tools/testing/selftests/kvm/lib/guest_modes.c |   2 +-
 .../testing/selftests/kvm/lib/guest_sprintf.c |  18 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 222 +++++++------
 tools/testing/selftests/kvm/lib/memstress.c   |  38 +--
 .../selftests/kvm/lib/riscv/processor.c       |  56 ++--
 .../kvm/lib/s390/diag318_test_handler.c       |  12 +-
 .../testing/selftests/kvm/lib/s390/facility.c |   2 +-
 .../selftests/kvm/lib/s390/processor.c        |  42 +--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  18 +-
 tools/testing/selftests/kvm/lib/test_util.c   |  30 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |  30 +-
 .../selftests/kvm/lib/userfaultfd_util.c      |  14 +-
 tools/testing/selftests/kvm/lib/x86/apic.c    |   2 +-
 tools/testing/selftests/kvm/lib/x86/hyperv.c  |  14 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  10 +-
 tools/testing/selftests/kvm/lib/x86/pmu.c     |   4 +-
 .../testing/selftests/kvm/lib/x86/processor.c | 178 +++++-----
 tools/testing/selftests/kvm/lib/x86/sev.c     |  14 +-
 tools/testing/selftests/kvm/lib/x86/svm.c     |  16 +-
 tools/testing/selftests/kvm/lib/x86/ucall.c   |   4 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 108 +++---
 .../kvm/memslot_modification_stress_test.c    |  10 +-
 .../testing/selftests/kvm/memslot_perf_test.c | 164 ++++-----
 tools/testing/selftests/kvm/mmu_stress_test.c |  28 +-
 .../selftests/kvm/pre_fault_memory_test.c     |  12 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  |   8 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   6 +-
 .../selftests/kvm/riscv/get-reg-list.c        |   2 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   8 +-
 tools/testing/selftests/kvm/s390/debug_test.c |   8 +-
 tools/testing/selftests/kvm/s390/memop.c      |  94 +++---
 tools/testing/selftests/kvm/s390/resets.c     |   6 +-
 .../selftests/kvm/s390/shared_zeropage_test.c |   2 +-
 tools/testing/selftests/kvm/s390/tprot.c      |  24 +-
 .../selftests/kvm/s390/ucontrol_test.c        |   2 +-
 .../selftests/kvm/set_memory_region_test.c    |  40 +--
 tools/testing/selftests/kvm/steal_time.c      |  52 +--
 .../kvm/system_counter_offset_test.c          |  12 +-
 tools/testing/selftests/kvm/x86/amx_test.c    |  14 +-
 .../selftests/kvm/x86/apic_bus_clock_test.c   |  24 +-
 tools/testing/selftests/kvm/x86/cpuid_test.c  |   6 +-
 tools/testing/selftests/kvm/x86/debug_regs.c  |   4 +-
 .../kvm/x86/dirty_log_page_splitting_test.c   |  16 +-
 .../selftests/kvm/x86/feature_msrs_test.c     |  12 +-
 .../selftests/kvm/x86/fix_hypercall_test.c    |  20 +-
 .../selftests/kvm/x86/flds_emulation.h        |   6 +-
 .../testing/selftests/kvm/x86/hwcr_msr_test.c |  10 +-
 .../testing/selftests/kvm/x86/hyperv_clock.c  |   6 +-
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  10 +-
 .../kvm/x86/hyperv_extended_hypercalls.c      |  20 +-
 .../selftests/kvm/x86/hyperv_features.c       |  26 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  12 +-
 .../selftests/kvm/x86/hyperv_svm_test.c       |  10 +-
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  36 +-
 .../selftests/kvm/x86/kvm_clock_test.c        |  14 +-
 tools/testing/selftests/kvm/x86/kvm_pv_test.c |  10 +-
 .../selftests/kvm/x86/monitor_mwait_test.c    |   2 +-
 .../selftests/kvm/x86/nested_emulation_test.c |  20 +-
 .../kvm/x86/nested_exceptions_test.c          |   6 +-
 .../selftests/kvm/x86/nx_huge_pages_test.c    |  18 +-
 .../selftests/kvm/x86/platform_info_test.c    |   6 +-
 .../selftests/kvm/x86/pmu_counters_test.c     | 108 +++---
 .../selftests/kvm/x86/pmu_event_filter_test.c | 102 +++---
 .../kvm/x86/private_mem_conversions_test.c    |  78 ++---
 .../kvm/x86/private_mem_kvm_exits_test.c      |  14 +-
 .../selftests/kvm/x86/set_boot_cpu_id.c       |   6 +-
 .../selftests/kvm/x86/set_sregs_test.c        |   6 +-
 .../selftests/kvm/x86/sev_init2_tests.c       |   6 +-
 .../selftests/kvm/x86/sev_smoke_test.c        |  14 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |  10 +-
 tools/testing/selftests/kvm/x86/smm_test.c    |   8 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  14 +-
 .../selftests/kvm/x86/svm_int_ctl_test.c      |   2 +-
 .../kvm/x86/svm_nested_shutdown_test.c        |   2 +-
 .../kvm/x86/svm_nested_soft_inject_test.c     |  10 +-
 .../selftests/kvm/x86/svm_vmcall_test.c       |   2 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   2 +-
 .../kvm/x86/triple_fault_event_test.c         |   4 +-
 .../testing/selftests/kvm/x86/tsc_msrs_test.c |   2 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/ucna_injection_test.c   |  45 +--
 .../selftests/kvm/x86/userspace_io_test.c     |   4 +-
 .../kvm/x86/userspace_msr_exit_test.c         |  58 ++--
 .../selftests/kvm/x86/vmx_apic_access_test.c  |   4 +-
 .../kvm/x86/vmx_close_while_nested_test.c     |   2 +-
 .../selftests/kvm/x86/vmx_dirty_log_test.c    |   4 +-
 .../kvm/x86/vmx_invalid_nested_guest_state.c  |   2 +-
 .../testing/selftests/kvm/x86/vmx_msrs_test.c |  22 +-
 .../kvm/x86/vmx_nested_tsc_scaling_test.c     |  26 +-
 .../selftests/kvm/x86/vmx_pmu_caps_test.c     |  12 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |   2 +-
 .../selftests/kvm/x86/vmx_tsc_adjust_test.c   |  12 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  58 ++--
 .../selftests/kvm/x86/xapic_state_test.c      |  20 +-
 .../selftests/kvm/x86/xcr0_cpuid_test.c       |   8 +-
 .../selftests/kvm/x86/xen_shinfo_test.c       |  22 +-
 .../testing/selftests/kvm/x86/xss_msr_test.c  |   2 +-
 161 files changed, 2323 insertions(+), 2338 deletions(-)


base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
prerequisite-patch-id: 3bae97c9e1093148763235f47a84fa040b512d04
-- 
2.49.0.906.g1f30a19c02-goog


