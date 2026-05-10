Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F04CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us7YZwfeL54L7NHWNrpZhRJPUQQv0/hJAz/QtqFzTn4=; b=hufTHuoS05mD4DluEUxvG7mvR3
	wDhttO3L66JW1Wb/r+SxcZHZ8myi3oxE//vNzwNlOjZsYf0+x+TyWUCkq7Eg66HGrJevHGsGhS0l2
	LE3L4ZuQhJ2UFyl4R8zvoki19ViJiqYIjDDQshEG4r1BGMpj8k3UYAGYLVeKQkOqi9lEKuHvpIuLI
	k1IO4mCjYkfefEvRfygkxyx2IWSpSzl3VnQI+XBkqLbbL/SMq3poSJCXhbKHiJkRcdLlarw2RMKKQ
	pByOmw0uL7qICy0DViLe5g6dW3+kr+HcMLl/jHzhuu+hbhEEe7eu4ahzqmycdGVnsPdNmPzYDMy+A
	Vl32qRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9kd-0000000BTxH-1TPi;
	Sun, 10 May 2026 19:23:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9kc-0000000BTx1-3qoS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 19:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 084A9600CB;
	Sun, 10 May 2026 19:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B507C2BCB8;
	Sun, 10 May 2026 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441021;
	bh=VtKlCWi/WZCp9eF70ML2HPisQEkB7bfjW/9MYJQ6q9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKSfM7WNNhAXCJYptyUa1uL9pzlwb+HjyhNFI0Yvfe+p+oNuZedvLCdtySeR5AFie
	 tiZMFWCVgbIt0nFyNZU98gEfgpBtbtiBKXkYF6XUTV+S9kNYzO+8zWGQpcFh0/raNv
	 DZ1DDxMwpKooQS9220xFKHn8fks85dZ+8e6fQWwesNM+tJE9KF2azWM6711Hadt25b
	 +xuIZlL9UGTYBBLsrbOWunfSozeIkFYM8M2d6SqKLyuD3JwP/nlx78aQQRzsJYmFk7
	 mRcS10Q/sc1Gk+80nle1p8GKvk/5EelyMXsewXHVu2NWX0wbUQ/DQemcicpH7vGYoY
	 iAcISIv5dCTNA==
Date: Sun, 10 May 2026 20:23:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jack Matthews <jack@jackmatthe.ws>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Regression in split ARM MMIO timer driver
Message-ID: <20260510-augmented-kakapo-of-wholeness-748b38@sudeepholla>
References: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
 <20260509-ruddy-dragonfly-of-poetry-45e9f1@sudeepholla>
 <87wlxca2jb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlxca2jb.wl-maz@kernel.org>
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

On Sat, May 09, 2026 at 06:58:00PM +0100, Marc Zyngier wrote:
> On Sat, 09 May 2026 13:19:56 +0100,
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > On Fri, May 08, 2026 at 03:48:14PM -0400, Jack Matthews wrote:
> > > Hello,
> > >
> > > I am working on mainlining an old chip, Qualcomm's MDM9625 modem.
> > > I had previously booted 6.17-rc3 before putting this project to the side,
> > > but when I restarted work on 7.0 I was unable to boot. 
> > > I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a
> > > (https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and
> > > reverting this commit makes the device boot successfully. Unfortunately I do
> > > not have access to low level debugging such as UART so I have not been able
> > > to pinpoint exactly what is missing.
> > > My changes for this chip are all available here in case it is an issue of my
> > > own doing: https://github.com/jackmthws/linux/commits/mdm9625-latest/.
> > 
> > Looking briefly into the DTS file, I couldn't find the sysreg based
> > arch timer node in the DT. It could be just an overlook unless there
> > is some issue with it that it's not added. After the above mentioned
> > commit, the MMIO timer gets initialised bit late in the boot and
> > could be the reason for boot failure. Unless you have intentionally
> > not added it, I would suggest to add it and try.
> 
> Ah, that's a good point. Not having per-CPU timers is not going to
> fly, I'm afraid. The MMIO timer will kick in very late, and we
> probably need to schedule threads way before that.
> 
> This looks to be a single Cortex-A5 however, not an A5MP, meaning it
> does not have the TWD, and relies on a global timer, which is a
> terrible thing to have. Not to mention that MMIO accesses on the
> counter is going to be even worse.
> 

Ah, my bad I misread it as Cortex-A15 and not Cortex-A5, so assumed
missing sysreg based per-cpu arch timers.

-- 
Regards,
Sudeep

