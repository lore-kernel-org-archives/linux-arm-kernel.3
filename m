Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83D1C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpUiMfVwSW/zIUNwP4BurmlV8bA4PXk+KZwy+rFiEys=; b=nqmvk5nGH0C39CdLl8Qi95r29C
	0qAGnkdhfl3OuvhJGkRbZ0qkFLX8pRbNHpJWzipfdKMWBd7l5/JnTs9Wc4GJYb+CCCnQrilNVeEIt
	A35H6zsYKu73QLPnPH97fFECuUdDQ68Mr9nv0syxytMO/5a3EK5CA6y+D6gCnU2FfzDglOUZXBxuq
	7r+QofkDB2SDnGIbqu/3mngDC++NFEix9tEXjc2YXk7asJfhiAB62KqtktDwc6LCjKNBgoOxWs6AA
	YpNs+AKRsasyqDHe4j3j7PGJgHgnjc5FSuB7ZtFpGJxKkrFplSeqdPS3FJCvl1ipv+e6016Y41PmP
	n5Yhtgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYx-00000001dzB-0tFu;
	Mon, 07 Apr 2025 18:51:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pqB-00000001J41-1w4D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D62043BEB;
	Mon,  7 Apr 2025 17:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8695DC4CEE7;
	Mon,  7 Apr 2025 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744045254;
	bh=ulG/3ksGQhOb6YzURseStzy1EXvhbkyKTyfVCaK8SyI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Rl99jLRXVvyQYdmBMGBK9z1gdjO2frTv9eX6gSEEGwkjjbnqvl+fHkv6tbaZnukN9
	 D9bCJVnjq0AvSCN0Aq4xHHMG7pSeX5GuwskelskKNxuu6Zpp1FL0fW5If9kth3MMI+
	 bqfmkhJ7oYxjvHhNGxmWI54LgNYjRrNvI5ZgG/bD0orzRO3ZMS76Qf8O4LpHuVvKP4
	 q7U7c4/bnNsFhpS1uwEObZoiSHzB6Z60TAiCJEHMA++f3XCr60vEb1QItdWA8bHc7o
	 MQzTnAnnxBjcVUCe4Lx1Z/nGhwceLpCt20+OgEIuvl7fvd61dcZc4fn7rkK+6HCG0E
	 hLjD452BLHr7A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 35B4DCE089F; Mon,  7 Apr 2025 10:00:54 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:00:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org,
	jpoimboe@kernel.org, peterz@infradead.org
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
 <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_100055_539043_71E7B590 
X-CRM114-Status: GOOD (  29.50  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 31, 2025 at 11:48:40PM +0200, Linus Walleij wrote:
> On Wed, Mar 12, 2025 at 7:00 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> 
> > Once you are confident that you have all the needed "noinstr"
> > and "__always_inline" instances in place, could you please add
> > ARCH_WANTS_NO_INSTR to the list of "select" clauses for "config ARM"
> > in arch/arm/Kconfig?
> 
> I would love to do that, I'm just not sure what this really entails.

I freely confess that I have only seen this done, not done it myself.

> Surely this patchset tags a noinstr on every entry point from
> exceptions and syscall software interrupts.
> Documentation/core-api/entry.rst is pretty good at explaining this.
> 
> But what makes me uncertain are things that are tagged
> "notrace", such as void notrace cpu_init(void) - surely we
> don't trace, but should that be "noinstr"? It's even marked
> "notrace" but not "noinstr" in arm64.

I know that __always_inline does the trick, but I am not sure about
notrace (my guess is "no" on notrace).  I added the objtool maintainers
on CC.

No argument on the usefulness of documentation.  ;-)

							Thanx, Paul

> cpu_init() is called from e.g.:
> asmlinkage void secondary_start_kernel(struct task_struct *task)
> OK should this also be noinstr? Or is that just implied because
> of asmlinkage?
> 
> <linux/compiler_types.h> will resolve to:
> 
> #if defined(CC_USING_HOTPATCH)
> #define notrace                 __attribute__((hotpatch(0, 0)))
> #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
> #define notrace                 __attribute__((patchable_function_entry(0, 0)))
> #else
> #define notrace                 __attribute__((__no_instrument_function__))
> #endif
> 
> which I read as three different ways of saying "don't patch here".
> 
> Which is confusingly similar or identical to what noinstr does, I do see that
> noinstr pushes the code to separate section but that in turn might
> be what __attribute__((__no_instrument_function__)) and
> friends does?
> 
> Are they equivalent?
> 
> sched_clock_noinstr() is tagged noinstr and sched_clock() is
> tagged notrace, so there must be a difference here.
> 
> secondary_start_kernel() is tagged "notrace" on arm64 but
> not on arm, should it be tagged "noinstr" or "notrace"?
> 
> This kind of stuff makes me uncertain about how this is to be
> done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
> would help a lot I think!
> 
> Yours,
> Linus Walleij

