Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDF4C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9wmj+UF3ZBwNytHK13BfVarj9jHLB/ciTxE2Q6X0qw=; b=SsGUVNsDPqRIsAzy+uYph4Bs0U
	MoneQqTSu9v9jTVI4+gvd/I0nBA9lYST0Ww9mF6hnzpQhwiYJ58GiGtumyucSXMwj6oryY5I50p2z
	bYJBkHAA+RkGrpjc8PISwu1GhVudBiVp+UclOXaPxHH8lzPeNxgMBT/CGlOhqa5iOEVKsGdLyLooY
	7gBbvtsG2ZOIMsuf3240DCOmX7wCl81Bb1P/RCz9VuPpvbmH0V728iT0MtiAHdSz2rD7ep/Ns5aLC
	IvDK/gUFUP0jL1iAarvq01zCVuWVa4wTCJV5v8oPwXLgR6qe1MovsYSvrQCaK4HdLpzyrva09qCPh
	rjNwn6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tRo-0000000CQsi-1gWB;
	Fri, 25 Sep 2026 00:05:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tRm-0000000CQsV-2hyc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBFF242DD3;
	Fri, 25 Sep 2026 00:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5E61F000FF;
	Fri, 25 Sep 2026 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790294749;
	bh=x9wmj+UF3ZBwNytHK13BfVarj9jHLB/ciTxE2Q6X0qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zrwfn+N7i0gd+uW4UcPFxlywSNaic7UyQW+i3oiCbNdYV7D5TAvDozCn+YsKAXMgt
	 6F2Ye7K4QdkjIAdruy1A8gZuP0xAz5urEYYx5zpBnXq2bXYlusq27zJs+8xsUr8Z8T
	 LkFI45DWzmz9Yfb6Spv/u6LWiLHNe3LVmaHwYOoSUQRqHbngKlqDFPlm6zPTR5817k
	 hJ+G57s5yfhOaMRRb6y3EfyrZK2zT8T+cUwlQJO6Kgy+OslVXRpSxeoQSPr5UeANYI
	 dQWm8NR9AvSnrJagc+Eztowq1/Qjlw9f/F8izSlEwzmAevHKKROqgRujDQyks17ikC
	 q7AhLfjWWijGg==
Date: Thu, 24 Sep 2026 17:05:49 -0700
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
Message-ID: <202609241703.4AF69048@keescook>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <202609221129.B5E13A7@keescook>
 <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, will@kernel.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2026 at 05:32:14PM +0800, Jinjie Ruan wrote:
> 在 2026/9/23 2:29, Kees Cook 写道:
> I tested the rr test cases on a Kunpeng HIP09 (with minor adaptations,
> since Kunpeng CPUs aren't supported by default), and the results showed
> no regressions.

Great! Thank you for getting that set up.

> 
> |               |    7.3-rc4 baseline     |   Patched                 |
> 
> |  ------------ |------------------------ | ------------------------- |
> |   result      |  87% passed, 190 failed |   88% passed, 186 failed  |
> 
> 
> | Failure Mode   | 7.3-rc4 baseline |   Patched  |
> | ------------   | ---------------- | ---------- |
> | TICK_MISMATCH  |         76       |   74       |
> | TIMEOUT        |         68       |   65       |
> | GDB_SCRIPT     |         34       |   37       |
> | PERF_EVENT_OPEN|         3        |   2        |
> |   OVERSHOOT    |         1        |   0        |
> |    OTHER       |         8        |   8        |
> | -------------- |  --------------- | ---------- |
> |  Total         |      190         |   186      |

GDB_SCRIPT failures went up? Are the tests just flaky?

> > - MTE: I didn't see MTE in the cover letter's test list, and it seems
> >   relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
> >   ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
> >   on the reworked exit path. The MTE selftests showed no differences,
> >   but a third of them don't actually run for me under QEMU, so they'd
> >   be worth running on your hardware. (Testing MTE under QEMU saw
> 
> Turns out our arm64 machines don't support MTE; I was testing it on QEMU.

Ah, dang. I wonder if we can find anyone with MTE hardware to test this.
Any volunteers? :)

-Kees

-- 
Kees Cook

