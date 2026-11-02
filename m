Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdLJn1/E;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T//zf3IG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P2ey6Onrpj0y2/IBiqoDV7wz5s2e6pa1EP6Aux57bqo=; b=zdLJn1/ENq28K+2G23U4nBwFj6
	SIll5kUv6zS1nrjcLsgGZhZRIyTlXHQAro9a3mXPg+dF52i2ZaobsO1Liu8M6dcBYfOQR9XebE8vt
	dbxTvXrO3OV2xvjgv7GZqaG4xw4aygXzBOBIn1+SCZr1Kanao+oBNLHYG/Xy9mvMyK8H/X4CWG1xU
	O14OcJhlnYWLTGAsW5yxOmyE7K3vun+BQ9OCeM9Itt/Xdc9cE9m6p9VptrZHxxv/aot5Qo2i+tBxk
	8rDvpNgHX1ABZC5C3pbWsjmcT6KAivDXgqblZih6auM3lTT0aGXUJ5/ma7UI/CqNwYlrkmBSVmYys
	ZGx5Vn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw4-00000000NnX-3XS6;
	Mon, 02 Nov 2026 20:47:20 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw0-00000000Ndt-11Kz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:17 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso30943145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652433; x=1794257233; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2ey6Onrpj0y2/IBiqoDV7wz5s2e6pa1EP6Aux57bqo=;
        b=T//zf3IGTDpHMUCsnQDr1zrrgGC1RuxxE4sSdC2apKrofZTxasWRh+f1ufKbeCIU+g
         /krFB2Gie/e4O1KYRjJ33bug3pHXQ6YtIt3uYzXxYYzaJpG6OMiFDW05qm6a08HmxOQp
         BcHy7xAmgYs0diVNFvIPK8YHCaPLUKZtfzPi/UYaJ/Hk3mu9A2D8fgVOTqJNqtHBQelA
         bhwJRoE6LdCu+LHEpe2SKmd+n6aM9gYzNQ8cIyvGEwivvbYnLcJ9MO2R8wuau6EXyppg
         smTU/L3I1+N5sDlL67SlFOC8ssDJ4gmDUNMsRz5+VMcl5B3kz6TjDzQOciMA6hhdkRww
         vW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652433; x=1794257233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2ey6Onrpj0y2/IBiqoDV7wz5s2e6pa1EP6Aux57bqo=;
        b=PRPEnBJWQ+bQpg5IdBMQQ2lRzDjTdE/e8INwasNSw9/VR2yKKaliGxNRvXsK174IZ/
         mvNTe9Cia6k34baEMXcuoKHiGP1h7qnkbGFO2+QwuIuztiLeNhHQ7erDcBZh8oMxyWHm
         SJYq5FxvAA8o19Zb3jANMcSZaDacGFITjcknliSUcEum8minqz9yVhgqLYpvv19Hk9ei
         EnRYdUXtLFeY/2H7B2r2CR7dSPMpzskeKC+Zvfxaqy4r1WsrlnzrELLBLPXpEmDqz1J8
         5CED/r9s8OTyWyKGq6jiRzuVsqanHw3BPuyfCg5pOhRAV+miVZMQBUISaRpd7EH+wRTB
         S/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4EIS5da17DBOGoJe+1QAK2ukQ1SmtXq/gURA4yZ0mSV7wnlDmucdWAYwcAnhfewtq5U/c8xZ5QNjQn5rt0/dJ@lists.infradead.org
X-Gm-Message-State: AFq9FYI8VRxrtuPmPPA3XYNHWWUHPxnE6Y6eMr8UrITQBqIHRwXpWl+A
	br+VYzBfXSIJSfybyV/ZwrZ67gSdhazoR9ZMJZAprTQcv18hVKYkNDkltPti8lpDKX/PHSJvOdW
	endOS+S8kChmk44+ECaVmmQ==
X-Received: from wmsk28-n2.prod.google.com ([2002:a05:600d:849c:20b0:4a1:811f:6de2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr278044675e9.21.1793652432957;
 Mon, 02 Nov 2026 12:47:12 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:16 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-12-vdonnefort@google.com>
Subject: [PATCH v3 11/23] KVM: arm64: Add a range to __pkvm_guest_share_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124716_440370_3DC1C028 
X-CRM114-Status: GOOD (  14.78  )
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
add a nr_pages argument to the __pkvm_guest_share_host() hypercall. This
range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 24 ++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  2 +-
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index b05b0bcc3f2d..6741c9ecb879 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -32,7 +32,7 @@ enum pkvm_component_id {
 
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
-int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d5dcfbb59b7c..9183406ae04b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1034,31 +1034,37 @@ int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size);
+
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, phys, ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	ret = -EPERM;
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE))
+	if (__host_check_page_state_range(phys, size, PKVM_NOPAGE))
 		goto unlock;
 
 	ret = 0;
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
 				       &vcpu->vcpu.arch.stage2_mc, 0));
-	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED));
 unlock:
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1941,8 +1947,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
-	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1972,7 +1978,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 2a73e63e8f81..66d7493a6549 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1178,7 +1178,7 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa))) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
-- 
2.56.0.385.gac671c819a-goog


