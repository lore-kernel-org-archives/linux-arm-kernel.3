Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTOOUtsfqb4l+gJAMFgunehBcfSR/NR1FIZMjayX2WY=; b=0oBJSajr1H3HYPc84ldDCjU5GC
	zJSf8VkI6+Oh1BpuyJ/x1jtuhNJnri3X7aR1GFQ5DYUv2eds3wzv7DF2snuufX79V0N7NFLTUMhDv
	MUE6YPDkAWhi0rQrx+J/wFOPDlkDIFvFf5pAkTOZTQczIGRUpHcJ9OvoTAS7AZLFHu1OIfuWvxIkt
	UzgbMX9EGooCtE9mOBlchTRNS1XpD520FkHUN1x3SjAaHmeOYj4PvNIwjwL1tHjdznXRoKVyADBrE
	8IKTolgwAaQNFjvGdr6QpiE/UuJjx+V02lsL5gYxeRvSrkCYAztM2gllLeyvUtDoEHVNU8Cwe2wtG
	xpW+Fv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWj-0000000DFjZ-3VhR;
	Mon, 06 Jul 2026 17:54:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWa-0000000DFbi-0a1D
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 17:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bTOOUtsfqb4l+gJAMFgunehBcfSR/NR1FIZMjayX2WY=; b=nK2/6yYpKoEctNZ/l52/vvSft8
	a1PWRbVVj9gakTQfGLgC2efXA4jnijEHUr7HFBMOsQn189YevAUysDTvyWxFCqLWpG/g2Cf+RPcB0
	NTEsijO0DYW8HsEqRPS8/Jqc8UX5nZqHI2oUyoKT9cq1X6XYVrxG+VVddnZCgHuAJy8a19qmgHNzs
	yH6z+vFy27JBeRt8eDTiA78VCROud12iWhr+zzkcoYckRdpFVtRjRqf1CEQ/sjhjzyS4Y3BgmUnkW
	lVZ9cNGV6wPxjIvfFWIcOLjYa11f8fi6rR+seD+7HTOG2zUORi3uJQEj6/6AEnZWktZxV8Czpc1k9
	B82A6fYg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgnWX-00000006p3U-2148
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493ae2a6a72so28401425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360467; x=1783965267; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTOOUtsfqb4l+gJAMFgunehBcfSR/NR1FIZMjayX2WY=;
        b=M/aXkMvm2kMv9BJWFHvMiuGXXHJcBoPFtOg/HxzZuXTOj/0cTXNnN6XLx+t1NqSMz1
         cs/H9LTJvg7NXZV4WmzEh1VMxqduiDFhkm5qqKTPyK1rniQec2acpyqQHgaD5iBOwNRO
         oeG2GSZP3tQ249qtaaI+UDmP3Z+BAy1QPEYJII9FAYeKUaocOZsx4M4tgkQ9AYvgRM/q
         5Ym9gkQpIafCcExkLL3xybtXC6rBLWYAS6fbltsb/4OT9ZGOvc/vi3onbmoy3olqS6rZ
         VOMDpgciG4SK4i33i9FyQOX3GE9rsQsrVzcdcIbGakKmM+E7wX7LCgiRXQnATJlcD+se
         i7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360467; x=1783965267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTOOUtsfqb4l+gJAMFgunehBcfSR/NR1FIZMjayX2WY=;
        b=Qz5OaaBcFfamTxlQVy+NT8q8Tm19HK4fKhpW6a1YLeoKdpuy6iRh88/7JGtgKvNldF
         10jvoR7PkU5Z6X4qrx6EgnxNvJPiJvB1/ZfR1QfN5kEbcce8Kgb2Sx6YCAke+RQ/KYlf
         4X6nMaWBO9GhnHfb2ZvEvVKKnznQpdjGwB6miDHF2jP+sCTAUwK1qSZ8OdX0+5v+L7Xd
         Cy8bAt7dQvA3rpbGfn9N3GnYgfg5U/K3T56Dro8oQ7UFJP8XCkdaJdtzNRx6BtOhJgwV
         WtE9hWwIwq0tWHyeYWlhTBl3JRbtLMJ35P1p9CA+qNng2CeCUE6prsX6Y2U7YRHGI0a1
         sHbQ==
X-Gm-Message-State: AOJu0YznubCK7cKEoIBJqUOOEp/CGB1JudxnUdlwtT2djVkO5DswkNLn
	N7Ba0Svu6r3c0/ehDpTvWoaimnU0GgbRUR4upYg+RB5pW+meNI8FX4Sm1ZvbZ3jy6BP9iMmU/hl
	lwKlwJDtB247KFAWZPcLDAg==
X-Received: from wmng10.prod.google.com ([2002:a05:600c:308a:b0:493:c8aa:3616])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3153:b0:493:de4b:de17 with SMTP id 5b1f17b1804b1-493df06b036mr19445045e9.14.1783360467395;
 Mon, 06 Jul 2026 10:54:27 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:02 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-6-vdonnefort@google.com>
Subject: [PATCH v2 05/18] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_185429_557871_DBA23AC9 
X-CRM114-Status: GOOD (  11.43  )
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

Although currently limited to guest stage-2 page-table allocations,
struct kvm_hyp_memcache is a useful primitive for passing a list of
discontiguous pages between host and hypervisor.

Introduce init_hyp_memcache() to initialise a generic hyp memcache, and
init_hyp_stage2_memcache() for stage-2 specific memcaches. The generic
initialiser will be used to top up the upcoming pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..caea8e9986d1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -91,9 +91,22 @@ struct kvm_hyp_memcache {
 	struct pkvm_mapping *mapping; /* only used from EL1 */
 
 #define	HYP_MEMCACHE_ACCOUNT_STAGE2	BIT(1)
+#define	HYP_MEMCACHE_ACCOUNT_KMEMCG	BIT(2)
 	unsigned long flags;
 };
 
+static inline void init_hyp_memcache(struct kvm_hyp_memcache *mc)
+{
+	memset(mc, 0, sizeof(*mc));
+	mc->mapping = ZERO_SIZE_PTR; /* Prevent allocation, solely useful for stage2 memcache */
+}
+
+static inline void init_hyp_stage2_memcache(struct kvm_hyp_memcache *mc)
+{
+	memset(mc, 0, sizeof(*mc));
+	mc->flags = HYP_MEMCACHE_ACCOUNT_STAGE2 | HYP_MEMCACHE_ACCOUNT_KMEMCG;
+}
+
 static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
 				     phys_addr_t *p,
 				     phys_addr_t (*to_pa)(void *virt))
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..fb38821f2037 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1159,9 +1159,11 @@ static void hyp_mc_free_fn(void *addr, void *mc)
 static void *hyp_mc_alloc_fn(void *mc)
 {
 	struct kvm_hyp_memcache *memcache = mc;
+	gfp_t gfp = (memcache->flags & HYP_MEMCACHE_ACCOUNT_KMEMCG) ?
+		    GFP_KERNEL_ACCOUNT : GFP_KERNEL;
 	void *addr;
 
-	addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	addr = (void *)__get_free_page(gfp);
 	if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
 		kvm_account_pgtable_pages(addr, 1);
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..8324a6a1bc48 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,7 +111,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	void *hyp_vcpu;
 	int ret;
 
-	vcpu->arch.pkvm_memcache.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
 
 	hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
 	if (!hyp_vcpu)
@@ -172,7 +172,7 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_vm;
 
 	kvm->arch.pkvm.is_created = true;
-	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	init_hyp_stage2_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


