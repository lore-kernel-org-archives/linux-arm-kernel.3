Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCA0C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w4fSGZZKxTAEm7QBmM/ifgE0KdTZsw8zslELXp4R22A=; b=2/QEQn9ZRP3YuQCCnO5sz79RdS
	yvm3LtFMyLgAa23SmchFSLyXIRLJJRBu8CVTcKVJkNqIZZ0A2XZ5RYoyE3fFVfgisjGSk9iN4S8aF
	mu/HAqSToy2OO/+ek66C5u0zeVm/vrsZqVQpgZDJVOdUnmPG/wy4NHtUuHE+BCXmPkTNgUZi9oM//
	0tahKe+oDeNixYbH/k2RTuYNcTp/WNIQXtG7sWQEoGMbr8X33nyaDxBKaX/YUyrzlzaX0BF61BeCN
	nGb5lR+/NcfRaCm9wul/FOiLdexDLPmNJG6x5hIdb9aG2C5QDok59wZJUS65c6Hii7TrRyO9QKpyg
	PJZRYGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhH-0000000GC7U-0Urw;
	Wed, 08 Jul 2026 03:11:39 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhE-0000000GC62-3DkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-8478423e020so416273b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480294; x=1784085094; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4fSGZZKxTAEm7QBmM/ifgE0KdTZsw8zslELXp4R22A=;
        b=NT8OAN1ETXvAzwAttaF8co1P0ZhdSAAA4m/nFnGXhVX0BqeCFs7lkz97FBvGAd355r
         ErtoRebRVEkUE4+tt4LHtab9D08Srtic9y9gFQlJgu0OuYvHGy4D8f9Ii6gd0ULQj8sx
         2TfpOcDdWAWNS46n7LBklAwmTBy0JEmuWH3+OKcS5raIZd06YAwxArOwfujBHGl1Ylip
         itLmmuSiXBmv8m7gAMvzATgpT58v3lEz8D7VNoFprFjgxj2w+65+DLG6N8ENv3cZt8mq
         9GC5ML8Is3pzuiWnAxAnWToUa1KAYyv/KNuweesOOgRTImk8v9kSC4oj1t68MxEB7bsE
         InoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480294; x=1784085094;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4fSGZZKxTAEm7QBmM/ifgE0KdTZsw8zslELXp4R22A=;
        b=qZBwxBZCHTlssz5qqH35bwU9/wKL8X+bNupXW1A3X1WbfR8gdtCZ1AAEnfnP/rcovo
         azFaVF3f0g5ApEB42n1oawnkKgpSZD29v4LMS37REFU0p0pehAHp2cNonsg8tybRB3vL
         q3qtmudfALq/VHULeoRVPU8Ph4VSeANrmPc0wycLpYKT+kolxkQiiobv1GILql5Y+kNq
         Z37wOGXFvU7c3I0XDvtM7ed1ZvUqC5DSRviYbjE6laPyRaysETZ3DMs1/9InVanHdvtm
         mCsy1Ko5WfGXXmZK5mdYg7nH9N+JNqVlHyafdBor0gs9las1fI0/vw+kXNa6NomyaOfx
         kIdg==
X-Forwarded-Encrypted: i=1; AHgh+RpRZhJOhVy8ayWaRFFkxe8Oa5RL4aEoXGV5oIzAit382kaR1OAXkJZqXDEAHrAZ9qMvGRKJHf6N7issrFJSfhn1@lists.infradead.org
X-Gm-Message-State: AOJu0YwYoFbyU+mmN3wfbM+tdBx3i1KkahgE1+TQu5EYSn1L957XF8L0
	Cs/teDhRFBbfnIeAa67OkI2hj/LjE1VAnue05sS6q4RLsxTzaHlkowYkg9/3vHaD/3egO6bvKjd
	SLKRHe0mc90tvlkzXx2GSNQ==
