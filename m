Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE221606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0RTPqAlp;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VhTsgYoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FrKaF8369FUs2Vi+hmG02tOP08987jT6Bv1rZZj0tP4=; b=0RTPqAlpuBRQ9f9NiDwetV9g+n
	ZTLxrOWAUunf8RxqBAHxNR/S2RtFy4+/9UtDSZslyYxH5I1n3ktGBk/RX3g972pNnfor+toeQdV0r
	SNJ5NSTu8npsqT8Je0DtWRycF+fNVJj5P58GQT/uu/70Nx7uv2xVwGQ4CsgeZGvBMNCVtRJejyYXn
	aVk9MMGwCR4gOkMtydc5Rc1PmF4+/QgyYcYk6176YyeQoIlB+017M6ND6Vh40nFpPO3lm5WiiIVVg
	B14IdUOm5l6eVdfAq97fQLiFJpgapr4lsmMPjelgJPoFSBKNUg75UAzl3k53qVKnGoGhcrDd+6qhB
	3RZywOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywJ-00000000OA7-0q35;
	Mon, 02 Nov 2026 20:47:35 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw9-00000000NqJ-17Rh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:30 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a2b0669946so24735115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652441; x=1794257241; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrKaF8369FUs2Vi+hmG02tOP08987jT6Bv1rZZj0tP4=;
        b=VhTsgYoej2XJ570d6+DuNQskDKI39J3Jg+i4FvkCHlmWx6Zeqh2w/S9mAB2pryZj0f
         sg+UYjU57F/RQ/tuvqKV/HvteFdWAGqp1dRKnpFgkZDwYvrPqJoevlwjO+nNucINQvhc
         NaYWfxBM6rM7q55UToc9CXlFvZuHfUhY2FecF7UR8s2w1aM/42fft8W1KG/cBe1Tmg+X
         c5hgC2ivxusL56rBYo654Y9WZUmWXVXcMlaIpSWWL3qXg460hlDax5Idc3yRaIcrYdna
         5oHBoinNwUhZ+gQkm7DSWGYRvI4dMOj6lefpFD05X58FcVkiUOEz/5t6oaBa6fp/YNjr
         ZRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652441; x=1794257241;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrKaF8369FUs2Vi+hmG02tOP08987jT6Bv1rZZj0tP4=;
        b=lrwLyE8iaSUiA8bcCnAuqPPJ+dVLeL9VcFSAuXG6itSgs0Xz1ensgBUlmZ3upjOn95
         9J8k67QUXqA48OgSjcncW/HsIhzY6MzxbhyCTf5Qj/mE6JKihKANF3upGpp4FOlIsD7c
         uUTKJef0TEGntvhEkhAh/GesTnfJMha6ZZmo6ErbdFe0KBn2Jn+sfTp3rfgc2i9zcUQ9
         zcNa34k1kVqG7Un3ao2zxeR7bnPBw6IFmN+1ePkr7NEtfZjTdkTlt9JJZHH4RNnAeJTh
         zMwuGSYolWiKsUxwN0T7ni61tfZiYX+D8jpV8NgKZE4Fa0dUN88zPbbj8ZRStk9bUteW
         jXDA==
X-Forwarded-Encrypted: i=1; AKwUvBxWhD9DaAGboaKPmaSD3iMvcw+RWDequ66ZsTeJOlgmoE/FJ5CIEhwY9f0NA6vdIzIh02kgnVtHUZQWeRXQe5X2@lists.infradead.org
X-Gm-Message-State: AFq9FYKwKECg4x3CVRicbLJS0DJwc4e0fZnAbiZbOjT1VoeB2+e/zfcH
	UNrqNVIolFdHTVRrh5U8ospc8qccmg6QYLf7yC3MxexFoc1MYirO6xntRK5ibZXqhlIXTMpj2MP
	9/HnZTWA1fH/9UdNseVHizw==
