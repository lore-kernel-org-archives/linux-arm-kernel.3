Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B249606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TLIBmZO4;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eDD7tuIc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zMsJQgVrf0JZ++d3iFatLVEh5rUSU8qY+49KgPh446g=; b=TLIBmZO4wo4NbZblR0gvaQzmv9
	ntNjWdSkuKFmvBm0+hDpEXpqFYhXd19VocEWKoIQU9mseffVuV5JBXDe/NW3faX9jsRu90UHOxmft
	oknF3HH3PbjzKr86RbVjZLi0C8l7eGcd/osh/VzZT6xFGRyf7+ULkrOFxVOOIJ5RgRH8ykpKSyfI2
	yFrc8hwZS8lSgKdEnHk4mRI1npQlo6ljVN3IBjowywzfypxXEYMvt0P93e4ruxdMLRWhtRKsYMw7A
	hWrSulKg2EzGfs6HtWiOcQn6LnM+j/WnQmeQNU7pyz4MgJSo/Ty+mFOjg2grAYZ9SBmKb715b/YFP
	E4IlH3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvq-00000000NXr-19uF;
	Mon, 02 Nov 2026 20:47:06 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvn-00000000NWA-1eW4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:04 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso30942275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652421; x=1794257221; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMsJQgVrf0JZ++d3iFatLVEh5rUSU8qY+49KgPh446g=;
        b=eDD7tuIcFXzlBdX5KPig4bxn1kk4ZqG9uGauEb8CjShiOrxWMeGfXxiwY0XA4MTNuu
         bAk1PjU3e3LxCnVcDT+mgLC9/Wo0EoGiZfhTn/1QQ22Y5BzNyGUh/CloHR+JvOkruXcb
         ShLChQxg2ktUWageLISHWkuEWMMaRteDGodcDOngAe2pqPcRs6qLjUB76f40zKuXjrBp
         I9vHwQvKdtpSv1yNqni1fJpqEaVKUYwSvqvz3EViZs3R6eg33ciXpp7/7DgtTHTLVZx7
         nfcSTB+tMj7+2IP+0q2Huywhdt92hJgvGukYz8Fh/HuPl91r7DR+PXzNFw3s7lM93K+8
         1cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652421; x=1794257221;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMsJQgVrf0JZ++d3iFatLVEh5rUSU8qY+49KgPh446g=;
        b=isEdPYMcbh4jwJt0F/rxy9Nwk4X03KAlAomxXVIb6A8DDLLsFyu7TSt7/YLXj6/alH
         TJgSrGFAobu8oDuUkuEg+XriHPnSRexTG+VE9SFq/CZ0e1Qpwb7JXsIMiOwO0l6h80xm
         GYOUxO37gB9hVDwLGg7mfxw5DUVKS39vcnsiVNpjo17ToF/st9s+Z22D4l7UHNT0FIZp
         pOALMOnOy2xRbNC5YWCd1QzX/btv74m3pmwQOt7ggIiscNHjX2RLxa9PBjJk1BgoyFro
         qzKdwTPkWWwcMqORvguN1CAW/UCXNc7zr0NjVoC8QA7iMEbyh+tIxIbJ+6/vSO4hJpmr
         9zlw==
X-Forwarded-Encrypted: i=1; AKwUvByLEZpvT1GQp2E/DXQWe1EC9cV6N1PtVIBXJaeAko7sGVqsUh2RtJATVpv2/0RuhIt1Z6NzypLxZ3s2PNI9fWkN@lists.infradead.org
X-Gm-Message-State: AFq9FYLPSTnyXAEfD/N0XSzXjLlQAjMcSN23daGraAXN+1dmmtMjEzHG
	/ITnZBmsIiumIUdBLIbAlpHDQaY9BSJwmJCSFS1uzvKpGGyn2kObBLCtvxXWhUnCm8yYc9P1ejf
	0bGUkYur6rEBnh6Q6uYk2Rg==
