Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74741D2F7E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOqOO1RkHv+TL4sHO2I/M94wigINI1Cn0aqofm8+DJM=; b=PS1ZLIHWOPuZy7xUbA6WOmdxiS
	iz5NOr+Vc/D5cTZbG21xXOVvopoOQ3Nzqm9Sj0YGifNgltoFTrnrLKtCTmuR0BY0aOUNsxhrSV88T
	I4bxUmdcdDea9xaca8HuHVi5v+mqQtsKXwQ/boMpgM7VDe2gujeFunZwLTTbnnwH/VX2uI1EFaDWB
	0HQYmar+V2OHx7ayexEjFbnPvtYUcY2UCbuWnvTo1cjVSn7GfVK7nhTHnUBuxSpBKfwfyFUjhCtFU
	VkGlUVxBw2otJM5xUHlA8LEwkw3HyBouHui/b5zZZ4PD/uHy9z9nMQ4e7YwdyS86jvgJ654hyoWXX
	c1bBxA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUc5-00000009SLF-2bBC;
	Fri, 05 Dec 2025 12:08:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUc2-00000009SKg-2gT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qOqOO1RkHv+TL4sHO2I/M94wigINI1Cn0aqofm8+DJM=; b=JrZon1c+goGZ/cvJPITZz+HQAG
	H8Glqh4GmzB4ynFJAlqotxWYu/at+K2gILu3ugTSYfgyyA9nlgkYCOH9DsRXqv3mk+Id9XnDEeOyo
	KPPF7riTyhWttscjHg/UmGw+FFzHJ+L3PDkBoL47BA7n8mYjoZSHW/H/o341Ym97v+olzn/mai3wg
	jtud26oX+CTo/9jlt8VAMQYI2a5VHeGTe/kcmC2pGu8768drFMpPega2QiNq3vkswcBw485F65wHM
	TiWeqs1otv1R5KDD6QrYP4z85DZ5jaJokaX/uCSIHMgPaKqDiJ87vv2t31h78rMOxahMYDXcOxl2s
	+bhzADnQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53922)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRUbi-000000004aX-0Y8R;
	Fri, 05 Dec 2025 12:08:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRUbe-0000000025R-1Eju;
	Fri, 05 Dec 2025 12:08:14 +0000
Date: Fri, 5 Dec 2025 12:08:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
	brauner@kernel.org, catalin.marinas@arm.com, hch@lst.de,
	jack@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, pangliyuan1@huawei.com,
	wangkefeng.wang@huawei.com, will@kernel.org,
	wozizhi@huaweicloud.com, yangerkun@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aTLLLuup7TeAqFVL@shell.armlinux.org.uk>
References: <CAHk-=wg4ZnsfpgXYL5qhjYDYo1Gnssz+VxnKZzHXMEmE7qrnQQ@mail.gmail.com>
 <20251203014800.4988-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203014800.4988-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_040838_858895_DCAF78E9 
X-CRM114-Status: GOOD (  36.70  )
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

On Wed, Dec 03, 2025 at 09:48:00AM +0800, Xie Yuanbin wrote:
> On Tue, 2 Dec 2025 14:07:25 -0800, Linus Torvalds wrote:
> > On Tue, 2 Dec 2025 at 04:43, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> >>
> >> What I'm thinking is to address both of these by handling kernel space
> >> page faults (which will be permission or PTE-not-present) separately
> >> (not even build tested):
> >
> > That patch looks sane to me.
> >
> > But I also didn't build test it, just scanned it visually ;)
> 
> That patch removes harden_branch_predictor() from __do_user_fault(), and
> moves it to do_page_fault()->do_kernel_address_page_fault(). 
> This resolves previously mentioned kernel warning issue. However,
> __do_user_fault() is not only called by do_page_fault(), it is
> alse called by do_bad_area(), do_sect_fault() and do_translation_fault().
> 
> So I think that some harden_branch_predictor() is missing on other paths.
> According to my tests, when CONFIG_ARM_LPAE=n, harden_branch_predictor()
> will never be called anymore, even if a user program trys to access the
> kernel address.
> 
> Or perhaps I've misunderstood something, could you please point it out?
> Thank you very much.

