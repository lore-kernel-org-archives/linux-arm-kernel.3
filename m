Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23416606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aa58O0Sd;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aZxaTolt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DFKfYvpudmZ0Kylu+HLBtCK3RdHVQLNBhCCTs8AyHF0=; b=aa58O0Sdt/vEtw9+KWZNYr8uK5
	zWziOElO1cVzk5xw6i/qgu4o+K/WB9bjpbgVhKAglT82QRfja2Ji02d0+ClK9YJOqDzeq5GLUrhsX
	OoVSXQnxdG69V6X0AI4kbn93OVC2XxN1n8jB4nP3bqJ1GWeHo2Ex/pjTHMyKUkm+4ICmi1r38hoPR
	Uxdi2kGU7OjIqo4VvjFAj3xCfJvoj8VwI2G80juAha86fWlg32ihK9Dmt6E8GtVvUykoVMT7U2xSV
	6HpuaeWF0k4+CUQ7tnMsn75b+TQQOU+iD6TtAD6ybDkshILmiMN9XG3p0K/q/5u4T0dnPCpXs8uoz
	gYdCqLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywF-00000000O17-0cy8;
	Mon, 02 Nov 2026 20:47:31 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw4-00000000NkS-163J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:23 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso29286965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652438; x=1794257238; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFKfYvpudmZ0Kylu+HLBtCK3RdHVQLNBhCCTs8AyHF0=;
        b=aZxaToltY5OhLFNBDJerwAIzy3h+pVC7+JNzvjaMeBiQaC0cWa8EebeiyEQx9ftUp1
         eGRMOP84Ixth9VHclE61N0E9ZT3t/hPoVe/Hfjh1OhyJyHrsyuVjoEGnCCKPSP5evQ6I
         yQV4BY90uWpGP+G9tT7e+9XPTR37IGQukn0JP3rd6L8AqAAf7FqQhM2LhIzzrY4LxYF4
         IJm9mdwYuyZAbxmZIFOJf1DswOLah5X2ZFIyg3vmOo4tQjK7cVwRg1XQGNfWobzYYKqF
         r4X15WZgI3wX87Rw0b7C23YdtTdRQs9gdp4R2MYLHXXw5oU8SeY0UCmkRG7fAWrPrzLt
         gVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652438; x=1794257238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFKfYvpudmZ0Kylu+HLBtCK3RdHVQLNBhCCTs8AyHF0=;
        b=xRCgUG2uL9bBN43ecNZrgNBXlsUnAzBkh4bLypMOnllw0Og9xdZC58o8FOc/Eqk4El
         wmHj2Hi/8NZej3I6/Yasbhp7ZFSoZhxpvShODbpbmMaMXsHB9AXC2GSBAKiaYZ3F+YkP
         Ee5dlZaVW4ygZW0K7lP909eKEOEzZwWQP1BExN5BNq7CIOsY7aWIuOVzHVmwETU2mZlW
         bdo6F36UoWos6M2UZcpmTW/KkwGtq2ZZczVJrFSGjZjy6iIGA4B48El+6Xfmxu6Aq+6E
         ibocTVVn9RZfvz2JVDqOGAnxxjh/LZFmuJKq7PAKaDSjmg+o3/e7+aYdCghSywR1nieD
         L2Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwku+lIQp5RrX5BICLnoiBgBJeMKW04RikeHocqS5HNHZ7WDGpYOrq13EC+JQq5H3jidICrzpvZ3W5iJfiMVjb4@lists.infradead.org
X-Gm-Message-State: AFq9FYILOvLiYkJeccdMEDDW0uwjxCAWzF4CH0GO2U0Xry9pdlOeSTL0
	IuQCgo6MPVv9aWClJt3YJqEaYCVwubpPcgCby/gmoqF05dxe3JR9t0gkB5Z3lSk0b3uSHRCYJoM
	6phjUIk5FV7dveGNfpfxX2w==
X-Received: from wmpf27.prod.google.com ([2002:a05:600c:491b:b0:4a2:c25:d91a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr245331475e9.32.1793652437751;
 Mon, 02 Nov 2026 12:47:17 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:20 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-16-vdonnefort@google.com>
Subject: [PATCH v3 15/23] KVM: arm64: Add a range to pKVM ownership selftest
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124720_523181_1738F1CB 
X-CRM114-Status: GOOD (  14.08  )
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

Extend pkvm_ownership_selftest() with a nr_pages argument so that state
transitions can be tested with both page-granular (1) and block-granular
(PMD_SIZE / PAGE_SIZE) ranges.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hcall.h            |   2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   9 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 214 ++++++++++--------
 arch/arm64/kvm/pkvm.c                         |  37 +--
 5 files changed, 148 insertions(+), 118 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 201d58907109..e54a4631a378 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -157,7 +157,7 @@ DECLARE_KVM_HOST_HCALL0(void, __vgic_v3_init_lrs)
 DECLARE_KVM_HOST_HCALL0(u64, __vgic_v3_get_gic_config)
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_hyp_alloc_selftest)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_ownership_selftest,
-	u64, pfn, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
+	u64, pfn, u64, nr_pages, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
 
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 3fb55899be6b..a991be3d4c9a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -76,9 +76,14 @@ static __always_inline void __load_host_stage2(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
-int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages);
+int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			      unsigned long pgtable_nr_pages);
 #else
 static inline int
