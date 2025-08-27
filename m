Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FDFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15IbCh6FREymugCSrCisKigz25x9k3php32v0CEPWCQ=; b=pER4HMYHsWI2fwT22k8/PJgkxa
	LMakrIa4QDemkUauuxamL5KnbI/+sb1hVq4cqONKNMljN+Tv43ZUdIQwAW9WtS5gtvfBNlMD/H2Nc
	J1e+/KKwjTccofAHpAMBJ1MzBuXY2PPNDmGZ/JanxKTJMDzh3iDgWP09QvMhp6Eoa4loP9H9DEjWY
	tFFSURlgfJsqD44zqyaZYtwaMh4lQ4K+SmZFgzVfBhI+De04QfIL7lVW4BwRWazjhjAMz7DNIeVSa
	IxPDHAN3fvdTctp4c6fsULJpXZkUk21AbRqtyhpRyH3BTcn3KcqtWBmrJSxVSkKE4G4yWJCHA7AN4
	rkitsrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1V-0000000FCPi-15rc;
	Wed, 27 Aug 2025 11:09:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG3-0000000F2bE-2zJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:20:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso49200875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289998; x=1756894798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=15IbCh6FREymugCSrCisKigz25x9k3php32v0CEPWCQ=;
        b=DrAMrdeary5Eo/FVNji++8lsxWelEeafed6OlU8kUHTdu9PnM1NmbIPSNItCRk1D+X
         5GDF7QhDRkxGHadSd1GpUYgkgyRvA48ZKxOLwQYr+agkHE+JqNQd4tl3ByQ1O3AfFs8s
         ZwAsV/pUOVeiobyD/3GKIBzVNYsFtx/ImNQtIEaTh/2o9x9zwnBTaqbVMLFr+WyzFc1W
         qa14touTXSMCqX88h8xT/T46HWLEnWJa0C1l+SKKOLz4VU9gCzT+l3sq8idwzERRLMvc
         DIsmxzr5qMvUx1Eel8LKPZ3Z+lMJqn9AUTZ1OV9Ez/csj7Vw3YjqOW+hcpL1k7qt5ooD
         HR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289998; x=1756894798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15IbCh6FREymugCSrCisKigz25x9k3php32v0CEPWCQ=;
        b=RRgy+k52CDJQnU2LV1+0KaowvwFpmP2oO+smfhFkrHjzQU57UGfej09FS1+8sPenKF
         GNiBqAEUCnvUYwvFJRBcGlY+wEncNm5e0usiq6myjXNjR863KV8FQe0/NZEZe2cP/1VH
         nKqRwrycQk8EJYdcfMU2R7dxQbewBiwhOcKVOECiLv68PMQNCzgVuHIJ1LqcQXhjp7Dt
         TDQ/crZnzCunel2oxNgWOmsi898ciDyo2eb+lqcRk21b59NuWHjBDb486b01Y598q9DA
         dhcXaXXEfjXIASUPxql1RZsvt+nxWyKMg2LmlayTgciAlOcBvc8qHSKA8VClt9OsE1kS
         3XZg==
X-Forwarded-Encrypted: i=1; AJvYcCU+0RpWU+KjJkY9A8VzeLmxcvOWrNxRVF8neaXyU7nXUBjOsYI36v1TeommSJgXcBQw34hj8b0K7Ci0o9TqATuj@lists.infradead.org
X-Gm-Message-State: AOJu0YxIfANMdQlu8pXaMYVZWc8kjhWc9NP49sOTD1NyRP3Nks/EoeLU
	Af5P0k81g3YWSDvDYI4k7eqtSDliiFofNLYbHo1so05I8FiUHH/fMmnDH7rKWTnn6qL00/k4evE
	ndA==
