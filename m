Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5946BC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xme47uO+Jf63evL4/29gr84tP1Hv+GyQrOlJltHuyMs=; b=J1DGViNZMwAoAThxf9zaQf8eWN
	Lra80aCennoJm841XknLrNCQaMDOo56LUPebpXQJVvprZ6WPNSuXwHldoifug3pnB1EfKiuf+d6+c
	G6C7EBod0EwZSAe6jWVsGyHCV4S26U+hzpWAusGQ87wfCTbyNCEybYjtoV5Sbth6tS74MUqaJU5nf
	voCLfCYsdq2rzh2FCl3UDuHUcUUPNq5tR9sLUbkDO2/O5P8vU9NtZ/z03+bpECz9JmVK+FE7IRKhh
	pOUxbRuej/mjqBD2ZbfFMyBcbOdERGqkwaQS2ypRT5ZXJEz9mJRr0KP1ZvHw09xlSRkCs+lTFWK+A
	NL/2g7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ac7-000000074lC-11Mp;
	Mon, 07 Sep 2026 14:46:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ac4-000000074kJ-1qaw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xme47uO+Jf63evL4/29gr84tP1Hv+GyQrOlJltHuyMs=; b=hbAkk2Q2EognyWHMNrcyAs+Cq8
	s6Ud1Oag8AO98MG66I82FLWOADGkZ4NXz0ST5xd/MLKm9xmWwKXM00XLEUfA06z+ASWZUPZmJtQ3A
	rgcYEEw3BFBf3kIG7EZshHKjRVpslOi8Zh3r3uzowvPNxGOV7X23iZZuOIhVS7kpYXygjp2wF1Vv+
	SjDWq390303ekV68zoztlcDP0iVwdL3csh0RjwXeA4eNX1CEBdxcdrRX5Xu+ZyARu9LGcamuE/57H
	SwHrtmdM3OuP2i6lQLxA4JdvV7W49+P3Cwatzz6aqpCJMN9/HEL5CIY2ODOwLQi1N43LsS7Ijlwk6
	GbDJKdRw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34342)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1x3abv-000000006zQ-150O;
	Mon, 07 Sep 2026 15:46:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1x3abp-0000000035r-22YQ;
	Mon, 07 Sep 2026 15:46:09 +0100
Date: Mon, 7 Sep 2026 15:46:09 +0100
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
Message-ID: <ap7OMYBVKUrQjX9O@shell.armlinux.org.uk>
References: <20260814085118.OPEA_Ssn@linutronix.de>
 <20260903160710.vVf4gEL2@linutronix.de>
 <apmknG55qFAn8EPf@shell.armlinux.org.uk>
 <20260903133146.07095885@gandalf.local.home>
 <20260904155404.ESPFg3zi@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904155404.ESPFg3zi@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_074624_757355_F8D2A139 
X-CRM114-Status: GOOD (  26.84  )
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

On Fri, Sep 04, 2026 at 05:54:04PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-03 13:31:46 [-0400], Steven Rostedt wrote:
> > On Thu, 3 Sep 2026 17:47:24 +0100
> > Russell King <linux@armlinux.org.uk> wrote:
> > 
> > > What do you expect to happen with this? Which arch maintainer should
> > > apply this patch that affects three different independently maintained
> > > architectures?
> 
> Well, if you as the ARM person are fine with ARM part, an ACK would be
> appreciated. If you have something to object, it would be nice to let me
> know so I can adjust accordingly.

First, I only just looked at the email - you may have noticed I'm not
very active with the kernel anymore, as I'm a full-time carer at the
moment.

Second, I'm not fine with the patch as-is, because it's not clear how
it could be merged in its current form. It would be inappropriate to
give an Ack, because an Ack means I'm fine with it. I'm not.

Third, I haven't actually reviewed the patch itself (see first point).

Looking deeper now, I see nothing in the linked report, nor in your
write-up that identifies what is responsible for the context being
inappropriate to deliver the SIGTRAP. See the first point - I'm not
able to read lots of code to work that out, and presumably you've
already done that ground work to come up with a fix. This is *vital*
information when someone looks back at why this change was made as
it helps to understand how the problem occurs. This is, after all,
the whole point of commit messages - to help people look back and
understand why a change was made. The "what the changes are" part
is already covered by the patch showing what the changes were. It's
the stuff that *isn't* in the patch that needs to be in the commit
message.

So... don't describe the code changes in a commit message.

So no, an Ack is not appropriate.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

