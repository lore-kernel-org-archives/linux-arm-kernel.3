Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E8FD8745
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laDkWqR1a7rz/2dqrsx9+KB4LKUqNt1cwi/3oAl02fo=; b=U2QZfPuWCKTZUHfaDrCQyy20PK
	1Y5KW1RvExMD7VTVUiFP5r2j8kl7Tr7+qAHikQc4N+apSdS+w9C6U+7Wwxm/0SNmU4Cr5oBtfSqsR
	HkGC6T0GEcKDLIJQEbBhUKzMX3oqV8hX6vzx1iomg8Dtg45iAhk3ItlJn8wv1IzGmN+QBDoUgHBbc
	zo6odfnE0zmbEnjMOaPvj2w2Izo/s0TyLs+ft9BesmqMqbzuYmWCX6HooeHKjd5XJM6xl/QUQZPDD
	qucDv/4yzJtN8Ih4UH6uZbui1nmTSowAUxWtWQnGVhctYkpi8QMDv3DpUxT5/f7HwnI+z0GG4/TKO
	+rsoFscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sen-0000000693M-0QaK;
	Tue, 17 Mar 2026 11:32:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sem-00000006932-0Yss
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECE9A60018;
	Tue, 17 Mar 2026 11:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CE3C19425;
	Tue, 17 Mar 2026 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773747134;
	bh=+YmOaBx+HsryXQJW+c4VhaEdouxRJXYUy4pS8RABD+I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=me+GRMKrKfKDD1n4x3ewa4FfZ7LtkHCBZyrLBd1208an4O6YhI1MU4Dl8ZRqrvD7c
	 5N3MTW7QTnEeZCX3aUeaqRmFDhacsiTnJdYeNZivX5pFrv7MgZ3Z5XHZjV98bdkP9Y
	 akVKSqB7hstAay+11B2z0gijYQTarKOIhSmlFzINCxhgbC0D0RzRt1h54c5094twtl
	 +4Wy2quNje8IrnM6Y9oXcBL0qf3nDDpBc1y4skFiuDwMqPpB0iK/sQhxR2RDsYnjrL
	 h8/jo+WHP8aONb/H2jj019FoiY655uC/uippooOpBU/6jegjkgOC5ZQnb0Bb+hInYS
	 V0r1QUqn3YOoQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3385CF4006C;
	Tue, 17 Mar 2026 07:32:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 07:32:13 -0400
X-ME-Sender: <xms:vTu5ae_8Cq1uueVNRl1uee62OXyiTLBqXdpX6YgWXm8ID0U3QVLupw>
    <xme:vTu5aZg_z9YEavLa03Gt9kLD7M0pxkAeYBngPKXghU8L2KF2cbPkMtzU-dhQBuN6G
    nD_dMq0jydAP5Vhp1l091pZgKvM9uuFSglMoUsGvw70gfgcG0hHQ-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhgvrhhnvghlqdhtvggrmhesrghnughrohhiugdrtghomhdprhgtphhtthhope
    gtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhk
    rdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhooh
    gumhhishdrohhrghdprhgtphhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepqhhpvghrrhgvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsh
    grmhhithholhhvrghnvghnsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsvggrnhhj
    tgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlmhgtvhhitghkvghrsehgoh
    hoghhlvgdrtghomh
X-ME-Proxy: <xmx:vTu5aS5CNkJpwlCDAlOJZ6pnN102RP2SiCQpynyUU4zm74oPFw8JTg>
    <xmx:vTu5abWlXvJqsRJjT1K1ysjGyMYrRSkOZoMYtAV8o9Ui1aobffm7eA>
    <xmx:vTu5aSgxNIhI4OA501RCHZ2w_RoScZkMlSkB9fKEQMB8BmMl39n83w>
    <xmx:vTu5aTdR7RYT-YuOa6125owjKM8HXUtXy8UAEfHhXykXQLFNZds9ow>
    <xmx:vTu5aZ1umuuLxKOrvbQ4ETLsEV-sYMvUxuomM_3rqmec_o3uZoi-qaP7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03800700065; Tue, 17 Mar 2026 07:32:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4nMOTjRT8v3
Date: Tue, 17 Mar 2026 12:31:51 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: "Carlos Llamas" <cmllamas@google.com>,
 linux-arm-kernel@lists.infradead.org,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Kees Cook" <kees@kernel.org>,
 "Quentin Perret" <qperret@google.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Will McVicker" <willmcvicker@google.com>,
 "Sean Christopherson" <seanjc@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Message-Id: <f7ca0540-12d4-49eb-9baf-0ed254d3f340@app.fastmail.com>
In-Reply-To: <20260317112453.GF2872@noisy.programming.kicks-ass.net>
References: <20260313061852.4025964-1-cmllamas@google.com>
 <6053b599-c00e-47d0-8f9c-4554fec6d288@app.fastmail.com>
 <20260317112453.GF2872@noisy.programming.kicks-ass.net>
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 17 Mar 2026, at 12:24, Peter Zijlstra wrote:
> On Tue, Mar 17, 2026 at 11:59:49AM +0100, Ard Biesheuvel wrote:
>
>> > +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
>> > +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
>> > +	    "	.align	3						\n" \
>> > +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
>> > +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
>> > +	    "	hint	34	/* BTI C */				\n" \
>> > +	    "	adrp	x16, 1f						\n" \
>> > +	    "	ldr	x16, [x16, :lo12:1f]				\n" \
>> > +	    "	cbz	x16, 0f						\n" \
>> > +	    "	br	x16						\n" \
>> > +	    "0:	ret							\n" \
>> > +	    "	.type	" STATIC_CALL_TRAMP_STR(name) ", %function	\n" \
>> > +	    "	.size	" STATIC_CALL_TRAMP_STR(name) ", . - " 
>> > STATIC_CALL_TRAMP_STR(name) " \n" \
>> > +	    "	.popsection						\n" \
>> > +	    "	.pushsection .rodata, \"a\"				\n" \
>> > +	    "	.align	3						\n" \
>> > +	    "1:	.quad	" target "					\n" \
>> > +	    "	.popsection						\n")
>
>> > +void arch_static_call_transform(void *site, void *tramp, void *func, 
>> > bool tail)
>> > +{
>> > +	u64 literal;
>> > +	int ret;
>> > +
>> 
>> Here, set func to &__static_call_return0 if it is NULL.
>
> I'm confused. NULL is for the static_call_cond() case, where we NO-OP.
> And the trampoline above does that cbz 0f to ret. So far so good.
>
> But ret0 should return 0, and IIRC arm64 uses x0 for the return value.
> But I don't see the above clearing it. Hmm?
>

The RET0 case will tail call __static_call_return0() which will take care of this.

I am just saying that the NULL case could just do the same, rather than have a conditional branch in the trampoline, as even in that case, the surrounding code must assume that X0 is clobbered. Alternatively, we could tail call __static_call_nop(), which would do just the 'ret'.

IOW, if we guarantee that the target is always set to something appropriate, we can elide the NULL check, and __static_call_return0() and __static_call_nop() are equally appropriate for the NULL case.

