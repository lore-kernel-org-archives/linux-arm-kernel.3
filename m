Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB95C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj2MMqnWlYe6/fW5qpeAUarvFQbB3E8ym+WmwNi7UpM=; b=BlKn689eXOFCHCjgHre0bwGvlt
	DXj4ihNo959yK7YDzU7/EgupJChidUJcldGE7gcLebLG+5XKd8ldLNBC04P/lTpVgG3ah6DgI+kcD
	pbtDJbJkY0cPi07sareskIeHn3WHV8WaKHQ3GCheUyg0UZmw8/I/wHO0LfSr7tHK2YIscnNuYr4An
	+qotVQz9CPdlFLh1G9y/ZbBju7HjX6jcAI+LeIv2qyC02JJvLW17wJHarmZQ1RVTvIJu/6I5R1KVK
	DO85K1sEKeAVYlN1R2g84VW6p1+WY0675aFbUIi0ThqeR6wcOw4IkYkzVRxcFx8AcH5k7XaVxip8X
	M2yMXfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnez0-00000007koY-1oec;
	Thu, 27 Feb 2025 14:35:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneUQ-00000007dwd-0wbX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:03:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45373444FB;
	Thu, 27 Feb 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740665027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hj2MMqnWlYe6/fW5qpeAUarvFQbB3E8ym+WmwNi7UpM=;
	b=gE+NqB/ZT76Zfm5KOQLTox3/ZcrhFB1NVqxq5ulMQht8Cd+f9isTnrlTEAci7J8u0YcEvl
	kniXc19VhbuV12vfFLOipblXB7mW05WotrBYrlfjTz0emTHnUiWFkVo/tvzuPUo8mpB3cw
	Akw56yiVrkEZ+IgKAlEGza5tYxjZNVQJXR8wcvzpKA07HTrAuFEKk1+YxHxNLRNsw8Z2ey
	WChYSXS333B6/wUmd6DIhBCcgc3oOSRDky2gvV/9Xdd+yY941QTZW7hCpXp9yUi9evBieQ
	ETa9vU04gxlkaNlIJFa59XZ+N8jp3Tspe86KYTCp8qctiZ0/7ktFHxse6u5X2w==
