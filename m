Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28AEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iwiiQmAlU8enifR6QY44I57i3gUB3NZPzvMn8cgozk=; b=3lbCH+TzQAHnU4JbfPZbynk57J
	T7/ckwYJaE0NV9dOBZhycSsyhOI2PJQhAlcf1ZnBYDmsgSQHafsKweHMu0k50CH4CkOhOMDrOjlMJ
	ICIci1mHsI6iByk27HPWuTY9fCGzkvpg+23jMPVUPof44cl9ritgnXKnmUPjw3d6FbUFhLsRkp9qm
	ldmz/MCN3i8bh8hJi/9XRg8YfJngxvMi+KjOPOyY8sdVpQ6OCfcdIe0MzIaryGIVg29hqnh0A30oI
	QOkSFURJoVZNue+SfE5MQwufbKbI9fT01Rkl/nIUGe5X7vEhvyB7RsMTbDIvgCehtwE2VKBGlRcQJ
	19wDLcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vEi-000000093fX-0Q4h;
	Tue, 08 Sep 2026 12:47:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vEd-000000093ex-3vCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3iwiiQmAlU8enifR6QY44I57i3gUB3NZPzvMn8cgozk=; b=Lg3hQczS+6CsrXLaGUJP8xOLSk
	SS9xphKhDY8HntlM6yMVO0UjTkXpH+IBJoIhA3uQMwpDGAiCTkC7A0U7ZZgV9ArI5C/6mzjLQasye
	n7qErS98uKbiwtY3cpepGG+ILCX072Yy3dzPCtj6v+sz8QEFpMTARgnwGnE4rlV2O59Hi2UQwk3bS
	AiF+9L1IgyHRqNv7n9BDrtU2Hsf20e7Y4N0FAr8e28Jn5l7vqzRPf6Mh837G3EyS6M9atzuMNXkn+
	idbZ6csgR2ehxgPWJfrwu6wGISWm1mOPdmw79XR6320D+QhTyE8EqUx6aQCc3fOrY5HwLqdlzNcyj
	rZyGwhCw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58402)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1x3vEY-000000008Uo-2eoX;
	Tue, 08 Sep 2026 13:47:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1x3vEU-0000000043Q-0WTK;
	Tue, 08 Sep 2026 13:47:26 +0100
Date: Tue, 8 Sep 2026 13:47:25 +0100
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
Message-ID: <aqAD3YubuHDy8Fva@shell.armlinux.org.uk>
References: <20260903160710.vVf4gEL2@linutronix.de>
 <apmknG55qFAn8EPf@shell.armlinux.org.uk>
 <20260903133146.07095885@gandalf.local.home>
 <20260904155404.ESPFg3zi@linutronix.de>
 <ap7OMYBVKUrQjX9O@shell.armlinux.org.uk>
 <20260908075455.OffmMhrB@linutronix.de>
 <ap_AhKXlAWecV3BI@shell.armlinux.org.uk>
 <20260908083740.0qERUBOE@linutronix.de>
 <ap_Kv73A8exPhK-j@shell.armlinux.org.uk>
 <20260908093826.ofGxmRRK@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908093826.ofGxmRRK@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_054736_867398_EE47475A 
X-CRM114-Status: GOOD (  29.26  )
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

On Tue, Sep 08, 2026 at 11:38:26AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-08 09:43:43 [+0100], Russell King wrote:
> > > > > The linked report shows a backtrace by "BUG: sleeping function"
> > > > > originating from el0_breakpt() -> perf_bp_event() following by sending a
> > > > > signal force_sig_fault() followed by rt_spin_lock() and
> > > > > __might_resched(). It also contains a reproducer.
> > > > > 
> > > > > The first sentence has the part
> > > > > | The hardware event is
> > > > > | delivered with disabled interrupts and perf intrastrucure expects
> > > > > | disabled interrupts while the overflow callback is invoked.
> > > > 
> > > > *Where* are interrupts disabled?
> > > 
> > > On exception entry point, that would el0t_64_sync() for arm64 as in the
> > > report.
> > 
> > Oh FFS. So why does this need to be done on ARM? Explain it. This is
> > what I'm trying to get out of you, but you're being very resistant
> > to providing the technical details. I can only think you haven't
> > actually done the analysis.
> 
> I had the feeling that this is not what you were expecting but I wasn't
> sure what you were expecting either.
> 
> The hardware breakpoint is delivered to the OS via an exception and on
> exception entry point the interrupts are disabled. This isn't unique to
> ARM but the same on other architectures, too.

Yes, architecturally, when the CPU enters an exception handler,
interrupts are disabled by the CPU. However, that doesn't translate
to "the kernel runs with interrupts disabled". In most cases, we
re-enable interrupts if the exception comes from userspace.

However, I have no idea where in the call path is between the
exception being entered and the code you have a problem with - and
I've now forgotten where to find the call path, and I don't have
time to find it again. You are making this incredibly difficult,
and I don't have time for this. Sorry, this is my last reply for
a while, because this is just too much stress at this time for me.

What was a simple request has turned into a major source of frustration.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

