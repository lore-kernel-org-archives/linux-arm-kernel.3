Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99264F53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//FHnIwo7aoEhx9bjdFrjsaq8jBBBfenc6FlUNtMzL0=; b=GpJJ6BVHLFX5lbpS2uvRZYuPbk
	0T5IjzlnhQ1KVsZPf+8JI5cU0KnrsgA7TS2AbFU6KtESHCC9x3O9Cjavub+n0di8aUBBOd3VtWNu5
	Vt8ouxPNkN0miZE/Tz+QawYrgKK4uVYCMibpBeSzNxezdt0JI4smStAPG88Zd/B3xzBLtuI8ZVthg
	Ez7IlAkK34cz6mwakHqsRrBajpsA1PJJNFPzqbB1bzpG6YwUkGkFnxjNJVKnc4Wrk3OpY367qLG5y
	08g3sjGCpFVY+BHnnQrI2/wkcDs3gk4pCKT0KwfOyv+QjG7+aAeZiXoL+AaN1uzqKNwpTByoq7ybN
	NZd3rdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CAH-00000004dMR-0SJm;
	Mon, 16 Mar 2026 17:55:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9p-00000004ctP-4Bz8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=//FHnIwo7aoEhx9bjdFrjsaq8jBBBfenc6FlUNtMzL0=; b=aw0i5YRUhaw9MHjYCNPS+dMZ50
	UxcjaRm5J11iVM6LunmuUfFghonjvLlScZMrj4bPqFgYvWvtme49jSiCq9ZYo4Wpt2mpogLRngh+R
	deix7ezIvFY3VW3nBCK+Nawj3gOqwuTOesrZhGpVFSXOUQbXuDD64D2LdqAx+7mU6Qf435H4a9Xpe
	M4Ocui3fFXKmSOVLa793YOlTefQjImS1mLMCqFDh1uid7/8DgM7am75ufm98tpNpS3r2P3u2ZhP2n
	Yn4+3CjIU1gF7Fgwmw5gl5oG6oQGGUnCZkBh2f8vskVU/l47g4t0TjPSG7G4iXEEW1MToBLs11S9C
	po5EFc4A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9k-00000007OVo-3YUK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB8344568;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFBBC19421;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683704;
	bh=s/z1LspYizz2QyV5nRvyCdxnP9mDQADtxBQ0AiriWLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnnfFyeWzzDT/AgSrrECoaB89rauXol/V4+QQQaidE9zasOdpsY3W4JLrdcL/shg4
	 rGrG9aRdcH2BkF7zQrqMirfWUT06l/6waV4hc0ZwUAfaPC1TJPx1lFxLB4Rsoa2F6o
	 CQiB16IeMqWvVbEy3rx/p1YkBtpy6dDXFekQPdCyF2Ts2k+WB4Ue51lc6oRGVG1dub
	 95XKMDfNST7ThT/yz25TBO6MBIKE9FcrwhdwIJIAUhuv8T0A1Po4IzXMc9Hsrqp56B
	 De8+foWhSZyqf5zDsMP2EeVNfS7Bd1lGtOhysHzmqlq/+1jXhl2yfan0bRrn8W57Gw
	 BXaa7nb+OYVNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9e-00000002XDx-1zQJ;
	Mon, 16 Mar 2026 17:55:02 +0000
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
Subject: [PATCH 14/17] KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
Date: Mon, 16 Mar 2026 17:54:47 +0000
Message-ID: <20260316175451.1866175-15-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260316_175509_287648_C6ECFEB9 
X-CRM114-Status: GOOD (  18.18  )
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

Attributes computed for devices are computed very late in the fault
handling process, meanning they are mutable for that long.

Introduce both 'device' and 'map_non_cacheable' attributes to the
vma_info structure, allowing that information to be set in stone
earlier, in kvm_s2_fault_pin_pfn().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 52 ++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ac4bfcc33aeb1..97cb3585eba03 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1656,9 +1656,11 @@ struct kvm_s2_fault_vma_info {
 	struct page	*page;
 	kvm_pfn_t	pfn;
 	gfn_t		gfn;
+	bool		device;
 	bool		mte_allowed;
 	bool		is_vma_cacheable;
 	bool		map_writable;
+	bool		map_non_cacheable;
 };
 
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
@@ -1728,7 +1730,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 }
 
 struct kvm_s2_fault {
-	bool s2_force_noncacheable;
 	enum kvm_pgtable_prot prot;
 };
 
