Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76765C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m5bqbS5De2414rudA+6hni5oX136rUbEPTOwyZJ3oE=; b=u/orxkb5E8pP0/qVqqTkHhkoxD
	OMzX+R9gwJPsXawWb1zlsqT4KgHIF/lEdJ/VceEyHjC9M0/mouAFa5MnsDrqR0oSDQmAj/KISZiJO
	q9pw+SzZu/SJAwM5oOK/yIfuAH5LgFVP1mukP1TbTgaQjNtVTVQemnTENh7urb4pkdZJsur/nr9BK
	OtVeGC8Ig5lK/gewEKf6JhifjdGVBUfbCZbjnkbDDeVKz9jXWOwn1Q16madYoE4Bzh/EhHIGpA+gt
	M4CSPhKxXWojJy6CG+HC5WiRsk6UjtVrWu3OCc6Pb9K/ycFQpPap3th54Do/V2w768XArDQirqPhr
	KYH3ukLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq94S-0000000AjU1-1tpS;
	Thu, 06 Mar 2025 11:07:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yD-0000000AiWk-0O7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:00:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so2241485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258851; x=1741863651; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6m5bqbS5De2414rudA+6hni5oX136rUbEPTOwyZJ3oE=;
        b=oR124gdzAszUUqbmcg7Kh7rqdP81lJQygsSrTSq3vaZcQrQG9zGQi/SFxG9PmDxnhO
         aFY3RxTjtgABpLUuVhXz4X74ch7ItR1id8gebTQBrvi6BchHtcvcKRjmPiMvtSp0gAhr
         Yzp04VN+e4+nj4hvw0nTMNvsHlKzZFbxDaRZKS0eYbbcG46xoVEFh1L02TbHBaSOQjyz
         82WjZ1pIsBlSW8Vih8t0mMhmXo5NzyHsGC2VQufNq/6jsJX90Bs5Dozo5QAZEN5FX9DT
         laok6PYDKRquemsDNA+GULWuQpwbZ7KnAOobNpwE0urDp5/EZeMMnE3+aV149NrqiGXW
         GPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258851; x=1741863651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6m5bqbS5De2414rudA+6hni5oX136rUbEPTOwyZJ3oE=;
        b=VhBUxx2olfgccaC1H2RfxPHmY5DljZZ1MDChNvDb/5t/cVcIQ+rxIQTDq0227xsGF/
         BAuajpHq5IHjZZslft1YAr37BHYv7/P8xvvyWiNn/Uv6T5br7ZkrFLil0Jrvfgmlu2JQ
         IRjQhPpp7/yHgQ4z27j+4XX2l9DfGZEdGmFSmP1m8ldeBZwliUMiPwbVrvIjX6TVuj8B
         7ATpWrr6wXuiykFPQz9PHXrZvPI3PpP3lI7V7vSv0lJ/llBggw2fEtMkyAQuj8ks0QAe
         jXAxX7nxYcZk/mj9CY8jbz7NpiLrp/+n5gN1GnWmi8urzpOnvzFd8M3+n7xSWcquZcWs
         +HKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRnovadiHhdjK0CeY6fDtYP341GTx3Zm2WNIrGe0Z7FFh1Yv7BrGLYSLpJ5RbWZSJBfPUNi7zQvNB04ub3Xa9@lists.infradead.org
X-Gm-Message-State: AOJu0YyXJfKzU54MHH7GqBKm0jnbcb/he21eundytNiHEHIr21VLNVua
	2ew4j/sTi7NfEih7QwR+1MoItRodptSLv/bZQfq/O89lhv4zHGC0G9+B6wnnNtt7EZvw/PWRy1x
	W74/tlbYyD/lNWJDSXQ==
X-Google-Smtp-Source: AGHT+IGZUqYVdIQcMkVSVKvjHliXkD+ge0vVye+cOo8Dd1sDdxpdmjqRMSVgh2kbfPadmJR/0CYkDABlridM7EGM
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:43b:bf84:7e47])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c9f:b0:43b:c0fa:f9c5 with SMTP id 5b1f17b1804b1-43bd2aed752mr44314515e9.21.1741258851559;
 Thu, 06 Mar 2025 03:00:51 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:32 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-4-vdonnefort@google.com>
Subject: [PATCH v2 3/9] KVM: arm64: Add a range to __pkvm_host_unshare_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030053_190198_5E5C6E70 
X-CRM114-Status: GOOD (  11.91  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_unshare_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 1abbab5e2ff8..343569e4bdeb 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,7 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e71601746935..7f22d104c1f1 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -274,6 +274,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -284,7 +285,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+	ret = __pkvm_host_unshare_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7e3a249149a0..7b9b112e3ebf 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -998,13 +998,12 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	return ret;
 }
 
-static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa, u64 size)
 {
-	enum pkvm_page_state state;
 	struct hyp_page *page;
 	kvm_pte_t pte;
-	u64 phys;
 	s8 level;
+	u64 phys;
 	int ret;
 
 	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
@@ -1012,51 +1011,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return ret;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
+	if (kvm_granule_size(level) != size)
 		return -E2BIG;
 
-	state = guest_get_page_state(pte, ipa);
-	if (state != PKVM_PAGE_SHARED_BORROWED)
-		return -EPERM;
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
+	if (ret)
+		return ret;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
-	if (WARN_ON(!page->host_share_guest_count))
-		return -EINVAL;
+	for_each_hyp_page(phys, size, page) {
+		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+			return -EPERM;
+		if (WARN_ON(!page->host_share_guest_count))
+			return -EINVAL;
+	}
 
 	*__phys = phys;
 
 	return 0;
 }
 
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	struct hyp_page *page;
-	u64 phys;
+	u64 size, phys;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, size);
 	if (ret)
 		goto unlock;
 
-	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	page->host_share_guest_count--;
-	if (!page->host_share_guest_count)
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+	__host_update_share_guest_count(phys, size, false);
 
 unlock:
 	guest_unlock_component(vm);
@@ -1076,7 +1076,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 00fd9a524bf7..b65fcf245fc9 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -385,7 +385,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
 		if (WARN_ON(ret))
 			break;
 		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-- 
2.48.1.711.g2feabab25a-goog


