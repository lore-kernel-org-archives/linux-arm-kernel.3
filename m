Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF8C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C7meh7Zk2BryuRHZQzTdfY/zcqUr93vjK6hfL4XFOhg=; b=Fu6AV5JYPhe5n1j1nriEN3A6QJ
	j+W7cNXZfvLJH6/OLDz8pHt4v3o1KFsm79mVclxrq9m/z98u6Ziw0LqhxlaL27rYeMSXGIywPwSmk
	glQo0YTypGPAyzXKPVKL5W6o7YSFReQkgpJBGrKFVywsdCnnrjFDggwJBMfOBPqcWfIXYJJD70Kfc
	Dunj8R7Acrbn5F3KEzFePYx5dyTF3O6rj4BYAe0GVkkFxzW5sWYy45Tg/Aeg0dqPVNnDBR//QeaWa
	TMflpOhza/E4wMfzgB6PyVTt/GSdWlpAaFo9pR9pTV0RMHezrFeStvkyM2nM/I773t8ingrFeo+v1
	Rjw/SZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXsu-00000002TKN-1agQ;
	Tue, 01 Apr 2025 09:26:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXi2-00000002REm-1m3Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F2175C5CED;
	Tue,  1 Apr 2025 09:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A92C4CEE4;
	Tue,  1 Apr 2025 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743498901;
	bh=seWYDHPLc2z3HEFqrMpWI1o5SgZbSrhxi4B6ybcZzwI=;
	h=Subject:To:Cc:From:Date:From;
	b=tQJ/H0PQDLESCEz2nFlyaHS9rcz9PhBXhttcZ0mJtmKEjLn+awW0bSUDICRp1dE6H
	 C5SreI6gmiEgJb85gh1cyQ6aziXRpnmKLE2aZfEupgA3emy6PW0DnvtmCu2qfjREXV
	 koaQfJfsyPchHo4NwcJ9U2ahB1LVGkmdEsfvXKWg=
Subject: Patch "ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()" has been added to the 5.15-stable tree
To: akpm@linux-foundation.org,ardb@kernel.org,ben@decadent.org.uk,broonie@kernel.org,gregkh@linuxfoundation.org,keescook@chromium.org,linux-arm-kernel@lists.infradead.org,rmk+kernel@armlinux.org.uk,wangkefeng.wang@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 10:13:23 +0100
Message-ID: <2025040123-lazy-abstract-aab6@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021502_516187_32730E09 
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

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
and it can be found in the queue-5.15 subdirectory.

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
@@ -24,6 +24,13 @@
 
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

queue-5.15/arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
queue-5.15/slab-clean-up-function-prototypes.patch
queue-5.15/arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch
queue-5.15/slab-introduce-kmalloc_size_roundup.patch
queue-5.15/openvswitch-use-kmalloc_size_roundup-to-match-ksize-.patch

