Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vjGVqZ801u6hxGqkfTA8jJyWHpR5ckb7YSt41rFQIw=; b=Tj8iikNh/TFbEItk0PL4W0RS75
	8sXMIir4UyiCW8J1GCA4YHUB598oEuP/F5+3tf3em0ufoADkbA8oVys2QXtHZsurq5jc4TT4jO1gr
	5eH1Zismpy6V34S3zrXH41DDqmLgGuy+fQ5QnADuDuAL2RzFpUXxUOF9D3i95QhVwxA/b6Cxas5T7
	cir8XeeA+2YFtIrIovNNprRsHbk6mvR2gbHRh/d5ocpEeqMzdmN2Yu6xZT3+lUivaBHwQK5taEDEW
	G4q/GWtKD6JfLFOfJmrxylFGVaPSv7hthYCgWz8grB2d2o8g5XeE06AkTI3xfGn7XyvZEhfltzj4c
	nBRFPnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHHK-00000004hs2-2EKd;
	Sat, 16 Aug 2025 13:49:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHEk-00000004hfH-0TyY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 13:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3vjGVqZ801u6hxGqkfTA8jJyWHpR5ckb7YSt41rFQIw=; b=VKRS6dKACAPPqDh+fZxsnlW9j5
	Gzc0ykwuORiofHpTjaOR+cvAHIamo3N6/KepBDvOYVYQKgmSxgxtpqYNe6PIWIJIjlJmdja8E/cCO
	YgoXL4pKNCJ7S7EncWoBc3OzZkImlmk+pLQr1VGpNsWBpw2Z0NNABivkc6MjLKrYlS7WTmFccPAt3
	kYGgp+vCWU6+eBg81d3SfAp0MebvxcWBPDYPSkBug0ny1kXJPu0bPZUEuptIxYybHZFwpxz4dk+bR
	AnCEPs/ORNR/OYkPGmNlatlHWg45izoipH/INp8sPLGr29ZLS6ufDPBWogGm+zGZwnO2w9m76SyGB
	1gl/uCUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42708)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1unHCQ-0002D7-1b;
	Sat, 16 Aug 2025 14:43:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1unHCM-0000RZ-2K;
	Sat, 16 Aug 2025 14:43:54 +0100
Date: Sat, 16 Aug 2025 14:43:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Nam Cao <namcao@linutronix.de>, John Kacur <jkacur@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] runtime verification: Updates for 6.17
Message-ID: <aKCLGvmPLPwjyw13@shell.armlinux.org.uk>
References: <20250729174332.3acd1a86@gandalf.local.home>
 <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_064622_157887_1A95D2D5 
X-CRM114-Status: GOOD (  14.51  )
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

On Sat, Aug 16, 2025 at 02:04:34PM +0200, Richard Weinberger wrote:
> [Adding ARM folks]
> 
> On Tue, Jul 29, 2025 at 11:43 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > Linus,
> >
> > Runtime verification changes for 6.17
> 
> [...]
> 
> > - Add a vpanic() to allow for va_list to be passed to panic.
> 
> This change is causing a regression on ARM32.
> panic() no longer shows a proper stack trace.
> 
> With this change:
> [    2.943690] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    2.950101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.17.0-rc1 #176 NONE
> [    2.950509] Hardware name: Generic DT based system
> [    2.950865] Call trace:
> [    2.951722]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.953111]  show_stack from dump_stack_lvl+0x54/0x68
> [    2.953312]  dump_stack_lvl from vpanic+0xf8/0x388
> [    2.953526]  vpanic from __do_trace_suspend_resume+0x0/0x50

Please lookup the value of __do_trace_suspend_resume in System.map.

> 
> With commit  3f045de7f5 "panic: Add vpanic()" reverted:
> [    2.680077] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    2.690241] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.17.0-rc1-dirty #177 NONE
> [    2.690832] Hardware name: Generic DT based system
> [    2.691339] Call trace:
> [    2.692530]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.694283]  show_stack from dump_stack_lvl+0x54/0x68
> [    2.694536]  dump_stack_lvl from panic+0x110/0x31c
> [    2.694944]  panic from mount_root_generic+0x1fc/0x2ac

Also please lookup mount_root_generic.

> Maybe it changes the stack layout enough such that dump_stack() on
> ARM32 is no longer
> able to walk it? I'm using gcc 15.1.1, if this matters.

Also please check whether you're using frame pointers or the unwinder
(CONFIG_UNWINDER_FRAME_POINTER or CONFIG_ARM_UNWIND).

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

