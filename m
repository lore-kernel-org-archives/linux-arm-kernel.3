Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116F8D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwkxrOhf4MPsWdJ3TbYzFMXzZqwZrMM4caiEbRwaHlc=; b=kV2cl+gRuotsvMh3Q5aotKDMHH
	jzhAOAGjNdn21uzRuE8HM9x1Lus0CFUI13SenFe3tzDiekI9RXbTrEyo+jqIOHPnqWhoPv3/29f0k
	3dWzU9EAFKu2+S6EwFmR9aafddd21wUY/a0xhQw5xNjT/Rm0zRb6dHv+5n+Tpd98HsO4fyYtAlCp5
	V+FGja3AGNoI4HkuspRjlxAFNEvhYiRTUPWdyCuZBumlinHl1FL1c/IY1bt8Fr1RD0HosR7K2fGYH
	BLfsSKDbMb1U2/2xdcisXSuXbWiPdt2uLu25e/9WgROPkpr6Nsng6aUBQWjVRnzxQtkO0GJG5NWua
	umy+SJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2N6-00000000jqx-0FGL;
	Fri, 28 Nov 2025 17:35:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2N3-00000000jqJ-10WV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JwkxrOhf4MPsWdJ3TbYzFMXzZqwZrMM4caiEbRwaHlc=; b=EL8Chp9jEKRF7gKMPiwqVJMmUi
	3sja2/y4vjeQ1ppshT3Y0Phtzb/uA0GK4rORcGycRI4NBjBEMRXoaSoIXCeS+SWJl032Ib++WYptL
	x0IYBkql8K00oiwm7UzwVXX3X/i2/sBjeGk2+j6vi8lnTIx0FlJNpxYizecjmRn1iFfwg8hxM0ip9
	8p7k3NEwKfnQhmyhfYKrR+8rCrEUAn7CXRvAZO06nEmmL33gMsfTc5WHBJiUssojzWZUGL0x8BPYQ
	PhHgGkwqAaFhx/nnT54HgjdB7Zlsb5WvULLZ1VMGrYqeBfrUAuATDr+HUyD+sBc684L0Kt7gQdKgF
	aIHx+16g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34828)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vP2Me-0000000076f-1n11;
	Fri, 28 Nov 2025 17:34:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vP2MZ-000000003nu-1jFT;
	Fri, 28 Nov 2025 17:34:31 +0000
Date: Fri, 28 Nov 2025 17:34:31 +0000
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
Message-ID: <aSndJ1EYUnMGsUYX@shell.armlinux.org.uk>
References: <20251127145127.qUXs_UAE@linutronix.de>
 <20251128022756.9973-1-xieyuanbin1@huawei.com>
 <20251128120359.Xc09qn1W@linutronix.de>
 <aSnVXrnuY9QKjTKg@shell.armlinux.org.uk>
 <20251128172242.cCNBVf7H@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128172242.cCNBVf7H@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_093501_283013_582CB18B 
X-CRM114-Status: GOOD (  21.56  )
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

On Fri, Nov 28, 2025 at 06:22:42PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-28 17:01:18 [+0000], Russell King (Oracle) wrote:
> > > I hope Russell will add them once he gets to it. They got reviewed, I
> > > added them to the patch system.
> > 
> > I'm not sure which patches you're talking about, but discussion is
> > still ongoing, so it would be greatly premature to merge anything.
> 
> This thread
> 	https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy@linutronix.de/
> 
> and the patches are 9459/1 to 9463/1 in your patch system. They address
> other issues, not this one.

Oh, the branch predictor issue. Yea, I'm not keen on changing that
because I'm not sure if it's correct (the knowledge for this has
long since evaporated.) There have been multiple attempts at fixing
this in the past, and I've previously pointed out problems with
them when I _did_ have the knowledge. Have you looked back in the
archives to see whether any of that feedback I've given in the past
is relevant?

> > https://lore.kernel.org/r/aSmUnZZATTn3JD7m@willie-the-truck
> > 
> > There are now many threads each with their own discussion, which
> > makes it more difficult to work out which is the implementation that
> > should be merged. Clearly, not everyone knows about the other
> > discussion threads.
> 
> So Will suggested to let change the handler and handle this case. The
> other patch is avoiding handling addr > TASK_SIZE.
> Any preferences from your side?

... and now we have a new proposal from Linus. I'm not intending to
do anything on this new problem until the discussion calms down and
we stop getting new solutions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

