Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF74C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuAq9UFobmsTI5xlvKd+L/f4TT/s2a3cyQYycHWbELo=; b=CVMSRPpIL1lP2SPY0UyMMuqcZ4
	k4XJH8ZVpw33TTmJhLGBwc/HTgDxDkIarTU8eLgw5ic9+inLAV8i/ZRb83r3EhQia371+C5K6IOvI
	CRHx3YubR+xBk9YMVigWgAjrcHLkWbcbTrC1Sc2ef2HX47sBjcvKxUTr80ciDvCZ0CbLpgwhkPInv
	REN9pV7sHP1zuoyoKQVSLyzm2fbGXe5U+GKXCV1R4BtYwI40UxgxKOfF5bj51w+Exd5+hZwje1Nj+
	bQhP20zRO58EpRrnRz6tKIEzdv42KxnlrxNQgan3PIH4FtYUmbChV+FVWKYCpgVNNRFC+b60fu55z
	XIN8j4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIBK-00000000RN7-1vhB;
	Tue, 04 Feb 2025 12:37:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHzG-00000000Ptr-47Nl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B4D8A424F8;
	Tue,  4 Feb 2025 12:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2491C4CEE2;
	Tue,  4 Feb 2025 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738671905;
	bh=nxM4s2+q4jMZZl9mmJo4b5VSqkcMlsVNTuzIDh7bq9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ks/IsdNh5Qkr6K3WXKSZIcSbXY6wUP5hDJ2befaqkWNrPe2XwEUZCFrZc6rgK9Gyh
	 zU23yHkNgIA+ZmgQ4GIUyRtO+v4OSacd9aH+20AWDsGE2ANT2rqqeEgHz8mx83/pbU
	 vN2q69DIDF1Vu7LQHyykA1RhLOmYlrgysh6HinQVNGD3tzpyLVZJczVAb0Vi7Wmp4y
	 9FGhHKr4x1D6amsB0Tk/MFD9byksGe2z1y1YvsFMOP8mDSl9maPPwBgjbAqvxAu/ix
	 MPzuAaAkKjK3e+cHZhsF6L6Z+1I2cp4XCJf/MfScHqwDlf0jpP3yHezz2dWobBn4zY
	 LqxVsMTd8BszQ==
Date: Tue, 4 Feb 2025 12:25:00 +0000
From: Will Deacon <will@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced
 HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <20250204122459.GB1063@willie-the-truck>
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
 <20250204113614.GD893@willie-the-truck>
 <CAOc5a3O-8wrQq3oNJC+H9ncFt0yxcm4O+QSgPk4QckF6Ak5pGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOc5a3O-8wrQq3oNJC+H9ncFt0yxcm4O+QSgPk4QckF6Ak5pGg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_042507_080973_6F9AAB29 
X-CRM114-Status: GOOD (  21.78  )
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

On Tue, Feb 04, 2025 at 12:44:25PM +0100, Lukas Bulwahn wrote:
> On Tue, Feb 4, 2025 at 12:36 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Jan 17, 2025 at 07:55:22AM -0500, Lukas Bulwahn wrote:
> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > >
> > > Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
> > > replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> > > HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
> > > various architecture Kconfig files. In the arm64 architecture, the commit
> > > adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> > > 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> > > config.
> > >
> > > Remove selecting the replaced config. No functional change, just cleanup.
> > >
> > > Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > > ---
> > >  arch/arm64/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> >
> > Hmm. There are still a couple of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL guards
> > kicking around:
> >
> > include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> > kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> >
> > so it's not clear we can just remove the option from arm64 without
> > breaking ftrace_return_to_handler(). What am I missing?
> >
> 
> Will,
> 
> I believe you are looking at a tree, which did not include commit
> a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs") yet.

Argh, sorry, you're completely right! I'd forgotten to fast-forward my
fixes branch to -rc1 before looking at this.

In which case, thank you for the patch :)

Will

