Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C50FC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 02:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMGoKaVGT/WLPvCUKFso57b/S1XOxk0a0r7fmr8dVTw=; b=FLus+YKzYNR4rYHNaq25ymc+SB
	81mt4ix/q21IyUbN1o2MTpKvQ3oEanMlLoUa77p9Q+GNP29O/Wh6KTTnBXIxWKsBMOdsmR98fHdWz
	8JQDNkqvrnB15SqAYwgLbfLWqCX38yub7Bs1zf2x9KERuwUKkLBhUg9LNoLgIM1V0BVvz9cfvnn1Q
	Qdl0VUCUWFxHk9fSxj01YRfiLQGOL+RoeA0rv0Oi9pdQsPaq3xDUQFVNqnPsKffqZ2bSD4iHogdt0
	IDtzFzVV8MN82CBShpzSFx8M9pipcIKSUUj63p1LVUvBSYoJYZzgvhd9uPc44ousmmhMcxF5MAfPx
	nT0CkauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5KT-0000000FMeW-3yCf;
	Fri, 24 Jul 2026 02:08:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5KS-0000000FMeO-2Drc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 02:08:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C31EE4076B;
	Fri, 24 Jul 2026 02:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5544B1F000E9;
	Fri, 24 Jul 2026 02:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784858879;
	bh=ZMGoKaVGT/WLPvCUKFso57b/S1XOxk0a0r7fmr8dVTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aHsqjK466GviO+4M28gRYI4WYgJxsCNCumllgwy29OJfBV8rWpwribREA5zqpnpCD
	 znlz95zxNhPtzmomcgD/S5bD00fiCeY11ELwJqXZmAcIf995BGNtIIQsFY6Ml4x7dM
	 +i67kc9tHHH/CAVuiAwsVNgkNDCk0I7DXjc5h3sV4CmRNQfLPjp0afYb7nbtW5hUOB
	 MX5mwLCaK71IW3iUP6thSA2cMYMNcogHo0ZfGM56T7aBWgNfiCl91GjunRA0UPCrGM
	 1wd7jyvplc1gP79pYM8/W8QVrApDZx3sJMtUO8T4jXSWr0v0eL2MeNkGK22D1u4t1z
	 bzhQOmd6o87+Q==
Date: Thu, 23 Jul 2026 19:06:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260724020608.GA51735@sol>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
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

On Wed, Jul 22, 2026 at 01:33:51AM -0700, Bartosz Golaszewski wrote:
> We can offload crypto operations to the QCE saving CPU cycles

Here are benchmark results for SHA-256 on the SM8650 HDK, hashing 50000
4096-byte messages (matching dm-verity's and fsverity's workloads), with
all your pending patches applied:

sha256-lib (i.e. ARMv8 CE):

    Wall-clock elapsed time: 0.10s
    CPU time used: 0.10s
    CPU time spent in hardirq context: 0.00s
    CPU time spent in softirq context: 0.00s

sha256-qce:

    Wall-clock elapsed time: 10.76s
    CPU time used: 5.14s
    CPU time spent in hardirq context: 0.77s
    CPU time spent in softirq context: 2.31s

So sha256-qce is over 100 times slower and uses over 50 times more CPU
than ARMv8 CE, over half of that in hardirq or softirq context.

This was even worse than what I got last time I tried this!  So I tried
rolling back your BAM locking patches:

    Wall-clock elapsed time: 4.85s
    CPU time used: 2.78s
    CPU time spent in hardirq context: 0.55s
    CPU time spent in softirq context: 0.94s

That's more in line with what I measured last time I tried this, but
still atrocious.  It's still far more CPU time used than just doing the
hashing on the CPU, and much of it spent in hardirq and softirq
contexts.  The BAM locking just makes it even worse.

With that, plus the security claims not panning out either when
considering the actual code and usage in Linux, and also all the bugs
(both historical and current unfixed ones), I don't think there's any
credibility left.  This legacy driver should just be deleted.

To be clear: completely separate from QCE, Qualcomm SoCs have good
support for crypto acceleration in ICE and the ARMv8 CE.  That's great!
And that is, of course, what is *actually* being used in Linux.  That's
what we'll support.  Let's stop wasting time on a dead-end approach.

I understand there may be a desire to keep this driver around so that
support for restricted media content can be added to it.  However, that
would be new functionality that has nothing to do with what the driver
currently does and doesn't use the kernel's crypto API.  There's no need
to keep the driver around for this.  Just put together a clean proposal
to add a new version of the driver with just the needed functionality
(note that drivers/crypto/ probably won't be the right place for it).

- Eric

