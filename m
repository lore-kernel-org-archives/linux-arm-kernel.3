Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5EAC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE4M5bZ8qa5ONlWyjoO6PT9YT/rm032gR13k1+hQA+s=; b=tzHkS3IQnMJmxjFcbzrh8KEz2b
	gzDmoqQ61FUg40Jy75rXT56pdwWS+1yaZHTiiw8vnK2FrS4xld15HeugNQqrkqdE39ahUFvoFQy5B
	IQmRcHzylfCH8mhYOe9+GbuX2QPvYfsS3w/sqcaW0dw/ooeN15zfzLY/fnv5SE3YT2clnKr1kJxrQ
	WIv63w59gCaTCsiWZ02/FRGYN+STgLmPW2ycKSC/ZNElTWB2pnKmAn3qRPFgoLLJBmFq3JraVRAVS
	BOl69/aNwTgezRpMdasi0bupHO8hzrog4SrRVE6wTVlOynwQ9c14qneiG0eY6olSIEC0NkSt8LTRZ
	jSi6ALwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AbF-00000000D21-1t7W;
	Thu, 03 Sep 2026 16:47:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AbC-00000000D1K-0OfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PE4M5bZ8qa5ONlWyjoO6PT9YT/rm032gR13k1+hQA+s=; b=I23Lcsn3E+BTZqmu+d5CGfgHwK
	3qS6wiCrS19b//RLzh7QxvWrqznkylmRe1kmkX2xuzrC1DhZrPi+XVYTpkPfwh+4CAAfHo+/iPG1g
	X3wTaXN/QJ6sKW7EmH9x50yocWgsxMCxGEXX1+TQUR6JZZcSX6wGKgBaQFVQc3ZGNMOkOlRVU4bbC
	oef/ChSoq+1JtplljCZYXw/S8hk1QUnR9AHu8CzVdiMaLPu61MKtQgZt+4faKdoy0dO91k0lnwfrx
	eOOA+mxx+nnaHy7Lhg0GuOeZN9zcCmj+X+fZ09c3I5MPrQfLBT2df/qW+bDfqxrGafoaGcqBoOGhB
	m9uNY41g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43748)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1x2Ab3-0000000013P-2RN0;
	Thu, 03 Sep 2026 17:47:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1x2Aay-000000007Y3-2v7X;
	Thu, 03 Sep 2026 17:47:24 +0100
Date: Thu, 3 Sep 2026 17:47:24 +0100
From: Russell King <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Waiman Long <longman@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>
Subject: Re: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <apmknG55qFAn8EPf@shell.armlinux.org.uk>
References: <20260814085118.OPEA_Ssn@linutronix.de>
 <20260903160710.vVf4gEL2@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160710.vVf4gEL2@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094738_432298_77B64FF4 
X-CRM114-Status: GOOD (  20.40  )
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

On Thu, Sep 03, 2026 at 06:07:10PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-14 10:51:18 [+0200], To linux-arm-kernel@lists.infradead.org wrote:
> > Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
> > "sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
> > delivered with disabled interrupts and perf intrastrucure expects
> > disabled interrupts while the overflow callback is invoked.
> > 
> > The callback then sends a SIGTRAP signal for which it acquires
> > sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> > must not be acquired in atomic context.
> > 
> > Delay the event callback until the return to userland.
> > Add perf_arch_hwbp_notify(), a generic perf callback which delayes the
> > actual callback invocation to task_work_add() callback. This callback
> > invokes the architecture defines callback arch_hwbp_send_sig().
> > This requires struct callback_head and the functions require
> > ARCH_NEED_PERF_HW_NOTIF to be defined.
> > 
> > This was reported against ARM64. ARM and LongARCH follow the same
> > pattern are also converted.
> > 
> > Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> > Reported-by: Waiman Long <longman@redhat.com>
> > Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Did this get lost, should I repost it or is there something obviously
> wrong with it and nobody wanted to hurt my feelings by telling me?

What do you expect to happen with this? Which arch maintainer should
apply this patch that affects three different independently maintained
architectures?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

