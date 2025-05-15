Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6CCC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2lHQlLoAJuJYsHZTLiF9IRd/5tAuuzWdTKCXeJG69c=; b=t4rdg3Qof4JFuuzpi9ZSbNH0r4
	RNqG3rQymB6mZXA5+LVELLFoyYcgkT7pOy1x1Tx7gYO4G+eGJp6aJehGjx8vEfBMOXNu00u+atoyP
	CLIekmylA59e7uk+4vCnfi8i88CCe8xjdI91ogUln16wlbm4Dr86VC+yM7jMrlTlxV5AjIq3GwzFT
	IJNqKvlMtPdc9xEawp8XtqxVzUpGKF/n2BuEPC5WueFfOW3veWO5MW0a7mBBQjJijFfcQFaA+CcXB
	+/DHeX2LjoXgLlbYGbLMVTMAC4q56A6aS1QRq55EdQUbmFvq8GLfoyVCY8c5RhxpnSGquQLSN0M8U
	SLF1gjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXit-00000000ZKC-2fia;
	Thu, 15 May 2025 12:30:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXgr-00000000Z5G-1cCq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95314A4B566;
	Thu, 15 May 2025 12:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193E5C4CEE7;
	Thu, 15 May 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747312076;
	bh=F/XhtE918UetHxCqDQJYNXlwYSxyWI6CctB4Lrzut74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFLM7YXS0JH1RgjD49TaWZ0xEF4Mx9AetCek/EJN8P5S7316HiKQjR5KHBEdapEE4
	 nUoMDZAH2oz7NCBZzIzVousfu93GTD7lJ2A/BHfM3gOm3lB544afA8ASpqu//YobYd
	 09BFS9jNi2mcuI4ycBzmvDdcH8+Xh5a+krgDRZudshZ+r96j5vUBDRis4c0oxMy8My
	 pS2ppozS7iNYDcWaggDETKEO+dtOv1EjFOM9eSSSXGER4JLsksnVLXu1xkas6TtmvY
	 LLe+kYQ2If2HfyemKCpZvEgWrgsorBxK7Fe3KVJVXSwT9RO+/DdlLTfxQLNCrysGq8
	 kq2ABlz8MmkCQ==
Date: Thu, 15 May 2025 13:27:51 +0100
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: ftjahjad@redhat.com, catalin.marinas@arm.com, bgoncalv@redhat.com,
	linux-arm-kernel@lists.infradead.org, juri.lelli@redhat.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.15.0-rc6, upstream-arm-next, c919f087)
Message-ID: <20250515122750.GA11761@willie-the-truck>
References: <92816.125051417421200539@us-mta-256.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92816.125051417421200539@us-mta-256.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_052757_552334_E5F6DD65 
X-CRM114-Status: GOOD (  11.19  )
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

On Wed, May 14, 2025 at 09:42:05PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/core' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1817830955
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         Boot test
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1817830955-aarch64-kernel_upt_4
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check

I think that's because of this splat during boot:

May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: ------------[ cut here ]------------
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2411 build_sched_domains+0x268/0x940
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: Modules linked in:
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc6 #1 PREEMPT(voluntary) 
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: pc : build_sched_domains+0x268/0x940
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: lr : build_sched_domains+0x264/0x940
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: sp : ffff800084b4bd10
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x29: ffff800084b4bd50 x28: ffff000800342e40 x27: ffff800082be4938
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x26: ffff0087837c5a00 x25: ffff800083c58148 x24: 0000000000000000
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x23: ffff0087837c5a00 x22: ffff8000836e24a8 x21: ffff800083690cc0
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x20: 0000000000000070 x19: ffff0087823630e0 x18: 0000000000000014
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x17: 0000000048f650fb x16: 00000000a07d7076 x15: 00000000b26727b2
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x14: 0000000087fdd0f9 x13: 00000000c2ddb74f x12: 000000000a009718
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x11: 0000000006e1b9d0 x10: ffff800083df69b8 x9 : ffff800083df69b0
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x8 : ffff800083e2e4a0 x7 : 0000000000000004 x6 : ffff000000000000
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x5 : ffff000000000000 x4 : 0000000000000003 x3 : 0000000000000002
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: x2 : 00000000000000e0 x1 : ffff800083e2e4a8 x0 : 0000000000000000
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: Call trace:
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  build_sched_domains+0x268/0x940 (P)
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  sched_init_domains+0xbc/0xd8
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  sched_init_smp+0x48/0xd0
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  kernel_init_freeable+0x194/0x218
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  kernel_init+0x28/0x160
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel:  ret_from_fork+0x10/0x20
May 14 20:34:38 hpe-apollo-cn99xx-21.khw.eng.rdu2.dc.redhat.com kernel: ---[ end trace 0000000000000000 ]---

but we haven't changed anything here recently afaict...

Will

