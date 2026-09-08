Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8CBC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxn7PT+EAVFsbAjdQ2z3LbyFBgdM3inwgwbxduT95vI=; b=xDqYCh6tU7T0IjiH8QzhFg41+G
	KrFjFLmbshfCJjCf91ERXiYk9f5s8RrW0P75OXHrJ24DF2KdUZ7kIJ0Kmlq+OiXEMkvC3ubheI6OQ
	U9tN5FQZS72JP2E8B8tLeYTIUI3yJZHy7kuY/5awMmvKkwhS9oaLWfulwoWiY6OlCp12HQ5JhO2dC
	sc0EDIWH/3ULtAUP35PPWECnj7JJw4IUkSepCCR/wkAaN4m5z/1ZiPLhPPbB1aqs8pwc8iD4rGMmt
	8EzGf7+QAHy21mbnmFLCxiJCoajrjsSxkMApLVRwlvjP+IXJIMmupdZuVVxHhPg9ik5+jPVKaAkIT
	z50pyHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qkc-00000008Kjk-1axp;
	Tue, 08 Sep 2026 08:00:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qkZ-00000008Kiy-25Jj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uxn7PT+EAVFsbAjdQ2z3LbyFBgdM3inwgwbxduT95vI=; b=k2pFIpeNykpDXUpgGP6rmLNoV1
	v/gsW08BVVUZfDPnDaCOYq/EPmKDFUni7x5/8twmANTmNfp5sQYO6M5iMkWl7C/Yj8eByFi0NSjP5
	+pKn3gZs8uXX5sMu1Rwbj/XeNHpvtcP2iheVMIB9c8X8dDZWr122N2kazWTQ16RAvx+Ca1sHX+TFH
	ZtTLGhonByGtkYC2q3cf/86RHDlQDw9Ts/EgBNsL7k3mrWZZKvQpqmnPtBKewzJQHfSco39iq1brj
	m7SiZUcp6mag/2vpZ39mmJo8N3iPN8A5fDIP7p9oxcTGE7fua+tmzCqrAI/TrTSDeYeaqTt9EuUlm
	zRqHERBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51328)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1x3qkT-00000000835-1isj;
	Tue, 08 Sep 2026 09:00:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1x3qkO-000000003sU-2C7X;
	Tue, 08 Sep 2026 09:00:04 +0100
Date: Tue, 8 Sep 2026 09:00:04 +0100
From: Russell King <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Message-ID: <ap_AhKXlAWecV3BI@shell.armlinux.org.uk>
References: <20260814085118.OPEA_Ssn@linutronix.de>
 <20260903160710.vVf4gEL2@linutronix.de>
 <apmknG55qFAn8EPf@shell.armlinux.org.uk>
 <20260903133146.07095885@gandalf.local.home>
 <20260904155404.ESPFg3zi@linutronix.de>
 <ap7OMYBVKUrQjX9O@shell.armlinux.org.uk>
 <20260908075455.OffmMhrB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908075455.OffmMhrB@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_010015_539547_A8F202B1 
X-CRM114-Status: GOOD (  42.66  )
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

On Tue, Sep 08, 2026 at 09:54:55AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-07 15:46:09 [+0100], Russell King wrote:
> > On Fri, Sep 04, 2026 at 05:54:04PM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2026-09-03 13:31:46 [-0400], Steven Rostedt wrote:
> > > > On Thu, 3 Sep 2026 17:47:24 +0100
> > > > Russell King <linux@armlinux.org.uk> wrote:
> > > > 
> > > > > What do you expect to happen with this? Which arch maintainer should
> > > > > apply this patch that affects three different independently maintained
> > > > > architectures?
> > > 
> > > Well, if you as the ARM person are fine with ARM part, an ACK would be
> > > appreciated. If you have something to object, it would be nice to let me
> > > know so I can adjust accordingly.
> > 
> > First, I only just looked at the email - you may have noticed I'm not
> > very active with the kernel anymore, as I'm a full-time carer at the
> > moment.
> > 
> > Second, I'm not fine with the patch as-is, because it's not clear how
> > it could be merged in its current form. It would be inappropriate to
> > give an Ack, because an Ack means I'm fine with it. I'm not.
> > 
> > Third, I haven't actually reviewed the patch itself (see first point).
> > 
> > Looking deeper now, I see nothing in the linked report, nor in your
> > write-up that identifies what is responsible for the context being
> > inappropriate to deliver the SIGTRAP. See the first point - I'm not
> 
> The linked report shows a backtrace by "BUG: sleeping function"
> originating from el0_breakpt() -> perf_bp_event() following by sending a
> signal force_sig_fault() followed by rt_spin_lock() and
> __might_resched(). It also contains a reproducer.
> 
> The first sentence has the part
> | The hardware event is
> | delivered with disabled interrupts and perf intrastrucure expects
> | disabled interrupts while the overflow callback is invoked.

*Where* are interrupts disabled?

> 
> This is what happens, followed by 
> 
> | The callback then sends a SIGTRAP signal for which it acquires
> | sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> | must not be acquired in atomic context.
> 
> This is not really specific to PREEMPT_RT as we enforce to not allow
> raw_spinlock_t -> spinlock_t on !PREEMPT_RT via lockdep, too.
> 
> > able to read lots of code to work that out, and presumably you've
> > already done that ground work to come up with a fix. This is *vital*
> > information when someone looks back at why this change was made as
> > it helps to understand how the problem occurs. This is, after all,
> > the whole point of commit messages - to help people look back and
> > understand why a change was made. The "what the changes are" part
> > is already covered by the patch showing what the changes were. It's
> > the stuff that *isn't* in the patch that needs to be in the commit
> > message.
> > 
> > So... don't describe the code changes in a commit message.
> 
> I think both parts (describing the issue and the change) are part of the
> commit message.
> 
> > So no, an Ack is not appropriate.
> 
> Sebastian
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

