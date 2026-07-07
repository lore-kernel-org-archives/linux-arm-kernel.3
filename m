Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D407AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stkx+vjsKdhX968mmJiOePHn7dujN6VJDWqehc4K6N4=; b=h0Ms9190ppnYklN5d1I63CYJ9W
	DbqCWiuDsgdYddFERBX5PSavsY0lHrBKqng1ygGL+RCLnlrp3hjz+xLB/0lps4l2hlsrtdds/s5IH
	VBz4wAHTv414Ynqax2/07Cv9/A2xEeoSevPoyKIZVw2GfWOXW7lS/6mOEbOCKLM87GoO7B7JPPsWr
	1Mu3g5QpxCGCvCIY09My0BmjQel+ELG9pMeRQYyGnurh/mcFZ29YYC5ZCmwI1youDlA7Y9pKtsGas
	I623ayCNxmN0b1XI2o7A4rB0fPIYf9k7obOi6g84ccM40wiYAlLqXvP+4aT78jQpypmG8j1Ty7hQH
	HsW1sAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4RQ-0000000EuFw-1951;
	Tue, 07 Jul 2026 11:58:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4RN-0000000EuEv-3VeR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=stkx+vjsKdhX968mmJiOePHn7dujN6VJDWqehc4K6N4=; b=CQap+tkaox9/fVICER9FoFNvDu
	e//Xtvd6Qs1gsrYGHA+TRKpq5dBGjLojzL9FfGAqF+24spZ1aqVFVlU0uyeRXvH8QEY9XSUM1GI4+
	sApiwFB89AG0Yy64xD4vHmmZimtSrgLMrpXzjSDE7Z4vyLLGQelEV1efYgpyRyGPfCGsaxfj08E9a
	nmWAe1pnoyFsQHl+gzgze0DQfQSp7FyDtz4+SLME7De/bvDvuu8whgrA8YE0p26g/XsMbHfVT6ne0
	6Qs2eCUnsoJBmNA8dmndgy5vIf4dszJr+Wfw15tEDQSWyGoFlB0pm44BxnHSIeF7tENXo66tVldoG
	I323MjOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45516)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wh4Qu-000000000mm-2UGt;
	Tue, 07 Jul 2026 12:57:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wh4Qr-000000006gy-3vIs;
	Tue, 07 Jul 2026 12:57:45 +0100
Date: Tue, 7 Jul 2026 12:57:45 +0100
From: Russell King <linux@armlinux.org.uk>
To: Qi Xi <xiqi2@huawei.com>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sunnanyong@huawei.com, linux-mm@kvack.org, lilinjie8@huawei.com,
	liaohua4@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
References: <20260626073048.3595106-2-xiqi2@huawei.com>
 <20260706133247.145485-1-xieyuanbin1@huawei.com>
 <c11452a3-b918-4d4c-afd7-a835a1d0a3bc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11452a3-b918-4d4c-afd7-a835a1d0a3bc@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045817_876129_F8FE2B2C 
X-CRM114-Status: GOOD (  22.81  )
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

On Tue, Jul 07, 2026 at 07:48:12PM +0800, Qi Xi wrote:
> 
> 
> On 06/07/2026 21:32, Xie Yuanbin wrote:
> > On Fri, 26 Jun 2026 15:30:47 +0800, Qi Xi wrote:
> > > @@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
> > >   		pr_err("8<--- cut here ---\n");
> > >   		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
> > >   		       tsk->comm, sig, addr, fsr);
> > > +		mmap_read_lock(tsk->mm);
> > >   		show_pte(KERN_ERR, tsk->mm, addr);
> > > +		mmap_read_unlock(tsk->mm);
> > >   		show_regs(regs);
> > >   	}
> > >   #endif
> > I found that this fix does not completely solve the problem. For a user
> > fault, the addr could also be a kernel address. For arm32/x86, the kernel
> > address space and user address space share the same pgd page table,
> > but the kernel address space's page table is not protected by
> > current->mm->mmap_lock.
> > 
> > I have written a use case to construct and verify this point. When A user
> > program accesses a kernel address and triggers __do_user_fault(),
> > show_pte() will directly print the kernel page table.
> > 
> > So, I suggest that:
> > ```c
> > 	if (user_mode(regs)) {
> > 		struct mm_struct *const pt_mm = addr >= TASK_SIZE ?
> > 			&init_mm : current->mm;
> > 
> > 		mmap_read_lock(pt_mm);
> > 		show_pte(KERN_ALERT, pt_mm, addr);
> > 		mmap_read_unlock(pt_mm);
> > 	} else {
> > 		// .. keep nothing change
> > 		show_pte(KERN_ALERT, current->mm, addr);
> > 	}
> > ```
> > 
> > I have read this article:
> > Link: https://docs.kernel.org/mm/process_addrs.html
> > `mmap_read_lock(&init_mm)` should be able to ensure that the kernel
> > address's page tables can be traversed. But I'm not quite sure if
> > `mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
> > addresses?
> You're right. And I think the fix is to simply skip show_pte() for kernel
> addresses.

No. This information is useful debug for kernel oops.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

