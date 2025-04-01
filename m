Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758F7C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/caelYZHfrPt5GIAkUy/0++3k6rFdT+YLbsInDvrY8=; b=gim+NXmAhQKYL5i9++K59WuUpK
	SB/3szktGb4hRhcNX0RPz76CefE+qoESrqKpSLLy4VyQDdb9FjuqaW1mts5AgxZkVbYwWoETLtyhF
	UTqMmU17sOo8PffVoUqKhZ3nMhJ8KvYR/4qYSsyvuL+dnNGWduiA3uqj09s6PRFBH5dECNLDLFcjN
	+VxwBqA97quciHKihlcnXXwjzviSj497Dw30RerurYs+FQ9w9gDVnukn03XvL+4X3qbyQIPNVQDmI
	x66pSckM+uNg8jF2rCmp73+O/BYscLB9MNYx08/zhqPdqhau8Xvv6sPpsNiXp5dhNbIxDKjQswdW3
	lQOPidaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYTm-00000002YmE-2M23;
	Tue, 01 Apr 2025 10:04:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXoN-00000002Sle-2DO5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3575A4440E;
	Tue,  1 Apr 2025 09:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08251C4CEE4;
	Tue,  1 Apr 2025 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743499294;
	bh=3XJcyP9cSWdPUJWcEzJ6e1l3veGQ/axLQOZFS0EQXsQ=;
	h=Subject:To:Cc:From:Date:From;
	b=sAl5UaIpdXM0+0ofcsdNM0gYVcmnFXgB7wFWiyNucZOLMbqx7vHBHbYv6J14n1vzr
	 u6j9ymuAud9YG6aqjPD2pSEjy0REVrJjS0pU9T8ShmnrKzzd3Q8ps/cYYYxpYr7iNv
	 +S3GOaxs0iYqtJi2BxkrggvDdU5t3YzQDAvcpcQM=
Subject: Patch "ARM: 9351/1: fault: Add "cut here" line for prefetch aborts" has been added to the 6.6-stable tree
To: ardb@kernel.org,ben@decadent.org.uk,gregkh@linuxfoundation.org,keescook@chromium.org,linux-arm-kernel@lists.infradead.org,rmk+kernel@armlinux.org.uk,wangkefeng.wang@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 10:19:51 +0100
Message-ID: <2025040151-eternity-profane-c1d2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_022135_654736_6C2F8E5B 
X-CRM114-Status: GOOD (  13.27  )
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

    ARM: 9351/1: fault: Add "cut here" line for prefetch aborts

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8f09b8b4fa58e99cbfd9a650b31d65cdbd8e4276 Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Thu, 1 Feb 2024 18:32:23 +0100
Subject: ARM: 9351/1: fault: Add "cut here" line for prefetch aborts

From: Kees Cook <keescook@chromium.org>

commit 8f09b8b4fa58e99cbfd9a650b31d65cdbd8e4276 upstream.

The common pattern in arm is to emit a "8<--- cut here ---" line for
faults, but it was missing for do_PrefetchAbort(). Add it.

Cc: Wang Kefeng <wangkefeng.wang@huawei.com>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mm/fault.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -563,6 +563,7 @@ do_PrefetchAbort(unsigned long addr, uns
 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
 		return;
 
+	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unhandled prefetch abort: %s (0x%03x) at 0x%08lx\n",
 		inf->name, ifsr, addr);
 


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-6.6/arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
queue-6.6/arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch

