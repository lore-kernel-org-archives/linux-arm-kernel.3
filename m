Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnGUu9KwPOjM9n0YvVm33uejfmZM7bns69qSuovH7P0=; b=ysb9H73gOhexvsN7PnoeQgxlKh
	FdGN6JCPIuec0ZoDPknG3vBDcM3/0Ui3tIVNLEgJurGw2DPIlzpuF1aN+aZcvIQV88dj2LSUIfqQp
	tZd8IgBKxxg9jGlrBy9RE5UV2zP7HbZRk7cZLmvqMcQgogKpcXLrA6RJJGkZRv/g8I2jfcixMH1d+
	rHrjtx+eigw5ixsSecpo6MSCkCYqgDUi9GMxyTzdkKtqKxRuxMpC9q+SDxPWeyfHxtplFXcHQoj+v
	Uj95wSShVk+/wf52NecVs+3KniYNbGPfhW+lIaVYhxSElQ+VmDcsfq4iw83OQDOTh/JHAX4HT4sPc
	5cjGHRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgew1-0000000Bs95-2u4i;
	Mon, 06 Jul 2026 08:44:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevz-0000000Bs6g-0kJ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1935469a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327450; x=1783932250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnGUu9KwPOjM9n0YvVm33uejfmZM7bns69qSuovH7P0=;
        b=CqWcsCLglpCkMOkbkCFQu10d5tswFagoIaLxsR7GZfOlzOWRWErgCBSjd7wVzz0zaN
         dixIGHs3NJ34jVTGiiZZm7mVD+/bRDFwZhagQAbYQoW7WAUXFILMQOXPtUR01qsnTMiz
         Hpj63RhqBuSz0blOF1h71raCDsIzic7wSBWWh9nvkfkxOsRqL25AfLNnSY3Zl3EV3yI6
         sdHbwsxJWK3nSLD0iW263ZN7ES5+YcGDmdLRMdnca2bgqLEYxhi/xJN+/gfHoX3OmK4o
         H9Bbxbv9QnW/Wu050NRXyy6bPKpDsdfC1r9e9VwT1saGlcWUM2ToVA48RbfQoibgGSXq
         rU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327450; x=1783932250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnGUu9KwPOjM9n0YvVm33uejfmZM7bns69qSuovH7P0=;
        b=VDwGk7g37MG2HZfe3ijAR33w5JnV6HB1w5SD7jltrZmEib3shV1N+Mvpg5j6MtKPLp
         uJruD4q56E4KtJ8UNzT6iJfReDQlASLgsE8l0yYTjIn1HYDQMMVTQM3RSU+bnbH56oaL
         K2YEQAuiQo/SMe6QvWwOg18sw00btkOJlCOuz5iNI6jnm1Y/fq0BHxrAincjOEIqeDD4
         aBRXyDkBZTf0omKXMKs2HYtI/OhZfr3cvXK259eiOPF8V+0vL0iLHBR/CW3jPVYWA5Sb
         Bjl7ObVAinsHyMYz28LvTSLzzmDjD6egDQt2Xx7miI50Wpc374CT6Bnat2XugtOVCmac
         TJIA==
X-Forwarded-Encrypted: i=1; AHgh+RoMWkrzldtUICqZyc+KwRzuXZCoSUN4JE0HdTkIdQOi5chQB+tQLNwvWlMQro60ObKfiLKhgFQDeOoEz5mOMZWy@lists.infradead.org
X-Gm-Message-State: AOJu0YzstACSxcHp1HIap0yisIQL/P2aLcI/Ekz4hjEiIU+yIrxUcZAn
	DAbQq0GhY3z8rXWueiT7OUV3bYGIyE69ENWBTk8EgaX+aWJ2Muz0NgYu
X-Gm-Gg: AfdE7clYJbRsigmIDq3EV+g2ZRA0ysMwS7JHAzs/M3uacvAkgXL4RNhyQ9c+Kzk+ylH
	OG1LKvBiI5PdworyhpGzBOsFLnA2BhPIIjsGDy1p45F4TzQmf5YLZBDzPs0+AQpeWR2tzZMLW4C
	MxFbfJPq1/yvrSMusrvNViFF/A0hfY08gW2nJ7fGS1JEhVJ908A4mZ+gfWAOQUzeZsbjJ27i8TP
	/kftZ9WJL6FhzQw4E/F96TyOu+UEdFLwQ3Li7t/Jbh0L9e03QMqgWZOywqlNYKGUeJ60xPZYR6a
	vYOBxOTwu6PVh7HNtJ5S7WGAv19ZWPdLbOQ681g4RtIjjikfhwzry+kkgVdRBs5ezka73vLU1LL
	zKLEcWYFccu3KGnTt2owHX7FJFXN9H/RuBPfvgFmaErE21un2wHuIqe8mQtEgMclqBaDmbyf8lC
	ohxrdDvloDTE4xVU1J3qrxSQ/lg86w1tqh7ksWqvFF99K5ug==
X-Received: by 2002:a17:90a:d44f:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-382803b6538mr9020955a91.4.1783327445435;
        Mon, 06 Jul 2026 01:44:05 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:44:04 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v5 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Mon,  6 Jul 2026 16:42:29 +0800
Message-Id: <20260706084232.177786-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014411_220788_F79F8915 
X-CRM114-Status: GOOD (  13.78  )
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

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
so callers no longer need to handle the conditional compilation.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2c2f74a07f396..d7fef85b241c4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -91,6 +91,33 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_t entry = pfn_pte(pfn, prot);
+
+		entry = arch_make_huge_pte(entry, ilog2(size), 0);
+		set_huge_pte_at(&init_mm, addr, pte, entry, size);
+		return size;
+	}
+#endif
+	set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -119,19 +146,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-#endif
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		pfn += PFN_DOWN(size);
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
-- 
2.34.1


