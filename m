Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDVepe6L;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vt/A3x+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kVp/0GTX/TyDJlLVG6qMhJVaGtnr4QyC8tDer4ir+Gc=; b=RDVepe6LCk2Z4BAsqcg5aPopo+
	zHQ8y3A9HouylwYBIGgaw5kJlD1bbBy+lTAtOKfYIikGI6o0l8x6VWQj414BoeJakim1dv3YerHOl
	TyDUawjanBd3oKBRXRgxuOufEQG7mqB2kte/OCL3mWYs/IUanDHOcyl69prNAFjIYW2dz26KT6HOf
	nyalmFNzXHBkBcKtHum3L+7R54mTwRULKvdqvQF9azEumoEdIulfXbhi/KtMNIjvUayNqc2oB1VBD
	UiaYTqwENJ9TfFoHR89fP20od7YarXvO3rdQ5Ow6TnS8nY4mhHjkyUZPuXgK6hmCGs0ygSxBB8kU6
	YNcNNcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywK-00000000OCU-0OFt;
	Mon, 02 Nov 2026 20:47:36 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywD-00000000Nve-1Kvw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:33 +0000
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso30105425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652444; x=1794257244; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVp/0GTX/TyDJlLVG6qMhJVaGtnr4QyC8tDer4ir+Gc=;
        b=Vt/A3x+a+cDPnzYHfBiumABAkBc4IdI7tphBT99Fphcgs2+H9HwJBDPVsK1l0qxbb8
         JuPgtTDDyzv/l7tHmMLUYhzZxwdPPBsOt+40ytm37j7emhJNOGGeBFL4059Jezdy7wkr
         1hT0zRxxcaOL4O7b15GktubxfQb5y10Q3mjAzQqGG1hBqQ46YAFySYwui7Wyd5Yb1yS8
         1Bm2k8jd6IbvPIUkFGjdErpdNJ7SypdtcwowUl0ojFFRi0k3w5O0JL11GEM8+gVQgMYQ
         Rylhe5X/c/aFqnDPuCtdVy92B1+KqM3ixGHIBwH1LXSg52z0XYUAOnpRvEWhG5WUgoGf
         KvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652444; x=1794257244;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVp/0GTX/TyDJlLVG6qMhJVaGtnr4QyC8tDer4ir+Gc=;
        b=O9XvhoR26CfTlfuv5v7FkS3yy3JD6FYXoYhTc+HRiux6BgJ+K5NiFvuk1FlVp+EMxy
         ylFJQJBWPBmIwphEwepqq6ICHfdlVvkhdcZYt7ngPMvslx0hHMs6egayiGGvWF4zgx4O
         2XTYQBoytd5B23LgilXJ6hrgf5UAVUUZAjJ14ZcQo3FEu/yJDDcxEODn3v2ieTPAv7s1
         qUkt0Knb6bQ+sGnDqEDtK6mmPGeeryfwKRQYKtBSlrlPZsftr2OB0Ds54+gwDlBurQiX
         /sehXHI3Xmgv+EZhw6yqFeY4hs2lWDYPgDTTw9qA5c3i1ut5wlNgdJwKY9SrH8Jycvrz
         aIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGUZgasTIrL23YG8GMwr0KOajNgENclB9MCLPNGYmLTV8QCNAfxb6ME1drxKl7s4XvTzox4Qoc80IdPmalts3N@lists.infradead.org
X-Gm-Message-State: AFq9FYJKnP7pMI6tPhM6eXqUohLWjMtGMR9LsBSGA/SO6V97Me3Cqcw3
	wvXZNupg6moIZp7WBVChra1LE8Ahoge6sqBd9BAWFp8ALKMnsX/2k3heXND5E/P5CUzvGLZE79A
	RoVe8QcvtTNgObX3Pe0I3NQ==
X-Received: from wrwc14.prod.google.com ([2002:a5d:63ce:0:b0:48b:273:b184])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e50:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4ac16bc461emr257883815e9.7.1793652443932;
 Mon, 02 Nov 2026 12:47:23 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:26 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-22-vdonnefort@google.com>
