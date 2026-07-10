Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D76DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfhA5mObWV9xOlIalj51moctdPsSARKApcsKWsQw+V0=; b=ELhVJgt0RHGkpkCHKZbQjmib4g
	HRaGjbyx4Ffq8u2C+MFD83YbjeIfojHDmMpQn+2NlqVIBtjvlO7jwLDgAUfn3rhh7uSxy4co3dwk/
	sUizzdEWtRxANJ46xXnDjQAHJfV5IEuZx/FdcEKCxojP9b4nI+DzfjzoYCuR1HjFUbFz0djZx8VSh
	Xp2EpbztP3WGKX3KDkNKQ3b3eTKCYRg1CRIAQKbDLlNr8SDy1zs0zls+aIV3QIXu4gD0nQX34vD8R
	swzpIfWXvwPlKO4u/0cazqt7vqXoq7xdh1S6oOii2ijT0Kv3tYDex9lxwjcVxMneQzW5+7lBRgcfd
	7HeXwp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3KU-000000047EU-1h57;
	Fri, 10 Jul 2026 04:59:14 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3KQ-000000047E5-1Y5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 04:59:13 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783659546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfhA5mObWV9xOlIalj51moctdPsSARKApcsKWsQw+V0=;
	b=Kp7H8Dl+ealeNCHL7ogMvFDT+WmY8nDPRfjeyjOSLw3yReBkB/+76TRe1NwDfx/nVePhI2
	oakc1bzUZxywHnBqFyejgKB0A21Oc6aoDdo39Sc8R9pqpBt4fHOT6ZfTGkptPHQatCnNag
	x/jWC1sJnnE/SrVIEgXs/A2LeRlfcPo=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Date: Fri, 10 Jul 2026 12:58:18 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B2B37B5-16DE-4DB0-8A78-4CB8636C1A86@linux.dev>
References: <20260708031129.3503195-1-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_215910_582891_1D30E806 
X-CRM114-Status: GOOD (  44.16  )
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



> On Jul 8, 2026, at 11:11, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Hi everyone,
>=20
> This patch series uses a trick with the Access Flag on CPUs that =
support
> hardware update of the AF to update vmemmap page table entries without
> introducing a time window where CPUs accessing the vmemmap might =
fault.

Hi James,

I was just looking into the Arm ARM specification regarding the TLB =
caching
behavior to better understand the "AF trick" used here, and came across =
a few
sections that got me a bit confused.

Specifically, Section D8.5.1 [1] states Rule RDWZCQ:

	"Descriptors with AF set to zero can never be cached in a TLB. =
For more
	 information about when translation table entries are permitted =
to be
	 cached in a TLB, see Translation Lookaside Buffers."

This indeed seems to support the core assumption of the AF trick. =
However, when
following the reference to Section D8.16 "Translation Lookaside Buffers" =
[2], it
defines the following rule for permitted caching (RSQBCS):

	"When address translation is enabled, a translation table entry =
for an
	 in-context translation regime that does not cause a Translation =
fault,
	 an Address size fault, or an Access flag fault is permitted to =
be cached
	 in a TLB or intermediate TLB caching structure as the result of =
an
	 explicit or speculative access."

This is exactly where my confusion lies, as these two descriptions in =
the spec
feel directly contradictory when FEAT_HAF(hardware management of the =
Access flag)
is enabled.

On one hand, Section D8.5.1 [1] explicitly uses the word "never" for =
AF=3D0
descriptors. On the other hand, under FEAT_HAF, an entry with AF=3D0 =
does not cause
an Access flag fault anymore, because the hardware is capable of =
updating the AF
automatically. This technically makes it eligible for speculative =
caching under
Rule RSQBCS in Section D8.16 [2].

My question is: which part of the spec reflects the actual architectural =
intent
when FEAT_HAF is enabled? Is an entry with AF=3D0 permitted to be =
speculatively
cached in the TLB by the hardware under FEAT_HAF, or does the "never" in =
RDWZCQ
still hold absolute priority?

Please let me know if I have misread the specification or missed some =
overriding
constraints here.

Best regards,
Muchun

References:
[1] =
https://developer.arm.com/documentation/ddi0487/mb/-Part-D-The-AArch64-Sys=
tem-Level-Architecture/-Chapter-D8-The-AArch64-Virtual-Memory-System-Archi=
tecture/-D8-5-Hardware-updates-to-the-translation-tables/-D8-5-1-The-Acces=
s-flag
[2] =
https://developer.arm.com/documentation/ddi0487/mb/-Part-D-The-AArch64-Sys=
tem-Level-Architecture/-Chapter-D8-The-AArch64-Virtual-Memory-System-Archi=
tecture/-D8-16-Translation-Lookaside-Buffers?lang=3Den#mdsec_translation_l=
ookaside_buffers

