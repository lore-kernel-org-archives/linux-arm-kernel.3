Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5934C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VP8XzO8vFrFd5ETL1+sEMHAtuJv2eejZ8MTTJf7D5E=; b=yYJ7vE365qPAVXyBi+zW5ehN5n
	kbvEVwEeo7mLkAZg5DZ7sngKOimntCvC/Jwfj1goVnGe/57WUXc1gjznALZTOYQjtpEaoXH/UeCVM
	ctTasx/QIZNL0RVcBODnFhOCGAIJvAIhOopXoLNI9mfGF9jFZ1e/CJWe6xp1+VVBFnEvhX/7zaqoK
	SYTIrUFkMTgfvoI2FoPAmKLXeK/i3w+cpNRHwycjsSaia7xuPj9pYQbN/T4epvBKY28DY1CLMkDNw
	rUx4uwQlw1QpfswH70gVL5H2gcnFLLsUc1a/WefCAxTWqLTIaZE3Qs/1vhqSgh8vmUCzKaB7L/qRD
	ipsc2RJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXr9-00000002T0S-19ex;
	Tue, 01 Apr 2025 09:24:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXft-00000002R02-2B1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44EA361132;
	Tue,  1 Apr 2025 09:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513E5C4CEE4;
	Tue,  1 Apr 2025 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743498768;
	bh=yT2rb8dZFzaEEkIrEzNU+tghfBfIqg/UjQr0q7GY2XE=;
	h=Subject:To:Cc:From:Date:From;
	b=1D5EP4dfTA9YxGi3e/Lc/eoZUvdrv8HOrY7PVXzEqzR1aX+ywIQCtLEYwqEB3VVeA
	 7M9JAdVDhlXnDLXiIdW58cGrwLC6PuyFyFluMUBnVcJ+jG5WD+nceBUqRBiIY+QMYF
	 8cvsltq/bBXp0LX8od45VM2NJzOYovLmf2l0BxRE=
Subject: Patch "ARM: 9351/1: fault: Add "cut here" line for prefetch aborts" has been added to the 5.10-stable tree
To: ardb@kernel.org,ben@decadent.org.uk,gregkh@linuxfoundation.org,keescook@chromium.org,linux-arm-kernel@lists.infradead.org,rmk+kernel@armlinux.org.uk,wangkefeng.wang@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 10:11:05 +0100
Message-ID: <2025040105-crumpled-manger-cfde@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch
and it can be found in the queue-5.10 subdirectory.

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
@@ -559,6 +559,7 @@ do_PrefetchAbort(unsigned long addr, uns
 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
 		return;
 
+	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unhandled prefetch abort: %s (0x%03x) at 0x%08lx\n",
 		inf->name, ifsr, addr);
 


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.10/arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
queue-5.10/arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch

