Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302AFD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVRJvm/lygEstYwV/cxa35RATnYQMUHVa5blksxqM90=; b=03uumdXAC4fupzo7KOR6eKOQwK
	i7DJM0Uud29Bn8TZoTWyGIhJYhDy3mgHCdeb5QWaF/aVEFtUGdZrNdEEvoPd1i2ZR9ixoZPS7i8A/
	WaOLFJiNcbcn3c4fhgAV/8jDgWPq+as6mCWC0/CnwRWc8fRWOB1RAo8tZN0feRuGTFsHcKJM0bJ0o
	fZqTWMs5vehw1xKFu7rsqOIsrAaOl2Jq94uQBj2j8e1n/RIqH6UzGS5TByvtm/X8pgH+i4qiafh1T
	knLY2ySBXqQ1OvtZ5ThUqGajTb2yGfI7RhcilTOMI81Y1kt2gj4wPv9OxfTp1N7uZUBWjbmY+AqXE
	kmshqTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1rc-00000000hGZ-1bhZ;
	Fri, 28 Nov 2025 17:02:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1rY-00000000hFM-48Dw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XVRJvm/lygEstYwV/cxa35RATnYQMUHVa5blksxqM90=; b=Du0ZlL/yTuJ7tgAK2/eya2Msv0
	m1hqJ1fknLG5/2gAaZraPTBi4xu5lbdIohbe+V2jihr4tRyNEtbSORjNW/LjDwo9S5Nas1NhX0U+X
	vO1ED5Q3H05FJRXQJm28JEFlS6JVro50OVs0uhPUT8l7bea10AB3nG06YNtCYyGUuTmfhMa75P4Oh
	/dhkFNrWOrM0yYp2pq9f5ZW2TG5aKT5L0OnEgk/qi8Al+krHe1/xBvr+aQSYMZAya472w82YALFwu
	5Q2rA7atA436DTMf/r7uTyS/8+zDwF2MuzRB9woLnX+Wm6oeApu9ixX4s8wLJ7MiB7MKf8PvS9g9L
	mYnjWg5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vP1qZ-0000000071m-1bEl;
	Fri, 28 Nov 2025 17:01:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vP1qR-000000003mj-01ZK;
	Fri, 28 Nov 2025 17:01:19 +0000
Date: Fri, 28 Nov 2025 17:01:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org,
	arnd@arndb.de, brauner@kernel.org, david.laight@runbox.com,
	hch@lst.de, jack@suse.com, kuninori.morimoto.gx@renesas.com,
	liaohua4@huawei.com, lilinjie8@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, marc.zyngier@arm.com, nico@fluxnic.net,
	pangliyuan1@huawei.com, pfalcato@suse.de, punitagrawal@gmail.com,
	rjw@rjwysocki.net, rppt@kernel.org, tony@atomide.com,
	vbabka@suse.cz, viro@zeniv.linux.org.uk, wangkefeng.wang@huawei.com,
	will@kernel.org, wozizhi@huaweicloud.com
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when
 handling with page faults of kernel address
Message-ID: <aSnVXrnuY9QKjTKg@shell.armlinux.org.uk>
References: <20251127145127.qUXs_UAE@linutronix.de>
 <20251128022756.9973-1-xieyuanbin1@huawei.com>
 <20251128120359.Xc09qn1W@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128120359.Xc09qn1W@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_090229_048706_315B1F0C 
X-CRM114-Status: GOOD (  15.92  )
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

On Fri, Nov 28, 2025 at 01:03:59PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-28 10:27:56 [+0800], Xie Yuanbin wrote:
> > According to the discussion, it might be better to handle the kernel
> > address fault directly, just like what x86 does, instead of finding VMA.
> 
> the kernel fault shouldn't have a VMA
> 
> > Link: https://elixir.bootlin.com/linux/v6.18-rc7/source/arch/x86/mm/fault.c#L1473
> > ```c
> > 	if (unlikely(fault_in_kernel_space(address)))
> > 		do_kern_addr_fault(regs, error_code, address);
> > 	else
> > 		do_user_addr_fault(regs, error_code, address);
> > ```
> > 
> > It seems your patches hasn't been merged into the linux-next branch yet.
> 
> I hope Russell will add them once he gets to it. They got reviewed, I
> added them to the patch system.

I'm not sure which patches you're talking about, but discussion is
still ongoing, so it would be greatly premature to merge anything.

https://lore.kernel.org/r/aSmUnZZATTn3JD7m@willie-the-truck

There are now many threads each with their own discussion, which
makes it more difficult to work out which is the implementation that
should be merged. Clearly, not everyone knows about the other
discussion threads.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