Right, let's split these issues into separate patches. Please test this
patch, which should address only the hash_name() fault issue, and
provides the basis for fixing the branch predictor issue.

Yes, at the moment, do_kernel_address_page_fault() looks very much like
do_bad_area(), but with the addition of the IRQ-enable if the parent
context was enabled, but the following patch to address the branch
predictor hardening will show why its different.

In my opinion, this approach makes the handling for kernel address
page faults (non-present pages and page permission faults) much easier
to understand.

Note that this will call __do_user_fault() with interrupts disabled.

Build tested, and remotely boot tested on Cortex-A5 hardware but
without kfence enabled. Also tested usermode access to kernel space
which fails with SEGV:
- read from 0xc0000000 (section permission fault, do_sect_fault)
- read from 0xffff2000 (page translation fault, do_page_fault)
- read from 0xffff0000 (vectors page - read possible as expected)
- write to 0xffff0000 (page permission fault, do_page_fault)

8<===
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] ARM: fix hash_name() fault

Zizhi Wo reports:

"During the execution of hash_name()->load_unaligned_zeropad(), a
 potential memory access beyond the PAGE boundary may occur. For
 example, when the filename length is near the PAGE_SIZE boundary.
 This triggers a page fault, which leads to a call to
 do_page_fault()->mmap_read_trylock(). If we can't acquire the lock,
 we have to fall back to the mmap_read_lock() path, which calls
 might_sleep(). This breaks RCU semantics because path lookup occurs
 under an RCU read-side critical section."

This is seen with CONFIG_DEBUG_ATOMIC_SLEEP=y and CONFIG_KFENCE=y.

Kernel addresses (with the exception of the vectors/kuser helper
page) do not have VMAs associated with them. If the vectors/kuser
helper page faults, then there are two possibilities:

1. if the fault happened while in kernel mode, then we're basically
   dead, because the CPU won't be able to vector through this page
   to handle the fault.
2. if the fault happened while in user mode, that means the page was
   protected from user access, and we want to fault anyway.

Thus, we can handle kernel addresses from any context entirely
separately without going anywhere near the mmap lock. This gives us
an entirely non-sleeping path for all kernel mode kernel address
faults.

Reported-by: Zizhi Wo <wozizhi@huaweicloud.com>
Reported-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Link: https://lore.kernel.org/r/20251126090505.3057219-1-wozizhi@huaweicloud.com
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 46169fe42c61..2bbec38ced97 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -260,6 +260,35 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
 }
 #endif
 
+static int __kprobes
+do_kernel_address_page_fault(struct mm_struct *mm, unsigned long addr,
+			     unsigned int fsr, struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		/*
+		 * Fault from user mode for a kernel space address. User mode
+		 * should not be faulting in kernel space, which includes the
+		 * vector/khelper page. Send a SIGSEGV.
+		 */
+		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
+	} else {
+		/*
+		 * Fault from kernel mode. Enable interrupts if they were
+		 * enabled in the parent context. Section (upper page table)
+		 * translation faults are handled via do_translation_fault(),
+		 * so we will only get here for a non-present kernel space
+		 * PTE or PTE permission fault. This may happen in exceptional
+		 * circumstances and need the fixup tables to be walked.
+		 */
+		if (interrupts_enabled(regs))
+			local_irq_enable();
+
+		__do_kernel_fault(mm, addr, fsr, regs);
+	}
+
+	return 0;
+}
+
 static int __kprobes
 do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 {
@@ -273,6 +302,12 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
+	/*
+	 * Handle kernel addresses faults separately, which avoids touching
+	 * the mmap lock from contexts that are not able to sleep.
+	 */
+	if (addr >= TASK_SIZE)
+		return do_kernel_address_page_fault(mm, addr, fsr, regs);
 
 	/* Enable interrupts if they were enabled in the parent context. */
 	if (interrupts_enabled(regs))
-- 
2.47.3

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

