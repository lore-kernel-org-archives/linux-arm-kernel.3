Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A368606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0cO+cOpc;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=innBnR8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M0SPwlooo8QFrnwNZf/PyV+WJMNWJ9T5R+ygx0SnAo4=; b=0cO+cOpcsZO4+fyck0JkECqan1
	w/KPLOtcQLcbswPQsqeDdtcA29vu2yfoDB6fhJFlAnNiUchpbGeeg/DlulAPqOBVz1baNonqPmJBi
	xwyHz7jWNPx1HT+C/CHQEHxlPXVq2ScEyezG7wH5QSpPNYl05RjwB7zJ+zm78+LqSNlOhb0+d0qvv
	8afVhaxu5fD2azV0gLGC2sNDpsnZQ/0J23hTxJvnnvWB+ooIj3dCW63aEOfmAtg8z3Vvfc8MXHqnk
	XWGASAjaPerz1hCkrxt1hLCmER+P4njYdlCa+P0q7IEvI+UXzbARhhmzJLHIBurCQSOZXkTcAB0lO
	LwdqtzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvt-00000000Nbm-2sEE;
	Mon, 02 Nov 2026 20:47:09 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvr-00000000NXT-1ur3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:08 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so2419289f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652425; x=1794257225; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0SPwlooo8QFrnwNZf/PyV+WJMNWJ9T5R+ygx0SnAo4=;
        b=innBnR8ea9dH6etJ4rtb5nJ98r4NUFIM3K6jNfn1xLsZJNZ6v0HyF9bMCZD+uwJJUB
         oSeRAqRXXJA3Np+nRD4gFX2gAtQFJYWXnp/atx5at95gkX+GyHrbIQ6P5sYfHBHaCm6p
         4qvWy74jliDGqIu0+h1y5ZBx4Ec0W6nGeV5MBLAxcIzQBvC9DGvW9Bjf3CsPiFimGP31
         PbtE+cp3phXEg9Pb65EELSVqAg7sE+5GbmFKNgU1EbcH/I4yNLL9Yzb8PcVMfjD92tIG
         /O9/b0tgJA0k/PFiPZ1xK8uMP67lw4bRr6HBHdlTmnFQVPicGaU64kAFH7gdfa7OjgWf
         Mn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652425; x=1794257225;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0SPwlooo8QFrnwNZf/PyV+WJMNWJ9T5R+ygx0SnAo4=;
        b=BhNqsbg7O3RD8FpTzS2wk7qis8eOwpTPsKPi7iiV6JhL3kHmUH+rDoYdHrw1nFRo9b
         EYzv5sclOifRNIpHUYkZhE5J217B15v8dmn/PUiox3p9lvrc0mVtyfyvti8pT18aN5iq
         lrdWhXQz7Z+VFpfJX1A+RrcAvW8NI9xwvXfySx+huCj4BJngN3T7e5maVqQsqMyVlMqa
         y6T+UosfkDa4HzN2i/khMYqpZcKzxr79vu9zInoh5Mc0yaYvJ/N7BK9mYjHW0Zj3Tg9H
         aBmwnRnpUx9SkPCcA/ocZs1ASZwldvKtQZy6k+mpF0ZKOYkGAfWhB946yMrU9G33c3mU
         T54w==
X-Forwarded-Encrypted: i=1; AKwUvBwN+pKUsz8diB8MGTvUJZyNJ5U+kH4urgxe/eEZvDy5WJJcL0rQkGB7UBRxrTjvvWUD0OXBSemrZN68s+N4pOpK@lists.infradead.org
X-Gm-Message-State: AFq9FYL7PRH+0BN/En3pzQppA88tBHvlnYccAkRFtmNYdxQamEATHyLN
	Il/06Z19UmCkjORSqqlfVL9pAiraDVk2CHly6hPRDYyyw7rKHuBqtEC0NAz78Q38jv3/sHI3uv2
	Kkp1snyNoyUQNPzxv0sWeWw==
X-Received: from wrxm15.prod.google.com ([2002:a05:6000:8f:b0:48d:ed12:7c4c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr268972445e9.2.1793652424698;
 Mon, 02 Nov 2026 12:47:04 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:08 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-4-vdonnefort@google.com>
Subject: [PATCH v3 03/23] KVM: arm64: Allow block-level stage-2 annotation
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124707_501598_DCF69E03 
X-CRM114-Status: GOOD (  11.24  )
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

On host to guest donation, pKVM annotates the host stage-2 invalid
entries with the GFN. Now that the host stage-2 preserves annotations on
block split, we can allow these annotations at block-level. This enables
safe support for guest stage-2 huge mappings.

Allowing block-level annotations also reduces stage-2 fragmentation when
unmapping a huge region, and reduces host stage-2 memory usage by
avoiding the allocation of intermediate page tables.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index bf5c8e75dd52..abd32e94f6ff 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -949,9 +949,6 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
-	if (data->annotation)
-		return true;
-
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -1180,8 +1177,9 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	struct stage2_map_data map_data = {
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
-		.force_pte	= true,
 		.annotation	= true,
+		/* Pretend ID-mapped for kvm_block_mapping_supported() */
+		.phys		= ALIGN_DOWN(addr, PAGE_SIZE),
 		.pte_annot	= pte_annot |
 				  FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, type),
 	};
-- 
2.56.0.385.gac671c819a-goog