X-Received: from wrnb2.prod.google.com ([2002:adf:e642:0:b0:48e:579c:a0fa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr258596025e9.17.1793652441187;
 Mon, 02 Nov 2026 12:47:21 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:23 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-19-vdonnefort@google.com>
Subject: [PATCH v3 18/23] KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124727_409590_4174E12E 
X-CRM114-Status: GOOD (  18.71  )
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

The existing kvm_pgtable_stage2_split() is unfit for pKVM: it relies on
kvm_mmu_memory_cache which pKVM doesn't use and has no easy way to
handle pKVM-specific annotations.

Add the pgtable helper kvm_pgtable_stage2_table_install() so pKVM can
handle block splitting in mem_protect.c. That helper can take a table
either populated with kvm_pgtable_stage2_create_unlinked() or one filled
with annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 12 ++++
 arch/arm64/kvm/hyp/pgtable.c         | 85 ++++++++++++++++++++++++----
 2 files changed, 86 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57cd6ae4..587874c3a525 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -835,6 +835,18 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc);
 
+/**
+ * kvm_pgtable_stage2_table_install() - Replace a stage-2 leaf entry with a table.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_create_unlinked().
+ * @addr:	Address identifying the leaf entry to replace.
+ * @size:	Size of the block to replace.
+ * @tab:	Pointer to the pre-allocated table to install.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				     kvm_pte_t *table);
+
 /**
  * kvm_pgtable_walk() - Walk a page-table.
  * @pgt:	Page-table structure initialised by kvm_pgtable_*_init().
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index abd32e94f6ff..19634e5ec555 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1537,18 +1537,38 @@ static int stage2_block_get_nr_page_tables(s8 level)
 	};
 }
 
+static int stage2_table_install(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				kvm_pte_t *table)
+{
+	kvm_pte_t new;
+
+	if (!stage2_try_break_pte(ctx, mmu))
+		return -EAGAIN;
+
+	/*
+	 * Note, the contents of the page table are guaranteed to be made
+	 * visible before the new PTE is assigned because stage2_make_pte()
+	 * writes the PTE using smp_store_release().
+	 */
+	new = kvm_init_table_pte(table, ctx->mm_ops);
+	stage2_make_pte(ctx, new);
+	return 0;
+}
+
 static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 			       enum kvm_pgtable_walk_flags visit)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 	struct kvm_mmu_memory_cache *mc = ctx->arg;
-	struct kvm_s2_mmu *mmu;
-	kvm_pte_t pte = ctx->old, new, *childp;
+	kvm_pte_t pte = ctx->old, *childp;
 	enum kvm_pgtable_prot prot;
+	struct kvm_s2_mmu *mmu;
 	s8 level = ctx->level;
 	bool force_pte;
 	int nr_pages;
 	u64 phys;
+	int ret;
 
 	/* No huge-pages exist at the last level */
 	if (level == KVM_PGTABLE_LAST_LEVEL)
@@ -1590,18 +1610,12 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (IS_ERR(childp))
 		return PTR_ERR(childp);
 
-	if (!stage2_try_break_pte(ctx, mmu)) {
+	ret = stage2_table_install(ctx, mmu, childp);
+	if (ret) {
 		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
-		return -EAGAIN;
+		return ret;
 	}
 
-	/*
-	 * Note, the contents of the page table are guaranteed to be made
-	 * visible before the new PTE is assigned because stage2_make_pte()
-	 * writes the PTE using smp_store_release().
-	 */
-	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
 	return 0;
 }
 
@@ -1620,6 +1634,55 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	return ret;
 }
 
+struct stage2_table_install_data {
+	struct kvm_s2_mmu	*mmu;
+	kvm_pte_t		*table;
+};
+
+static int stage2_table_install_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				       enum kvm_pgtable_walk_flags visit)
+{
+	struct stage2_table_install_data *data = ctx->arg;
+	struct kvm_s2_mmu *mmu = data->mmu;
+	kvm_pte_t *childp = data->table;
+
+	if (ctx->level == KVM_PGTABLE_LAST_LEVEL)
+		return -EINVAL;
+
+	if (ctx->addr != ctx->start ||
+	    ctx->end != ctx->addr + kvm_granule_size(ctx->level))
+		return -EINVAL;
+
+	/*
+	 * On success, return a positive value to prevent descending into the
+	 * new table.
+	 */
+	return stage2_table_install(ctx, mmu, childp) ?: 1;
+}
+
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, u64 addr, u64 size, kvm_pte_t *table)
+{
+	struct stage2_table_install_data data = {
+		.mmu	= pgt->mmu,
+		.table	= table,
+	};
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_table_install_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &data,
+	};
+	int ret;
+
+	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	if (ret < 0)
+		return ret;
+	if (!ret)
+		return -EINVAL;
+
+	dsb(ishst);
+	return 0;
+}
+
 int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      struct kvm_pgtable_mm_ops *mm_ops,
 			      enum kvm_pgtable_stage2_flags flags,
-- 
2.56.0.385.gac671c819a-goog


