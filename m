Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F028F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jTQJV2XDPRFBoqPQW75dThgv5ySUNKYJ10HEIvNCJz4=; b=y1asOk9NeFfyY4hJVDCzVILMoV
	KE8YjFiiYo4elTYbD9kexJq1bjiHWy8NjDsVVcVfvFOwjOL1JQDcLQL4ffW3yr9KpGWNTbFXEr3Hl
	UO3N3kkc8n+cZIKfpgatQFyfHL/+S2cORTLW4Qv/vh+aLLocQKmT9U4LU61TBOtJ6RL6qkFzSO9+j
	qgn0czKI88R83bjDwGGz7wFQuO2H1d5eqdWtcRqt2HBS/tQT5TR3EDRuoav65ZjMJ4CbAbS2e1RTs
	nfSDQHZRNsLaTW2542mMzn0yeyBPDFKNvXnfEicBKKQJEY5u/Fswy3xpUHnl+XOpZNydop0/Rt23m
	V11Rj6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpwG-0000000BIia-2XYq;
	Thu, 23 Apr 2026 09:01:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpw8-0000000BIeT-07C4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB83641936;
	Thu, 23 Apr 2026 09:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522A5C2BCAF;
	Thu, 23 Apr 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776934887;
	bh=TdMOQJwA7b5UM1qW1Fqdvr52/Fylo/qjf+0mFhtaabQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=NB8vX29woijkcyCMnU8edZoY62TFLPVjTnZdDuLF+frBnSfi3K58z0gLd3/YP4WJk
	 mLBj0sF6aZREKvdL0UTaG167Lh+0SGpftWMm9clmFHGm97bAvPlmCl1qBrVBHEodgy
	 zrchRKBtpJWvOnxFLQ/7ZyoFoLud5Im/kUVV1jj0=
Subject: Patch "arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()" has been added to the 6.18-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 11:01:14 +0200
In-Reply-To: <20260421100018.335793-5-catalin.marinas@arm.com>
Message-ID: <2026042314-fleshed-ion-c1f0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020128_116325_F060917A 
X-CRM114-Status: GOOD (  14.41  )
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


This is a note to let you know that I've just added the patch titled

    arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-tlb-pass-the-corresponding-mm-to-__tlbi_sync_s1ish.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-240112-greg=kroah.com@vger.kernel.org Tue Apr 21 12:02:34 2026
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 21 Apr 2026 11:00:15 +0100
Subject: arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Message-ID: <20260421100018.335793-5-catalin.marinas@arm.com>

From: Catalin Marinas <catalin.marinas@arm.com>

commit d9fb08ba946a6190c371dcd9f9e465d0d52c5021 upstream.

The mm structure will be used for workarounds that need limiting to
specific tasks.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/tlbflush.h |    8 ++++----
 arch/arm64/kernel/sys_compat.c    |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

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
@@ -310,7 +310,7 @@ static inline void flush_tlb_mm(struct m
 	asid = __TLBI_VADDR(0, ASID(mm));
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(mm);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
@@ -337,7 +337,7 @@ static inline void flush_tlb_page(struct
 				  unsigned long uaddr)
 {
 	flush_tlb_page_nosync(vma, uaddr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
@@ -492,7 +492,7 @@ static inline void __flush_tlb_range(str
 {
 	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -37,7 +37,7 @@ __do_compat_cache_op(unsigned long start
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
 			__tlbi(aside1is, __TLBI_VADDR(0, 0));
-			__tlbi_sync_s1ish();
+			__tlbi_sync_s1ish(current->mm);
 		}
 
 		ret = caches_clean_inval_user_pou(start, start + chunk);


Patches currently in stable-queue which might be from catalin.marinas@arm.com are

queue-6.18/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch
queue-6.18/arm64-tlb-introduce-__tlbi_sync_s1ish_-kernel-batch-for-tlb-maintenance.patch
queue-6.18/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-6.18/arm64-tlb-pass-the-corresponding-mm-to-__tlbi_sync_s1ish.patch
queue-6.18/arm64-cputype-add-c1-pro-definitions.patch
queue-6.18/arm64-errata-work-around-early-cme-dvmsync-acknowledgement.patch

