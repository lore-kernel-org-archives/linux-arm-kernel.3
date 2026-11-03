Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C69606A80A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHFpYtiX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDuT7Ktm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=; b=yHFpYtiX5FsVt8
	UKxf+EPNf7Ja+jq627eNDUdoqozfmimzwF4jBaVKb4Er2RvU6kjx5YOKoihAv4RRTX564ayfJbbpi
	rgJWj12N9KTOyND4+Y6TyR1Lq+xjjwZ3S8qS+zGdNTnQRXC5HpjNqfeQmQ3K9uVokroPk0J2OauJZ
	tcmAK/wFO/B2vXw57kfpuXmTN8uTF4H7YwM2x0e8+XCWjbW2xmJ0vNjFFnwFr2vVIIIC9I/cEyetb
	avN9idm77Jz/Iwlf1VSOEo0LPC0woHun1uque3Fi4IMQkJcRCMoRaCNKSoRHscdb5DDpee3gy/aVu
	ZSBL9zd7U7jRBj4jaPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaY-00000001xJP-1aZ4;
	Tue, 03 Nov 2026 10:17:58 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaS-00000001xEy-2QG8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:57 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35b2c599f43so6994882eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701072; x=1794305872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=;
        b=SDuT7KtmxGH90KYK1e4VP1NT83iru/kJdwu+nIoQGAap72rmd3LDoG1Z4ChyVNnID7
         kDjTSd5HXRybA9poc5vbFisavpMykgLI/8SYl3/jLdkJid/bgEMWv413Ofrkm8bNPc/g
         f/6hXiFTQDMPj+Ffjcdnrq9tllsO4lm9ntx+UwCfmqKhnMqYz1ENOLOLq1tc7ZkMTR0W
         ait7DHU11Ba/wFQPPrtSW0+CccnOjjGyP9VOY+1lWQ6WPVAKp3XQGCWB5I0+ikYFwuvN
         k17UzrMmQwL7Qj3vSJl5foKWYqD0cTHw4viSfYCy3tqawQECxKAZ4CgohiPBLsi5p4+o
         HS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701072; x=1794305872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQZGTVWVxsbky0R5YyDomc+9xqg3NrjJBS/7gn3/iEE=;
        b=rkADarFpVZ9hMfQ3iUzsOjrDb2yNI0zQJwMKFek93S1yaev0Didbm6smhWWsrt6q9+
         I8wIeOeGkjHkacd20BULO2TV0C6wzWxgJ8EcClC3osYVzdguyaQBKqfy4X+h6W3vGUYO
         FhluiFSvgRUmO/8XH/cvMd+qhWu8nqqh+ohS/ZBGIVUJCWIqOTwwYgQN0FxCVNOQStd1
         Juw0V6j2Oolie1abzFKyx760kyqhjp8WOul3UiWKcPW+wHw8cMUewf2Ar18EwZWQkqMy
         JFoGliEOY3GQGSje4sZT9VDxMv/pp5963dEVEK+LMJJ/7DYDfvT5VNdT4SaLW/IDUTsm
         hJ6g==
X-Forwarded-Encrypted: i=1; AKwUvBxbdnpF6Y6s5YfKE7m2C65DSN6UlaCxBTGs8EEO7NjaNerkPcVF55UVvqND6/s4O7zQIDnySZ4IN6FT2cdDGWHT@lists.infradead.org
X-Gm-Message-State: APuU4Z/3eMmJ2zwF+wbgrZjWA3bnp7sJUw5bKunbNHLLoq4/uYp5R/RT
	X5edBwjhUxgLE3WRH84XlhC5G2HAmOR7zRmTfr1zSkpX9424juRnms5woZ4IVz6k
X-Gm-Gg: AYBFou3FC6UZZSWvI3GxO1CtJktc+ovoFA0XXw5KTH6THdCe46Okeb2TJNGLHkT5cNt
	iQTuYCxUf5CfXztsTW/ACPdgd0XMhr7vkSrrf0QKovp1KQLyG/ocvisMOys4Pdt5aYXMtxuVQjn
	QUxo7AvJRjnwinBU0NlZAW7imqHIppnVEmjjmEAcnzznDLcdCopujcEAmgyY+ol0IPA7WRQTNqi
	+useyc3MoOYondzO11YzLDJMSKNfslskv6BiczK+UQS441T9d2Bs1oO7r2vfZPSV4w2zGAvicFC
	9gJPSDktN3Ii9SVV/VSQmGeo9wLSmOSIRPyVczFXTojQDTRJTW7k9QriCrA7nZ2IBL7mls+WI32
	ooNf29atm3YCDGT99j2edPYaYVH5WdR5tz5S4hUXLtCOzx4h7Tp7HBTZ2eXPPMad6LnzvyZVDS7
	mYUhJOpDxlzOFanMM4Wwl+FUYz/M2ky9uxbv4wBopjrsV3ZGrKjZLmaps0WL+P8UJHcCv7F0Djg
	uinO5XlxNuy40m4wNPaRnJu1XTZ4U9TZG072NOuIgJEkMEVXwjkJt9cTkQ1tEL5LsJqJlUeirRa
	aBx/dzs2PVbJbGX4xiGEnqCKLAx1DQ==
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr518555eec.30.1793701071962;
        Tue, 03 Nov 2026 02:17:51 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:51 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Tue,  3 Nov 2026 18:16:54 +0800
Message-Id: <20261103101658.766905-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021753_249080_0855448D 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df37c8490ae7..e3ea9581e68d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		vmap_pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int nr_pages;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1