-__pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages) { return 0; }
+__pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			  unsigned long pgtable_nr_pages)
+{
+	return 0;
+}
 #endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2621a4ef7e1e..c322ef4432c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1314,9 +1314,9 @@ DEFINE_KVM_HOST_HCALL(ulong, __pkvm_create_private_mapping,
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_ownership_selftest,
-	u64, pfn, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
+	u64, pfn, u64, nr_pages, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
 {
-	return __pkvm_ownership_selftest(pfn, pgtable_pfn, pgtable_nr_pages);
+	return __pkvm_ownership_selftest(pfn, nr_pages, pgtable_pfn, pgtable_nr_pages);
 }
 
 DEFINE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index b9b591533b30..751f76d3ec39 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1787,14 +1787,19 @@ static u64 selftest_ipa(void)
 	return BIT(selftest_vcpu->vcpu.arch.hw_mmu->pgt->ia_bits - 1);
 }
 
+static unsigned long selftest_nr_pages;
+
 static void assert_page_state(void)
 {
 	void *virt = hyp_page_to_virt(selftest_page);
-	u64 size = PAGE_SIZE << selftest_page->order;
 	struct pkvm_hyp_vcpu *vcpu = selftest_vcpu;
+	u64 size = selftest_nr_pages * PAGE_SIZE;
 	u64 phys = hyp_virt_to_phys(virt);
-	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
 	struct pkvm_hyp_vm *vm;
+	u64 ipa[2] = {
+		selftest_ipa(),
+		selftest_ipa() + size
+	};
 
 	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
@@ -1818,7 +1823,8 @@ static void assert_page_state(void)
 		assert_page_state();			\
 	} while (0)
 
-int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages)
+int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			      unsigned long pgtable_nr_pages)
 {
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_RWX;
 	struct pkvm_hyp_vcpu *vcpu;
@@ -1831,7 +1837,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	if (ret)
 		return ret;
 
-	ret = __pkvm_host_donate_hyp(pfn, 1);
+	ret = __pkvm_host_donate_hyp(pfn, nr_pages);
 	if (ret) {
 		WARN_ON(__pkvm_hyp_donate_host(pgtable_pfn, pgtable_nr_pages));
 		return ret;
@@ -1841,10 +1847,11 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 						pgtable_nr_pages);
 	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
+	selftest_nr_pages = nr_pages;
 	phys = hyp_pfn_to_phys(pfn);
 	virt = hyp_phys_to_virt(phys);
 	gfn = hyp_phys_to_pfn(selftest_ipa());
-	size = PAGE_SIZE;
+	size = nr_pages * PAGE_SIZE;
 
 	selftest_page = hyp_virt_to_page(virt);
 	selftest_page->refcount = 0;
@@ -1853,48 +1860,48 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_page_state();
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
+	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	hyp_unpin_shared_mem(virt, virt + size);
 	WARN_ON(hyp_page_count(virt) != 1);
-	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1902,116 +1909,125 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
 
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	selftest_state.host = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + nr_pages, nr_pages, vm);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
-	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = PKVM_POISON;
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + 1, 1, vm);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + nr_pages, nr_pages,
+									vm);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, nr_pages);
 
 	/* This also gives back the ownership to the host */
 	teardown_selftest_vm();
 
-	WARN_ON(__pkvm_hyp_donate_host(pfn, 1));
+	WARN_ON(__pkvm_hyp_donate_host(pfn, nr_pages));
 
 	return 0;
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 4c80e0960154..ae53c701206a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -333,31 +333,40 @@ static int __init pkvm_drop_host_privileges(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
+static void __init __pkvm_ownership_selftest(unsigned long page_order,
+					     unsigned long pgtable,
+					     unsigned long pgtable_order)
+{
+	unsigned long nr_pages = 1UL << page_order;
+	unsigned long page;
+	int ret = -ENOMEM;
+
+	/* Page whose ownership will be tested */
+	page = __get_free_pages(GFP_KERNEL, page_order);
+	if (page)
+		ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest,
+					virt_to_pfn((void *)page), nr_pages,
+					virt_to_pfn((void *)pgtable), 1 << pgtable_order);
+	if (ret)
+		kvm_err("pKVM ownership selftest (order=%ld) failed (%d)\n", page_order, ret);
+
+	free_pages(page, page_order);
+}
+
 static void __init pkvm_ownership_selftest(void)
 {
 	unsigned long pgtable_order = 5;
 	unsigned long pgtable = 0;
-	unsigned long page = 0;
-	long ret = -ENOMEM;
 
 	/* Memory for the VM page-table */
 	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
 	if (!pgtable)
-		goto out;
+		return;
 
-	/* Page whose ownership will be tested */
-	page = __get_free_page(GFP_KERNEL);
-	if (!page)
-		goto out;
-
-	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
-				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
-out:
-	if (ret)
-		kvm_err("pKVM ownership selftest failed (%ld)\n", ret);
+	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
+	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
 
 	free_pages(pgtable, pgtable_order);
-	free_page(page);
 }
 
 static void __init pkvm_hyp_alloc_selftest(void)
-- 
2.56.0.385.gac671c819a-goog


