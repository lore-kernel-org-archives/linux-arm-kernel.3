Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744DCC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSwuAGPzX8RoJMccYGVKtdfyo6odqNj35F2Uzl7Q2qA=; b=P9/BbcYElxyrifyMbZXDoxXkMR
	ncZNTBqhPjWLtlogmZt2/leM5v+zyArGT3Angzl34W0W9bcv3vQR7aXIJYnjet0f7GSmWdwUfK2PS
	xs78iR8GEgXTrvvM6NjV6FmOfUNiWl/FCDyrsCko9DZUhzvW7jOKEmx66wqskx3pT/C2M1Miuie5r
	R0f8m0sAvl06RrN+Y4dfz+f3nSFlRRMOShdAIgkIr48YUoeLaX1VGQHWnR9KVYS42g3EBTIsZ4OGU
	wgW+U4g7rJ+exPLUId8R4NtKK7vrOmr6YyuH1Js0tBw2Q1DGZXT4ACzQ4hEDrm+1EoTFnUgPhF2xN
	k4qOASkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tIy-0000000CQ79-05d1;
	Thu, 24 Sep 2026 23:56:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tIw-0000000CQ6w-2jJS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:56:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7E21601F6;
	Thu, 24 Sep 2026 23:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686591F000FF;
	Thu, 24 Sep 2026 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790294201;
	bh=JSwuAGPzX8RoJMccYGVKtdfyo6odqNj35F2Uzl7Q2qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ToswNapex2IFgKhaY1s/8FdlMabI62hEDEpKUTy1dJMd0Rv5/09AWVjiYrc4Pyo/y
	 Sd8Wra9/4mCWlbBt9+69kDdw3zrDwK6FCVbaDi/BeY7rzjlVfatdKntHdqBLW+/zcg
	 7X1fcOH76ng9qOOnN9LC2FkxAc157ysF26o4JGHt5pmAObQ8QjsEeVKjmXXfIZYCPH
	 YahCxN1lXj7cZf99dwEmnaiONZlVDatYaroDN7e1ZRRAXk1OdImMOQyGxvJ+tm9b4M
	 J/v8Gsu3DSLFOr96KxPPOx5u6e9I5TS7sk/v+B9Xvb7M9iorBkU7PxtCcLJo/kBN60
	 bPjBi0UYUhwkA==
Date: Thu, 24 Sep 2026 16:56:41 -0700
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH] selftests/ptrace: Add PTRACE_SYSEMU_SINGLESTEP
 syscall-exit-stop test
Message-ID: <202609241654.F545D3A88@keescook>
References: <20260922195719.i.211-kees@kernel.org>
 <bbd65e4d-8096-4939-8308-f0f54c5cb3bc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbd65e4d-8096-4939-8308-f0f54c5cb3bc@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, will@kernel.org, Shuah Khan <shuah@kernel.org>, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2026 at 12:11:31PM +0800, Jinjie Ruan wrote:
> 
> 
> 在 2026/9/23 3:57, Kees Cook 写道:
> > ptrace(2) states that no syscall-exit-stop occurs when a tracee is
> > continued with PTRACE_SYSEMU or PTRACE_SYSEMU_SINGLESTEP. arm64 gated
> > its syscall-exit report on
> > 
> > 	flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP)
> 
> Hi Kees,
> 
> The original fix description is a bit off: on arm64 there is no extra
> syscall-exit-stop; instead, there's an additional pseudo single-step
> injection.
> 
> As sashiko pointed out, as commit ac2081cdc4d9 ("arm64: ptrace:
> Consistently use pseudo-singlestep exceptions") described, for
> PTRACE_SYSEMU_SINGLESTEP, arm64 still needs the pseudo single-step
> because its hardware single-step state machine is fast-forwarded over
> the SVC instruction.

Ah! Okay. So this test should be tweaked to deal with that? Feel free to
snag/update this test for the series. We didn't have anything testing
syscall exit stops, so it seemed reasonable to get it written.

-Kees

-- 
Kees Cook

