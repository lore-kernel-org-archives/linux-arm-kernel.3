Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C673F53D86
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGnmoosyJCIKxyo4OmFTM/I2TwP92DK94pojeh5aYkI=; b=P87mgAzae9iay+5/vEH/xim35/
	BkiDgm9fs/lFxmuRuGNCK84xBO6VZFriODDpV0TeZuJGD7WHmD/HKa2SANarNIEeLdB5vi2dHaEBP
	CX+RJtFTWjpyo/+bEIWAfB9FRa653En0cNvWz4vMiMVPBvIvNdYqw0dVfYkbNq32RedDf0ZbFx31L
	FyV+TIxWJ+XaGQXS/rkZ5mpkkX3hKDyZqjrpi4FkfMdBzNQern0BSrsdTEQ1XAsbA4uPcPhZgvsb3
	VF45Wr3nQp/654Hj3OTUYCi4iLt5oguU4vlAakpQxHIsMcW5BHfQ8oR/GZaSWYXLO/G5F0KZl5Qxs
	kymlyc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CAH-00000004dMz-1xdn;
	Mon, 16 Mar 2026 17:55:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9q-00000004ctY-0mPT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kGnmoosyJCIKxyo4OmFTM/I2TwP92DK94pojeh5aYkI=; b=dehoPCbDSLnm/s4PWqlFMWIlzY
	F7P0DUCg09Z8jE5PFoUkA0nd4Lw1I6e0LYHS50MxUpmGeZVoUg5Y0YTuWbf26xAUrcB4iRtuQRcMU
	B6Hm0dAEQ4zPGVHc0Yy/x7ZaBXPiu1FYUlC66wadGxeQtWfBMSLA6/1NpXKzlcx7oggwkR7NFcMwI
	Xgdlh7QL8Pf5iRard7oKntu7F6+JOdXSW5NG4jin93yitXoquwJvOpRvFhdJinsvcXZuLy+vDIRHr
	fqBIAfVpUP2/v5E7fjvZ6ZFWt9W1allJf8nWM5zd0vTuGSan9xVsVX4Wrrjjk2kWpaXmDi+K5UgVO
	cOcFlQMg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9k-00000007OVn-3YMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDBD844578;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD7EC2BCB5;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683704;
	bh=dFbpfv1p35YcB4zPuAbay7B6ANDvgyG8ziGP1KFMJIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J1JLSPb6AJQ7aOBPLY5+KShzFS52pCEBYMOsK/waYHBXmFbnmVHmVdisjKXCEOGzm
	 aw9BWiPB0tr9fKAewYLcnal+v7bzjNHrwMQdhjOyH+J3u2VXww7DmiuHaWy/xGIpYo
	 sbtlWQRTUXPSeBNwi29La6j/iT5rHn5/6X/FRP3GVBvyvPi8F9uhxQJ2ozXv0QnH6y
	 5Jr03/AdXViILVWidL5D2J9Ix0pi3ts6HI2BV/F6eIvDTAKhPO+ndQYl3JOHR51ipL
	 xgd7Vjfgaze2Lca2/oDq6+1tw/TC0I2dX4MdFZvJkGCs5Z8BjoJKTMGzRI89MXWPjP
	 kksESnfRYJKAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9e-00000002XDx-3tUl;
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
Subject: [PATCH 16/17] KVM: arm64: Simplify integration of adjust_nested_*_perms()
Date: Mon, 16 Mar 2026 17:54:49 +0000
Message-ID: <20260316175451.1866175-17-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260316_175509_277956_37760933 
X-CRM114-Status: GOOD (  16.66  )
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

Instead of passing pointers to adjust_nested_*_perms(), allow
them to return a new set of permissions.

