Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7AvyGK6;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k/MZi71N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N9/aAcI8tDrlGXTuOLbUQjQM2gmmk27o5OqCSTvv6zc=; b=c7AvyGK6pEABnI6jP6F2a5psVd
	ukLljD2Ly0qbHEhwb4LVv9vlPrLKwItdmfJo8xbY8DCkYg8twxZi+DvzDWDcF7ER+cqujwHE4pIeO
	Sb15JbZe4FP7vg2FbMiX088V/E6KbqB2OadRQiZLdo0rEDe+HaVS9P8okqQfecajKpXvfjMLRHJZt
	wZawoXiKXFEFAP3aR5e1TuAeDWwVugXfNTVTYmfuuc++rx4k/NmBV7dc1SIuFxiRpyvZb7mtR5zSm
	mLD0LIM8hYYMoHc/AqPtfj4z25vj9EC92SQc7Q7tLJPwXORnp+x171qzl5ABP5T8ghGy7m5TJnC7d
	hqSDjMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvs-00000000Na3-2GSn;
	Mon, 02 Nov 2026 20:47:08 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvp-00000000NWU-1S68
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:06 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48af4046a3bso3371926f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652422; x=1794257222; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9/aAcI8tDrlGXTuOLbUQjQM2gmmk27o5OqCSTvv6zc=;
        b=k/MZi71N7O4dOqGA6McYXRGAY7svJPk5bt5Tvb3jtQU+dyhVt2nnwhP4xbbEno7QZv
         J7jpdjj6PZ3aEypdwPPq8k2AIMgYTt5u7itJwlc9Q8fdXE794e6tG3+BDcbvCKcprvBS
         kGvE9yOIZmdaI2s0h5rrF5SonSHiDMXTQ9n1kWv4jn8z3G0NkurQuiqqd2JJe8D/n5Yf
         mgWA5GSrCxVsACrDPQRRXLwwx1W3sUgHKensy1zg+hukSwphVWRQ0qn05gpqoyPK5HfP
         boCVY9tn5gHbkV1CYHZPXszDItHe6vQDdsdfNabISDUohDmepsBDyXvjga8g9kPzEJNh
         jnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652422; x=1794257222;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9/aAcI8tDrlGXTuOLbUQjQM2gmmk27o5OqCSTvv6zc=;
        b=PbYGTHBiA/acIADLgc+MUXY9oj5kJMYQxMTDrF/b/LyZ+NdXG1L3zpIG6yjPeIWLBf
         GSqM4mDcSU99TOZKZySpYWKFWfP350ieQO4SUAmr4JlqgdeiI2hEVYrX/XPpN5vLNdDp
         QQdOt77OuOKP+KUR26l25UG7D0gvoXOB8ts1M3O0FKSPueLg5KB4EdVpXvVEZ+7fkOdh
         z/kwOM/4R3498imuOPNN2Qn6j45d1WIAm0nr081VrCpT4V8ew+JxqFpw9q4XAgaJlFuY
         VMGM24kITSaKFH+bMzLwq8hSXNvPqvK9K4Jg9P4HirR6YM7QOjYIpHed7FnkLu4K8o9z
         oAVw==
X-Forwarded-Encrypted: i=1; AKwUvBwYxGKVaPE4OJJMtZ+5dFI/LRT3C6Ba053MKgyKjwqaZru3UJH8NddV/p2NBGQumgOb8vVixNH3CtAXUCtof8kC@lists.infradead.org
X-Gm-Message-State: APuU4Z/oE17UCYUtwu6ghTbuVGz7no0u2WRqY/A+RjCwkxqhLIvhkPoz
	m6c0TP6x/HMWSFpcfDUfrAX1XGJypWF6Tv0ryanjip4xz7t2Favefk/gyGHcYaTAaWVaaJpOHKE
	D7Cg2hl43iAUF9p0iMKE9Fw==
X-Received: from wrna10.prod.google.com ([2002:adf:e5ca:0:b0:48d:f161:cdaf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4810:b0:48e:f8d:8cab with SMTP id ffacd0b85a97d-48e6e2bcd79mr27169760f8f.4.1793652422051;
 Mon, 02 Nov 2026 12:47:02 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:06 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-2-vdonnefort@google.com>
Subject: [PATCH v3 01/23] KVM: arm64: Prefault host stage-2 entries on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, Keir Fraser <keirf@google.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124705_422833_F80E7871 
X-CRM114-Status: GOOD (  16.94  )
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

From: Keir Fraser <keirf@google.com>

For the host stage-2 that is idmap, we can avoid lazy-mapping on block
splitting by propagating existing valid mappings to neighbouring entries
of the new table.

Signed-off-by: Keir Fraser <keirf@google.com>
Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b184d..dfbcdd3d91a4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1032,10 +1032,52 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
+{
+	kvm_pte_t block_pte = ctx->old;
+	bool counted;
+	u64 pa;
+	int i;
+
+	if (!kvm_pte_valid(block_pte))
+		return;
+
+	counted = stage2_pte_is_counted(block_pte);
+
+	/*
+	 * Shared walks not supported: cannot rollback refcounts on break
+	 * failure.
+	 */
+	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))
+		return;
+
+	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
+	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
+		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+
+		/*
+		 * Skip ptes in the range being modified by the caller if we're
+		 * installing last level entries. Otherwise, we need to
+		 * temporarily put in a valid mapping to make sure the
+		 * prefaulting logic is triggered on the next
+		 * stage2_map_walk_leaf(). This adds an unnecessary TLBI as
+		 * we'll presumably re-break the freshly installed block, but
+		 * that should happen very infrequently.
+		 */
+		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
+		    (pa < ctx->addr) || (pa >= ctx->end)) {
+			*ptep = pte;
+			if (counted)
+				ctx->mm_ops->get_page(ptep);
+		}
+	}
+}
+
 static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 				struct stage2_map_data *data)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
+	struct kvm_pgtable *pgt = data->mmu->pgt;
 	kvm_pte_t *childp, new;
 	int ret;
 
@@ -1053,6 +1095,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!childp)
 		return -ENOMEM;
 
+	if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
+		stage2_map_prefault_idmap(ctx, childp);
+
 	if (!stage2_try_break_pte(ctx, data->mmu)) {
 		mm_ops->put_page(childp);
 		return -EAGAIN;
-- 
2.56.0.385.gac671c819a-goog