Subject: [PATCH v3 21/23] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124730_856842_22FFB61D 
X-CRM114-Status: GOOD (  24.67  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With the upcoming support for stage-2 huge mappings for protected VMs,
we need a way to split blocks. Since the host has its own "copy" of the
guest stage-2 in the pkvm_mappings rb-tree, the split must be done
simultaneously for both that tree and the guest stage-2. Therefore the
hypervisor can't do it on its own and must rely on the host for this
operation.

Create a pKVM hypervisor request to ask the host to split a specified
region of the guest. On this request, the host can synchronise the split
of both guest stage-2 (HVC __pkvm_host_split_guest) and the
pkvm_mappings tree. It ensures a concurrent VM teardown can't observe a
PMD_SIZE pkvm_mapping while the guest stage-2 is PAGE_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_host.h |   5 +
 arch/arm64/include/asm/kvm_pkvm.h |   5 +-
 arch/arm64/kvm/pkvm.c             | 148 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/trace_pkvm.h       |   4 +-
 4 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0161bcb8123b..c68693509c1e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -142,6 +142,7 @@ enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
 	PKVM_HYP_REQ_HYP_ALLOC,
 	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
+	PKVM_HYP_REQ_SPLIT,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -154,6 +155,10 @@ struct pkvm_hyp_req {
 		struct {
 			u32	nr_pages;
 		} mem;
+		struct {
+			u32	nr_pages;
+			u64	gfn;
+		} split;
 		struct {
 			/* Helper for SMCCC encoding/decoding */
 			u8	args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 3e51337f2d9e..5676eed1c71e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -222,7 +222,10 @@ static inline size_t pkvm_host_sve_state_size(void)
 }
 
 struct pkvm_mapping {
-	struct rb_node node;
+	union {
+		struct rb_node node;
+		struct list_head list;
+	};
 	u64 gfn;
 	u64 pfn;
 	struct {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index c55b6d442d0e..58ca7ffa68e3 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -488,6 +488,64 @@ INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
 		       });									\
 	    )
 
+static void pkvm_mapping_free_spares(struct list_head *spares)
+{
+	struct pkvm_mapping *m, *tmp;
+
+	list_for_each_entry_safe(m, tmp, spares, list) {
+		list_del(&m->list);
+		kfree(m);
+	}
+}
+
+static int pkvm_mapping_alloc_spares(struct list_head *head, u64 nr_spares)
+{
+	struct pkvm_mapping *m;
+
+	while (nr_spares--) {
+		m = kzalloc_obj(*m, GFP_KERNEL_ACCOUNT);
+		if (!m) {
+			pkvm_mapping_free_spares(head);
+			return -ENOMEM;
+		}
+
+		list_add(&m->list, head);
+	}
+
+	return 0;
+}
+
+static void pkvm_mapping_split(struct pkvm_mapping *mapping, struct kvm_pgtable *pgt,
+			       struct list_head *spares)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	u64 nr_pages = mapping->nr_pages - 1;
+	gfn_t gfn = mapping->gfn + 1;
+	u64 pfn = mapping->pfn + 1;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
+	mapping->nr_pages = 1;
+	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
+
+	while (nr_pages--) {
+		struct pkvm_mapping *m;
+
+		if (WARN_ON(list_empty(spares)))
+			break;
+
+		m = list_first_entry(spares, struct pkvm_mapping, list);
+		list_del(&m->list);
+
+		m->nr_pages = 1;
+		m->gfn = gfn++;
+		m->pfn = pfn++;
+
+		pkvm_mapping_insert(m, &pgt->pkvm_mappings);
+	}
+}
+
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops)
 {
@@ -753,6 +811,73 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	return -EINVAL;
 }
 
