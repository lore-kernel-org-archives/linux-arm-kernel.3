Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F461606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wpk/rgz4;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fXNiTeC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O33+NCycmOfzcP1ZcAQN9xwtoCagQjbgxHzNinMkOtI=; b=wpk/rgz49YpAD13z1FEZBItWRe
	Ld1r3SEZMebOb1pvu9bGZ8H4ITYig2i2ARQ20heCZC7kFPMl250rqtRjslwmOZnXE3NlWvu1GSzwK
	lFXW4wJN0wRbC7mQ2w1+v34M5Gop5d+7tn2Dln3Mn1NDj+7pv/+JdHp3sPrblbmD6xA9txtffTjxy
	Bb7RcnIiOWm0B4mRW1ZhqICH/wjSd/Y379a6bGpzPQLGdICNAg+TiO7zwshaxoPLdgBCFivvoJ4Xp
	ksa/Nv9edkpZa47JbRQt6ECwcKHB6KrpsRQsf4s+Gxz1N+OAtexADeabLTfnkJ9ZOy1ufnRnkXoDL
	c63wtFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw4-00000000NmL-1xlt;
	Mon, 02 Nov 2026 20:47:20 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvy-00000000Nbi-3fmN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:17 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso24484875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652429; x=1794257229; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O33+NCycmOfzcP1ZcAQN9xwtoCagQjbgxHzNinMkOtI=;
        b=fXNiTeC+r1ixy/NlAvU+kkXOSq50yO4k+QQU6EH4KxUoC4pHHh2535dxRdw1ewfC4a
         GJ/IgCnj2eobz+bSjtbZemFD1/4N8UhywTMkRar/34MtKMK6wQEmDQ7hazu973aeq22R
         acHuFGwTdTtOoF+UV57w/gzEMjmC+1iaxK6UpEUOWGt+6nE2e9wfIp5syXkuqYu0dTyc
         XCwTeHDJ0sCiWJCOrFws1yqCN/+2oPd5wnsauEbVtOdDfBCa/QXg8M94YA6VZFmBvgqb
         dAXlhZpKTWhhr+fbm4lJdjzw66d8Cy5WRITZ1SK6hUqhKKZsCGPVIMuXOoVp8JaZqfjc
         xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652429; x=1794257229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O33+NCycmOfzcP1ZcAQN9xwtoCagQjbgxHzNinMkOtI=;
        b=FF4BFKsScYNikRxL3mZbMKiSX1zhi7JY4cFdlvw8RISfuclgRCQzHBZ1vAiutGP/bx
         vgm+LZexs1Lr9ifx9J8gR/SdGNMe1WZeT1CimQkFCdX1VGndouI43unajTzGKHcstj/C
         xpRXTmg+OC8Pu1ryN1oOw+oMNXUbc2cKqXsY2NkmEXexS3+CwDCuAwsuaNigaYIf7BGG
         J92TrGAZhc6VwQMsdiIU3ZCji8AIUf7HneHYqAJwOq89H45AwOw2LFuJNZKMtgAQeden
         9HI/S9GAxK0sxBXmbAo5g55TkaZkjorzPW3taXpOqWw/pSsWSfocUvvxLLEMLFlIJSFV
         sdAg==
X-Forwarded-Encrypted: i=1; AKwUvBz2gc4bGMNaBC2GC2oDiafvGTfdpCyKn03tP0KsJ3koOUg06z1LR1DlmyBjAsycYIxZvBvKZiKBFqBA/958GERe@lists.infradead.org
X-Gm-Message-State: AFq9FYLRZOaUJR1xfIgdMoFC/OQfpOO/+gXjbwiEg8rDZ3SelOozrjbZ
	bFBxPq03YKovRWHW79Sak8MFKpg2kjjXWMJyMtjyT7CogphIru5B9Ee1DSzkJGEurUoqTBsbbTH
	AbTgo3mtZJ/kTt4R4Ei6HzA==
X-Received: from wmpg42.prod.google.com ([2002:a05:600c:4caa:b0:4a2:d3e:ee4a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr267566705e9.13.1793652428758;
 Mon, 02 Nov 2026 12:47:08 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:12 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-8-vdonnefort@google.com>
Subject: [PATCH v3 07/23] KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124715_816876_AB8CFDC2 
X-CRM114-Status: GOOD (  14.36  )
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

Nothing prevents the host/hyp sharing transition from working on a
range. In preparation for testing huge mappings with the pKVM ownership
selftest, add a range to these hypercalls to allow them to be tested
just like the others without any special case.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  4 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 | 12 ++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 50 +++++++++++--------
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index a1c9c71beb36..ec0bf9dff899 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -31,10 +31,10 @@ enum pkvm_component_id {
 };
 
 int __pkvm_prot_finalize(void);
-int __pkvm_host_share_hyp(u64 pfn);
+int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
-int __pkvm_host_unshare_hyp(u64 pfn);
+int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 5ad74ab265b5..cfcf93770c77 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -286,13 +286,13 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	if (ret)
 		goto out_unlock;
 
-	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx));
+	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx), 1);
 	if (ret) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto err_unmap;
 	}
 
-	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(rx));
+	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(rx), 1);
 	if (ret) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto err_unshare_tx;
@@ -324,9 +324,9 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 err_unpin_tx:
 	hyp_unpin_shared_mem(tx_virt, tx_virt + 1);
 err_unshare_rx:
-	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(rx));
+	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(rx), 1);
 err_unshare_tx:
-	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx));
+	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx), 1);
 err_unmap:
 	ffa_unmap_hyp_buffers();
 	goto out_unlock;
@@ -355,11 +355,11 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 	}
 
 	hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
-	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.tx)));
+	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.tx), 1));
 	host_buffers.tx = NULL;
 
 	hyp_unpin_shared_mem(host_buffers.rx, host_buffers.rx + 1);
-	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.rx)));
+	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.rx), 1));
 	host_buffers.rx = NULL;
 
 	ffa_unmap_hyp_buffers();
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index bf3d13a15b2f..853dad542597 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1282,13 +1282,13 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_cpu_set_vector,
 DEFINE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
 	u64, pfn)
 {
-	return __pkvm_host_share_hyp(pfn);
+	return __pkvm_host_share_hyp(pfn, 1);
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_host_unshare_hyp,
 	u64, pfn)
 {
-	return __pkvm_host_unshare_hyp(pfn);
+	return __pkvm_host_unshare_hyp(pfn, 1);
 }
 
 DEFINE_KVM_HOST_HCALL(ulong, __pkvm_create_private_mapping,
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 385a7ed12b3c..f7d249d35f50 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -992,12 +992,15 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	return ret;
 }
 
-int __pkvm_host_share_hyp(u64 pfn)
+int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE;
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -1084,12 +1087,15 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	return ret;
 }
 
-int __pkvm_host_unshare_hyp(u64 pfn)
+int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE;
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -1807,8 +1813,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.guest[0] = selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_page_state();
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
@@ -1820,15 +1826,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.hyp = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
@@ -1840,8 +1846,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	hyp_unpin_shared_mem(virt, virt + size);
 	WARN_ON(hyp_page_count(virt) != 1);
-	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
@@ -1855,15 +1861,15 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
 	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
@@ -1881,8 +1887,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
@@ -1907,8 +1913,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
@@ -1921,8 +1927,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
@@ -1935,8 +1941,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
-- 
2.56.0.385.gac671c819a-goog


