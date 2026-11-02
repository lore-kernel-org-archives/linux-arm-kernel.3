Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GEaLOB/P;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T85mvK5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5rUTB8+IRDsGKtDPVzlsYq54baKTeMsOoKHU9nmOMDA=; b=GEaLOB/PHx6T6F90ne/sh4xnJW
	Rze2KJgtdIpJu1Ff9VF2cGfmoCZHOmaRDDsMzjjn0qfmhuNpVivB+B7XsoqkMaME+Rj+6Scx0g259
	2vfBXqNtl6Skopd5lhSwKnrHuDYJsoKYWkQtoKq9TuHv/EiiD83nLCpwF0jznmmurwtJdC7WdtRkI
	/EX+pozHkBS11oGD3DMX0qUkMXgTeQiZDJpGHMp/BhMiqH7uiDM1buSkQnT76rqn8tgEInxdldLg2
	Vk7iJOloTQFz+mIPSHDhyWGh8LOkK2nMNVeNiqI7iYgfeQSg/3DRo83jcX4jDk8+Q+eIRsftse6NC
	yQ3Lq27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw4-00000000Nmw-2hla;
	Mon, 02 Nov 2026 20:47:20 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvy-00000000NdD-2plz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:17 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48e6d6e780fso1587671f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652430; x=1794257230; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rUTB8+IRDsGKtDPVzlsYq54baKTeMsOoKHU9nmOMDA=;
        b=T85mvK5uN5jnZ/qO5aa2awul1N8mX55cX19U7ydiW1sXenINQy6lqL1DviThF353t4
         cjnJR3+qIdjihc4vbnkEfvZjQTOt3RJ63ul66OU4pEzti9aEujuJl+Pvh17t1EzRy9kF
         IjjstTriABYzF9yDUt8e5KYac/IShbaN8EWQgf7MA8sN3/r7HGGYU1Hpr65xOCv2oHk2
         KBVlTER8rPmfbvxJtx0I3pO4diyJL0Ph4dLELLFvNpSPFuHGZv5oetwgxsJ1/RSbk/Cr
         wtNUaQ/apGIhaqt2t6wyYsCz52Azf12XU09tqeu8EgdXVnTZrZztDykKBDHAAOn+KAi9
         FvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652430; x=1794257230;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rUTB8+IRDsGKtDPVzlsYq54baKTeMsOoKHU9nmOMDA=;
        b=NmbNPDOqXSF/GtiuRwaPQhsVa7BsbfienfwmMMOsByU/1WJWZjQAwZ6Fa0NxolPAHv
         ztKUdEVFeF3Rf8Y3u9slRJowfuDWzmko/bXpK2xC041WnhSuI4ip28ZNijXGIb/FWL5z
         wx17xW3wM8C9I5xjfW7PoPKe/sbqsmpxVpcB6Ghu9qyiz+rfdKkqwxQD2HFmBr5ao17Q
         KxKHZdcSodvvi8AL2Bx1dfoNRzAF15u/qYoL+Wl0oNAFMjl5QK/nMwFXrtE0h8tNdNQ0
         WYqWqqOHcnaAJdWyetq4kd1pY2ycTR5L62vjU1JtiwfEVrUboQ2Ye7fTXb+rZIe3dcsO
         A1gA==
X-Forwarded-Encrypted: i=1; AKwUvBz2AKv3O56etaZOPXX9xCu7o/ZLWIgGFJkcOir52mWYxIVcYzK5KxT2Ao38L4mq9Zt2FSOKzkxXwxi9EuAUpnlk@lists.infradead.org
X-Gm-Message-State: AFq9FYIvwOtqw0/k0a7v4KB4NNZHuFB3c+tBmPNFC5F1qhpth0AX8dmN
	bl9vOfBFB1///ppYVwfA/dxAqKefNHFEe0vh+ztjcVvFbDRT7XzCJ60F/Hu6EgaSqlShJthJ66H
	Gd7r5k28DyB6dCTw2L7ezug==
X-Received: from wmqg6.prod.google.com ([2002:a05:600c:4ec6:b0:4ae:2747:b6c5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr214165995e9.33.1793652429856;
 Mon, 02 Nov 2026 12:47:09 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:13 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-9-vdonnefort@google.com>
Subject: [PATCH v3 08/23] KVM: arm64: Add a range to __pkvm_host_donate_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124716_402054_41996134 
X-CRM114-Status: GOOD (  15.46  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
add a nr_pages argument to the __pkvm_host_donate_guest() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hcall.h            |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 48 +++++++++++--------
 arch/arm64/kvm/pkvm.c                         |  2 +-
 5 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 64d18b7f2392..c47ee2653110 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -221,7 +221,7 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_hyp,
 	u64, pfn)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
-	u64, pfn, u64, gfn)
+	u64, pfn, u64, gfn, u64, nr_pages)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_guest,
 	u64, pfn, u64, gfn, u64, nr_pages, u64, prot)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_guest,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ec0bf9dff899..b04cedaf4ec6 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
-int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
 int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 853dad542597..4f420718ca6a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -965,7 +965,7 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
-	u64, pfn, u64, gfn)
+	u64, pfn, u64, gfn, u64, nr_pages)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	int ret;
@@ -978,7 +978,7 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
 	if (ret)
 		return ret;
 
-	return __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
+	return __pkvm_host_donate_guest(pfn, gfn, nr_pages, hyp_vcpu);
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_host_share_guest,
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f7d249d35f50..ed82cbe973ad 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1452,22 +1452,30 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
 	return 0;
 }
 
-int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size;
 	u64 meta;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
 
-	ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
@@ -1476,9 +1484,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 		goto unlock;
 
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.stage2_mc, 0));
 
@@ -1820,7 +1828,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1840,7 +1848,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1853,7 +1861,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1873,7 +1881,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1890,7 +1898,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
@@ -1906,9 +1914,9 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1921,8 +1929,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
 	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
 	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1935,8 +1943,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
 	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
@@ -1948,19 +1956,19 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = PKVM_POISON;
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn + 1, vm);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 
 	selftest_state.host = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 29e7a51a1c03..d1acdca0254f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -594,7 +594,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return ret ? -EFAULT : -EAGAIN;
 		}
 
-		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, 1);
 	} else {
 		if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
 			return -EINVAL;
-- 
2.56.0.385.gac671c819a-goog


