Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AABF53D84
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqKQnjPhK8VzUQFrfGAHrg44sBJ/ygTrddZ5oT5QEaY=; b=jhdgOeAtlwgVuRQnqTNxJJ3SNj
	IT7mjUvE39VDc/5tq9oZWBfoiM/Ua087GsWlEJJRSqCa6YRUXbriwiiauT09a0shCBVrNE8IW0you
	fZQ/6h8HdTcvc5H/40W95LCyUZYTPRlBQI20npsf+46MeofAn8m546LeMI0W/1vZ91B5FysVj+Cq8
	wjgXvydqmU7UpHmky1vQVA52CYKYKwVL/JxpsQHk2lFccGF7zEJ0oYv+g7seR878hjc3kAJ/tw1hI
	aNlcaMO2tkbbw2I9UuIO3LDiJkHz3gcPZy0gbLAwncd/z7/G1pFRrITKM1ld2pzti4IKMes+WpG6+
	AYh+ifwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CAG-00000004dLY-2xQj;
	Mon, 16 Mar 2026 17:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9o-00000004cps-3ijS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fqKQnjPhK8VzUQFrfGAHrg44sBJ/ygTrddZ5oT5QEaY=; b=D9zgajur+B0rg+rPsGZ3uny7qZ
	AvNLFYFJNRZZPjF5A21fIzgYhhDXs62tFIZ02TqRYy6vLS6j2DI5NVAirCFaNf35CvlT/kZZdnklA
	+jfQEa8HdpefpjU5SnHNWP6flpHJjF3Wf0YS79MMHSHw5vmok3vVDQBZ9ffggPCMyxXvlFrC8HYs2
	QZ279TVxH1bpvj2Avzx9y83z8l95vitDnf61Wt3Jhg5hI/9L1/SyB22Mgz9osDSZs3AwoLTk4Y0oa
	K4pB2sQg97IrsL3xZDLhj9nTj2o1Te9p4pOOqrY5SBl58P/tVMvnCkDAZusg72EitGHyqvU6UoOE3
	gKEODdIQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9k-00000007OVp-3Xpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F62A44584;
	Mon, 16 Mar 2026 17:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D993FC2BCB4;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683704;
	bh=Pvjh0AUsyMGimq0mjyKa4oCBCOcqYdbMF6v3IKCf7Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSKaPU4UToJvenGSVEOhbttA4wQXA3yOEltwiZUV51COGf+Aqkc6Euk/rXEn6Hs17
	 5M4H3LW4fj3ZfL/NR+vU7FNIvygo6tf9xr96jX2N+TP+s86PTIwcOa2TN1wG73v81S
	 xXzQSzV03NggPe5Fg9yPUNNhVThBrwN/QQcxykW1eiyFhzMe3tu9iq0IV9KVD08Ari
	 afTul/H+0VAsCuHVhMzeyZrjqYtleDXfo+L+JRgq77ZoLWtX063izhPXgIIu0H94kU
	 aaG5kajaLxAN+/VtMylQomsLaNbe10ax0V3Ju55K+xkUOPhPAdxId4RK+tJdGvbovM
	 SuKi9UYmaUMEg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9f-00000002XDx-0kJo;
	Mon, 16 Mar 2026 17:55:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 17/17] KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
Date: Mon, 16 Mar 2026 17:54:50 +0000
Message-ID: <20260316175451.1866175-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175509_252949_1A80F670 
X-CRM114-Status: GOOD (  13.10  )
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

Having fully converted user_mem_abort() to kvm_s2_fault_desc and
co, convert gmem_abort() to it as well. The change is obviously
much simpler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 57 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 18cf7e6ba786d..e14b8b7287192 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1567,33 +1567,39 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
 	return prot;
 }
 
-static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-		      struct kvm_s2_trans *nested,
-		      struct kvm_memory_slot *memslot, bool is_perm)
+struct kvm_s2_fault_desc {
+	struct kvm_vcpu		*vcpu;
+	phys_addr_t		fault_ipa;
+	struct kvm_s2_trans	*nested;
+	struct kvm_memory_slot	*memslot;
+	unsigned long		hva;
+};
+
+static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
-	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
 	unsigned long mmu_seq;
 	struct page *page;
-	struct kvm *kvm = vcpu->kvm;
+	struct kvm *kvm = s2fd->vcpu->kvm;
 	void *memcache;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
 	int ret;
 
-	ret = prepare_mmu_memcache(vcpu, true, &memcache);
+	ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
 	if (ret)
 		return ret;
 
-	if (nested)
-		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
+	if (s2fd->nested)
+		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
 	else
-		gfn = fault_ipa >> PAGE_SHIFT;
+		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
 
-	write_fault = kvm_is_write_fault(vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+	write_fault = kvm_is_write_fault(s2fd->vcpu);
+	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
 
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
@@ -1601,24 +1607,24 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
 	smp_rmb();
 
-	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
 	if (ret) {
-		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
+		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
 					      write_fault, exec_fault, false);
 		return ret;
 	}
 
-	if (!(memslot->flags & KVM_MEM_READONLY))
+	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
 		prot |= KVM_PGTABLE_PROT_W;
 
-	if (nested)
-		prot = adjust_nested_fault_perms(nested, prot);
+	if (s2fd->nested)
+		prot = adjust_nested_fault_perms(s2fd->nested, prot);
 
 	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		prot |= KVM_PGTABLE_PROT_X;
 
-	if (nested)
-		prot = adjust_nested_exec_perms(kvm, nested, prot);
+	if (s2fd->nested)
+		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 
 	kvm_fault_lock(kvm);
 	if (mmu_invalidate_retry(kvm, mmu_seq)) {
@@ -1626,7 +1632,7 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		goto out_unlock;
 	}
 
-	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
+	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
 						 __pfn_to_phys(pfn), prot,
 						 memcache, flags);
 
@@ -1635,19 +1641,11 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_fault_unlock(kvm);
 
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
 
 	return ret != -EAGAIN ? ret : 0;
 }
 
-struct kvm_s2_fault_desc {
-	struct kvm_vcpu		*vcpu;
-	phys_addr_t		fault_ipa;
-	struct kvm_s2_trans	*nested;
-	struct kvm_memory_slot	*memslot;
-	unsigned long		hva;
-};
-
 struct kvm_s2_fault_vma_info {
 	unsigned long	mmu_seq;
 	long		vma_pagesize;
@@ -2296,8 +2294,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	};
 
 	if (kvm_slot_has_gmem(memslot))
-		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
-				 esr_fsc_is_permission_fault(esr));
+		ret = gmem_abort(&s2fd);
 	else
 		ret = user_mem_abort(&s2fd);
 
-- 
2.47.3