X-Received: from pfbik4.prod.google.com ([2002:a05:6a00:8d04:b0:848:3cf3:73fa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:6f4b:b0:848:4754:28e4 with SMTP id d2e1a72fcca58-84847542d78mr152108b3a.15.1783480293882;
 Tue, 07 Jul 2026 20:11:33 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-1-jthoughton@google.com>
Subject: [PATCH 00/18] Another attempt at HVO support on arm64
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201136_983542_7A943201 
X-CRM114-Status: GOOD (  25.79  )
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

Hi everyone,

This patch series uses a trick with the Access Flag on CPUs that support
hardware update of the AF to update vmemmap page table entries without
introducing a time window where CPUs accessing the vmemmap might fault.

By avoiding faults, the HugeTLB vmemmap optimization (HVO) can be
implemented correctly on arm64 in a much more straightforward way than
previously attempted, most recently here[1] (please see [1] for a
breakdown of the other approaches attempted before).

For large-memory systems that allocate most of their available memory to
HugeTLB, HVO saves a huge amount of memory (1.5% of system memory).

This series has four parts:
  1. Some preparatory changes (patches 1-3)
  1. Bare minimum HVO support (patches 4-10)
  2. Drop BBML2_NOABORT requirement for HVO (patches 11-13)
  3. Drop the user-configurable Kconfig for HVO (patches 14-18)

Parts 3 and 4 are technically optional. More details below.

The main functional caveat with this series is that bootmem HugeTLB
pages are not "pre-HVOed". They will be HVOed, but because at pre-HVO
time SMP CPUs have not been enabled, we cannot query for full system
support.

This series is based on 7.2-rc2 (0e35b9b6ec0f).

This series almost 100% cleanly applies to mm-new, which has some of
Muchun's HVO patches, with one trivial conflict. I imagine this series
will conflict pretty heavily with some of Muchun's other patches[2].

-- The AF trick --

The trick is that translations with the AF unset cannot be cached in the
TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically updated
without needing a full break-before-make sequence.

So the PTE update sequence becomes:
  1. Atomically clear the AF on the existing PTE.
  2. Invalidate the TLB.
  3. cmpxchg the AF=0 PTE with the new PTE. If this fails, goto 1.

If there is a CPU on the system that does not support hardware access
flag updates, clearing the AF is problematic, as those CPUs might fault
on the vmemmap usage. Therefore, HVO compatbility checks all CPUs for HW
AF updates.

-- Application to HVO --

HVO relies on the following page table transitions:
  - When enabling HVO for a page, PMD block entries in the vmemmap are
    shattered into PMD table entries. The first PTE remains mapped
    normally (RW mapping to a real page of struct pages), but the
    remaining PTEs in the vmemmap are mapped read-only to a shared
    page of struct pages (that is, there is an OA change and a
    permissions change).
  - When disabling HVO for a page, the RO PTEs are remapped back to RW
    PTEs that point to newly reallocated pages of struct pages. The
    PMD block -> table transition is not undone.

In patches 4-10 of this series, I use the Access Flag trick to do the PTE
OA and permissions updates. We rely on BBML2_NOABORT for the PMD block
-> table transition.

In patches 11-13, I re-use the Access Flag trick to do the PMD block ->
table transition without needing BBML2_NOABORT. For systems that support
BBML2_NOABORT, the logic is unchanged.

I am aware of Linu's BBML3 patches; I've opted not to rebase onto them
for now, but I am happy to do so later.

-- Late-onlining of CPUs that do not support HW AF --

One of the complications with this series is how to handle late-onlining
of CPUs that do not have HW AF when HVO is in use. Naively, if HVO (HW
AF) is supported on all boot CPUs and the kernel is compiled with HVO
support, late CPUs that do not support HVO will not be onlined. This is
a regression.

This series provides two ways of dealing with this. First, add a
default-off Kconfig for users to enable HVO support, avoiding the
regression. This is not ideal.

Patches 14-18 get rid of the new Kconfig by allowing onlining of
HVO-incompatible late CPUs as long as HVO is not actively in use.

-- Litmus test --

The following Herd litmus test demonstrates the PTE update routine:

  AArch64 TTDFaultlessUpdate
  Variant=vmsa
  TTHM=HA
  {
   uint64_t x=1;
   uint64_t y=2;
   [PTE(x)]=(oa:PA(x), af:1);
   0:X0=PTE(x); 1:X0=PTE(x);
   0:X1=x; 1:X1=x;
   pteval_t 0:X2=(oa:PA(x), af:0);
   pteval_t 0:X3=(oa:PA(y), af:1);
  }
   P0                | P1             ;
   LDR X4,[X0]       | L0:            ;
   MOV X5,X4         | LDR X2,[X1]    ;
   CAS X4,X2,[X0]    |                ;
   DSB ISHST         |                ;
   LSR X9,X1,#12     |                ;
   TLBI VAALE1IS,X9  |                ;
   DSB ISH           |                ;
   ISB               |                ;
   CAS X2,X3,[X0]    |                ;
  exists
    0:X5=0:X4 /\ (* First CAS must succeed *)
    (fault(P1:L0) \/ ~(1:X2=2 \/ 1:X2=1))

  (* This test should not violate BBM requirements. *)

This test must be run with herdtools with Nikos's changes[3] to more
accurately model BBM requirements. When tried, the output will notably
*not* contain the "Warning-BBM-expected" flag.

-- Testing --

I haven't yet done extensive testing of this series. HVO is correctly
freeing pages on my system, and the hugetlb-vmemmap test passes. Freeing
HVOed HugeTLB pages also seems to function normally.

[1] https://lore.kernel.org/linux-arm-kernel/20241107202033.2721681-1-yuzhao@google.com/
[2] https://lore.kernel.org/linux-mm/20260513130542.35604-1-songmuchun@bytedance.com/
[3] https://github.com/herd/herdtools7/pull/1864

James Houghton (18):
  hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
  hugetlb_vmemmap: Move vmemmap_get_tail up
  hugetlb_vmemmap: Leave pages partially HVOed upon restore failure
  hugetlb_vmemmap: Use try_update_vmemmap_pte to update in-use PTEs
  hugetlb_vmemmap: Allow architectures not to allow HVO at runtime
  arm64: Rename cpu_has_hw_af to system_has_hw_af
  arm64: Add system_supports_hvo
  arm64: Implement try_update_vmemmap_pte using the AF trick
  arm64: Prevent HVO if the HVO system feature is not enabled
  arm64: Support hugetlb vmemmap optimization
  hugetlb_vmemmap: Use try_populate_vmemmap_pmd for replacing in-use
    PMDs
  arm64: Implement try_populate_vmemmap_pmd using AF trick
  arm64: Drop BBML2_NOABORT requirement for HVO
  hugetlb_vmemmap: Rename mm/hugetlb_vmemmap.h to
    mm/hugetlb_vmemmap_internal.h
  hugetlb_vmemmap: Add a way to permanently disable HVO when needed
  arm64: Allow "optional" CPU features to be required sometimes
  arm64: Permit onlining of HVO-incompatible late CPUs if HVO is not in
    use
  arm64: Remove user-selectable HVO Kconfig

 MAINTAINERS                                   |   3 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/cpucaps.h              |   2 +
 arch/arm64/include/asm/cpufeature.h           |  39 ++-
 arch/arm64/include/asm/hugetlb.h              |   7 +
 arch/arm64/include/asm/pgalloc.h              |  54 ++++
 arch/arm64/include/asm/pgtable.h              |  57 ++++-
 arch/arm64/kernel/cpufeature.c                |  43 ++++
 arch/arm64/tools/cpucaps                      |   1 +
 arch/loongarch/include/asm/pgalloc.h          |   8 +
 arch/loongarch/include/asm/pgtable.h          |   8 +
 arch/riscv/include/asm/pgalloc.h              |   8 +
 arch/riscv/include/asm/pgtable.h              |   8 +
 arch/x86/include/asm/pgalloc.h                |   8 +
 arch/x86/include/asm/pgtable.h                |   8 +
 include/asm-generic/hugetlb.h                 |   7 +
 include/linux/hugetlb_vmemmap.h               |  20 ++
 include/linux/pgalloc.h                       |  20 ++
 include/linux/pgtable.h                       |  21 ++
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_sysfs.c                            |   2 +-
 mm/hugetlb_vmemmap.c                          | 237 +++++++++++++-----
 ...b_vmemmap.h => hugetlb_vmemmap_internal.h} |   6 +-
 mm/sparse-vmemmap.c                           |   2 +-
 24 files changed, 489 insertions(+), 83 deletions(-)
 create mode 100644 include/linux/hugetlb_vmemmap.h
 rename mm/{hugetlb_vmemmap.h => hugetlb_vmemmap_internal.h} (95%)


base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.55.0.795.g602f6c329a-goog


