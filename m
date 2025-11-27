Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB3FCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwaD6e3iO7FBswKwqbiTF+sng1XMVLA9gDzbmcM5PHM=; b=ceptD3YiwnlH8d5T3C0QNFi5Fy
	mbISp2Gqgc0dlQ6pQsqO3ysOho9xko31TlIQLak6KVQleXzKPdMb87fAAjcnOPu5BCGp6EXJyzyA6
	cqdks+xYmz/9DXs13Al9opQ8rI6rldmQ8UF3e7A1uv142pYwwjjZsxSNVCdOdi1k5rFGxONH9knTN
	sR82SM/ON/wsm2r8RK+WiMHb0zd43Nr8JPp9lYyZI0Mb/qLvOZfsj1Yk0c6FtrlJz7mKVJTq4TxoU
	BWVQClatzeyMl5xBKevQLsgo5lXpyaMaMKePTdrvomdkbH5zHyDrh1dC0syaJ+ofwuXt3T1VFYkwY
	lBRBCH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZhc-0000000GPS6-2C95;
	Thu, 27 Nov 2025 10:58:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZhZ-0000000GPRL-23bw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rwaD6e3iO7FBswKwqbiTF+sng1XMVLA9gDzbmcM5PHM=; b=B2/lGneYs6pnScUNtyjG5fu88K
	S9+aReYiXYJTutEJBS5f97T5J5MZrDROL1VEzgpFlfs8j3y+bS501SkJES8IWxiycOAy0t95qRaeH
	amDDj2epiA9f/aFZLEGgNb8spmyhmFUp4APCVQH6+aCByPg72BD60fXcz+KYCsAktSKAGpGFzlpZZ
	Tja95pCyi8u48LDgytl9k+kcHYcY6uAKQyy40CoI8OC1418+VtkN1t2gybnHazlGHODW/+QZnzKzK
	5UsiiICDEJoHLQ0bHx7brGk6gacCnnB3nNT9ocSQ7FGKsyyMY6yAIQpRv9c7ObQarzVFarrC6m5+p
	g/9m4ITg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55668)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOZhM-0000000059B-0iXv;
	Thu, 27 Nov 2025 10:58:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOZhH-000000002cD-2eoj;
	Thu, 27 Nov 2025 10:57:59 +0000
Date: Thu, 27 Nov 2025 10:57:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, jack@suse.com, brauner@kernel.org,
	hch@lst.de, akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
 <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_025817_560472_29EE981E 
X-CRM114-Status: GOOD (  37.11  )
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

On Wed, Nov 26, 2025 at 01:12:38PM -0800, Linus Torvalds wrote:
> On Wed, 26 Nov 2025 at 02:27, Zizhi Wo <wozizhi@huaweicloud.com> wrote:
> >
> > 在 2025/11/26 17:05, Zizhi Wo 写道:
> > > We're running into the following issue on an ARM32 platform with the linux
> > > 5.10 kernel:
> > >
> > > During the execution of hash_name()->load_unaligned_zeropad(), a potential
> > > memory access beyond the PAGE boundary may occur.
> 
> That is correct.
> 
> However:
> 
> > >                This triggers a page fault,
> > > which leads to a call to do_page_fault()->mmap_read_trylock().
> 
> That should *not* happen.  For kernel addresses, mmap_read_trylock()
> should never trigger, much less the full mmap_read_lock().
> 
> See for example the x86 fault handling in  handle_page_fault():
> 
>         if (unlikely(fault_in_kernel_space(address))) {
>                 do_kern_addr_fault(regs, error_code, address);
> 
> and the kernel address case never triggers the mmap lock, because
> while faults on kernel addresses can happen for various reasons, they
> are never memory mappings.
> 
> I'm seeing similar logic in the arm tree, although the check is
> different. do_translation_fault() checks for TASK_SIZE.
> 
>         if (addr < TASK_SIZE)
>                 return do_page_fault(addr, fsr, regs);
> 
> but it appears that there are paths to do_page_fault() that do not
> have this check, ie that do_DataAbort() function does
> 
>         if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
>                 return;
> 
> 
> and It's not immediately obvious, but that can call do_page_fault()
> too though the fsr_info[] and ifsr_info[] arrays in
> arch/arm/mm/fsr-2level.c.
> 
> The arm64 case looks like it might have similar issues, but while I'm
> more familiar with arm than I _used_ to be, I do not know the
> low-level exception handling code at all, so I'm just adding Russell,
> Catalin and Will to the participants.
> 
> Catalin, Will - the arm64 case uses
> 
>         if (is_ttbr0_addr(addr))
>                 return do_page_fault(far, esr, regs);
> 
> instead, but like the 32-bit code that is only triggered for
> do_translation_fault().  That may all be ok, because the other cases
> seem to be "there is a TLB entry, but we lack privileges", so maybe
> will never trigger for a kernel access to a kernel area because they
> either do not exist, or we have permissions?
> 
> Anyway, possibly a few of those 'do_page_fault' entries should be
> 'do_translation_fault'? It certainly seems that way at least on 32-bit
> arm.
> 
> Over to more competent people. Russell?

Ha!

As said elsewhere, it looks like 32-bit ARM has been missing updates to
the fault handler since pre-git history - this was modelled in the dim
and distant i386 handling, and it just hasn't kept up.

I'm debating whether an entire rewrite would be appropriate, but I'm in
no position to do that at the moment for several reasons:

1. I've now very little knowledge of the Linux MM, there's been many
   changes over the last decade that I'm not aware of, and my knowledge
   of modern things like RCU, kfence, etc is practically zero.

2. I don't have a 32-bit ARM platform to hand to test on.

3. I've not touched these parts of 32-bit ARM for a very long time, so
   my knowledge there has severely bitrotted - E.g. I need to review the
   FSR codes and what they mean, because that knowledge has now
   evaporated as I've not had to use it for getting on for two decades.

4. The arm32 code has been modified by others in ways I don't yet
   understand.

I'm wondering whether Al's solution would be a reasonable stop-gap, but
I can't say whether it would have any side effects, so I've asked for it
to be tested so we get some idea whether it's a possible solution.

Basically, I'm afraid it's going to be a steep learning curve, and thus
won't be a quick exercise - expect it to take a month or more as there
is Christmas, and then I likely have medical stuff at the beginning of
next year.

The reason I'm suggesting a rewrite to something closer to x86 is that
we then have a familiar code pattern that's much more likely to be
correct going forward for the Linux MM requirements, which should also
make it easier for MM folk to understand.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

