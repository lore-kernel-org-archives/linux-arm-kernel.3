Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B88C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUKyeMIV3zkWanrFkcdfKRQWpErY1QBkjiP38JqL4ts=; b=FqYQgN4Yd2C8sWVsnQ8hLEPgJD
	QkrkCdpU1vimJo4CenAt3VXjyrpf6RbePOUbiZdinErPYFgm+6+lQuyMLHhyCXTtYJLE63aMgQLhl
	2cUqKYmNrAEll6ttYZhd3tTn9ZTxAQTZbotYyO7FhTKzplRjW+Lj6dI30zBZ45S+kiOvX7+/DT2UH
	XwN5zL88G/Dyg0t8AkqWf9jEo7qdX4A8SuWnosHsHdcgOFh6kEhGiSm5jV1sXlx/IMIuEKpnNd5Y9
	MWIMpnXbSaHJzfxY2MqhwFLzgPpsP4ypf1qFUuS4QfaZkAs24dK1nTvBQ/7lBDRsIg1e1bFzdaP8r
	mjXNHJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wD3-00000002LP0-2noD;
	Mon, 07 Apr 2025 23:48:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wBJ-00000002L7m-0neX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B6C661141;
	Mon,  7 Apr 2025 23:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A341EC4CEDD;
	Mon,  7 Apr 2025 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069628;
	bh=AbvE5c3dYOD/66rM6cge3IeNI23tpIjwleY3jYySq/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5FmmgjYX0Wp/zR9Chhk/bN8lqvJSMCjSQQc2oasdA8P6Lx8tjG5gvtYRaxIrNgC1
	 WiW7mwXr0tmjQ/Boefr8RnntsfTW/TsVjJfHAu3EKk481Cgn+ZFpUW2rudQz8jBL1R
	 DfqSGEVXfaTVdtjs35TDcpovdiNtsUBe7rPnruk6LuYfhIMskolSNlxMBMuxj0bZGE
	 yC4jNECJ+8Wul+M3B0e1Jv4wAP6ybI/k44OB4WO4zkzPZqKvf7lRNtip+8QdqzbxcB
	 a9HS1942e94FNK4qd92U2E41Ty1aVwTQG76/2osS4G7R8K2Rbl2MKVo3Bo8ng6zSRy
	 gi62TvkChc7Tg==
Date: Mon, 7 Apr 2025 16:47:05 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org, peterz@infradead.org, 
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
 <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
 <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
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

I think Thomas, Peter and Steven are the experts here, but I'll give my
limited understanding.

On Mon, Apr 07, 2025 at 10:00:54AM -0700, Paul E. McKenney wrote:
> > cpu_init() is called from e.g.:
> > asmlinkage void secondary_start_kernel(struct task_struct *task)
> > OK should this also be noinstr? Or is that just implied because
> > of asmlinkage?
> >
> > <linux/compiler_types.h> will resolve to:
> > 
> > #if defined(CC_USING_HOTPATCH)
> > #define notrace                 __attribute__((hotpatch(0, 0)))
> > #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
> > #define notrace                 __attribute__((patchable_function_entry(0, 0)))
> > #else
> > #define notrace                 __attribute__((__no_instrument_function__))
> > #endif
> > 
> > which I read as three different ways of saying "don't patch here".
> > 
> > Which is confusingly similar or identical to what noinstr does, I do see that
> > noinstr pushes the code to separate section but that in turn might
> > be what __attribute__((__no_instrument_function__)) and
> > friends does?
> > 
> > Are they equivalent?

noinstr is much broader than notrace.  No instrumentation of any kind
(ftrace, kprobes, sanitizers, profilers, etc), in the prologue or body
of the function or its callees, except for regions marked by
instrumentation_{begin,end}().

noinstr is needed in early/late entry code before/after RCU transitions,
as instrumentation code might depend on RCU.  Also, entry code tends to
be sensitive and unable to handle random instrumentation code.

notrace is more narrow, it just means "no function tracing".  It's used
by tracing code and the functions it calls.  It's also used for early
boot code, as ftrace can be enabled on the kernel cmdline.

I believe noinstr is not typically needed for boot code, at least for
the primary CPU.  RCU isn't present yet, and many instrumentations might
not yet be available.  Or their handlers can detect whether they've been
initialized yet.  Or they're disabled in .init sections.

Whether noinstr is needed for *secondary* boot code, I don't know.  It
may be dependent on the instrumentation implementations, e.g., whether
they're enabled globally or per-CPU.  At least on x86, start_secondary()
is notrace.  I don't know enough to say whether that's sufficient.

> > sched_clock_noinstr() is tagged noinstr and sched_clock() is
> > tagged notrace, so there must be a difference here.
> > 
> > secondary_start_kernel() is tagged "notrace" on arm64 but
> > not on arm, should it be tagged "noinstr" or "notrace"?
> > 
> > This kind of stuff makes me uncertain about how this is to be
> > done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
> > would help a lot I think!

Sounds like a good idea.  We just need a volunteer :-)

-- 
Josh

