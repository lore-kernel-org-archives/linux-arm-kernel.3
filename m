Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aSU/sQFS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oPcl1S5q;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BuHTEmqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pypvUQzOZRecF9C5F+7tuIBn1NBmciDOtiV+pevKLGc=; b=aSU/sQFSGXD8XWscZTrP/2++Rp
	5iiyyeTbyEI6/ZZgAdtrX6oVsA1WvvmWFdjP4K4e42wc8kiNBPoSEG23KsMFkNDHwCrjJU310yeKY
	ZnJ1bBhABkPatm1gu6VZO6G0aiwpvwrrknnKWwZ3IwhRSTbZpmeB22PNbKIVMbKdFjiSBq7b3358W
	AMpiW0QWEv7qH7YJF1fDQDiBXWVuVX6GKk4/sKGSmTscjBy2q9MaF7yto71zeDWQa2i83GEHpFKuP
	8FTBP5du56sJlIEjQ4OPEsGQj+FYSxi2KPx7Zzsxu3Ucj+ctbsxL++/OK3S0XcUqnH8xNPeHyC4k0
	Dv1VE1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyx5-00000000P6s-2QXp;
	Mon, 02 Nov 2026 20:48:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyx3-00000000P5K-2248
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 20:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pypvUQzOZRecF9C5F+7tuIBn1NBmciDOtiV+pevKLGc=; b=oPcl1S5qPFnI+mYxDaPbe9dy1R
	5NWP2OJ4spGg7Iv/6pP0ed+tZjS0IxkgD65T1lIvoZJskcYa+n2acVwgQNYhLuyZbspgUq0tmoqmn
	oO3dLfvJE2c43nzXpd8kVVAQSouhYkGtOmwZzewxb+FY5g0dyMa8lvcgwIATm9gl/hUXC1Oa9j32u
	kEt535gX2bC1xx7FeRd6rITPM9siVxybfcTTMXSoj9tdFxY84yvUsZSvgisMRIxohAyf14vbPKNr4
	xW7sRLgC0V1gIwL1XGgkaSVDRcM+A2qmtJWTyfZlCY4RAZASjL0F4NI92djC0zvKixIJsICwJQ1sb
	FWpK5iDQ==;
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywW-000000035V4-2oZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:48:17 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso2994211f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652446; x=1794257246; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pypvUQzOZRecF9C5F+7tuIBn1NBmciDOtiV+pevKLGc=;
        b=BuHTEmqBgfAx7Uk6pmZ1nP4PWNDgGVshEoHp1t26x1Al6prUmHXmmt+r/BFpCoptLG
         meyMrtqajB48S0qZ/g2a/UO2MyjurSTNLonihDQPh0DaGykX/mrEwFhkVvzB/GeDkif2
         vzh+73dmlgT+opImxcOb+2EEWlHHtsMUFaRReiKkBkGnh4s2wXxqyfUmJmjelb/oQptI
         dBn28P5NQaW+3VjH9PfHb47Lpa/zgVFd8Djkzk17GosNCosKuA5wdkgTF366VWX+UMzV
         pjzjtyJlRw5sPe0IcPAWGKFpBLgCru+YyDPPuqxspw3L4sXQHEgzhn+kNAj7IUulnz6z
         sYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652446; x=1794257246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pypvUQzOZRecF9C5F+7tuIBn1NBmciDOtiV+pevKLGc=;
        b=HowuXEIb9cU2Hxw8cit/gZjNs1Y9EyOjOkgMKZuNYEM6x1ckoFNGJSReIVcL6E6I/7
         OBMz8lTu11ghuYXOKo9tRXgnV99xPzuJvDO7qX9qp41SR21OV5zyzL8CjHTnhek4mGyM
         uT+pw40W2dlsuOA8H/ujImJrVAwW9tHLqjU5GGtRL/xlDBC+MZeq0glqYXfNe5rxKCvn
         tsLPSGfzhsq9CEjqkSHVZqJWRV7FJk47VghvXSz2L6vJNDy9DtXMrpxnu5Mempner0Bz
         k2spV7Pd45bOW2igmuWM3NvT38G1uJarBsZLRnJhAZv0N7KLWw5YjxZuOsmDX0+pW0Zp
         Y+tg==
X-Forwarded-Encrypted: i=1; AKwUvBwVtR6UmkGUTBbGIDdx2wlY8fUv4szkADbZUM850F2VKBwCQboQT+j4u73X1yIoSRDxFtFt2sEecnvXEU9tpiyu@lists.infradead.org
X-Gm-Message-State: APuU4Z9l1lIbNDIiw7020obyJPaeZQPSgP7+18SSS5LndEu0BCYk7Pjy
	HUaPSloUWzUWM2lixrWA2fZ+Ma4mauoFHyWqynFR8i0KQGBrkJMjzSF92B1u5A3Gewz0fl6HKBg
	kTw/CQDKltdio8JqIQMXU9w==
