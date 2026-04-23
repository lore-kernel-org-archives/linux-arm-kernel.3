Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA52F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vwqkj3ItOD8BSwNV5R//ZBg4L666bHoqdmMjfksFSU0=; b=xaMWteXmgKUj2ixjZvn/55ux9H
	AxLEbxRIwKGaC/RQV1B0xddnIdO4Q945jUgUuC4UZIDqXAUobSF1N9iAwyOLylj2dyxwIHxcXt96C
	djHxr2iANp4AsstHAn9+oXhJkhs2sjRTOLuX94bu1Nal50SOr+Ph50XAF9ZkSee5zFKa7uCW2psyx
	K85lkHHQdGx5kn74XnTVLr1ymTX7SafSuyJF2ceh6ssfYbyEiFDcMz+z+nXVjg315VWYJD98trBVd
	A/nOS9QrJqC52v1xFwUU7pGZxUgKZS8HvZ760oruvOjw7BeEAzI1hWSbxY/LNgYTU7XyP3N0QRX9n
	7nOzp5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpwC-0000000BIgH-2WG1;
	Thu, 23 Apr 2026 09:01:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpw6-0000000BIdW-2Gs7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AD0041572;
	Thu, 23 Apr 2026 09:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2FBC2BCB5;
	Thu, 23 Apr 2026 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776934885;
	bh=Eu/SmExZ/rwzOyVcWXd6hXxkzr3pDxSpoQ7dS4ZvWVs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=cLwWqTHaeZBl0LqOqHdGX2T3bhBNuHoKb9yTWjJUMeqkv/BxTCTG0yibwTgkcLYc9
	 UFwNXNocXCocFLISZE+Mhd9POxlB9echbZLC0bl30axmXcx/O18nPU9aWxKnLjGoJu
	 a+0bnO99Z3gHYe6Puq8ie2EtkI4eKK+vL/hAnzOE=
Subject: Patch "arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance" has been added to the 6.18-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 11:01:14 +0200
In-Reply-To: <20260421100018.335793-4-catalin.marinas@arm.com>
Message-ID: <2026042314-outline-customary-99ba@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020126_632049_432B38B6 
X-CRM114-Status: GOOD (  14.71  )
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

    arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-tlb-introduce-__tlbi_sync_s1ish_-kernel-batch-for-tlb-maintenance.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-240111-greg=kroah.com@vger.kernel.org Tue Apr 21 12:07:14 2026
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 21 Apr 2026 11:00:14 +0100
Subject: arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Message-ID: <20260421100018.335793-4-catalin.marinas@arm.com>

From: Catalin Marinas <catalin.marinas@arm.com>

commit 6bfbf574a39139da11af9fdf6e8d56fe1989cd3e upstream.

Add __tlbi_sync_s1ish_kernel() similar to __tlbi_sync_s1ish() and use it
for kernel TLB maintenance. Also use this function in flush_tlb_all()
which is only used in relation to kernel mappings. Subsequent patches
can differentiate between workarounds that apply to user only or both
user and kernel.

A subsequent patch will add mm_struct to __tlbi_sync_s1ish(). Since
arch_tlbbatch_flush() is not specific to an mm, add a corresponding
__tlbi_sync_s1ish_batch() helper.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/tlbflush.h |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -191,6 +191,18 @@ static inline void __tlbi_sync_s1ish(voi
 	__repeat_tlbi_sync(vale1is, 0);
 }
 
+static inline void __tlbi_sync_s1ish_batch(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
+static inline void __tlbi_sync_s1ish_kernel(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
 /*
  * Complete broadcast TLB maintenance issued by hyp code which invalidates
  * stage 1 translation information in any translation regime.
@@ -286,7 +298,7 @@ static inline void flush_tlb_all(void)
 {
 	dsb(ishst);
 	__tlbi(vmalle1is);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -345,7 +357,7 @@ static inline bool arch_tlbbatch_should_
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_batch();
 }
 
 /*
@@ -512,7 +524,7 @@ static inline void flush_tlb_kernel_rang
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -526,7 +538,7 @@ static inline void __flush_tlb_kernel_pg
 
 	dsb(ishst);
 	__tlbi(vaae1is, addr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 


Patches currently in stable-queue which might be from catalin.marinas@arm.com are

queue-6.18/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch
queue-6.18/arm64-tlb-introduce-__tlbi_sync_s1ish_-kernel-batch-for-tlb-maintenance.patch
queue-6.18/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-6.18/arm64-tlb-pass-the-corresponding-mm-to-__tlbi_sync_s1ish.patch
queue-6.18/arm64-cputype-add-c1-pro-definitions.patch
queue-6.18/arm64-errata-work-around-early-cme-dvmsync-acknowledgement.patch

