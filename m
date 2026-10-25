Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7529606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iL/DezyF;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CfMak6rv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y1K0RTnG4l4ygM2F8GtIx4eTiSY/f4ozYtbSxngz744=; b=iL/DezyFTWhK37LvRtNQMN8TMk
	pFvlXt6uwN9v9uGk+ZLAhvEJVJ2Mcd+spJR8MWQ4kt6UNEE7CPrx45ZNNMo964aKPzoX95rU8aDeX
	PJal9DDX7yov0aIpmQUXzADXpcrIpyQMp7fYnBzT+264tAr4+f6YByw8F7EGy1WC6SyxUowiGv9tx
	xmHvhPmILrID2ZFLBuFGj5V/QnNlZDMooEzOYjUhnmt7sUoUotSI2kKkYaReJEhOJMjsfH5ky4VtQ
	yCa0iUmQ0kKGmsTDr1f/8wNZ4uCSid7Kic9ZrgAgwEHWqaPo6DGl7r7xtyf2RxD0kjYC6vKfJIAkc
	PJcAKu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL554-00000001R1B-1oyn;
	Sun, 25 Oct 2026 20:44:38 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL550-00000001R0p-3HnK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792961075; x=1824497075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eXznDtSLHr+NGm3eF9RB5EGJ3G5yfhG0QIJwsysSxZw=;
  b=CfMak6rvrJv22LtBpib1ZQADucCHdlW3VsgbrHfSZRRvVYk+XHH9yyu2
   wni17aZ+c5hM3Mx44Sh57xTDl8ugkZdYr12miHVNHXxiJ6OsLKHxhKAbS
   LzbUoWbrfUzy3y4cnM2YO1UhBIm5KkYPwQbQWYBAzbiwwpbQlzWwEX4Mz
   buV48O/SO7OR+rnijkybFMU8bGNcDmS9XVBInxr5D58p2RP3+3j5sszUk
   zV6eEcywWp9peVXqnuuzFnh+pBVW/Kx+KZj7rJ5rabd+wMzln3+xV78ME
   ZfUnobhGTM65Cslyhovbu3gypLs1jH34yggsyI1QbGeNivf1yYG5WJ9su
   Q==;
X-CSE-ConnectionGUID: /AvyNzIYROaYFYp8prc+iA==
X-CSE-MsgGUID: GIY6k93wRFm0JKKeIZgfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1527864"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1527864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:44:33 -0700
X-CSE-ConnectionGUID: EMIh884NTLyiP+HifSGEoA==
X-CSE-MsgGUID: K9IknHoWQhyv10Qz/UdTGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4080612"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:44:27 -0700
Date: Sun, 25 Oct 2026 22:44:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <at5qKehogAjTa-fA@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
 <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_134434_837150_72667A36 
X-CRM114-Status: GOOD (  32.92  )
X-Spam-Score: -4.5 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
> On Sun, Oct 25, 2026 at 9:10 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > > On Sat, 24 Oct 2026, James Hilliard wrote:
> > >
> > > > uart_write_wakeup() expects the UART port lock to be held. Several worker,
> > > > DMA completion and interrupt paths call it without that lock, including
> > > > indirect calls from uart_handle_cts_change() and the transmit helpers.
> > >
> > >  Fair enough, and thank you for the cleanup and spotting the issue in the
> > > first place, however...
> >
> > He already issues a v6. I think the tactics against AI contributions should be
> > to not answer for a week or so until there will be a quiescent week.
> 
> At least with the workflow I've been using, a good signal for quiescence is
> simply whether or not the Sashiko reviewer found issues.
> 
> I am feeding the Sashiko prompts into my local agent but it seems to
> sometimes miss issues that get flagged by the public Sashiko reviewer
> still.
> 
> I've been attempting to peel off independently reviewable fixes where
> feasible as well to minimize the amount of patches/code during respins
> as well.
> 
> > At least that's what I learn from this patch storm.
> 
> Whenever my local branch accumulates significant refactoring/changes
> due to Sashiko or manual reviews I generally try and send out the new
> revision fairly quickly in an attempt to avoid reviewers wasting time
> reviewing code that is obsoleted by the new fixes/changes in my local
> branch.
> 
> Locally I actually have far more UART related patches in an integration
> tree that I've held off on sending for now since they are dependent upon
> the prerequisite fixes I have already sent. My unposted patches actually
> have an even larger amount of code changes than all the UART related
> patches that I've posted so far, at least when measured in terms of total
> lines of code changed.
> 
> The large amount of patches I ended up with seems to have mostly come
> about due to the AI agent identifying most of these bugs while iterating on
> and debugging new features(most of which are still largely unsent so far).
> 
> The strategy I've been using is to send small isolated fixes separately and
> then reference them as needed in the larger series that depend on them.
> I figure this should make the changes easier to review than having them
> all in a larger series. I contributed the changes[0] to make this compatible
> with the Sashiko reviewer actually.
> 
> I also use a custom AI agent controlled hardware in the loop test harness
> which makes iterating/testing changes much faster since the AI agent can
> autonomously test and iterate on changes far faster than is possible to do
> manually. This test setup also allows much more thorough testing as a lot
> of error handling or uncommonly hit code paths can then be tested using
> AI generated fault injection tests on real hardware tailored to the specific
> fix being validated. I manually review the final changes before sending as
> well of course.
> 
> I'm constantly refining these patch development/review workflows as well
> so feel free to give me any suggestions for anything I should change to
> make review easier.

I already gave one: slow down. Better think than loop through AI and keep
Sashiko busy. Your patches are valuable, no questions, but they are way
too complicated to catch on withing an hours or a couple of days time frame.

Some people might want to test the stuff. And sending too often you actually
will get the opposite results, people will be tired to even start reviewing
and/or testing your code as it's changed way too quickly. Settle down first
with something, put on the cover letter the answer why not all Sashiko's
comments are being addressed (for example, due to amount of patches or the
series being focused on a certain issue).

> [0] https://github.com/sashiko-dev/sashiko/pull/389

-- 
With Best Regards,
Andy Shevchenko



