Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DD81098798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrZacB4uB0kaaolZjrInY8IvgEW43dbywNDGay4OvCg=; b=hjmkWeafu2E8y5YW9/7q9snRlN
	ZyJzxCe5xTtIAuBCx7ipp/3zHZB4iYSnmhf/TModdnbmurEp5UdDnUQimdStHnD83PxqIbMhW2Qpm
	X7x2vTMiQCe/3rBNFan+k23ucxT/SaHj3Qjo4mnEX3ezQpY+Mo60rRqbC4fRqK+rP2UUdVN8ChXfa
	qNZzfHeYzGQx8ijnTLbnxMGhkrkomq2sgkMpv1fadr6A95GBk7iIRq8mrrmvkIbCX+XlHLTcQas1x
	pTVYRVgeGMOOoEvx598GQEV9iEy73mxozY8Gky17Ie+qg2C8l2A6b1voewmhq/5rOKes1608smKEP
	oisbCaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKz-0000000CytH-42LA;
	Fri, 20 Mar 2026 15:00:33 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKi-0000000CycC-2Evd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:17 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43b4454b459so503594f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018814; x=1774623614; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrZacB4uB0kaaolZjrInY8IvgEW43dbywNDGay4OvCg=;
        b=i+kd7coQZyT2uyVjJwMabEhw9sVoXWsTyrokmQuR33J7M3QT0ohE1Y+lwo7GC/mudH
         WLNCft0CeBg+5qk4U2O942CtZzttwghjsUq5OHThYEm7CxXXiBCzl5InAANNHdngnGQL
         FAPKzXtD6bUsGFluhuahQOeztv50+RUJc2yY/YqJanhQ6x5pEhag6aBivAOQ5roTLGoY
         2q8cdCWWr0aN1IwbA65vFSt2zFnnXGdjPWtbXF3MyNBgHbllKEw8hn4QtoRPklJf04xJ
         wi9QBsnNY5Aw2epY6WARSelCG3Vz+f97wWgXO3d1Ta3S0Unw3s9ptgIFx4wCuBW1YFML
         JKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018814; x=1774623614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrZacB4uB0kaaolZjrInY8IvgEW43dbywNDGay4OvCg=;
        b=rD24W8o5idJanQtcgZ27ImcJ5CDxPdN0Mg3fW3vu1toxrEcJrktDEPLlcIwwQLjmG9
         OZYhqlMXcPQukjblN9os+2BdXIWah/TWouPsSR0d+IjUao88dG1OD8SdBfWPhaOxTXQh
         QCyT3FK/EZ5kdaGRhC0HljrmOwQIPDeor4pwvaHnAdReYjIPHMo6+JU/pkEkeaQIwr6j
         sKeTteKNntTioCAA3ZVxG/Y16aU0FX9thpJMUD1nSeV/37aE89FjibMKm5GrhHBQC9cA
         QvD00p3tsfLxkvZCRKFlR3qZ333msHpTJki/JfpNgkKswdFs7GYqAYUDlKRcT+/exxQD
         IQEg==
X-Gm-Message-State: AOJu0Ywfi18R1XVRL+iFda8Vi+u5p11oYIZH3VR3Z/XNBftCh9dtnvpG
	ToQc56N0j+a4RbV3U5t0/IP8civJXnKcyycpy4LfjYStae8tD4B+fnhYnnvrt9QjEV9rsmASaA=
	=
X-Received: from wmlu26.prod.google.com ([2002:a05:600c:211a:b0:486:f89b:7f29])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8f:b0:483:badb:618b
 with SMTP id 5b1f17b1804b1-486fee1e062mr49167685e9.24.1774018814045; Fri, 20
 Mar 2026 08:00:14 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:48 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378; i=ardb@kernel.org;
 h=from:subject; bh=iQp7irbDz/c9Axp3wqFfYmhO5jDbkoyXPLaKPJQN80w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwouWK0ItWr1ZT/UYDA/sXPgq8H3H7KqWf9pttyVTc
 3ovvuXqKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOJEmJkOPJtLVeORLTLrXWT
 2fw+vNT/Z7hj09/UgmMr6jeWFU5QO8DI8EpJ/2Vg8LUJ/84589p8Ong8uCLRuXOT0Pyr095e7vg 3jxkA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-28-ardb+git@google.com>
Subject: [PATCH v3 13/13] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080016_619641_8951066C 
X-CRM114-Status: GOOD (  19.05  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The linear aliases of the kernel text and rodata are mapped read-only in
the linear map as well. Given that the contents of these regions are
mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 44 +++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 5332f4ec743e..82a495563b60 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -24,6 +24,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/suspend.h>
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 #include <linux/mm_inline.h>
@@ -1020,6 +1021,31 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void remap_linear_data_alias(bool unmap)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__pgdir_start - __init_end) / PAGE_SIZE,
+			 !unmap);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		remap_linear_data_alias(true);
+		break;
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1028,6 +1054,16 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	remap_linear_data_alias(true);
+
+	if (IS_ENABLED(CONFIG_HIBERNATION)) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1140,7 +1176,8 @@ static void __init map_mem(void)
 	__map_memblock(kernel_start, init_begin, PAGE_KERNEL, flags);
 
 	/* Map the kernel data/bss so it can be remapped later */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL, flags);
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL,
+		       flags | NO_BLOCK_MAPPINGS);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1152,11 +1189,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__pgdir_start));
 }
 
 void mark_rodata_ro(void)
-- 
2.53.0.959.g497ff81fa9-goog