Date: Thu, 27 Feb 2025 15:03:46 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <20250227140346.GD182392@tpx1.home>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227135330.GC182392@tpx1.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfefhlefgueektddvhfegveduvefftdevgfejffegveevvdekgfffleffteevfeehnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrieefrddvtddvrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrieefrddvtddvrdegtddphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepfigsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffhhgrrhhmrgdrueesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehluhguohhvihgtrdguvghsrhhotghhvghssehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_060350_419308_6945B438 
X-CRM114-Status: GOOD (  62.93  )
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
Cc: Jonathan Cameron <jic23@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2025 at 02:53:33PM +0100, Kamel Bouhara wrote:
> On Thu, Feb 27, 2025 at 01:59:57PM +0900, William Breathitt Gray wrote:
> > On Wed, Feb 26, 2025 at 01:58:37PM +0100, Csókás Bence wrote:
> > > On 2025. 02. 24. 4:07, William Breathitt Gray wrote:
> > > > On Fri, Feb 21, 2025 at 03:14:44PM +0100, Csókás Bence wrote:
> > > > > On 2025. 02. 21. 13:39, William Breathitt Gray wrote:
> > > > > > First, register RC seems to serve only as a threshold value for a
> > > > > > compare operation. So it shouldn't be exposed as "capture2", but rather
> > > > > > as its own dedicated threshold component. I think the 104-quad-8 module
> > > > > > is the only other driver supporting THRESHOLD events; it exposes the
> > > > > > threshold value configuration via the "preset" component, but perhaps we
> > > > > > should introduce a proper "threshold" component instead so counter
> > > > > > drivers have a standard way to expose this functionality. What do you
> > > > > > think?
> > > > >
> > > > > Possibly. What's the semantics of the `preset` component BTW? If we can
> > > > > re-use that here as well, that could work too.
> > > >
> > > > You can find the semantics of each attribute under the sysfs ABI doc
> > > > file located at Documentation/ABI/testing/sysfs-bus-counter. For the
> > > > `preset` component, its essential purpose is to configure a value to
> > > > preset register to reload the Count when some condition is met (e.g.
> > > > when an external INDEX/SYNC trigger line goes high).
> > >
> > > Hmm, that doesn't really match this use case. All right, then, for now, I'll
> > > skip the RC part, and then we can add it in a later patch when the
> > > "threshold" component is in place and used by the 104-quad-8 module.
> >
> > Understood, I'll work on a separate patchset introducing a "threshold"
> > component (perhaps "compare" is a better name) to the 104-quad-8 and
> > once that is complete we can add it to the microchip-tcb-capture as its
> > own patch to support the RC register functionality.
> >
> > > > In the same vein, move the uapi header introduction to its own patch.
> > > > That will separate the userspace-exposed changes and make things easier
> > > > for future users when bisecting the linux kernel history when tracking
> > > > down possible bugs.
> > >
> > > Isn't it better to keep API header changes in the same commit as the
> > > implementation using them? That way if someone bisects/blames the API
> > > header, they get the respective implementation as well.
> >
> > Fair enough, we'll keep the header together with the implementation.
> >
> > > > and it looks like this chip has
> > > > three timer counter channels described in section 54. Currently, the
> > > > microchip-tcb-capture module is exposing only one timer counter channel
> > > > (as Count0), correct? Should this driver expose all three channels (as
> > > > Count0, Count1, and Count2)?
> > >
> > > No, as this device is actually instantiated per-channel, i.e. in the DT,
> > > there are two TCB nodes (as the SoC has two peripherals, each with 3
> > > channels), and then the counter is a sub-node with `reg = <0/1/2>`,
> > > specifying which timer channel to use. Or, in quadrature decode mode, you'd
> > > have two elements in `reg`, i.e. `reg = <0>, <1>`.
> >
> > So right now each timer counter channel is exposed as an independent
> > Counter device? That means we're exposing the timer counter blocks
> > incorrectly.
> >
> > You're not at fault Bence, so you don't need to address this problem
> > with your current patchset, but I do want to discuss it briefly here so
> > we can come up with a plan for how to resolve it for the future. The
> > Generic Counter Interface was nascent at the time, so we likely
> > overlooked this problem at the time. I'm CCing some of those present
> > during the original introduction of the microchip-tcb-capture driver so
> > they are aware of this discussion.
> >
> > Let me make sure I understand the situation correctly. This SoC has two
> > Timer Counter Blocks (TCB) and each TCB has three Timer Counter Channels
> > (TCC); each TCC has a Counter Value (CV) and three general registers
> > (RA, RB, RC); RA and RB can store Captures, and RC can be used for
> > Compare operations.
> >
> > If that is true, then the correct way for this hardware to be exposed is
> > to have each TCB be a Counter device where each TCC is exposed as a
> > Count. So for this SoC: two Counter devices as counter0 and counter1;
> > count0, count1, and count2 as the three TCC; i.e. counter0/count{0,1,2}
> > and counter1/count{0,1,2}.
> >
> > With that setup, configurations that affect the entire TCB (e.g. Block
> > Mode Register) can be exposed as Counter device components. Furthermore,
> > this would allow users to set Counter watches to collect component
> > values for the other two Counts while triggering off of the events of
> > any particular one, which wouldn't be possible if each TCC is isolated
> > to its own Counter device as is the case right now.
> >
> > Regardless, the three TCC of each TCB should be grouped together
> > logically as they can represent related values. For example,  when using
> > the quadrature decoder TTC0 CV can represent Speed/Position while TTC1
> > CV represents rotation, thus giving a high level of precision on motion
> > system position as the datasheet points out.
> >
> > Kamel, what would it take for us to rectify this situation so that the
> > TCC are organized together by TCB under the same Counter devices?
>
> Hello,
>
> Indeed, each TCC operates independently except when quadrature mode is
> enabled. I assume this approach was taken to provide more flexibility by
> exposing them separately.
>
> Currently only one channel is configured this would need to rework the
> driver to make the 3 TCCs exposed.
>

One important point to consider is that each TCC can be configured
in Capture/QDEC, PWM or clocksource mode. We have written a blog post
that describes each modes in detail [1], which can help clarify how the
TCC works on Microchip devices.

> Greetings,
> Kamel
>
> >
> > > > > The `mchp_tc_count_function_write()` function already disables PWM mode by
> > > > > clearing the `ATMEL_TC_WAVE` bit from the Channel Mode Register (CMR).
> > > >
> > > > So capture mode is unconditionally set by mchp_tc_count_function_write()
> > > > which means the first time the user sets the Count function then PWM
> > > > mode will be disabled. However, what happens if the user does not set
> > > > the Count function? Should PWM mode be disabled by default in
> > > > mchp_tc_probe(), or does that already happen?
> > >
> > > You're right, and it is a problem I encounter regularly: almost all HW
> > > initialization happens in `mchp_tc_count_function_write()`, the probe()
> > > function mostly just allocates stuff. Meaning, if you want to do anything
> > > with the counter, you have to set the "increase" function first (even
> > > though, if you `cat function`, it will seem like it's already in "increase"
> > > mode). I don't know if it was deliberate, or what, but again, that would be
> > > a separate bugfix patch.
> >
> > That does seem like an oversight that goes back to the original commit
> > 106b104137fd ("counter: Add microchip TCB capture counter"). I'll submit
> > a bug fix patch later separately to address this and we can continue
> > discussions about the issue there.
> >
> > William Breathitt Gray
>
>
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

[1]: https://bootlin.com/blog/timer-counters-linux-microchip/

