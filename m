Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XNTyv5cM;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YNkvTx5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=; b=XNTyv5cMQLRKmP
	cMU3SdXLdooPc867JvpAK48LrHk8jbDRTXc5zP+QMqM1pH1RmBfPvuKE5JopftRn1pK6pP9p91/Yy
	RSQnvtmrk3mtskkOUz1eR9ggHzwCEcrGP61J2k0Oxl5NjYD1MyBgrsI/4S9dhXmr/YPxD8Zg3b/pH
	a57riZnCXlGo6sgvjcRJmv/SSHYUDwLSL3IItU71+uEXZMpg1Y7eI6ERMV9b3yU9XyYyK4SxysqC/
	LNRoA5fVw8POfy9vGhOgJtPPYzzFpHlbvKwmGvn1aOnmUskLF9CwEMtDS2+Wauzkq+cx4Y5coRVXS
	P7qOTJ0gALtCjw1jQb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHl-0000000Bpae-0uNp;
	Fri, 30 Oct 2026 14:08:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHg-0000000BpWN-02G0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e608cd460eso4697835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369322; x=1793974122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=YNkvTx5ZOjzZu2r989uUxJOVTEx56ms+Y6SbWFHRuI+M5chowtp+qtIYeGepJC1h39
         B4v003AlZVfOUqeON6vzZqp/dfOujYVJzlkzEfsZOAVC1ppLgSKVOZ+Db7LAXFvwrxAg
         1uZnVsEbHdUt0Dd0r5jnjRllbSLR/8XV8fLlFxoiUgSnfMHhBBRgILOdHH/a+uHukGDJ
         iVVyV8Q+Vrysw30ewiFTFfkxhBohDRMPpNFsvA2G18YsIWgvEyLB+5CkifbvHJBVGot1
         5CRzQKBKgPZxCXqwHmNnIKJ7VLjjFuY8+xXpETwQL4uysHhplaEwmnKk7T0IYNIUaCR/
         W7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369322; x=1793974122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=vX1h6iu6K0oGDvTyPx5+liSah/WBfbT6pNPWdigwqzCZjoFbHzsa92byFSz0cMadI5
         iR6EGFqtffFD9dNsCpgqybpJ3XZKZB+HrovP6zwziz5p45++8z2sFYQbb8qCrhp9p68j
         TP3tu1xJmNIFZZMob0mSsOPL9YoZC8ANUAFI+kcOlTUZLsyJFKPre0CLK+9kKm6tNS62
         Ej3O1YGaCtj1w/TcIbUKR+gT4Pns8Ck6/+5PqiHCEdGya3lLJf7QKPvxF4998IiEidao
         DDEsRlpmT46jkv6jtShNchbpciE2NlDJqh4Cgv1XM810q4s4jygf7sWo61DjphTvY7Xx
         show==
X-Forwarded-Encrypted: i=1; AKwUvBxUhPf9PKxwlS6Mb5qURpdJ0GpmD18qt4vT1NVj2HHTm4Er3UhE247QlBdqu3cxoLlDJpM02yEYt2QHHDNKz90i@lists.infradead.org
X-Gm-Message-State: AFq9FYK68q3tYBIt1cHh5WKlK1FqiarEjHcwx0ai5CH5DpFV3Xre+rsn
	tqBsqeDM6PnzE5T6nqvKcT2L0U+g3PkJleRBQTxn15/x2UBaUF/s2hRG8Rw2b7WNvaU=
X-Gm-Gg: AYBFou1Uu6xco6ZB7+mpEXzdu4pkUhD6O9ur7mXfhJ31KdelpDrN6fgJasWyRNcVVNg
	zi6LUY+xGTDxzRaY6Mjbgh2b9eXQIwkS/Gus86APlPCQQvitYL0jVr8AYxNua9bdzjPHjgZW3Pg
	sPLzOlbB48ICHSOUo05bVAZIxfYjvrLt9SVSaIT1ihk+hSfaXsTH5vy59X+4Wxb0ogCkhFo7VdA
	Zh5zu3FluLOyCtbdNbCw9ic6bi2Uek9sTUlQSChtYuAV3MgX1PYwccj5L3B5ciojoQ/BnJxPFI5
	sbVNtTu/9HC3jgAbQoEyt5guCCYRXsaUtYVcKZyhTdIOTHLopW3QPLIAoOkvfdfzwzmQtscxIFl
	XG+u1+/xyWk+k2mcZl6DTO/Lu9YiU+OiqN/cWaF/L3qG+BlyLGhCG3kZDZ4t++L5ilpK0rzgUio
	pZTjLmJplKf/pQtSZXnymzahSypsaIQNXp3CABaTIaTjgN5BPJ1gRzwEx0FWn7eS2MkU9kzTOxz
	Kfn8Oh1s8ifQxzwW1AD/6nOg2PqSTholFXm9LSxM6UuQ2tI8QxIa7hDBVOAXKxNQdSF9wJyR9w8
	OWOUZke1eyNymZOJ8Q4rCRB5VUoe2MqLZwAyAR+xib2PGyQODbbN
X-Received: by 2002:a17:903:1a8b:b0:2e9:401f:f0f8 with SMTP id d9443c01a7336-2eb364e9f6amr24067465ad.53.1793369322301;
        Fri, 30 Oct 2026 07:08:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 2/4] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:18 +0800
Message-ID: <20261030140720.1256062-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070844_135544_AB828798 
X-CRM114-Status: GOOD (  12.60  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PowerPC no longer needs an architecture-specific vmemmap_can_optimize()
override for DAX vmemmap optimization.

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can simply clear the section compound order
there and disable the optimization for that section.

Drop the radix-specific vmemmap_can_optimize() override and rely on the
generic checks instead.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  1 +
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..509cc4190db7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -282,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_set_compound_order(__pfn_to_section(page_to_pfn((struct page *)start)), 0);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
-- 
2.54.0


