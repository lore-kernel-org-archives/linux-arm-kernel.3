Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F30FD5F9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O998N0tGXzNBVWAcG5MVZE+q5zA46C6GPzB7F6kseTE=; b=CshpvBbBEhkPmRyowt1qxNK1zi
	+OBumAq2aLs6m59t1MWg/owKg+yZi+OHZY+LlY5RAovx5sryoyQrMPBiRbTXgAwZvp6HnqBoE+jmx
	bmXZNHotzTlbN0EiPAiWL9RYyY2FjgQd148a45H/MW6SI13dlBSBZs5O+1VGyP5Y585so/h7GCqh7
	9rUgN1LX+EyMOviAOdHIqqOGzDxs1PWQACHc0U2MpupZK9Q3nomAccgjH85FU0fgsUWdohJ30zyrE
	fITCXw/K2+BkluoYUdmb8O/n0TGsFJMxtrPAz97lRPTdRmRtYrFofRQInT2Vv3/7+zG1CXLj7lM9l
	293v3nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP4s-00000008b2F-4Adp;
	Wed, 08 Apr 2026 09:20:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP4r-00000008b1k-1Efw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 09:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O998N0tGXzNBVWAcG5MVZE+q5zA46C6GPzB7F6kseTE=; b=grQJSpZFqx8DwnmLmoU6WhTv7Q
	iXuJuhH6W9Oni9WG1LPUr4Au/tQgNjcPO9X3BrfwgIALK72Jw33QzFfG3zjJvEgqAvAkd3/cQvkfV
	F1BQlgWpN2fqyxZiUeOApp6kMfBwloAaTmgWswuZL/1mCwvmky2zKSodRWNTZsQXscK1eiuva3PXl
	AZQpwwNj6FPobLibQ/1kbZVyGnpwge9FXc49TYgp/Rgx/2FBfOlNXU/N2yZ3tcXSMGln9jyHb6xRn
	vAL2eS08YuAn2c6ef0NVSJzxxtLdSPO1HW106INDm+vxC01lRqX7aJZR1NGAtj8mMuZrsTwssHMd8
	ucJG4VFA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP4p-000000058OY-0E1m;
	Wed, 08 Apr 2026 09:19:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7DBB4300289; Wed, 08 Apr 2026 11:19:57 +0200 (CEST)
Date: Wed, 8 Apr 2026 11:19:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 00/10] arm64/entry:
Message-ID: <20260408091957.GK3738010@noisy.programming.kicks-ass.net>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <87cy0a4gx7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy0a4gx7.ffs@tglx>
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
Cc: Mark Rutland <mark.rutland@arm.com>, vladimir.murzin@arm.com, Catalin Marinas <catalin.marinas@arm.com>, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 07, 2026 at 11:08:36PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 07 2026 at 14:16, Mark Rutland wrote:
> > I've split the series into a prefix of changes for generic irqentry,
> > followed by changes to the arm64 code. I'm hoping that we can queue the
> > generic irqentry patches onto a stable branch, or take those via arm64.
> > The patches are as follows:
> >
> > * Patches 1 and 2 are cleanup to the generic irqentry code. These have no
> >   functional impact, and I think these can be taken regardless of the
> >   rest of the series.
> >
> > * Patches 3 to 5 refactor the generic irqentry code as described above,
> >   providing separate irqentry_{enter,exit}() functions and providing a
> >   split form of irqentry_exit_to_kernel_mode() similar to what exists
> >   for irqentry_exit_to_user_mode(). These patches alone should have no
> >   functional impact.
> 
> I looked through them and I can't find any problem with them. I queued
> them localy and added the missing kernel doc as I promised you on IRC.
> 
> As I have quite a conflict pending in the tip tree with other changes
> related to the generic entry code, I suggest that I queue 1-5, tag them
> for arm64 consumption and merge them into the conflicting branch to
> avoid trouble with pull request ordering and headaches for the -next
> people.

FWIW, for those 1-5

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

