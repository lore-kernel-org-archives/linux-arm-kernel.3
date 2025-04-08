Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 00:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBzFVXdZz3RIkERkl1wQ6qKAYcMNJAaNxtnkF6mFWJk=; b=Jyqqrxv786YWGi08lxAg1u8cQK
	ceSlt5QnT3kg6gjzPiybIYf8gkxtcSQ44E8QA+j2NJopa0sptX5+ttwzMP2xLUu+lE3sgmIMXqWu6
	A9YdrT+gjFZROL57OrDXMODa9PCgN8lRUi12aSPzSFnbT572+C/O4NvdbkwvlNp4+N5J+c3ymYSdi
	79mHTfGXupO7gbHtlx6pLK0RRNj+bES37ijv8UZTGAB3NvOvK2UUEPCZfA4p7Sz59731QSE5L78p0
	eFdym60d3n/yZ3Al2Z7ejG1kVyG/X00thI1pp7FEDhhGEdXskDvIq7xL7dcnsTvkAS2WU87Ijye5J
	YdTrFRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wch-00000002N5E-2bu0;
	Tue, 08 Apr 2025 00:15:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1wav-00000002MwB-3KqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 00:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D980A49F0C;
	Tue,  8 Apr 2025 00:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D6AC4CEDD;
	Tue,  8 Apr 2025 00:13:35 +0000 (UTC)
Date: Mon, 7 Apr 2025 20:14:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann
 <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel
 <linux-kernel@vger.kernel.org>, frederic@kernel.org, peterz@infradead.org
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <20250407201450.5acc83e3@gandalf.local.home>
In-Reply-To: <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
	<1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
	<CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
	<4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
	<xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_171337_876464_E0252924 
X-CRM114-Status: GOOD (  31.31  )
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

On Mon, 7 Apr 2025 16:47:05 -0700
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> noinstr is much broader than notrace.  No instrumentation of any kind
> (ftrace, kprobes, sanitizers, profilers, etc), in the prologue or body
> of the function or its callees, except for regions marked by
> instrumentation_{begin,end}().
>=20
> noinstr is needed in early/late entry code before/after RCU transitions,
> as instrumentation code might depend on RCU.  Also, entry code tends to
> be sensitive and unable to handle random instrumentation code.

=46rom my understanding, noinstr is usually used in context switching code.
That is, switching from user to kernel and back. It's highly sensitive
and I believe there's CPU helpers that will prevent random code from
happening here (I'm guessing at this, but from the strictness they have
about not doing any instrumentation and how things will break if you do, I
feel that there's going to be a hardware enforcement here, if it's not
already there).

>=20
> notrace is more narrow, it just means "no function tracing".  It's used
> by tracing code and the functions it calls.  It's also used for early
> boot code, as ftrace can be enabled on the kernel cmdline.

Right, notrace is basically code that doesn't make sense to trace. Like the
function tracing code itself. Also clocks that the function tracing uses.
You really don't want the clocks being traced as they are used by the
function tracer. Now that we have ftrace_test_recursion_trylock(), it
doesn't crash like it use to. But recursion does cause overhead.

Note, I've been thinking of letting some of the tracing code be traced.
Like the access to files and such. Just because there's been times I want
to know what code is actually being called there (like when I set up a new
histogram!).

>=20
> I believe noinstr is not typically needed for boot code, at least for
> the primary CPU.  RCU isn't present yet, and many instrumentations might
> not yet be available.  Or their handlers can detect whether they've been
> initialized yet.  Or they're disabled in .init sections.
>=20
> Whether noinstr is needed for *secondary* boot code, I don't know.  It
> may be dependent on the instrumentation implementations, e.g., whether
> they're enabled globally or per-CPU.  At least on x86, start_secondary()
> is notrace.  I don't know enough to say whether that's sufficient.

Not sure, as there's really no context switch at this time. But Peter and
Thomas would know better than I here (continuing to pass the buck!).

>=20
> > > sched_clock_noinstr() is tagged noinstr and sched_clock() is
> > > tagged notrace, so there must be a difference here.

sched_clock() is using in tracing. If it wasn't tagged notrace, the
function tracer would be recursing on it.

The noinstr looks like it was created just because some archs call
sched_clock in noinstr code?

> > >=20
> > > secondary_start_kernel() is tagged "notrace" on arm64 but
> > > not on arm, should it be tagged "noinstr" or "notrace"?

According to commit b154886f78924:

    arm64: make secondary_start_kernel() notrace
   =20
    We can't call function trace hook before setup percpu offset.
    When entering secondary_start_kernel(), percpu offset has not
    been initialized.  So this lead hotplug malfunction.
    Here is the flow to reproduce this bug:
   =20
    echo 0 > /sys/devices/system/cpu/cpu1/online
    echo function > /sys/kernel/debug/tracing/current_tracer
    echo 1 > /sys/kernel/debug/tracing/tracing_on
    echo 1 > /sys/devices/system/cpu/cpu1/online

If other archs crash when doing the above, then sure. Label it notrace ;-)


> > >=20
> > > This kind of stuff makes me uncertain about how this is to be
> > > done. A "noinstr vs notrace" section in Documentation/core-api/entry.=
rst
> > > would help a lot I think! =20
>=20
> Sounds like a good idea.  We just need a volunteer :-)
>=20

Agreed (but not me!)

-- Steve

