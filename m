Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44315606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z43Fkk8W;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ChJiIxBV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=; b=z43Fkk8Wj8MX+h
	x1ggz/QPBOXSyhpRLNnsqttWDXBYzAkuacb6GP9uz1NFhtTj1JLDUvjBX/oMwfUVdLVP4m2MKCEJF
	aHTPXmAZjT3O1vuefP7pK6IlszoV6m1kVaByvC9miTKTDqWNOHt+GB8AY1mhUdoP90JFGT75PjAaD
	HbpVFZsABDbJBsyRwoCUh9Pyln8ZCfnNMvyYDpB2fS5BJrzTYsBFD4kN5HUVnrleCexS+X5JOr89c
	94v34fytdC2Jtuk9H772ih9GGAETj/Kw9+dOwH7gBHkHYTJu9hcizCt6P1dWopCLnN8mrpzaR2FAZ
	cZeQoql/PfAzzBVcQG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiV-00000007vEt-1AKl;
	Thu, 05 Nov 2026 06:12:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiS-00000007vBt-3SNx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1320075a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 22:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859172; x=1794463972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=ChJiIxBVYJvvbMnv7ZPxZffu+gKyjTTLFBrndZhwErTOKjjnv712P9q4fbJJzr+fY5
         OcmuOn5ZzO9XEzcGyre4Q89ddrvZsuwVFd45hl0Zwz3QRhMr+gHaAY/Y2nEj0qAE+oN1
         KRqMpEDRhUNb4t4s49pVCcjHQdEbt4gnB0Hw+inAgXGInSSquDzaBR3LWxM+1XeNAKWL
         /1hHIxoAvyoMPURFtYt5IuUC1pUkFMvSc4syalHWaMaoLqUdB//XLYvL9rzQJAVCLJKr
         yTm19x0MhRWG16uk3OjSgT5bDsDiP/6be7OjkxqKmf2m06BO6ZlaA000MoIkqIhoaK1D
         HF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859172; x=1794463972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=ZgkYDU9MwHvg686a4YGjvF47Cxf+2pCebPnOxrQTckvyTXUueg8ldUB+A7DQiJtZcF
         wTlS2SwWBrXNraniaPFAe7bDhmqY20xowIwkWmAbT4XUDrLRF3BNlFiBubGuv/bd0WeC
         s23X74DyeZOxS8Y2ObqMi/i5nFaO+AolOLbKnBGIgDRSL76hH+K4FzcHsb2TK2M3Sjjo
         DtrQTD5ttIe5ORPqHfkioXU3yb21lgdVw7VxvbsNeHWBnjdXWEiKgfWVB7o6o4BppC+Q
         KSnaAgADGkDxbJU25t6mB+mL7DSZBcYyN5V5OWNqB6soTweWWhYTCIj8BcEwVcJdVXz4
         04CA==
X-Forwarded-Encrypted: i=1; AKwUvByIEHgxrhekpr63FputChBm5BfMvYnIrZG2A2Nu9l+M9GsR1Ig0Ysek3Vic0xaLYZk0GC93hcTvkAQVL8a+piZI@lists.infradead.org
X-Gm-Message-State: APuU4Z9g8AsYn6349qbT9CAOXBZdIStzzNTiuLm3tkhZCuodwkGF1vI7
	V42ygLIsYej4s0kDKRbbFF6h2QlgyfmPR1eb393zzfhB3cM8Bzh/aCT+lkMRqBEVhoY=
X-Gm-Gg: AYBFou1UNO2uEOybZX5ddcNVtAbgbgh7PkyInw9vMgwgwKmI2p4HQBbRW+QOdb+974I
	Jb6SktNsXS9asF/IIawzew86+ZRasZVSMv5wRKvemmMUNa0IQo9v3Fu++QpXLQX7Immcx1cmrsu
	IMU3xsKFhE0NDh/2qpLglTK4dGLPrp6NMXeTOqV9pgqevt1iDiIi2kdAeYZByGNaV8PyNrxx1EC
	kGrZcBwZB8ebtU4Yyr2KPwQk0dsq2niALNArHU6lH0w6HT1IB6esyBQN/eNVlLbRUWaCS0Wwh6o
	0JWwb5RxA8ixOIy0yoQuzrzF6/60cQBfQ+ua1CJSLdY2FPQLkIaBNR6JUuAzWM6zRD8QBkZ1+sC
	4OmOyHX8wpF7pkJ/3otZJyttMPwc7DFQAq92TczL9hMGBUg6sKcY4W97bOyJLOhGhbbTD0KRmcA
	Knw7kR2KXfkj4X1cnnfKs7B8opA5+mwdw7062ZUv+B4eccEJYAD70lwBfF1BHmm9NUGr4j8UDsG
	pw0neQDjX9gMAmLa3in95kOKbKZrItszzMP82W9UtyKleRbI0FauUeWDVeCBpA3JaDYj6CiQyxk
	FPBj9IY9JdjCH6sNmJSapc/vYHgCO+KvJDMfZ8watBEug7JzqR36SlK4HsIrv3UHY8+c0ZiSPh0
	4T2S/vIqU3Xc=
X-Received: by 2002:a17:90b:37d0:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae8979d2d3mr14790005a91.43.1793859171930;
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Thu,  5 Nov 2026 14:12:15 +0800
Message-ID: <20261105061217.13302-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221252_885244_0CA945B4 
X-CRM114-Status: GOOD (  11.74  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
empty, so it cannot tear down optimized Device DAX mappings.

A later change removes the generic Device DAX architecture gate and lets
vmemmap_populate() decide whether a section can use optimization. Clear the
section compound order in the LoongArch path so Device DAX keeps using
unoptimized mappings.

This does not affect HugeTLB HVO: LoongArch does not support gigantic
pages, so HugeTLB does not use section-based vmemmap optimization there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch using section_vmemmap_optimization_disable() to keep Device
  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
---
 arch/loongarch/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f801f7097f03..ea769e479241 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/memremap.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/mman.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
+	section_vmemmap_optimization_disable(start, end);
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
-- 
2.54.0