@@ -1738,7 +1739,6 @@ static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 }
 
 static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
-				     struct kvm_s2_fault *fault,
 				     struct kvm_s2_fault_vma_info *s2vi)
 {
 	struct vm_area_struct *vma;
@@ -1794,12 +1794,11 @@ static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
 }
 
 static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
-				struct kvm_s2_fault *fault,
 				struct kvm_s2_fault_vma_info *s2vi)
 {
 	int ret;
 
-	ret = kvm_s2_fault_get_vma_info(s2fd, fault, s2vi);
+	ret = kvm_s2_fault_get_vma_info(s2fd, s2vi);
 	if (ret)
 		return ret;
 
@@ -1814,16 +1813,6 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 		return -EFAULT;
 	}
 
-	return 1;
-}
-
-static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
-				     struct kvm_s2_fault *fault,
-				     const struct kvm_s2_fault_vma_info *s2vi)
-{
-	struct kvm *kvm = s2fd->vcpu->kvm;
-	bool writable = s2vi->map_writable;
-
 	/*
 	 * Check if this is non-struct page memory PFN, and cannot support
 	 * CMOs. It could potentially be unsafe to access as cacheable.
@@ -1842,8 +1831,10 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 			 * S2FWB and CACHE DIC are mandatory to avoid the need for
 			 * cache maintenance.
 			 */
-			if (!kvm_supports_cacheable_pfnmap())
+			if (!kvm_supports_cacheable_pfnmap()) {
+				kvm_release_faultin_page(s2fd->vcpu->kvm, s2vi->page, true, false);
 				return -EFAULT;
+			}
 		} else {
 			/*
 			 * If the page was identified as device early by looking at
@@ -1855,9 +1846,24 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 			 * In both cases, we don't let transparent_hugepage_adjust()
 			 * change things at the last minute.
 			 */
-			fault->s2_force_noncacheable = true;
+			s2vi->map_non_cacheable = true;
 		}
-	} else if (memslot_is_logging(s2fd->memslot) && !kvm_is_write_fault(s2fd->vcpu)) {
+
+		s2vi->device = true;
+	}
+
+	return 1;
+}
+
+static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
+				     struct kvm_s2_fault *fault,
+				     const struct kvm_s2_fault_vma_info *s2vi)
+{
+	struct kvm *kvm = s2fd->vcpu->kvm;
+	bool writable = s2vi->map_writable;
+
+	if (!s2vi->device && memslot_is_logging(s2fd->memslot) &&
+	    !kvm_is_write_fault(s2fd->vcpu)) {
 		/*
 		 * Only actually map the page as writable if this was a write
 		 * fault.
@@ -1865,7 +1871,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		writable = false;
 	}
 
-	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
+	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
 		return -ENOEXEC;
 
 	/*
@@ -1888,7 +1894,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
-	if (fault->s2_force_noncacheable)
+	if (s2vi->map_non_cacheable)
 		fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
 			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
 	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
@@ -1897,7 +1903,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
 
-	if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
+	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!s2vi->mte_allowed)
 			return -EFAULT;
@@ -1937,7 +1943,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (mapping_size == PAGE_SIZE &&
-	    !(s2vi->max_map_size == PAGE_SIZE || fault->s2_force_noncacheable)) {
+	    !(s2vi->max_map_size == PAGE_SIZE || s2vi->map_non_cacheable)) {
 		if (perm_fault_granule > PAGE_SIZE) {
 			mapping_size = perm_fault_granule;
 		} else {
@@ -1951,7 +1957,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, pfn, mapping_size);
 
 	/*
@@ -2016,7 +2022,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
 	 * get block mapping for device MMIO region.
 	 */
-	ret = kvm_s2_fault_pin_pfn(s2fd, &fault, &s2vi);
+	ret = kvm_s2_fault_pin_pfn(s2fd, &s2vi);
 	if (ret != 1)
 		return ret;
 
-- 
2.47.3