X-Received: from wrrs13.prod.google.com ([2002:a5d:424d:0:b0:48c:4508:e80a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41d1:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-48e6e50d8cdmr26999378f8f.54.1793652445911;
 Mon, 02 Nov 2026 12:47:25 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:28 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-24-vdonnefort@google.com>
Subject: [PATCH v3 23/23] KVM: arm64: Stage-2 huge mappings for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204751_877526_49E80806 
X-CRM114-Status: GOOD (  23.73  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable PMD-sized stage-2 block mappings for protected VMs. This is
possible whenever the stage-1 mapping allows it, that is, if it is
itself backed by THPs.

When a THP is found, an entire PMD_SIZE mapping is donated to the guest,
unless it overlaps an existing mapping. The new PMD_SIZE mapping can
only be broken down via the HVC __pkvm_host_split_guest() which the
hypervisor can request with PKVM_HYP_REQ_SPLIT.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c  | 128 +++++++++++++++++++++++++++---------------
 arch/arm64/kvm/pkvm.c |  34 +++++++----
 2 files changed, 104 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..df8ec7c798dd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1489,11 +1489,9 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
 	if (map_size == PAGE_SIZE)
 		return true;
 
-	/* pKVM only supports PMD_SIZE huge-mappings for non-protected VMs */
-	if (is_protected_kvm_enabled()) {
-		if (vcpu_is_protected(s2fd->vcpu) || map_size != PMD_SIZE)
-			return false;
-	}
+	/* pKVM only supports PMD_SIZE huge-mappings */
+	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
+		return false;
 
 	size = memslot->npages * PAGE_SIZE;
 
@@ -1843,42 +1841,23 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 	return ret;
 }
 
-static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int pkvm_pin_user_pages(const struct kvm_s2_fault_desc *s2fd,
+			       struct kvm_s2_fault_vma_info *s2vi)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
-	struct kvm_s2_fault_vma_info s2vi = {};
-	struct kvm_vcpu *vcpu = s2fd->vcpu;
-	struct kvm_pgtable *pgt = s2fd->mmu->pgt;
-	struct mm_struct *mm = current->mm;
-	struct kvm *kvm = vcpu->kvm;
-	void *hyp_memcache;
-	int ret;
+	long ret;
 
-	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(s2fd->mmu, hyp_memcache);
-	if (ret)
-		return -ENOMEM;
-
-	ret = kvm_s2_fault_get_vma_info(s2fd, &s2vi);
+	ret = kvm_s2_fault_get_vma_info(s2fd, s2vi);
 	if (ret)
 		return ret;
 
-	ret = account_locked_vm(mm, 1, true);
-	if (ret)
-		return ret;
-
-	mmap_read_lock(mm);
-	ret = pin_user_pages(s2fd->hva, 1, flags, &s2vi.page);
-	mmap_read_unlock(mm);
-
+	ret = pin_user_pages_unlocked(s2fd->hva, 1, &s2vi->page, flags);
 	if (ret == -EHWPOISON) {
 		kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
-		ret = 0;
-		goto dec_account;
+		return ret;
 	} else if (ret != 1) {
-		ret = -EFAULT;
-		goto dec_account;
-	} else if (!folio_test_swapbacked(page_folio(s2vi.page))) {
+		return -EFAULT;
+	} else if (!folio_test_swapbacked(page_folio(s2vi->page))) {
 		/*
 		 * We really can't deal with page-cache pages returned by GUP
 		 * because (a) we may trigger writeback of a page for which we
@@ -1893,26 +1872,83 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * pages backed by swap in the knowledge that the GUP pin will
 		 * prevent try_to_unmap() from succeeding.
 		 */
-		ret = -EIO;
-		goto unpin;
+		unpin_user_page(s2vi->page);
+		return -EIO;
 	}
 
-	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), PAGE_SIZE,
-				      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
-				      hyp_memcache, 0);
-	write_unlock(&kvm->mmu_lock);
-	if (ret) {
-		if (ret == -EAGAIN)
-			ret = 0;
-		goto unpin;
+	s2vi->pfn = page_to_pfn(s2vi->page);
+
+	ret = transparent_hugepage_adjust(s2fd, &s2vi->pfn, &s2vi->gfn);
+	if (ret < 0) {
+		unpin_user_page(s2vi->page);
+		return ret;
 	}
 
+	s2vi->vma_pagesize = ret;
+
 	return 0;
+}
+
+static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	struct kvm_s2_fault_vma_info s2vi = {};
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+	struct kvm_pgtable *pgt = s2fd->mmu->pgt;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long unaccount;
+	void *hyp_memcache;
+	u64 size;
+	int ret;
+
+	hyp_memcache = get_mmu_memcache(vcpu);
+	ret = topup_mmu_memcache(s2fd->mmu, hyp_memcache);
+	if (ret)
+		return -ENOMEM;
+
+	ret = pkvm_pin_user_pages(s2fd, &s2vi);
+	if (ret == -EHWPOISON || ret == -EAGAIN)
+		return 0;
+	else if (ret)
+		return ret;
+
+	size = s2vi.vma_pagesize;
+
+	ret = account_locked_vm(mm, size / PAGE_SIZE, true);
+	if (ret)
+		goto unpin;
+
+	kvm_fault_lock(kvm);
+	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
+		ret = -EAGAIN;
+	} else {
+		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), size,
+					      __pfn_to_phys(s2vi.pfn), KVM_PGTABLE_PROT_RWX,
+					      hyp_memcache, 0);
+
+		/* undo transparent_hugepage_adjust() and try again */
+		if (ret == -E2BIG) {
+			u64 ipa = ALIGN_DOWN(s2fd->fault_ipa, PAGE_SIZE);
+
+			size = PAGE_SIZE;
+			ret = pkvm_pgtable_stage2_map(pgt, ipa, size,
+						      page_to_phys(s2vi.page),
+						      KVM_PGTABLE_PROT_RWX,
+						      hyp_memcache, 0);
+		}
+	}
+	kvm_fault_unlock(kvm);
+
+	unaccount = (ret ? s2vi.vma_pagesize : s2vi.vma_pagesize - size) / PAGE_SIZE;
+	account_locked_vm(mm, unaccount, false);
+
 unpin:
