Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA5C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WiCxtzd63a71FtjHcTg2I660pi74yXJ5/7vdxwgSS+o=; b=XPV/AKuxU3u7hwX2EXvQu+29+4
	/kAi1C3Y4YTVgg/iOIZg6Rx7osnWYfvtCwY+0V7s1KFMBNSSojuvGvo576tbqrDpg602p/hphbbmh
	b4vAQ3fQb8pkX9RJmSACNXWko7BdhxG+coh+xegP1h4crJrbbBB1DpRH5hMDYzQzYXWYvrBKnZURV
	vTsylH3EiM0CJgqRHdc6Uv6TpZJXAYSxYapMWKivWz0RY7JHWSQ81pBSZX2Hn1ezicrnBl223nZj5
	K4GIOHHrZ6oLUry7i/lIqrOvN9vRPOVCHcmZgvEH0MPGMAapQUJ4s3enBL2agfz0Bf1CiLCD9NX+t
	Qvg3QVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYMl-00000002Xep-2yLd;
	Tue, 01 Apr 2025 09:57:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkd-00000002RfB-0jZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BA7844DE9;
	Tue,  1 Apr 2025 09:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F3C4CEE5;
	Tue,  1 Apr 2025 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743499063;
	bh=tCSwpeClK7C7zImTBSmRclMXmpQgGkoDkjZ2o/XhfU0=;
	h=Subject:To:Cc:From:Date:From;
	b=J+6rwYTvKcFCkfqiJwSQCfpfUsItCdYtRnXjYV3GKOKzYX2JUvtOpz2TVxnWlrMzx
	 gDVwB9b0gbBrvqVk9apuaIn2qyt2A7x5avbXM/WULS23wEThCYW4rbLGPOaRY/edKv
	 H0R1rbFckZqvv/Phw54uaoOn3wvpLl3nkstvYNCM=
Subject: Patch "ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()" has been added to the 6.1-stable tree
To: akpm@linux-foundation.org,ardb@kernel.org,ben@decadent.org.uk,broonie@kernel.org,gregkh@linuxfoundation.org,keescook@chromium.org,linux-arm-kernel@lists.infradead.org,rmk+kernel@armlinux.org.uk,wangkefeng.wang@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 10:15:42 +0100
Message-ID: <2025040142-pester-spiritism-3118@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021743_261547_C83ED043 
X-CRM114-Status: GOOD (  13.43  )
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

    ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 169f9102f9198b04afffa6164372a4ba4070f412 Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Thu, 1 Feb 2024 18:32:58 +0100
Subject: ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()

From: Kees Cook <keescook@chromium.org>

commit 169f9102f9198b04afffa6164372a4ba4070f412 upstream.

Under PAN emulation when dumping backtraces from things like the
LKDTM EXEC_USERSPACE test[1], a double fault (which would hang a CPU)
would happen because of dump_instr() attempting to read a userspace
address. Make sure copy_from_kernel_nofault() does not attempt this
any more.

Closes: https://lava.sirena.org.uk/scheduler/job/497571
Link: https://lore.kernel.org/all/202401181125.D48DCB4C@keescook/ [1]

Reported-by: Mark Brown <broonie@kernel.org>
Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Cc: Wang Kefeng <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mm/fault.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -25,6 +25,13 @@
 
 #include "fault.h"
 
+bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+{
+	unsigned long addr = (unsigned long)unsafe_src;
+
+	return addr >= TASK_SIZE && ULONG_MAX - addr >= size;
+}
+
 #ifdef CONFIG_MMU
 
 /*


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-6.1/arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
queue-6.1/arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch

