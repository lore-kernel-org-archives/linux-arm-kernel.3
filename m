Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF41606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WKiWahBN;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=2y909wnk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E0o7l/pShR1+SqYicqhHSKEqObfbQ+XkPYrzgPFmubQ=; b=WKiWahBNmsN3U+E4TgjvHGO6/y
	OvdnYO9FWBmdlWYHiufBeqShcwwW9YCR9l6kn65kUbRLtTx9HPVRv4qqw3DOly3IactDeNzsQX/1u
	ZUXz1YJwlSD1RdNCdI1tNDdNQoVYrCA4TX2KEUoTMMxAytpgY38QWEdVYA8oBOeMui9fRlne3jvva
	+knt6K6V/pJl0BHiIEa9v9Wr4hUXWVsgJG0AlbLiOJhyen6tLMln3laDEDRYzN+LcR0obdMfPPgGQ
	IkOni81u28mxrq8gkGWBv2Rt9dXCGzx95JPAMoZZf1CT4vHEQWYqMdAa6rB5JWXi8xu0Y3wMSgp/S
	4pwYbWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpwJ-0000000CB22-116y;
	Fri, 30 Oct 2026 16:58:51 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpwF-0000000CB0b-0a7v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:58:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jGS3m0SClzlfvqP;
	Fri, 30 Oct 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793379520; x=1795971521; bh=E0o7l/pShR1+SqYicqhHSKEqObfbQ+XkPYr
	zgPFmubQ=; b=2y909wnklU2A+ClYMerPOG3NZGXIP6oyU5On42tAacJMwUyp9Bh
	8Ol+pm80xoQPKEE8pQ/73VXnfk2D+kxbxdEsW9OwEzPQ7TwQbYLdEnhnu4Nn6eBR
	KZ8YDzA/D59VXhamt86aZmUwJ0Zjc0iGjmLP5KVH46+zCu4EOnzq4LO5P+Wr8rxs
	LzbEbSDzmWJBgU/4AyNikFb8oScL4su+hzcFrGbWWUaIAH4UsClhkEKHMwHfULG9
	Xd4HZzIeZDbtVqVtFqU3pM9A3eX6YF4glgr9sj/iLTn+KWkv/XPAu3k2tXnLdRdl
	A43c9QrBQRda6WFMyhbtPVcFW9qlEuXWGQA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tIOHeKqG_gr3; Fri, 30 Oct 2026 16:58:40 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jGS3h36Y2zlfvqH;
	Fri, 30 Oct 2026 16:58:40 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] ARM: Flush the entire TLB for large kernel ranges
Date: Fri, 30 Oct 2026 09:58:08 -0700
Message-ID: <ea3f6c05ad01fedc3859d8c16e98eaf521cee624.1793379488.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_095847_662306_4135F62A 
X-CRM114-Status: GOOD (  17.74  )
X-Spam-Score: -2.8 (--)
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

__purge_vmap_area_lazy() flushes the TLB for a single range that covers
all lazily freed vmap areas. On ARM, BPF JIT images and modules are
allocated below PAGE_OFFSET while other vmalloc allocations are above
it, so that range can span hundreds of megabytes. flush_tlb_kernel_range(=
)
invalidates such a range one page at a time, which takes up to hundreds
of thousands of per-page TLB maintenance operations. That loop has no
voluntary preemption points and runs while vmap_purge_lock is held, so
other tasks that free vmalloc memory are blocked.

Flush the entire TLB on both SMP and UP configurations if the range
touches at least PTRS_PER_PTE (512) pages, matching MAX_DVM_OPS on
arm64.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/arm/include/asm/tlbflush.h | 30 +++++++++++++++++++++++++++++-
 arch/arm/kernel/smp_tlb.c       | 15 +++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/tlbflush.h b/arch/arm/include/asm/tlbfl=
ush.h
index 38c6e4a2a0b6..c6a61f4488a9 100644
--- a/arch/arm/include/asm/tlbflush.h
+++ b/arch/arm/include/asm/tlbflush.h
@@ -9,6 +9,7 @@
=20
 #ifndef __ASSEMBLY__
 # include <linux/mm_types.h>
+# include <asm/page.h>
 #endif
=20
 #ifdef CONFIG_MMU
@@ -597,14 +598,41 @@ static inline void clean_pmd_entry(void *pmd)
 #define local_flush_tlb_range(vma,start,end)	__cpu_flush_user_tlb_range(=
start,end,vma)
 #define local_flush_tlb_kernel_range(s,e)	__cpu_flush_kern_tlb_range(s,e=
)
=20
+/*
+ * Bound the number of per-page TLB invalidations to avoid soft lock-ups=
 and
+ * long vmap_purge_lock hold times on large ranges (not necessarily a
+ * performance improvement). Matches MAX_DVM_OPS (PTRS_PER_PTE) on arm64=
.
+ */
+#define MAX_TLB_KERNEL_RANGE_PAGES	512
+
+static inline bool tlb_kernel_range_exceeds_max(unsigned long start,
+						unsigned long end)
+{
+	unsigned long pages;
+
+	if (end <=3D start)
+		return false;
+
+	pages =3D ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
+	return pages >=3D MAX_TLB_KERNEL_RANGE_PAGES;
+}
+
 #ifndef CONFIG_SMP
 #define flush_tlb_all		local_flush_tlb_all
 #define flush_tlb_mm		local_flush_tlb_mm
 #define flush_tlb_page		local_flush_tlb_page
 #define flush_tlb_kernel_page	local_flush_tlb_kernel_page
 #define flush_tlb_range		local_flush_tlb_range
-#define flush_tlb_kernel_range	local_flush_tlb_kernel_range
 #define flush_bp_all		local_flush_bp_all
+
+static inline void flush_tlb_kernel_range(unsigned long start,
+					  unsigned long end)
+{
+	if (tlb_kernel_range_exceeds_max(start, end))
+		local_flush_tlb_all();
+	else
+		local_flush_tlb_kernel_range(start, end);
+}
 #else
 extern void flush_tlb_all(void);
 extern void flush_tlb_mm(struct mm_struct *mm);
diff --git a/arch/arm/kernel/smp_tlb.c b/arch/arm/kernel/smp_tlb.c
index d4908b3736d8..957cc2eb662f 100644
--- a/arch/arm/kernel/smp_tlb.c
+++ b/arch/arm/kernel/smp_tlb.c
@@ -4,6 +4,8 @@
  *
  *  Copyright (C) 2002 ARM Limited, All Rights Reserved.
  */
+#include <linux/build_bug.h>
+#include <linux/pgtable.h>
 #include <linux/preempt.h>
 #include <linux/smp.h>
 #include <linux/uaccess.h>
@@ -234,6 +236,19 @@ void flush_tlb_range(struct vm_area_struct *vma,
=20
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
+	static_assert(MAX_TLB_KERNEL_RANGE_PAGES =3D=3D PTRS_PER_PTE);
+
+	/*
+	 * __purge_vmap_area_lazy() may pass a range that spans from the
+	 * modules area to the end of the vmalloc area. Invalidating such a
+	 * range page by page takes hundreds of thousands of broadcast TLB
+	 * operations, without voluntary preemption points.
+	 */
+	if (tlb_kernel_range_exceeds_max(start, end)) {
+		flush_tlb_all();
+		return;
+	}
+
 	if (tlb_ops_need_broadcast()) {
 		struct tlb_args ta;
 		ta.ta_start =3D start;