X-Google-Smtp-Source: AGHT+IEGZata72ejku0XcOfHTx/eRZ6xhDAnGZ/fNxAG576+6GwC+qli/4vpwJCFJBj4nB3I6znBURvILA==
X-Received: from wmbgz9-n2.prod.google.com ([2002:a05:600c:8889:20b0:45b:6fb3:665a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c48e:b0:45b:5f3d:aa3d
 with SMTP id 5b1f17b1804b1-45b5f6bde93mr79943025e9.21.1756289998235; Wed, 27
 Aug 2025 03:19:58 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:46 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-7-tabba@google.com>
Subject: [PATCH v3 6/9] KVM: arm64: Separate allocation and insertion of pKVM
 VM table entries
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031959_759500_E2E1B1B5 
X-CRM114-Status: GOOD (  20.75  )
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

The current insert_vm_table_entry() function performs two actions at
once: it finds a free slot in the pKVM VM table and populates it with
the pkvm_hyp_vm pointer.

Refactor this function as a preparatory step for future work that will
require reserving a VM slot and its corresponding handle earlier in the
VM lifecycle, before the pkvm_hyp_vm structure is initialized and ready
to be inserted.

Split the function into a two-phase process:

- A new allocate_vm_table_entry() function finds an empty slot, marks it
  as reserved with a RESERVED_ENTRY placeholder, and returns a handle
  derived from the slot's index.

- The insert_vm_table_entry() function is repurposed to take the handle,
  validate that the corresponding slot is in the reserved state, and
  then populate it with the pkvm_hyp_vm pointer.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 52 ++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 969f6b293234..64b760d30d05 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -192,6 +192,11 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
  */
 #define HANDLE_OFFSET 0x1000
 
+/*
+ * Marks a reserved but not yet used entry in the VM table.
+ */
+#define RESERVED_ENTRY ((void *)0xa110ca7ed)
+
 static unsigned int vm_handle_to_idx(pkvm_handle_t handle)
 {
 	return handle - HANDLE_OFFSET;
@@ -231,6 +236,10 @@ static struct pkvm_hyp_vm *get_vm_by_handle(pkvm_handle_t handle)
 	if (unlikely(idx >= KVM_MAX_PVMS))
 		return NULL;
 
+	/* A reserved entry doesn't represent an initialized VM. */
+	if (unlikely(vm_table[idx] == RESERVED_ENTRY))
+		return NULL;
+
 	return vm_table[idx];
 }
 
@@ -481,7 +490,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	return ret;
 }
 
-static int find_free_vm_table_entry(struct kvm *host_kvm)
+static int find_free_vm_table_entry(void)
 {
 	int i;
 
@@ -494,15 +503,13 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 }
 
 /*
- * Allocate a VM table entry and insert a pointer to the new vm.
+ * Reserve a VM table entry.
  *
  * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
-static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
-					   struct pkvm_hyp_vm *hyp_vm)
+static int allocate_vm_table_entry(void)
 {
-	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
 	int idx;
 
 	hyp_assert_lock_held(&vm_table_lock);
@@ -515,10 +522,30 @@ static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
 	if (unlikely(!vm_table))
 		return -EINVAL;
 
-	idx = find_free_vm_table_entry(host_kvm);
-	if (idx < 0)
+	idx = find_free_vm_table_entry();
+	if (unlikely(idx < 0))
 		return idx;
 
+	vm_table[idx] = RESERVED_ENTRY;
+
+	return idx;
+}
+
+/*
+ * Insert a pointer to the new VM into the VM table.
+ *
+ * Return 0 on success, or negative error code on failure.
+ */
+static int insert_vm_table_entry(struct kvm *host_kvm,
+				 struct pkvm_hyp_vm *hyp_vm,
+				 pkvm_handle_t handle)
+{
+	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
+	unsigned int idx;
+
+	hyp_assert_lock_held(&vm_table_lock);
+
+	idx = vm_handle_to_idx(handle);
 	hyp_vm->kvm.arch.pkvm.handle = idx_to_vm_handle(idx);
 
 	/* VMID 0 is reserved for the host */
@@ -528,7 +555,7 @@ static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
 	mmu->pgt = &hyp_vm->pgt;
 
 	vm_table[idx] = hyp_vm;
-	return hyp_vm->kvm.arch.pkvm.handle;
+	return 0;
 }
 
 /*
@@ -614,6 +641,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	struct pkvm_hyp_vm *hyp_vm = NULL;
 	size_t vm_size, pgd_size;
 	unsigned int nr_vcpus;
+	pkvm_handle_t handle;
 	void *pgd = NULL;
 	int ret;
 
@@ -643,10 +671,16 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus);
 
 	hyp_spin_lock(&vm_table_lock);
-	ret = insert_vm_table_entry(host_kvm, hyp_vm);
+	ret = allocate_vm_table_entry();
 	if (ret < 0)
 		goto err_unlock;
 
+	handle = idx_to_vm_handle(ret);
+
+	ret = insert_vm_table_entry(host_kvm, hyp_vm, handle);
+	if (ret)
+		goto err_unlock;
+
 	ret = kvm_guest_prepare_stage2(hyp_vm, pgd);
 	if (ret)
 		goto err_remove_vm_table_entry;
-- 
2.51.0.261.g7ce5a0a67e-goog


