Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E211C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW1i2nsSqGec664NhqCRjOb/CVuLPA/uupdfC4+Q4iM=; b=R/ShwQQxO6OsXFMle8ncnvP3nc
	/LqNo41g6J3ZMgxAOILyhToPhTTcNiuEKkmkSM4ZjAKj9pWUQrxHJVMIBtKt1lVBlU4U+YpNbmJBc
	tZBCmqwYWJB2pQyUiXtoGKJWkLm2dV4lqAsGkWa/rkf8jzfKVnaz84cGrcgQUJpleOEqgwCehJeIl
	iOGBmN6lkph0B2w0MtE/dBsGCqEVKLnoc33+0vOgLXtedEuOZrg8qoi/Zm0cXQo76ukgor3EnG95t
	JYK/J1jmIOSr8X1db9rkLDg2WGW9f46IeV3ip4tG7hs/gC25b5ssMJnpGJc5NFMPS8nZ10UtlbyEE
	aC02tCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7ot-0000000FKYN-3rsc;
	Tue, 07 Jul 2026 15:34:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7ok-0000000FKWn-2ecF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cW1i2nsSqGec664NhqCRjOb/CVuLPA/uupdfC4+Q4iM=; b=cbP0GUWTecrX6+QzFTOuGrg/ML
	sP1WAqoiMgHkO/UfOpf1RP6G7STdApB9Sqa5Q2j5+DumZDSKVgTAHcEvdVLNdQfUyfOPeikXydS4F
	aIO83IvQVFHcJHa9wVDa8zDuDbfoAAVU4soZ9ZlICSDvwByhTuou2aMTR7N82NsFXrMHpV2RZ7UDQ
	vPjfLEmWKL60siohRItl40x5InPPmgvilMzheygahePYah/p4EhCuuJm3OvSVckq8YtdzTbUCFB9c
	QtrdnqQdkd91USgiGA6nbDOJkX932vct6mpiGJvuDrbZSOZOKlGUJwjR7rElglPKtTjxPr1qBu2fk
	cGFXXK9w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47092)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wh7oW-0000000013B-3tY9;
	Tue, 07 Jul 2026 16:34:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wh7oT-000000006oU-389I;
	Tue, 07 Jul 2026 16:34:21 +0100
Date: Tue, 7 Jul 2026 16:34:21 +0100
From: Russell King <linux@armlinux.org.uk>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, liam@infradead.org, liaohua4@huawei.com,
	lilinjie8@huawei.com, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, mhocko@suse.com, rppt@kernel.org,
	sunnanyong@huawei.com, surenb@google.com, vbabka@kernel.org,
	xiqi2@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <ak0cfZPZIWz4v95K@shell.armlinux.org.uk>
References: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
 <20260707131409.79043-1-xieyuanbin1@huawei.com>
 <akz8aZUW23rpyrLO@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akz8aZUW23rpyrLO@lucifer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_083439_311181_6A399279 
X-CRM114-Status: GOOD (  23.69  )
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

On Tue, Jul 07, 2026 at 02:20:19PM +0100, Lorenzo Stoakes wrote:
> On Tue, Jul 07, 2026 at 09:14:09PM +0800, Xie Yuanbin wrote:
> > On Tue, 7 Jul 2026 12:57:45 +0100, Russell King wrote:
> > > No. This information is useful debug for kernel oops.
> >
> > For kernel oops, I think it should be `!user_mode(regs)`, Qi Xi's reply:
> >
> > On Tue, 7 Jul 2026 19:48:12 +0800, Qi Xi wrote:
> > > For do_DataAbort() fallback:
> > >
> > >	if (user_mode(regs)) {
> > >		if (addr < TASK_SIZE) {
> > >			mmap_read_lock(current->mm);
> > >			show_pte(KERN_ALERT, current->mm, addr);
> > >			mmap_read_unlock(current->mm);
> > >		}
> > >	} else {
> > >		show_pte(KERN_ALERT, current->mm, addr);
> > >	}
> >
> > changes nothing to kernel oops. It only skip show_pte() for user-mode
> > faults, and the fault addr is a kernel address, which means a user
> > program is trying to access a kernel address.
> > I think it is reasonable to skip show_pte() in this case?
> 
> Well the whole reason you're faulting here might be because a userland process
> did that right? The page tables should tell you (presumably on ARM32 :)
> 
> And I hate to repeat myself, maybe you didn't read the whole thread but... just
> use mmap_write_lock(), this isn't necessary?
> 
> What is this trying to achieve?
> 
> You're not in a hotpath, why are you bothering to conditionally take/not take
> the lock?

Unconditionally taking the lock could lead to a deadlock. Consider
the case where the mmap lock is held, and we get an unrecognised
abort from the kernel.

If we try to take the mmap lock again, we'll deadlock, which will
result in very little debug information being output - and the
system locks up. The only thing that would save such a case would
be if the user had decided to use a hardware watchdog, or is
physically present to press the reset button.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