With some careful moving around so that the canonical permissions
are computed before the nested ones are applied, we end-up with
a bit less code, and something a bit more readable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 62 +++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9b5df70807875..18cf7e6ba786d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1544,32 +1544,34 @@ static int prepare_mmu_memcache(struct kvm_vcpu *vcpu, bool topup_memcache,
  * TLB invalidation from the guest and used to limit the invalidation scope if a
  * TTL hint or a range isn't provided.
  */
-static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
-				      enum kvm_pgtable_prot *prot,
-				      bool *writable)
+static enum kvm_pgtable_prot adjust_nested_fault_perms(struct kvm_s2_trans *nested,
+						       enum kvm_pgtable_prot prot)
 {
-	*writable &= kvm_s2_trans_writable(nested);
+	if (!kvm_s2_trans_writable(nested))
+		prot &= ~KVM_PGTABLE_PROT_W;
 	if (!kvm_s2_trans_readable(nested))
-		*prot &= ~KVM_PGTABLE_PROT_R;
+		prot &= ~KVM_PGTABLE_PROT_R;
 
-	*prot |= kvm_encode_nested_level(nested);
+	return prot | kvm_encode_nested_level(nested);
 }
 
-static void adjust_nested_exec_perms(struct kvm *kvm,
-				     struct kvm_s2_trans *nested,
-				     enum kvm_pgtable_prot *prot)
+static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
+						      struct kvm_s2_trans *nested,
+						      enum kvm_pgtable_prot prot)
 {
 	if (!kvm_s2_trans_exec_el0(kvm, nested))
-		*prot &= ~KVM_PGTABLE_PROT_UX;
+		prot &= ~KVM_PGTABLE_PROT_UX;
 	if (!kvm_s2_trans_exec_el1(kvm, nested))
-		*prot &= ~KVM_PGTABLE_PROT_PX;
+		prot &= ~KVM_PGTABLE_PROT_PX;
+
+	return prot;
 }
 
 static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		      struct kvm_s2_trans *nested,
 		      struct kvm_memory_slot *memslot, bool is_perm)
 {
-	bool write_fault, exec_fault, writable;
+	bool write_fault, exec_fault;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
@@ -1606,19 +1608,17 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return ret;
 	}
 
-	writable = !(memslot->flags & KVM_MEM_READONLY);
+	if (!(memslot->flags & KVM_MEM_READONLY))
+		prot |= KVM_PGTABLE_PROT_W;
 
 	if (nested)
-		adjust_nested_fault_perms(nested, &prot, &writable);
-
-	if (writable)
-		prot |= KVM_PGTABLE_PROT_W;
+		prot = adjust_nested_fault_perms(nested, prot);
 
 	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		prot |= KVM_PGTABLE_PROT_X;
 
 	if (nested)
-		adjust_nested_exec_perms(kvm, nested, &prot);
+		prot = adjust_nested_exec_perms(kvm, nested, prot);
 
 	kvm_fault_lock(kvm);
 	if (mmu_invalidate_retry(kvm, mmu_seq)) {
@@ -1631,10 +1631,10 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 						 memcache, flags);
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, !!ret, writable);
+	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
 	kvm_fault_unlock(kvm);
 
-	if (writable && !ret)
+	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
 	return ret != -EAGAIN ? ret : 0;
@@ -1856,16 +1856,6 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 				     enum kvm_pgtable_prot *prot)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
-	bool writable = s2vi->map_writable;
-
-	if (!s2vi->device && memslot_is_logging(s2fd->memslot) &&
-	    !kvm_is_write_fault(s2fd->vcpu)) {
-		/*
-		 * Only actually map the page as writable if this was a write
-		 * fault.
-		 */
-		writable = false;
-	}
 
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
 		return -ENOEXEC;
@@ -1883,12 +1873,14 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 
 	*prot = KVM_PGTABLE_PROT_R;
 
-	if (s2fd->nested)
-		adjust_nested_fault_perms(s2fd->nested, prot, &writable);
-
-	if (writable)
+	if (s2vi->map_writable && (s2vi->device ||
+				   !memslot_is_logging(s2fd->memslot) ||
+				   kvm_is_write_fault(s2fd->vcpu)))
 		*prot |= KVM_PGTABLE_PROT_W;
 
+	if (s2fd->nested)
+		*prot = adjust_nested_fault_perms(s2fd->nested, *prot);
+
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
 		*prot |= KVM_PGTABLE_PROT_X;
 
@@ -1899,7 +1891,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		*prot |= KVM_PGTABLE_PROT_X;
 
 	if (s2fd->nested)
-		adjust_nested_exec_perms(kvm, s2fd->nested, prot);
+		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
 
 	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
-- 
2.47.3


