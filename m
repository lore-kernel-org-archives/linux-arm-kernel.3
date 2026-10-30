Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnxjdLwC;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C1mDg9bM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=; b=TnxjdLwClG9Vr7
	CWgLwg5UklIPmesAjqXm4Fzqor8ZNrIcmfXB3pWZ9KQrsz8ch3THEbHVLTF0TucSseoO31lB/3GIN
	Pen9lq2Wh0le1kDbxI2GGTuZohab6ZJTaNXVi2QtenPZHs5Jv3SZZFf58Gl/7LrUlos8xmGFmx3NZ
	qKzN7jM23q6zRKj5zInTIeOEDt/oez0/Ob3NxBxkIHjvYw53BcnI2iEINfp4Hjma9FgUZhCbDk0xP
	+WUYVAlomtElDkvJcWohJV3dwK1iA6SObrVAuJXP0yap9/DSP9AHuWnqT3KykRn/A5vVClssYh3TR
	DCa4Cp9dc02n+ADMzIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHe-0000000BpVq-2kxT;
	Fri, 30 Oct 2026 14:08:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHa-0000000BpUU-2zyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ea7987517aso5617365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369317; x=1793974117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=C1mDg9bMTGz/lz8r/yBbj+5X5AQgGq0Rqxuxk8h8gp5hZCAv+8nObcff1wHyStP1zs
         N98+gKZGa/6IypIkMtkvjZc/M0Jw+dNsHTE40KAzR2DbFsGhZoPSFFOgOTbAIdg8qrDY
         lJCVPf1o8N3UOOvlMgneDUFfcAtbLEgjwX6osX9QwtbHA+/RQaxNv9QqYG6TONkaCVG9
         VOkZWs152D74rSn39mOmSKlbVXgUHUQrt4XRakJmK5x2rVFpq36ymTI4QxUM2ikfP4/C
         nxIQTyj9+3Vu8I27+Tsu2kVPyFTyvwLrZhgLSmzTDnk/gqzSaPtYM5M/Q2C2wTFmPSnx
         k1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369317; x=1793974117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=uj1rfQ+ay8nj5GZrcq3teWN9rfw7C4CRrz9g/EPAMreNUG09RRhlnGu57Cefve5K4P
         A6Zm0LLO6bKiZkUpcZgELg784vH0QbWWTaYUwfJ+npjkjT4xsSzoRd2aOC4Weq9WIhF1
         6msYKozmlifhTceQayIKVtyKEXvGuLTo4USmliYUmJPdLAzTzOl2ef4JQh3j82mgwolb
         /G+yP/cgFQwrQmLCA3jcG5RDXnDfpABXNVSZOO+UXmpsCehdnMJpResixm2LP8IzoVS8
         6ryUFYRvaXZLvbJP0NUuYq96wxy9DNv0Crc1Cpf+Jbvahz6Qy9c7BYgAElAgkK0Oy+SJ
         fI/g==
X-Forwarded-Encrypted: i=1; AKwUvByiewDSF3uxu7fXb5c5ZGpzQ0Ix7BOH6WgRCQUffPCvrs9Rxku1RD/uq2eOOOwAFAlkF5K+bqY1fyxGxiuyJ3AT@lists.infradead.org
X-Gm-Message-State: AFq9FYIspmSnvU2uTpOshH2EFvOVVuseahG+EzWtzYAO+2LjdgCE3V1C
	+BH0oshmP0axuMnhBb1bm0x+wpiVpwPg05Xp36cjGyz6xOPnLti74YhTWdEcWQN8Ndc=
X-Gm-Gg: AYBFou04AwfGSkjmq3H7JdBC8mkda4wSg5aa5UALmLTdWHieJ0Vusq2P/fOujTFdFFT
	su5o8l83iycAPjBuYbdnEMMoOUZNoZOMUBe22rmMq4WdS9kvvXvH61eqaKv0ivdtfFy/iAmU9tP
	LuvFi7pWvxU4axH05kGLf8AaJY7y1gj+VnpmisIkTcRx/owgMhcq5VvP25DDZ+ffjN0XofU3Svp
	VdJJ5jWs1gR1OzkAL8iec0aZoJnuNrKEUgte5aN1pkkGoD3uH81R/Kf2/KLLX8gWPlNH1tp9i+j
	A+G/1J05m0UnJ/v6R24FgG4IiWiaa0V6/mgGlIfCyCbEONjZdno5dLmllYAwomWD5gyFi01FspB
	ZCg+0uM867ZTJCVIgHUbqoISd7dpLoAEUjCaqDJne7AODz2k2j0mlgHLP86uxtTIxl6o3QvlxJq
	Bs1rePu7SD2oxW7vWs1kcckPqect1ASWiRv+C83JgYCup0CmSRHmpHph7CwPqmX8P+w1DTIlvSh
	NlYmJQaSmtmvhBQB/lv6U3koIeE7c6H7IXiFsMKBaR2hqYdavg59HrDn0/8Du+kNU7flUD4VVtQ
	QEoaXqlN/s7qB4p9r6iBaLSyOzjUPt9IWqBmWzUN0uq/1haEmgU=
X-Received: by 2002:a17:902:e5c1:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2eb36414ef0mr26789535ad.5.1793369315295;
        Fri, 30 Oct 2026 07:08:35 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:34 -0700 (PDT)
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
Subject: [PATCH 1/4] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri, 30 Oct 2026 22:07:17 +0800
Message-ID: <20261030140720.1256062-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070838_935972_C788CA4D 
X-CRM114-Status: GOOD (  11.67  )
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

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0


