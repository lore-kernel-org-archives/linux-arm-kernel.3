Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E2F89246
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGQ9Wm1/XYQ+PYyoyWYqNIK6YfsibrrWAiy42dkhc/Y=; b=xWKrli7U8An47H0MY9JR191ON1
	0wVhnGPGfs8828nIE6cN+jknWzViEy5eS1LkWo7D7ShZN1Hel++rXlam0mqjXDLDa3Msg3QqpJBnY
	CFpS3vbBh5vy9umBiGySBL7DFF1S8KL2BOKZLA+4RgaEXn9dmn6mHxTTxbsqgBSACBfojTd27RQRq
	ZEeRVa3za/5INMytd3IVHDl+4B/+IBsUvPArbuTLEZdBk342F8k/WVkUxYAIUy+KWiPDl/UilR17D
	5lSOAAvHPOMuyVFcY9hjebl0Gie0Sae8jazKnMfQdRCQIduS1KqbaCap03M5eU51NvTXMC0AkQbgt
	8ikm6eeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uQ-00000008OD2-0HEo;
	Tue, 21 Apr 2026 10:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uK-00000008O9l-2bVn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 10:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OGQ9Wm1/XYQ+PYyoyWYqNIK6YfsibrrWAiy42dkhc/Y=; b=dOfcZzunIwrtGgGde3bOAMo6Cm
	PWKV7wMJhCfp1zndRZrIwPPcF+H0auP+DKOJ4Y/jAd3GXeRSozF0O4bHWW09rcVQBDd2Wkvswt69E
	rV5N7/WmgHLKDaOBVhhsjNuqcLsvNjmkPRHq+EUJNRKNeNv4/aXvV8qd5wXeebPRvQ5IWZSuLlSUR
	3QQCdQBIYCtIkAnFGC4bCwrObGk+NPRaC4VBy9l20/tyKvvQ/lmk9uI6QHYtgJM2tCqhfpSCndj0y
	5Z22Q8smmgKH5oQiAax9kNizboRnnDfONrcRUSBZdy4OEpIeMdNT9UG4R3fSDFu2OtJCYY/16WkQw
	FZQaw59Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7u9-00000009XMc-3hug
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:00:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DE423025;
	Tue, 21 Apr 2026 03:00:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07D43FBCB;
	Tue, 21 Apr 2026 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776765628; bh=EcTNGzHdHBi2cf4To1CwO4uoUFlIH4PpaV+wukCR4pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGyXEpRMyPJQYr/DY+ArC7uqtZGUttfaeRO7DqOnhA1PgFGrZxuM6JWNQc0C3XCSK
	 owEbolGv1QbV8Mvva4z2OihzjcluLXkNb4TXI0iMV0Z5Fii69p4y7S3piqPzu5/+v+
	 v+XIGUOtxJEXmbP+UDQfs22jqBz9v09+Rt6b6QGQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6.18.y 4/6] arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
Date: Tue, 21 Apr 2026 11:00:15 +0100
Message-ID: <20260421100018.335793-5-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421100018.335793-1-catalin.marinas@arm.com>
References: <20260421100018.335793-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_110030_186818_51D14DFB 
X-CRM114-Status: GOOD (  11.49  )
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

commit d9fb08ba946a6190c371dcd9f9e465d0d52c5021 upstream.

The mm structure will be used for workarounds that need limiting to
specific tasks.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 8 ++++----
 arch/arm64/kernel/sys_compat.c    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 387bd86af702..ba36e91aefb8 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -185,7 +185,7 @@ do {										\
  * Complete broadcast TLB maintenance issued by the host which invalidates
  * stage 1 information in the host's own translation regime.
  */
-static inline void __tlbi_sync_s1ish(void)
+static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
@@ -310,7 +310,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	asid = __TLBI_VADDR(0, ASID(mm));
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(mm);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
@@ -337,7 +337,7 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long uaddr)
 {
 	flush_tlb_page_nosync(vma, uaddr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
@@ -492,7 +492,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 {
 	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index b9d4998c97ef..03fde2677d5b 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -37,7 +37,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
 			__tlbi(aside1is, __TLBI_VADDR(0, 0));
-			__tlbi_sync_s1ish();
+			__tlbi_sync_s1ish(current->mm);
 		}
 
 		ret = caches_clean_inval_user_pou(start, start + chunk);

