Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9611CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u2E02BN0TOz5unoBlUvTeeG87ntgVboTD6KZ6U5aV0=; b=SvKWeBesUrsY+lRakqZ5pW7eiD
	+Rbe5WIEZA7gcTd5rGDONJ+0k25ilTq/II69y1V55nkYwPRTj+2uSrqgrXUbgZOwoB5XFVhYpD9db
	OjSVsaYmlG1N0lrDFcCeIU+n9/uFGjRsQ7gguNx9Kt4/P1ngEK5kTLaAx6DBatujD4X+/13HTyK9G
	oeSug/Lp5nEPukijfBs9uL4LTS5wYMQqoweEloe+87bPmtInZSA0km0uYhho5NJ81l+OuNJCf3K2u
	sWk0YeJb0cPusIrFVHW5i2UxbypdEW+MUeFXj6qVictrqpWHCwsdt+7jskUL/MbNWQxkri4Fih4a8
	QyESPEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwnx-00000006gMR-0egU;
	Thu, 23 Oct 2025 15:00:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwnW-00000006g1s-1nIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCDF1516;
	Thu, 23 Oct 2025 08:00:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047BE3F63F;
	Thu, 23 Oct 2025 08:00:10 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:00:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
Message-ID: <20251023150009.GS281971@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
 <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com>
 <20251003135946.GY7985@e132581.arm.com>
 <CAJ9a7Vgg24S3ApkvEWr5ayD0OK5cYZTsmjJKpZkZzzMah72ijw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vgg24S3ApkvEWr5ayD0OK5cYZTsmjJKpZkZzzMah72ijw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_080014_572468_A5BB2B9C 
X-CRM114-Status: GOOD (  39.07  )
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

Hi Mike,

On Tue, Oct 07, 2025 at 02:56:46PM +0100, Mike Leach wrote:

[...]

> > > System CTIs are attached to key HW trace infrastucture such as input
> > > triggers for ETR/ETB that have direct effect on trace.
> > > CoreCTIs, while they have some debug triggers, can also trigger ETM events.
> >
> > Seems to me, it is no matter system CTIs or Core CTIs. Here, I am trying
> > to distinguish three methods for enabling CTI:
> >
> >   (1) Enable CTI within a perf session.
> >   (2) Enable CTI within a sysfs session.
> >   (3) Enable CTI using the CTI driver's sysfs knob(s).
> >
> > Currently, methods (2) and (3) are both using CS_MODE_SYSFS.
> >
> > Method (2) enables a CTI device when we enable a source-to-sink path
> > via the sysfs interface; CTI acts as a helper in this case.
> >
> > Since the CTI driver also provides its own sysfs knobs to enable the
> > CTI device by itself (defined in coresight-cti-sysfs.c), to
> > distinguish this from method (2), this patch introduces CS_MODE_DEBUG.
> 
> The point here is that a user can (or at least could and should be
> able to) program and enable CTIs across the system to generate signal
> inputs to trace devices, then start trace either by sysfs or perf and
> expect those CTIs to have the desired effect.

I agree that we should allow users to configure CTI through the sysfs
interface, and afterwards it can be enabled either via sysfs or a perf
session.

However, the problem is that, unlike other components, the CTI module
can be enabled directly through its own control knob (see
enable_store() in coresight/coresight-cti-sysfs.c). As a result, the
enabling is _not_ bound to any CoreSight path.

This is why a new mode (CS_MODE_DEBUG) is introduced. When users select
this mode, power management should be handled by the CTI driver itself
rather than by the CoreSight core layer, because in this case no
CoreSight path is bound to the CTI devices.

> The "mode" for CTIs was introduced to fix a ref count issue. I am not
> sure now that this is the best solution. A "mode" is good for
> components on the direct trace path responsible for transmitting trace
> from source to sink, but perhaps less useful on the CTI/CTM system
> which is both global and has multiple uses.
> 
> We effectively have three domains for CTIs all of which can be
> programmed to affect trace capture -
> 1) CPU bound - on the trace path, possibly affected by core power down
> depending on the implementation of the system and will be enabled as
> helpers as the path is enabled.
> 2) Trace path  system CTIs - connected to other path devices - e.g.
> funnels, etr etc, that will also be enabled as helpers as trace path
> is enabled.
> 3) Other system CTIs - not directly connected to specific trace
> devices, but can channel signals via the CTM to other trace path CTIs

I would say we can simplify the case 1) and 2) as a single case, as both
cases CTI is attached to a path, and can be managed by core layer for
CPU PM. Only a difference between them is we cannot directly set
register for CPU bound module as it might be not accessible when CPU
power domain is off, but I will explain later appropriate way to handle
the difference (and why we should not have "powered" flag).

The case 3) is special, as said, this is totally irrelevant to other
coresight modules and CTI should manage every thing by self.

Could you confirm that the first two CTI cases can be enabled via CTI's
"enable" knob?  If answer is no (CTIs in the first two cases must be
enabled by a source-to-sink session), then the last case should be no
matter for CPU PM, and as a result, we can remove all CPU PM code in the
CTI driver (as all PM things can be managed by core layer).

> The CTI driver ref-counts CTI enables / disables, and alos has a flag
> to indicate when powered so that enables / disables are counted but
> will not be acted on unless powered.

I can accept the refcnt is used in CTI driver, a case is CTI module can
be bound to links (e.g., a CTI binding to funnel/replicator, etc).  So
a CTI device can be enabled for multiple times.

But the "hw_enabled" and "hw_powered" flags should not exist at all.
Currently, the CTI driver is a bit mess for me, mainly caused by these
two flags used in the coresight-cti-sysfs.c.

We already have the mode and refcnt, this is sufficient to present if
a CTI module has been enabled.  And if we can clearly distinguish config
parameters and runtime register values, and we must use SMP call to
enable/disable CPU-bound CTI module, then we can remove "hw_powered"
flag.

> There is probably a case for ensuring that the enables/disables via
> the sysfs files are balanced - i.e. a sysfs file disable should not
> disable a helper enable, so a specific count on that route may be
> needed.

IIUC, we don't need extra count for this case. We simply return back
if users try to enable CTI duplicately - first time we set the mode,
and afterwards just nop operations.

We might need to add an extra checking to prevent disable CTI via its
own knob if the CTI has already been enabled by source-to-sink
sessions.

I might extract out CTI patches in next spin, as we can discuss in
small context.

Thanks,
Leo