X-Received: from wmos18.prod.google.com ([2002:a05:600c:45d2:b0:4b0:ea12:73b5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ac1709aa77mr243577525e9.16.1793652420742;
 Mon, 02 Nov 2026 12:47:00 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:05 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-1-vdonnefort@google.com>
Subject: [PATCH v3 00/23] Huge mapping support for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124703_462407_CE2AB61A 
X-CRM114-Status: GOOD (  16.01  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, pKVM handles stage-2 mappings and ownership tracking strictly
at the PAGE_SIZE level. This series extends pKVM to support PMD_SIZE
block mappings, thereby enabling Transparent Huge Pages (THP) for
protected guests. hugetlbfs is currently unsupported as it does not
appear as swapbacked.

Summary of changes:

1. Enable host stage-2 block-level annotations:

The host stage-2 being annotated with the GFN of the guest on the
host->guest donation transitions, we allow block-level annotations to
ensure the host stage-2 mapping size matches the guest stage-2.

2. Expand ownership transition HVCs:

Enable the ownership test to work with PMD_SIZE so we can test
transitions supporting more than PAGE_SIZE.

3. Implements the PKVM_HYP_REQ_SPLIT hypervisor request:

Allows the hypervisor to ask the host to split a mapping. This ensures
the guest s2, pkvm_mapping tree and host s2 are always using the same
mapping size.

4. Wires up THP support for protected VMs:

Use a PMD_SIZE mapping for protected VMs whenever
transparent_hugepage_adjust() acknowledge the presence of a huge-mapping
in the VMM stage-1.

Changelog:

v3:
  - Move get_page() in stage2_map_prefault_idmap() from PATCH2 to PATCH1 (Wei-Lin, Mostafa)
  - Set map_data.phys in kvm_pgtable_stage2_annotate() (Sashiko)
  - Propagate -EHWPOISON and -EAGAIN from pkvm_pin_user_pages() to protected_pkvm_mem_abort() (Sashiko)
  - Fall back to PAGE_SIZE when a PMD_SIZE mapping overlaps an existing PAGE_SIZE one (Fuad)
  - Reject !nr_pages in pfn_range_is_valid()
  - Use mmu_invalidate_retry()
  - Rebase on 7.4-rc1

v2 (https://lore.kernel.org/all/20260911135053.146435-1-vdonnefort@google.com/):
  - Reorder patches to make the series bisectable.
  - Check memcache and WARN_ON if stage-2 split fails in __pkvm_host_split_guest()
  - __pkvm_pgtable_stage2_split(): return 0 if the block is already split.
  - kvm_pgtable_stage2_table_install() to let mem_protect handle the stage-2 splitting.
  - Refactor fix_host_ownership() (Wei-Lin)
  - Handle non-linear mappings in fix_host_ownership()
  - Drop _page_ from __pkvm_host_reclaim_page_guest and __pkvm_reclaim_dying_guest_page() (Wei-Lin)
  - Make a separate patch for hyp_poison_range() (Wei-Lin)
  - Use folio_add_pins in __pkvm_pgtable_stage2_split() (Wei-Lin)
  - Hold the mmap_read_lock() for transparent_hugepage_adjust() (Sashiko)
  - Catch 2MiB fault on existing 4KiB fault (Sashiko)
  - Add share/unshare testing of split blocks.
  - Rebased on 7.3-rc2

v1 (https://lore.kernel.org/all/20260803100904.3563942-1-vdonnefort@google.com/)

Keir Fraser (1):
  KVM: arm64: Prefault host stage-2 entries on block split

Vincent Donnefort (22):
  KVM: arm64: Propagate host stage-2 annotated entries on block split
  KVM: arm64: Allow block-level stage-2 annotation
  KVM: arm64: Use block-level annotations when setting up the host
    stage-2
  KVM: arm64: Make pKVM ownership selftest an HVC
  KVM: arm64: Reject zero-sized ranges in pfn_range_is_valid()
  KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
  KVM: arm64: Add a range to __pkvm_host_donate_guest()
  KVM: arm64: Add a range to hyp_poison_page()
  KVM: arm64: Add a range to __pkvm_host_reclaim_guest()
  KVM: arm64: Add a range to __pkvm_guest_share_host()
  KVM: arm64: Add a range to __pkvm_guest_unshare_host()
  KVM: arm64: Handle huge mappings in
    __pkvm_host_force_reclaim_page_guest()
  KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
  KVM: arm64: Add a range to pKVM ownership selftest
  KVM: arm64: Warn on pKVM guest stage-2 block collapse
  KVM: arm64: Add vcpu conduit for pkvm_hyp_req
  KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
  KVM: arm64: Add __pkvm_host_split_guest HVC
  KVM: arm64: Extend pKVM page ownership selftests to cover guest block
    split
  KVM: arm64: Add PKVM_HYP_REQ_SPLIT
  KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
  KVM: arm64: Stage-2 huge mappings for protected VMs

 arch/arm64/include/asm/kvm_asm.h              |  14 +-
 arch/arm64/include/asm/kvm_hcall.h            |  10 +-
 arch/arm64/include/asm/kvm_host.h             |  31 +
 arch/arm64/include/asm/kvm_pgtable.h          |  12 +
 arch/arm64/include/asm/kvm_pkvm.h             |  35 +-
 arch/arm64/kvm/handle_exit.c                  |   3 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  25 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |   5 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   6 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |  12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  43 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 591 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  59 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 165 +++--
 arch/arm64/kvm/hyp/pgtable.c                  | 139 +++-
 arch/arm64/kvm/mmu.c                          | 128 ++--
 arch/arm64/kvm/pkvm.c                         | 247 +++++++-
 arch/arm64/kvm/trace_pkvm.h                   |   4 +-
 18 files changed, 1126 insertions(+), 403 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.385.gac671c819a-goog