+/*
+ * Splitting is only expected on the back of a guest HVC, while
+ * pkvm_pgtable_stage2_split() can be called with dirty logging.
+ */
+static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
+{
+	struct kvm_hyp_memcache *mc = &vcpu->arch.stage2_mc;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct pkvm_mapping *mapping;
+	struct kvm *kvm = vcpu->kvm;
+	struct list_head spares;
+	u64 nr_pages;
+	int ret;
+
+	if (WARN_ON(!kvm_vm_is_protected(kvm)))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(ipa, PMD_SIZE) || size != PMD_SIZE)
+		return -EINVAL;
+
+	ret = topup_hyp_memcache(mc, 1);
+	if (ret)
+		return ret;
+
+	/* We already have 1 pin on the huge-page */
+	nr_pages = (size / PAGE_SIZE) - 1;
+
+	INIT_LIST_HEAD(&spares);
+	ret = pkvm_mapping_alloc_spares(&spares, nr_pages);
+	if (ret)
+		return ret;
+
+	write_lock(&kvm->mmu_lock);
+
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, ipa, ipa + size - 1);
+	if (!mapping) {
+		ret = -EPERM;
+		goto unlock_mmu;
+	} else if (mapping->nr_pages == 1) {
+		/* We've raced with another vCPU */
+		ret = 0;
+		goto unlock_mmu;
+	} else if (mapping->nr_pages * PAGE_SIZE != PMD_SIZE) {
+		ret = -EINVAL;
+		goto unlock_mmu;
+	}
+
+	ret = folio_add_pins(page_folio(pfn_to_page(mapping->pfn)), nr_pages);
+	if (ret)
+		goto unlock_mmu;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
+	if (ret) {
+		for (int i = 0; i < nr_pages; i++)
+			unpin_user_page(pfn_to_page(mapping->pfn + 1 + i));
+		goto unlock_mmu;
+	}
+
+	pkvm_mapping_split(mapping, pgt, &spares);
+
+unlock_mmu:
+	write_unlock(&kvm->mmu_lock);
+	pkvm_mapping_free_spares(&spares);
+
+	return ret;
+}
+
 /*
  * Forcefully reclaim a page from the guest, zeroing its contents and
  * poisoning the stage-2 pte so that pages can no longer be mapped at
@@ -765,6 +890,23 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 	return !ret || ret == -EAGAIN;
 }
 
+static int pkvm_hyp_req_handle_split(struct kvm_vcpu *vcpu, u64 gfn, u64 nr_pages)
+{
+	phys_addr_t addr = ALIGN_DOWN(gfn << PAGE_SHIFT, PMD_SIZE);
+	phys_addr_t end = ALIGN((gfn + nr_pages) << PAGE_SHIFT, PMD_SIZE);
+
+	while (addr < end) {
+		int ret = __pkvm_pgtable_stage2_split(vcpu, addr, PMD_SIZE);
+
+		if (ret)
+			return ret;
+
+		addr += PMD_SIZE;
+	}
+
+	return 0;
+}
+
 static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
 {
 	int ret = -EINVAL;
@@ -776,6 +918,12 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
 	case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
 		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC_SELFTEST, req->mem.nr_pages);
 		break;
+	case PKVM_HYP_REQ_SPLIT:
+		if (WARN_ON_ONCE(!vcpu))
+			break;
+
+		ret = pkvm_hyp_req_handle_split(vcpu, req->split.gfn, req->split.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
index 493225e3282d..a0787114b892 100644
--- a/arch/arm64/kvm/trace_pkvm.h
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -10,10 +10,12 @@
 
 TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
 TRACE_DEFINE_ENUM(PKVM_HYP_REQ_HYP_ALLOC);
+TRACE_DEFINE_ENUM(PKVM_HYP_REQ_SPLIT);
 
 #define PKVM_HYP_REQ_TYPES				\
 	{ PKVM_HYP_NO_REQ, "NO_REQ" },			\
-	{ PKVM_HYP_REQ_HYP_ALLOC, "HYP_ALLOC" }
+	{ PKVM_HYP_REQ_HYP_ALLOC, "HYP_ALLOC" },	\
+	{ PKVM_HYP_REQ_SPLIT, "SPLIT" }
 
 TRACE_EVENT(kvm_handle_pkvm_hyp_req,
 	TP_PROTO(struct pkvm_hyp_req *req, int ret),
-- 
2.56.0.385.gac671c819a-goog


