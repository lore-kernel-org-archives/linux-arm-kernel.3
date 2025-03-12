Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFCCC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR0AQ6ATVanBlj8FDr99LaRaPEUfXoVCCQHU9T/9ykw=; b=W+VS0US0JSqH38HRoK6oX2z5XL
	9sM4YU6qEiO52ApI85u30C9EL9PQt7DWc7pUMEjgRVwITla5GLeYYF3KjuBgnvAmkZfDdYAtZ2lYJ
	CAV08KTNkpu+/lz+JeexM4YN8v8TmpSaWEA8HgHCNhv8e7VNFqnK6xFQ0xK7hE/4LjPcqxdKVX5Ya
	CAXtbgeg2c0/H2W+lI7rS6nlU0fJAbSdHV9O7lVBbq7YfsKSOH6hHTd0p673ILxwfv9XKPZ12vfD7
	d+6kPRVdO7wz0YhZOsM6lN/N+mu2Z1dEU5pfbH16IFWD/XPxDxjjT8kZbWp9RnsD4XLuVzBxzF/Nt
	uY7CDfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIFm-00000007vyk-2FbG;
	Wed, 12 Mar 2025 09:19:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIE8-00000007vhQ-1LMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 09:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B16BA46E07;
	Wed, 12 Mar 2025 09:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCBBC4CEE3;
	Wed, 12 Mar 2025 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741771091;
	bh=MPhbOAlRmSQDrymRu11c022uCrA5qLlPMbyZ8sUlGQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5NkTz2TDhcxfgtafUw6PxH30PcDT+AUdcSrithUjNh2vzRiKPw3fAKP600UNrOmU
	 8fk3QTrgo4wd/xjqfOxC5QxpRyuhgo6g3cM984yceTTWvAS0LSfKlA5pWb+7R0BjQR
	 pl1wGI6hMKXP4VLHeWxTEe9elcSEUH44N+bpej1Y/9VwhgIhhe4y6kV6ecjABRkhKm
	 DDHnHK6rY/YMOXnJUJeKxQFx5fKNtCjXW0pi1W6vrfJ7wlcR1YM6Xdyt8yOygIbUmB
	 X7gSmCNfIL+vtxLK8sqfOVloneJrhx7ha7Nsvzv9qCvh0xYO3IFZ7tacOMdIB5yn8s
	 CKfN3x5W1o2sg==
Date: Wed, 12 Mar 2025 10:18:06 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <Z9FRTtcfQK9m6NE7@vaman>
References: <cover.1740762136.git.robin.murphy@arm.com>
 <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
 <Z89P461+Y6kQDOCX@vaman>
 <072d1d3a-2aeb-4ab0-9db1-476835a1131e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <072d1d3a-2aeb-4ab0-9db1-476835a1131e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_021812_430502_303242F1 
X-CRM114-Status: GOOD (  19.17  )
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

On 11-03-25, 12:48, Robin Murphy wrote:
> On 2025-03-10 8:47 pm, Vinod Koul wrote:
> > On 28-02-25, 17:26, Robin Murphy wrote:
> > 
> > > +static u32 d350_get_residue(struct d350_chan *dch)
> > > +{
> > > +	u32 res, xsize, xsizehi, hi_new;
> > > +
> > > +	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
> > > +	do {
> > > +		xsizehi = hi_new;
> > > +		xsize = readl_relaxed(dch->base + CH_XSIZE);
> > > +		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
> > > +	} while (xsizehi != hi_new);
> > 
> > This can go forever, lets have some limits to this loop please
> 
> Sure, in practice I doubt we're ever going to be continually preempted
> faster than the controller can move another 64KB of data, but I concur
> there's no harm in making the code easier to reason about at a glance
> either.

Yes you are coreect but when things go bad, a bug in h/w or something, I
would like to see a fail safe

> > > +static int d350_alloc_chan_resources(struct dma_chan *chan)
> > > +{
> > > +	struct d350_chan *dch = to_d350_chan(chan);
> > > +	int ret = request_irq(dch->irq, d350_irq, IRQF_SHARED,
> > > +			      dev_name(&dch->vc.chan.dev->device), dch);
> > 
> > This is interesting, any reason why the irq is allocated here? Would it
> > be not better to do that in probe...
> 
> Well, I'd say technically the IRQ is a channel resource, and quite a few
> other drivers do the same... Here it's mostly so I can get the channel name
> - so the IRQs are nice and identifiable in /proc/interrupts - easily without
> making a big mess in probe, since the names don't exist until after the
> device is registered.

Ok

-- 
~Vinod

