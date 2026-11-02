Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F0D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g5uxfIFw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZLbLYqrG;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAQkwBuo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DdPclGcz/C8ziGiUWCbTieOEXG2PqBiYeYgzWvSzdrs=; b=g5uxfIFw0QcfkMNmNA0lbCJhGm
	tcWbgtLwt3p+cindZVrPXMBo4icMsLzJHCePqOIyOJnfVeboFjwGu1naQh03eZwa7ulqsKpxqRgXP
	NfXKAY4ICfA2nlKpdSRqC0TQtommxd2FxicC55puMSLNqiA39JzfO+hmTJerTck5qzMQJoWQCZJe7
	HeB5a5ogvoBSkirPGrgbeK6Cwaw++ImFfNj36BlxoPHLqtAJhgg7ifb4YbVHBsHosUq9bt1tcu7uy
	jU/Jqf9Kc+HR6arl9vXtsX2/elxOhGTfvjlfmnZmXoc4p1cmCzczHzG45J61koVvJKLWkzsUpYrh1
	LgpTAwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyxq-00000000POk-46Tc;
	Mon, 02 Nov 2026 20:49:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyxq-00000000PO6-0XXj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 20:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DdPclGcz/C8ziGiUWCbTieOEXG2PqBiYeYgzWvSzdrs=; b=ZLbLYqrGAT920uI3cb5Qkmb5+C
	4OuV+tHqVXupqxxCKWXTgglkn1ExiJVZIPdObKsAjxWUxdM6aqnf+C4rLYpqNtNi1RWer3I1bgpfC
	KMSMkAN9yq18NeJ+UOSaZXnPskxEeRiBt2+t07nrdnZjYF5j3tAyUG1yhke9T+mDcGBdRmPGMOdSu
	QEPQFltENcUrPSlB+bm9+8LBxUsg9vCK2VTuVb/NanARi+MV7e/dOKsgIm/VeEopBSBnZMmP+vC3B
	dQcw7YK/2Tlgf2Va+GPxtnECIEzZe7j0nJv7HdVi/JM/4Yw81R2Nb7GmIthsmIdlfG3SYCV1/p+iY
	hFRcANVw==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvq-000000035Sd-2TNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:49:08 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso7417655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652423; x=1794257223; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdPclGcz/C8ziGiUWCbTieOEXG2PqBiYeYgzWvSzdrs=;
        b=QAQkwBuoaPnEC4sp/wLNErW1CT93bETeNYsILK+xmQfEt6vc2GrEnV+YL7xbxgcFo7
         /Pr16F5e3PjmucobUec4Z0D9NLns+JyEfK/6x5DCdJa0pVoJqO7J1ivh+YlL0RlTyBgo
         d36et3MmqCMwOZyP0fqgu4Tt1XQGU2dH9p+i2SX00K9t6RyQCpvvMijjMBfwX4v2AyDf
         PDZhPByaBiZHhrJU16LyxnJXoB9URneg27mE7J9jhTs76V+9kkMcfOCQFPo/VZM2oV7d
         azxoU+9CYhwcG0aAoquQm1/e6qAHr9Q0UZVCA9szNtfU+TOdd7kjL8fNllQMtPDmy9HE
         DJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652423; x=1794257223;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdPclGcz/C8ziGiUWCbTieOEXG2PqBiYeYgzWvSzdrs=;
        b=HnlRh+77Qnw5vxmU0QYk5ldit796FGD8i9LSoq1bWFUXTQJUnfHkrnU7JHRsrL+8Rb
         QH4yZsyOzz/Xy9YxBqCiVJyfGA3UaSYiZgPH4OC3IGA5dASao2QFvyrejr8PdkQierZX
         aK5T9i23Q4Mt3ebg3H99mSRpyd1REcJN/7fsGcrk3bq6ivx03FBh+QwpoQUTsZLuiEPO
         z5FaljLBAybxcNeiGSGgRark6NkmtEmCFyod+m8b5L6FcoAxWx0O3/Jt2tIcA0awuwqW
         ez9qXra0aV7X0UKkQNz3IIvCzBCDPuevJZIuXQSSGpFZ+FLSf2N8ujrmeimt/a1hiE+i
         U//Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA+l7nkoI9C/Jo6lpCSpYKvMl7G3a8Ud3z0R4j7xukKoxTTF0nY8q/4+y8hjYlsRofkSJuP59fzUIPRcCNwLZX@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8rvPFW3/+555j8/iZEKnc/J7gp0jJDHWGZFwZP5hTps1GRpoQ
	qJSE5nFoRltd44BdAyHKba9vWil9D6jDjtD0tMpG3zKlSridMhC//2nXauttKeFed0QcD2vHUhE
	t4g363AFqrz4ZOzwY5Hv/dg==
X-Received: from wmco7.prod.google.com ([2002:a05:600c:a307:b0:4b2:2ec5:89f8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6992:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4ac18992c01mr253389695e9.30.1793652423340;
 Mon, 02 Nov 2026 12:47:03 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:07 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-3-vdonnefort@google.com>
Subject: [PATCH v3 02/23] KVM: arm64: Propagate host stage-2 annotated entries
 on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204708_415014_56E0A51B 
X-CRM114-Status: GOOD (  14.20  )
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

Propagate ownership refcounts for invalid stage-2 entries mapped on
block split. This intends to allow splitting host stage-2 blocks while
keeping existing page ownership and metadata annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index dfbcdd3d91a4..bf5c8e75dd52 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1035,14 +1035,15 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
 {
 	kvm_pte_t block_pte = ctx->old;
-	bool counted;
+	bool counted, valid;
 	u64 pa;
 	int i;
 
-	if (!kvm_pte_valid(block_pte))
-		return;
-
 	counted = stage2_pte_is_counted(block_pte);
+	valid = kvm_pte_valid(block_pte);
+
+	if (!valid && !counted)
+		return;
 
 	/*
 	 * Shared walks not supported: cannot rollback refcounts on break
@@ -1053,7 +1054,9 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
 
 	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
 	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
-		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+		kvm_pte_t pte = valid ?
+			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
+			block_pte;
 
 		/*
 		 * Skip ptes in the range being modified by the caller if we're
-- 
2.56.0.385.gac671c819a-goog


