Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455D4CF31BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azetCnyTZlk3Rcc1Tn+FQSfr0mASKxWLyAIYAAPNitQ=; b=MxgxVOvxdDIljR2SLaGIU35lIO
	fLfaUyfKJoRfa9qmUYkZ/zmDKRS7p9pyrGIxgiUhvwYa0mp1j14ao5U27yE4URpHJyTroKSMh13qj
	WFHzBaQAd+We/ByF2QnEtX86NKL679hxVM4wPcjR+uhVUCuf4CCtYYxZkVDAmFN4R3+i59DRWOfQf
	G+7+OCpDxRyBABFlNWxRYDbEXGN64IEQK7pbu1VD2bkmoA6aRRiLgQGA4rNkBMn7fFr1x4pWyvLhC
	HL6fPF4wLThtlq677gUwgYOrfm95ongldmebLzCTpzBdnoupWKXt4h9Bf6EGj6AeIE0W+o3D19a5u
	1t/vg0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhTs-00000003BPQ-1xbx;
	Wed, 19 Nov 2025 12:40:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhTq-00000003BOp-0ltH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 182BA4421D;
	Wed, 19 Nov 2025 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2717C2BCB0;
	Wed, 19 Nov 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763556010;
	bh=5i6z2W6q1iTm22YvLzIETMkmV4YtGu9mjO0O0P0maVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ci5QtFfPtrKrHOdXGKcUNsTjO9cHr3lNsAUrNAlN3Z1GAlKaG51bJsT60eqdMZ5cD
	 43/kIqazOsoffMtV03DC1AmwtydQ/NCc3+kLIGhftBvAR5USTyvvtnuorrC894QtJO
	 qqUZGL5bDDRlfmt5ZmvFr+kPKcl0SdWmeJCqmNaalQ2X+M+GRzGIi2awYNfohfP3Lu
	 i3xNEAS5kQ9Jh5AcGJ5zOCyYVCwBV0a5IVhj93O6wGDxi1gkIyGWfqBuob9W1ggy5x
	 T5yxwcXGSPWusWi8enUpDcxMKcf7EBBDocBdP/tc+fwZSGvvYs+3TfUTAbj9dnhrGN
	 Y5+HZWfLFdI3g==
Date: Wed, 19 Nov 2025 20:22:13 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR22decsE0DYDUnS@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2ecpvm20y.fsf@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_044014_252895_F34E5963 
X-CRM114-Status: GOOD (  18.43  )
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

On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> 
> > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org>
> > wrote:
> > > 
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> ...zip...
> > 
> > > -#ifdef CONFIG_PM
> > >         unsigned long   saved_gplr;
> > >         unsigned long   saved_gpdr;
> > >         unsigned long   saved_grer;
> > >         unsigned long   saved_gfer;
> > > -#endif
> 
> Actually this is not equivalent to what was there before.
> 
> With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to the
> structure. You might thing today, 16 bytes is nothing. True, but on a
> 64MB RAM devices, it's something.

hmm, each controller adds 16bytes, then even on 100 controller platforms
1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there such platform?

From another side, recently UP support is removed from the core sched,
that removing adds more .text and .data overhead, so if the users really
care about this kind of 16bytes, it means he(she) can't afford even the
16Bytes overhead, then I bet he(she) the always SMP in core sched, so
why not stick with the old kernel? What do you think?

> 
> That might not be a reason to reject the patch, but it's not only a
> "modernisation patch".
> 
> Cheers.
> 
> --
> Robert

