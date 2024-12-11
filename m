Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC16E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=; b=lIJ5kYgkq+YdRGyvIkw724WjyK
	1KK1eZ6ZQq1RUD2lOKJS9BzYXaxS34yiiasLcrsoC7Amwo+7DxaGyX0mp0AwY/N2BpZH3SPHa27Fh
	Q8aIAylrlJkF7kq7zYRzZOYEDMm9FFa4Weks4d422HKuHP/oUj9ix+6h9ok6sKDx8vq93n1Y+tZGd
	/B9HYN5tdBRWymuILPvNBnZjg7fo106dddGSBubI5KsPsGdZl2cV8WRNVzkJPSQe0rUuHj0xT2sKm
	XJA6loRFhW1nzlQM77gYa7mpqDna0HjYHGksNSZM3EjuKPVkMv3WtXBXSyLEtTN2DhbahnKZ9ctev
	Dqp2eYwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWM8-0000000GVqg-2Nai;
	Wed, 11 Dec 2024 23:43:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW85-0000000GSeL-0L2v
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=; b=tTWDfJtpsOH+32OcsRtB2OxcLj
	fSfkS0Gp1ahnz9/jun8Q12mCWmGtpdHH/wY9SBy5wdF+UehzBBDSa/79RicBtOEwcdk4EodknyWrU
	cTtrksvvmBjq0euABYA7TdI0kKDKRWAPBJQCIsOrNYKE0V4QxK8wvP9wVMV1CMS8YHqaOLK67tusA
	K2F+od8Tpk3iE7bGLf00vFKj18g+YeILc8HqdSB4Capmsgh40/fIuFkh395piCWvvHYmlWZmVU4oG
	jLz73VfO9XP7ft7C1uF37BP+z8A9oajoIXwYE4/Ttm+dnjeOjrjr2mfKTys51UBMZmM+cX+sYk7IV
	twIH1waA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW81-00000001eY9-3cNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:28 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728e4e30163so19494b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959702; x=1734564502; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=KfQp3nnSvFY5LUpGzxPcwFmAyy00RnlHcMyCQNa2LOlmW1Wf7yeaavj+el9Iarf3Ee
         bXfofC9A0iOuvTTQcVfBVa747gDPNUOGWQueUgt0W8r0Q0rbV0nWu+bIfrw6xm2heNsp
         EcGHhjx0jxUyBKdIQZu+bYvjpNWVprxZbM2fqUQKI2nTpLHsqtKQGNzDOaHVtqZYGnkw
         g1K+vArmE1ADhJk/zsUOqPWpkT914BaaFzTuNSNvw9HFkT4DwMhYh0fdYBDgMq1ALZPn
         2hg6Rkv1DlXqSkxBMRJyPnNeQUBD1ObMBF6bn+TPzDNS1c1f8vs5KcU03TzwkblS21BA
         5CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959702; x=1734564502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=W1ZHtHZu89blVNAsgZuqGZt8pUB3aWFDU4QZ/Pt7F+rC8Ewrl/UztblGtmkyQD+PLW
         9mduVy3DtYfi6YqyBEbQ2EKqizPcs38toDk7oYVfPRdU1Z4BRyivpcFn47z9PSmvS3Yk
         IXq47Jm8HA2JaCytPN5AiR0NFzGZQ6PhsjR+hpy3T1iudBcvdGFr1SJUASU/khS9813a
         9VMiUiPO+8uGlkFASRRPttOJzVTja12IFZnMpppLnxjJklTOljMlqegL7xfeJwjbBxay
         QfMInfxCIQj/427CJzMMxF9RrMqTOjr2w080nYB929tyNQSppzRKJWzAz7UJLODihpcx
         oWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr59hv/ks6WIhmpyzQchXYZaz1urg3t6vMzOyhFIbIG/wKHV5uiVFFfh0lHqLfu1Mg8caaHPaYEF9HfJhmiJe0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtaxq60svW5M9cjXX77Gmy3J2gmuZcdkNXowljrJL2DPJAXFnY
	zxnRGuBw6LmG8vlqStdxwKBwPLlQEYJHSCyhXS4jQSzlXcUXedXn62lBJsAJWoAwPoZqD7Eg1gG
	nWJcMnQwFPD5qLV6ctwWM2A==
X-Google-Smtp-Source: AGHT+IGWTEcN8NSoCgFvsRpfbkF7zue8+P2XAq5n+JVkXUUPL+bOWBEsvAKL/CZzz2D8WnFsu8nT+1urmYWqTc7eRw==
X-Received: from pfaw10.prod.google.com ([2002:a05:6a00:ab8a:b0:725:ee5e:6efd])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:92a6:b0:727:3cd0:1145 with SMTP id d2e1a72fcca58-728fa9a8139mr1688780b3a.2.1733959702467;
 Wed, 11 Dec 2024 15:28:22 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:51 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 13/16] mm: sparc64: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232825_978018_94435164 
X-CRM114-Status: GOOD (  16.20  )
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

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 96 +++++++++++------------------
 2 files changed, 37 insertions(+), 60 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..e44d55b30a84 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,17 +98,19 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
-	unsigned long task_size = TASK_SIZE;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	unsigned long task_size;
+	bool do_color_align;
+	bool file_hugepage;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return -ENOMEM;
+
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -120,26 +122,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	if (test_thread_flag(TIF_32BIT))
-		task_size = STACK_TOP32;
-	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
-		return -ENOMEM;
+	do_color_align = (filp || (flags & MAP_SHARED)) && !file_hugepage;
 
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	unsigned long task_size;
+	bool file_hugepage;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -164,49 +169,20 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
-	unsigned long task_size = STACK_TOP32;
 	unsigned long addr = addr0;
-	int do_color_align;
 	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
 
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
-
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if (!file_hugepage && (flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (unlikely(len > task_size))
-		return -ENOMEM;
-
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
-
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


