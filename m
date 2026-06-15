Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC5CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+qTt02XvstvPHilEvantGeUvkvUJlPcq7cabpr9dSs=; b=elAY6uyvod4DvC4CKd0oq5hHsh
	G/n4SDqqCh6dbfMtReuCYMtfwMSOacAZu+N5t3EwFYn/NnOdIOyirhW8f9/gEtz9b9WLQ4BpBgXhj
	kjFxvTBIqc2JX/ez2ihgBQ/fdNejlijrn9oaJFb3nQlOPFeLwt5m/FIfw6pObcXSf2qdwTSPVDJdZ
	ejnTvz4IQS8seqbyCBwDSEkPqwpz4P7cuDIZ9kPdfxh4sASsljMu9Mg16EWLSqzouqIfsAhLfLXYb
	bZSfJpXi49u93wzd5k2cAK3Wej6B+BpCeQlJtYtGD59M34l9mR9Rvk0cykn/uvaQkCv2cbUMb9tx8
	bEqeB4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4Eq-0000000E1un-1Zeb;
	Mon, 15 Jun 2026 10:08:16 +0000
Received: from [2001:41b8:202:deb::311:108] (helo=stravinsky.debian.org)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4Ep-0000000E1tp-09Vg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z+qTt02XvstvPHilEvantGeUvkvUJlPcq7cabpr9dSs=; b=R80ShSCFLteNBJVj0U+3z37zCN
	9WpWDlDjnMmNpfLt9ufqd79IfMmqw6pk8fuLinn8zQ+mHuzccyhbJjF17IS1e+GsOsp06KuxfjST5
	N3f2Ics8tYF6RfWt4UZjolkmxq8rn6e8yFnTOYcQu4+jXnA89l5kp3Z/2vRVOFqnzkSWQb5R/rwbf
	9oofwtnxnDqdIUlItd/wYTsGvY6X+Dzd2zdxMYUQmeq8mbG5LBa1tw3GIC8HoVubg3Jf4tXSa0dGL
	kxTiv8fh1bX8XijsGDMCSC3GevjjmNJRd0cqRFN/dTw2DN9Fq6zABA9DrEG1vVin/2M4eIFcG265n
	2umyHcVQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZ4Ed-00CzhJ-1Q;
	Mon, 15 Jun 2026 10:08:03 +0000
Date: Mon, 15 Jun 2026 03:07:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, leo.bras@arm.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	paulmck@kernel.org, puranjay@kernel.org, usama.arif@linux.dev, rmikey@meta.com, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the
 arch_local_irq_*() helpers
Message-ID: <ai_NFFrMrMabVxED@gmail.com>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
 <ae9V6jrYEwa6Uwqn@arm.com>
 <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_030815_077700_36EF2D90 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Apr 27, 2026 at 02:08:59PM +0100, Mark Rutland wrote:
> On Mon, Apr 27, 2026 at 01:26:18PM +0100, Catalin Marinas wrote:
> > On Tue, Apr 21, 2026 at 08:58:57AM -0700, Breno Leitao wrote:
> > > Force-inline all of the arch_local_irq_*() wrappers so they cannot be
> > > emitted out-of-line:
> > > 
> > >   - arch_local_irq_enable()
> > >   - arch_local_irq_disable()
> > >   - arch_local_save_flags()
> > >   - arch_irqs_disabled_flags()
> > >   - arch_irqs_disabled()
> > >   - arch_local_irq_save()
> > >   - arch_local_irq_restore()
> > 
> > I'll queue this, thanks!
> > 
> > I think we should also do local_daif_{mask,restore,inherit} as they seem
> > to be called from noinstr locations in entry-common.c.
> 
> I agree we probably should mark those as __always_inline, but I beleive
> they're safe as-is.

Returning to this topic, I've also observed arch_counter_get_cntpct()
appearing in backtraces during lock spinning, which obscures the actual
code location and makes debugging less straightforward.

This scenario is common at Meta when a remote function call targets a
stuck CPU, resulting in an infinite loop, and dying at arch_counter_get_cntpc().

Is it worth making arch_counter_get_cntpc() always inline as well?


 [     T18] Sending NMI from CPU 1 to CPUs 18:
 [     C18] NMI backtrace for cpu 18
 [     C18] CPU: 18 UID: 0 PID: 7467 Comm: dynoKernelMon Kdump: loaded Not tainted 6.16.1-0_fbk3_0_gd6c130b80483 #1 NONE
 [     C18] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
 [     C18] pc : arch_counter_get_cntpct+0x14/0x18
 [     C18] lr : ktime_get_mono_fast_ns+0x5c/0x1a8
 [     C18] sp : ffff8000d43afa30
 [     C18] x29: ffff8000d43afa30 x28: 00000000000f4240 x27: 0000000000000000
 [     C18] x26: 0000028ac8fe4369 x25: 0000000000001388 x24: 000000000054fb54
 [     C18] x23: ffff800082fbd000 x22: 0000028f22c480dd x21: ffff800081b60000
 [     C18] x20: ffff800080c71058 x19: ffff800082fb8848 x18: 0000000000000018
 [     C18] x17: 0000000000000058 x16: 00000000ffffffff x15: 00000000ffff0000
 [     C18] x14: 0000000000000002 x13: 0000000000000003 x12: 000000000000ffd8
 [     C18] x11: ffff8000d43affd8 x10: 0000000000000038 x9 : 0000000000000000
 [     C18] x8 : ffff8000d43afa30 x7 : ff7fff7f7f7f7f7f x6 : 000000000000000a
 [     C18] x5 : ffff8000832772ba x4 : 0000000000000000 x3 : 0000000000000000
 [     C18] x2 : 0000000000000000 x1 : 000000000014b4c0 x0 : 000002a87573b7a0
 [     C18] Call trace:
 [     C18]  arch_counter_get_cntpct+0x14/0x18 (P)
 [     C18]  smp_call_function_single+0x2d0/0xd90
 [     C18]  event_function_call+0x80/0x2e0
 [     C18]  _perf_event_disable+0x5c/0xf0
 [     C18]  perf_ioctl+0x170/0x890
 [     C18]  __arm64_sys_ioctl+0xbb0/0xd28
 [     C18]  invoke_syscall+0x4c/0xd0
 [     C18]  do_el0_svc+0x80/0xb8
 [     C18]  el0_svc+0x30/0xf0
 [     C18]  el0t_64_sync_handler+0x70/0x100
 [     C18]  el0t_64_sync+0x17c/0x180


Thanks,
--breno