>=20
> By avoiding faults, the HugeTLB vmemmap optimization (HVO) can be
> implemented correctly on arm64 in a much more straightforward way than
> previously attempted, most recently here[1] (please see [1] for a
> breakdown of the other approaches attempted before).
>=20
> For large-memory systems that allocate most of their available memory =
to
> HugeTLB, HVO saves a huge amount of memory (1.5% of system memory).
>=20
> This series has four parts:
>  1. Some preparatory changes (patches 1-3)
>  1. Bare minimum HVO support (patches 4-10)
>  2. Drop BBML2_NOABORT requirement for HVO (patches 11-13)
>  3. Drop the user-configurable Kconfig for HVO (patches 14-18)
>=20
> Parts 3 and 4 are technically optional. More details below.
>=20
> The main functional caveat with this series is that bootmem HugeTLB
> pages are not "pre-HVOed". They will be HVOed, but because at pre-HVO
> time SMP CPUs have not been enabled, we cannot query for full system
> support.
>=20
> This series is based on 7.2-rc2 (0e35b9b6ec0f).
>=20
> This series almost 100% cleanly applies to mm-new, which has some of
> Muchun's HVO patches, with one trivial conflict. I imagine this series
> will conflict pretty heavily with some of Muchun's other patches[2].
>=20
> -- The AF trick --
>=20
> The trick is that translations with the AF unset cannot be cached in =
the
> TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically =
updated
> without needing a full break-before-make sequence.
>=20
> So the PTE update sequence becomes:
>  1. Atomically clear the AF on the existing PTE.
>  2. Invalidate the TLB.
>  3. cmpxchg the AF=3D0 PTE with the new PTE. If this fails, goto 1.
>=20
> If there is a CPU on the system that does not support hardware access
> flag updates, clearing the AF is problematic, as those CPUs might =
fault
> on the vmemmap usage. Therefore, HVO compatbility checks all CPUs for =
HW
> AF updates.
>=20
> -- Application to HVO --
>=20
> HVO relies on the following page table transitions:
>  - When enabling HVO for a page, PMD block entries in the vmemmap are
>    shattered into PMD table entries. The first PTE remains mapped
>    normally (RW mapping to a real page of struct pages), but the
>    remaining PTEs in the vmemmap are mapped read-only to a shared
>    page of struct pages (that is, there is an OA change and a
>    permissions change).
>  - When disabling HVO for a page, the RO PTEs are remapped back to RW
>    PTEs that point to newly reallocated pages of struct pages. The
>    PMD block -> table transition is not undone.
>=20
> In patches 4-10 of this series, I use the Access Flag trick to do the =
PTE
> OA and permissions updates. We rely on BBML2_NOABORT for the PMD block
> -> table transition.
>=20
> In patches 11-13, I re-use the Access Flag trick to do the PMD block =
->
> table transition without needing BBML2_NOABORT. For systems that =
support
> BBML2_NOABORT, the logic is unchanged.
>=20
> I am aware of Linu's BBML3 patches; I've opted not to rebase onto them
> for now, but I am happy to do so later.
>=20
> -- Late-onlining of CPUs that do not support HW AF --
>=20
> One of the complications with this series is how to handle =
late-onlining
> of CPUs that do not have HW AF when HVO is in use. Naively, if HVO (HW
> AF) is supported on all boot CPUs and the kernel is compiled with HVO
> support, late CPUs that do not support HVO will not be onlined. This =
is
> a regression.
>=20
> This series provides two ways of dealing with this. First, add a
> default-off Kconfig for users to enable HVO support, avoiding the
> regression. This is not ideal.
>=20
> Patches 14-18 get rid of the new Kconfig by allowing onlining of
> HVO-incompatible late CPUs as long as HVO is not actively in use.
>=20
> -- Litmus test --
>=20
> The following Herd litmus test demonstrates the PTE update routine:
>=20
>  AArch64 TTDFaultlessUpdate
>  Variant=3Dvmsa
>  TTHM=3DHA
>  {
>   uint64_t x=3D1;
>   uint64_t y=3D2;
>   [PTE(x)]=3D(oa:PA(x), af:1);
>   0:X0=3DPTE(x); 1:X0=3DPTE(x);
>   0:X1=3Dx; 1:X1=3Dx;
>   pteval_t 0:X2=3D(oa:PA(x), af:0);
>   pteval_t 0:X3=3D(oa:PA(y), af:1);
>  }
>   P0                | P1             ;
>   LDR X4,[X0]       | L0:            ;
>   MOV X5,X4         | LDR X2,[X1]    ;
>   CAS X4,X2,[X0]    |                ;
>   DSB ISHST         |                ;
>   LSR X9,X1,#12     |                ;
>   TLBI VAALE1IS,X9  |                ;
>   DSB ISH           |                ;
>   ISB               |                ;
>   CAS X2,X3,[X0]    |                ;
>  exists
>    0:X5=3D0:X4 /\ (* First CAS must succeed *)
>    (fault(P1:L0) \/ ~(1:X2=3D2 \/ 1:X2=3D1))
>=20
>  (* This test should not violate BBM requirements. *)
>=20
> This test must be run with herdtools with Nikos's changes[3] to more
> accurately model BBM requirements. When tried, the output will notably
> *not* contain the "Warning-BBM-expected" flag.
>=20
> -- Testing --
>=20
> I haven't yet done extensive testing of this series. HVO is correctly
> freeing pages on my system, and the hugetlb-vmemmap test passes. =
Freeing
> HVOed HugeTLB pages also seems to function normally.
>=20
> [1] =
https://lore.kernel.org/linux-arm-kernel/20241107202033.2721681-1-yuzhao@g=
oogle.com/
> [2] =
https://lore.kernel.org/linux-mm/20260513130542.35604-1-songmuchun@bytedan=
ce.com/
> [3] https://github.com/herd/herdtools7/pull/1864
>=20
> James Houghton (18):
>  hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
>  hugetlb_vmemmap: Move vmemmap_get_tail up
>  hugetlb_vmemmap: Leave pages partially HVOed upon restore failure
>  hugetlb_vmemmap: Use try_update_vmemmap_pte to update in-use PTEs
>  hugetlb_vmemmap: Allow architectures not to allow HVO at runtime
>  arm64: Rename cpu_has_hw_af to system_has_hw_af
>  arm64: Add system_supports_hvo
>  arm64: Implement try_update_vmemmap_pte using the AF trick
>  arm64: Prevent HVO if the HVO system feature is not enabled
>  arm64: Support hugetlb vmemmap optimization
>  hugetlb_vmemmap: Use try_populate_vmemmap_pmd for replacing in-use
>    PMDs
>  arm64: Implement try_populate_vmemmap_pmd using AF trick
>  arm64: Drop BBML2_NOABORT requirement for HVO
>  hugetlb_vmemmap: Rename mm/hugetlb_vmemmap.h to
>    mm/hugetlb_vmemmap_internal.h
>  hugetlb_vmemmap: Add a way to permanently disable HVO when needed
>  arm64: Allow "optional" CPU features to be required sometimes
>  arm64: Permit onlining of HVO-incompatible late CPUs if HVO is not in
>    use
>  arm64: Remove user-selectable HVO Kconfig
>=20
> MAINTAINERS                                   |   3 +-
> arch/arm64/Kconfig                            |   1 +
> arch/arm64/include/asm/cpucaps.h              |   2 +
> arch/arm64/include/asm/cpufeature.h           |  39 ++-
> arch/arm64/include/asm/hugetlb.h              |   7 +
> arch/arm64/include/asm/pgalloc.h              |  54 ++++
> arch/arm64/include/asm/pgtable.h              |  57 ++++-
> arch/arm64/kernel/cpufeature.c                |  43 ++++
> arch/arm64/tools/cpucaps                      |   1 +
> arch/loongarch/include/asm/pgalloc.h          |   8 +
> arch/loongarch/include/asm/pgtable.h          |   8 +
> arch/riscv/include/asm/pgalloc.h              |   8 +
> arch/riscv/include/asm/pgtable.h              |   8 +
> arch/x86/include/asm/pgalloc.h                |   8 +
> arch/x86/include/asm/pgtable.h                |   8 +
> include/asm-generic/hugetlb.h                 |   7 +
> include/linux/hugetlb_vmemmap.h               |  20 ++
> include/linux/pgalloc.h                       |  20 ++
> include/linux/pgtable.h                       |  21 ++
> mm/hugetlb.c                                  |   2 +-
> mm/hugetlb_sysfs.c                            |   2 +-
> mm/hugetlb_vmemmap.c                          | 237 +++++++++++++-----
> ...b_vmemmap.h =3D> hugetlb_vmemmap_internal.h} |   6 +-
> mm/sparse-vmemmap.c                           |   2 +-
> 24 files changed, 489 insertions(+), 83 deletions(-)
> create mode 100644 include/linux/hugetlb_vmemmap.h
> rename mm/{hugetlb_vmemmap.h =3D> hugetlb_vmemmap_internal.h} (95%)
>=20
>=20
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> --=20
> 2.55.0.795.g602f6c329a-goog
>=20