-	unpin_user_page(s2vi.page);
-dec_account:
-	account_locked_vm(mm, 1, false);
+	if (ret) {
+		unpin_user_page(s2vi.page);
+		if (ret == -EAGAIN)
+			ret = 0;
+	}
+
 	return ret;
 }
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 58ca7ffa68e3..5aea9e9aef17 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -572,9 +572,8 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 			continue;
 
 		page = pfn_to_page(mapping->pfn);
-		WARN_ON_ONCE(mapping->nr_pages != 1);
 		unpin_user_pages_dirty_lock(&page, 1, true);
-		account_locked_vm(kvm->mm, 1, false);
+		account_locked_vm(kvm->mm, mapping->nr_pages, false);
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
@@ -627,9 +626,17 @@ void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
 	WARN_ON_ONCE(!RB_EMPTY_ROOT(&pgt->pkvm_mappings.rb_root));
 }
 
+/*
+ * Return:
+ *  0		- Mapping successfully installed.
+ *  -EAGAIN	- Mapping already exists due to a concurrent vCPU fault race.
+ *  -E2BIG	- Mapping overlaps an existing smaller one.
+ *  -EFAULT	- Mapping overlaps an existing poisoned address.
+ *  < 0		- Other negative error code on invalid arguments or HVC failure.
+ */
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			   u64 phys, enum kvm_pgtable_prot prot,
-			   void *mc, enum kvm_pgtable_walk_flags flags)
+			    u64 phys, enum kvm_pgtable_prot prot,
+			    void *mc, enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	struct pkvm_mapping *mapping = NULL;
@@ -639,20 +646,22 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
-	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr)))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 
 	if (kvm_vm_is_protected(kvm)) {
-		/* Protected VMs are mapped using RWX page-granular mappings */
-		if (WARN_ON_ONCE(size != PAGE_SIZE))
-			return -EINVAL;
-
 		if (WARN_ON_ONCE(prot != KVM_PGTABLE_PROT_RWX))
 			return -EINVAL;
 
+		if (mapping && mapping->nr_pages == 1 && size > PAGE_SIZE)
+			return -E2BIG;
+
 		/*
 		 * We either raced with another vCPU or the guest PTE
 		 * has been poisoned by an erroneous host access.
@@ -662,10 +671,11 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return ret ? -EFAULT : -EAGAIN;
 		}
 
-		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, size / PAGE_SIZE);
+
+		/* Warn if -E2BIG is overloaded */
+		WARN_ON_ONCE(ret == -E2BIG);
 	} else {
-		if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
-			return -EINVAL;
 
 		/*
 		 * We either raced with another vCPU or we're changing between
-- 
2.56.0.385.gac671c819a-goog


