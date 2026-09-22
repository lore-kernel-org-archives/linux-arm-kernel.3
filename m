Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA4EC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=; b=sMR6yjR+S8PofbmN773r9m5Pru
	kT9N/j/F0VoygJOUG4ThV/XNaSco1OySA/3/Zvn3kiv/zxhgXxvjSD1XBoCUYwLyPEEms3eiewjPY
	JGK7vip9xlmVPg4Dx1jSsrWoSMBrLrc3Vpe55fa1T7XOY3Cn9cOvzXU5srfNrdekZxi3ObO0xikmZ
	HUw6LBNLRqvsKpvZGzowVSb0B794gl29OYPOLr0FeVALdAAYk771ocC9McB1hNrZ+C73WM45nntw+
	EJEM3lvkPawII+odq+inyb2ET5bZnr6y4gOo1xbgEKEKhobLfOAG1Vd5WZqaXSrlh8El5VAZ3otPs
	OIcwEezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6J-00000004icG-1l9K;
	Tue, 22 Sep 2026 08:43:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6H-00000004iav-3yNc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=; b=PHC02ty1gn+eMisYcNqd4nmLXk
	U0heX9B0qnI4DjRsU56+xxuyf/ktmb8/go5JnpnCuX2qKTuwdpuiP6I6l2vmcGbGMCpk6TDur7YrQ
	Pa8iozxnNHcWlpM+b9jMQ6azr9ffdP2HqOuFxaaGN+zgL3HPZyKOZCsQ5WGSZrqfWQkKC20KS70pA
	qfVrKkEc+hC7cL8KhNEj/kQAqorvh+N6dpcp+M1ub6UaxdunFJQGYTjAtsSpDUadvyPDMCYHcz4bh
	6RgVWep8MMuzLm1vXOSO/PlF+uGLWlwzClx505CSd3qUct0rKT2anv3s68O5T8H9KfP1i4JMXXsng
	c1u9yJ4Q==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w6D-0000000DHUN-0zwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:43:40 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2df5ab2f7b4so2586445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066615; x=1790671415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=HifKnMj3W80dqtq55Q9nwcMNWTNB9HZDB46sqTpG0+7oy0AnPv5vzzBojehQfRyXg8
         cXBoJfdqLUf5yy7+ptAFDgxQUW1gQHBK36HsDbW2GNe6J2eEzSMVEIAmYzrXQR1RIL70
         nepXcBhrSoc3TeT7HGX0ttaqeZK8zmUFWJvcL1tPOFxFiQIw/shlAbSdIoi4CESwJl7/
         QDBUbin2dI6SxXy/taCOzmgzI6PwB1l8vqUK9uxAXKS/lO4IddoKq5YvCV7qk41yvudf
         UHmB5t/QJxYNFJhXDc4hlvRm1+KHEfIZ1iErWF4cSbhEO0/n5LcLl9GJeTCXuZ/pLu9k
         lLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066615; x=1790671415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=aavziP6xmh+wIEHjM9vtA2vkYlrIJzlC2bHUH3SYJAEeEpJcOJGNzhhf47/XNqYAkD
         EEOzPGSSXjRpCuiS2luyWqgh/QUGojMbjdSYEodQpjqfJLEPi5njoH3OFQLLxStsdgvi
         KjIX46dcxxiEcv9SLkc4F8ySwsAcK0PlEOyxRu96kYdFjgI1L+Gb7bmBjjokPai9SciO
         RVebsQYO3CgeyZHgCQOuLxkPtSLV+B2sxnLobAtpR0rPW3qLigKjM1SWJcqm/40cA2fh
         t1rztrJq8gYamET+kwg1gWg2iPy7bcBD7kjVCrs1oK6tIZrto8eb7NMLUKWhEuNzKFmq
         YCpA==
X-Forwarded-Encrypted: i=1; AKwUvBxo+6PqK+giPbPIK+J7Fv5i4VdBgHersR7A2Ed7O0kUjn/MXK43bebLKzoCzM/NPlQhst4GageeVkR7tA5p06MB@lists.infradead.org
X-Gm-Message-State: AFuF++lURQTLFmSDShWaV/TTQUyP4X9yFrRmeIrzy5iZBTzmrSF/qzoe
	2gF2J5laDaItKiqwoVvnsRFt/z/ogseTjFUk2lzvlUSf4yVS7+rKjllD
X-Gm-Gg: AYBFou1PRyrMriEe6Vyh+ANSZBC58VhvlrZozBexrs8090wXsXhlHkJ6WS7HuCKRNa2
	QaOtDzlxD6VlAo/+VqveY0hQZ8JM5raoT1maedSO+yOXqT0+1fUhV73pKtClVnNUf8jZ9AcrMJS
	Y+ZDy7z/ijgGCme1BoylGY9CDz4Etj6lP8eQuhPGX4J8N11hCI21JsiQCcpzgiX44OwbK3KMZ7c
	vk6whA0X/UzPnthvYMTfp6rT/sa/PqanuUYfZgifvnEI/H7OATWfHYfDlBZdmMFac8p49zZ5poL
	FvfO+QbmFOIbnub2pkT+Y3tmrsTcemu9zqwKW6sDLqboOmJPV4Sjs4x8y+l/W0qER9/ZM9lEGFB
	VWlDGB12M1ZiMwYbWEr75+luLZ5tuV9datcbwxe/tfyoEMfxbbTg3W8Zna6ughiWzNdZT6suBTp
	fT9MoJny2FjW8vZtHvOp59I6UUUb2hN1kK1ELWH0Lspec9yiz29Zi06jrvRPH2rxntg4fkMz10+
	3m2AAHdl3HYmc88QNQ7ZQ==
X-Received: by 2002:a17:90b:1a88:b0:39e:252:ae4d with SMTP id 98e67ed59e1d1-3a073112d3bmr471304a91.17.1790066615322;
        Tue, 22 Sep 2026 01:43:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:34 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 2/9] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Tue, 22 Sep 2026 16:42:49 +0800
Message-ID: <20260922084256.1515554-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094339_148987_47A227C7 
X-CRM114-Status: GOOD (  17.25  )
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

From: Wandun Chen <chenwandun@lixiang.com>

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..d201638d11f3 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0


