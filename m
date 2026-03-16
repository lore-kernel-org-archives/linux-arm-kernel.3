Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05BF53D85
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1jd1kL814owrQVHcag9Hi5C1pkCVS1IF5x4sRDiojk=; b=Tcwd/ZlJ3VnM1eTM/F9SHLiiSO
	jRYIunVdNp+LM4QahdcSRcJFxGLKgkVuUF4/ZGCGxt8R6OViXQFHmFZt4iyv3w51b60zWAKaSTWmJ
	tNfCALzsorXcJ5wnBcYWwHW/Cs7p6dkfL+C9gMeu4WHZsGCDBunLOhD54/S85BQifUGfjU2ZQBStj
	g5z4dek6G10IDwpgUCbARqoC+OjXOck6p1viITYqzrGQWC3m0HQg66AVVC4W0WocmI8LVcfsqV1td
	lsISC5xg0/bMfnJQPmRV7s35ZTI4tutXPs9mJgOxCUwlJhcfwl2JyMQjVoB/6B2SIDUXTtMOHusUT
	UUsVJORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9p-00000004ctx-18r6;
	Mon, 16 Mar 2026 17:55:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9k-00000004cnv-3ZYg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=u1jd1kL814owrQVHcag9Hi5C1pkCVS1IF5x4sRDiojk=; b=q7qR2B6qqrE1rsGQh04AqoDWOl
	qsPWv0xaXTpEEHm0e8NvJFt1qMbU2ipjetzUzKfqPN8PPdvXv6xriEn2knU9DYeSf6neOIE0OL9a1
	rPmKcu4NWcnEdY5MlY3NFQsLYHKtJiuIN7T3gUtn8dutYfaf3rKnkme5WZQewmjW2G1mC0oxmBmg/
	kXpWe7v/t/Lm5b+m7lXpSKXhxZHcXIc6Qw7lUeqUWMB8tP9la6CfB1rFrrUxid/eUsE+TBzPltnej
	wYBlq6dW+zWgaFAG3uAAHJkwvZP6BhjAgiciYmv6KRvIvVV0wr2aunH9pPq0z4YC/kwP0gEsQAWHs
	5KsiVghg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000007OU6-2QRL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828BB44413;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A894C2BCB2;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683702;
	bh=jB+Gd1Qxp6irh08/3d+mSbcEd/e2O103zpAA1r2Qbqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Esr4XzvupwGd95q8qih39T3lNTnhLmakcLH0p7GVV59MDyWzYkFAYWIcZjf53HDwd
	 nQEgoLGTYIIRkMBRyqfhDqtjLvAyWKWdHCLE36ImpTgPka/mFtki6zSqPtTtLMFTwO
	 1xTh1NuVenP0BIMg9MkKAOCxNWByV0Zwl3ZkU1UdzCikg+WRo9FLoqe4GvIEPP7+VK
	 nqFtrHU0pYXL2bdK0hlQnlFN5xyYcc63t+FihZfsHrHzMIxJjWHGgHkjp2z4fuf6RO
	 OtqlxIS+19Y4czgCFkrCOeVqoF9jRTsxbNAb6J6u7AMnJK/VHYeLAot/zmgFxX4vrJ
	 HRbX0pxkR65Ng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9c-00000002XDx-1ozM;
	Mon, 16 Mar 2026 17:55:00 +0000
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
Subject: [PATCH 05/17] KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
Date: Mon, 16 Mar 2026 17:54:38 +0000
Message-ID: <20260316175451.1866175-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260316_175505_965197_69548050 
X-CRM114-Status: GOOD (  16.43  )
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

The notion of fault_granule is specific to kvm_s2_fault_map(), and
is unused anywhere else.

Move this variable locally, removing it from kvm_s2_fault.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1b32f2e6c3e61..12c2f0aeaae4c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1724,7 +1724,6 @@ struct kvm_s2_fault {
 	bool logging_active;
 	bool force_pte;
 	long vma_pagesize;
-	long fault_granule;
 	enum kvm_pgtable_prot prot;
 	struct page *page;
 	vm_flags_t vm_flags;
@@ -1908,9 +1907,9 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    struct kvm_s2_fault *fault, void *memcache)
 {
-	bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
+	long perm_fault_granule;
 	int ret;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 
@@ -1920,14 +1919,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
 		goto out_unlock;
 
+	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
+			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
+
 	/*
 	 * If we are not forced to use fault->page mapping, check if we are
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (fault->vma_pagesize == PAGE_SIZE &&
 	    !(fault->force_pte || fault->s2_force_noncacheable)) {
-		if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
-			fault->vma_pagesize = fault->fault_granule;
+		if (perm_fault_granule > PAGE_SIZE) {
+			fault->vma_pagesize = perm_fault_granule;
 		} else {
 			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
 									  s2fd->hva, &fault->pfn,
@@ -1940,15 +1942,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
+	 * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
 	 * kvm_pgtable_stage2_map() should be called to change block size.
 	 */
-	if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
+	if (fault->vma_pagesize == perm_fault_granule) {
 		/*
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
@@ -1984,7 +1986,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.fault_granule = perm_fault ? kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0,
 		.write_fault = write_fault,
 		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
 		.topup_memcache = !perm_fault || (logging_active && write_fault),
-- 
2.47.3


