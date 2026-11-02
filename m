Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39255606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HTV+nThT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TUSqL5zX;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsuxpkUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lBfCfijGJlZHvIxga5/+PAUqlvQA0SUFi5KOslqzj1Y=; b=HTV+nThTgf4u4fGNJzMJwEShNN
	/aSXkbLc2n9GipTCEoMEEp1fXr8OZ6Ymf/tNWbTR8HYPRxJ2YL1D3y7k8t3oJ61ZldUaZgXDzE5pr
	SnP2uEoOS7z0GXjJqrVMwaqdgmxfDYVQpSxTncuDW1ibGRaRtas2f60DcfL8Jvvy/yqR2RRjvH4u6
	d7gcTQorV83inMLo1Y5dyjMf4x9oF21fTbMFJbOKGTBxsGvbtdCkO/i/RDT8Rc8W2kDDErmLRz1Nm
	zt2EW9+CRzC2qgcQv5TQZVVbhfojMCyMztKX7hlUklfjuLN5/joR9g/dZhiLKT9fvJCqwo/VzeKGh
	d5kAs6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyy3-00000000PTo-0O2K;
	Mon, 02 Nov 2026 20:49:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyy2-00000000PT5-0byV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 20:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lBfCfijGJlZHvIxga5/+PAUqlvQA0SUFi5KOslqzj1Y=; b=TUSqL5zXFBKUQUJtkxmFkqFgMf
	Q0/+l1enipEdSE4Cv1x2xRVs8Qt2reIB9QtLgRP4Fyy+QQ4kHHHDzQtuu7tXTigmvgM6znoy0jq2U
	vGeWZjkJko9e/ZQT5HmGbh0WiuPT+jHuP0C9axx5jujRw6Mmhf/VDoMzwxFEBNC6BvtM+jXoPCboL
	mOY+CmrzihkyjOIs8/JYgpSL/Lz6Jx9Bw4c/vA7b+EYIogGevZC1V4Syku6QSH52biAlejilpmCSa
	B+tu17HAZ0YmvXXgXwGvpGTBiPhSKcoyh4Tlui/kME3HWiG67K2kT0hMcO50MwgQTkmDhuxjqF9AC
	1YbPo5xQ==;
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw1-000000035U6-2K8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:49:20 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48e0461e040so2814662f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652434; x=1794257234; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBfCfijGJlZHvIxga5/+PAUqlvQA0SUFi5KOslqzj1Y=;
        b=nsuxpkUKfFZc8mQQcY4ilRmsHhaD1p+7FV/M18vOWqHAB4PJbbwaYQfHswnLSy9PWR
         k+tjr2Ap4csrZvSkU1teTFXxKltGVOa2DbCIjSQ/wPPvw+6M0qD62iXxvjqjgBu7ihmK
         eoVBSCr9lWpe42Uncma/5pGBCXtPI0RxMoHYQyC9RyJkHP5QX/WW23NOH/bz3JLOS1xH
         FI/Cq6SNsXRAkrOYO4cDy6/26Ivn3Jjc9cljMK88jHItsKsd/YQjJ4t1O/d6UZ19u9e5
         rOHm/FhRZNQFaA4eytmXe3xoWkX0pDcw77zW1tIw6skTP7Lv/PsEoiEKVB2Mxp9k+O0P
         udFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652434; x=1794257234;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBfCfijGJlZHvIxga5/+PAUqlvQA0SUFi5KOslqzj1Y=;
        b=PgTRRqSKPwZyKvbGQJAZqOevoVxUvJyMA11HpPPpRCmVmSMylynU2OL4Xj7YwWAqOb
         AtmsAYA6Ttd+EEZT0Kz+i0Oy8liw2QZVY3T6EKffbuQgkt0cBd0bOOkC8sojDhy6+FuR
         RFTNy9T9AAZrMnxtB3vklQ+FB60pxGtHcIntkQDzu577rBT+NnsgV3E2jO74Gi2tcYfE
         QSPaxZQQNkBaDJVgae47q2NaoGaaLv3fTnqrMkY3jVbsGkKDmPKvpHoDfKzSu6c7adz8
         4CO7EnPZidDJkuzaxhEPWHk692TbRlxHTQYZxOmvpWjqo5HpTpu7r1ashlB5N2KI6I4q
         FioA==
X-Forwarded-Encrypted: i=1; AKwUvBwZZgFJl0SYjKn7HlszY3d1LnTYIhSJOcTmFR2GJl1c+rczXnLT3CS19zJfg0VrMA4eq4a1xy4358BRyMpjSr1D@lists.infradead.org
X-Gm-Message-State: AFq9FYL2v5rXO1RU43XPf1Hk6QVZkLaox0bToKh6TSKMLtwphu34bV6g
	2B97zwCHQMItSbrVv4DyvUN15ETkeqGOSPEJmVZbSm6EbIP+DWwa1P50QHESO4xNHajvB6GjF0X
	bylpNgrpQdXkNlIRmm1FziA==
X-Received: from wmcn23.prod.google.com ([2002:a05:600c:c0d7:b0:4a1:dfb3:2e66])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6508:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b0bc65ba2bmr88926705e9.35.1793652434243;
 Mon, 02 Nov 2026 12:47:14 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:17 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-13-vdonnefort@google.com>
Subject: [PATCH v3 12/23] KVM: arm64: Add a range to __pkvm_guest_unshare_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204720_499706_2A8B42DA 
X-CRM114-Status: GOOD (  15.70  )
X-Spam-Note: SpamAssassin invocation failed
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
add a nr_pages argument to the __pkvm_guest_unshare_host() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 22 +++++++++++--------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 6741c9ecb879..3fb55899be6b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -33,7 +33,7 @@ enum pkvm_component_id {
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 9183406ae04b..030bfc1155f8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1072,31 +1072,35 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 meta, phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, meta, phys, ipa = hyp_pfn_to_phys(gfn);
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
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
+	if (__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED))
 		goto unlock;
 
 	ret = 0;
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.stage2_mc, 0));
 unlock:
@@ -1961,8 +1965,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1979,7 +1983,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 66d7493a6549..d92f4da1c180 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1206,7 +1206,7 @@ static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
 		return;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
+	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
 		ret[0] = SMCCC_RET_SUCCESS;
 }
 
-- 
2.56.0.385.gac671c819a-goog


