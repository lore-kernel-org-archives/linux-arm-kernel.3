Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F045B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nZO1gmAL;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=inacc3mx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i+NDmw4lwf3hRzODAHlKBNdsDK4Mb0dC93HrLNynbZA=; b=nZO1gmALjpdQcNhNfyYWuaVOZH
	aBUTatINc3mKay+ayqGIyjCJ6uhvYplP7iKkKyTWoDKGo2R8bR7prgK2VsLg+GU+PFw2qr9MKapvX
	V9dUIL9GJ1CeGahk3gjc4TqWZY5vVVwBx74waoAsdup2zOK+zJDDBVvC5qnQpOZDroD5AZcPMzjeZ
	ungwCT5lZEZ1pUg70MJdv87ZzEOuGr9rtomxlGFhZCH6rJo2ULg4aeDZeiponDNa8vicZw7FdUoNa
	A6Dv6w+8fTIUeCXQfqY84Fbr4IVFHDgHEftStpKV3dch80CUeGMrdB+mIOdlwoLqOrDP0cooU10TQ
	LkFpNRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQle-00000003BhA-1CLi;
	Mon, 26 Oct 2026 19:54:02 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQlb-00000003Bgb-1FaI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793044439; x=1824580439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FV51n/PiZWx6bvBfOkBqCKkoCYD8qfwCN0puYCkV0os=;
  b=inacc3mxljgzdu/8y/6ILQZ5z2RLj/FqOFgudczFwtvteEOxyhoYuS6t
   rX19BlbEQsIPC3uvQl1fYD4B5AX6rkQm5cjGvxkxg+18qxGQyU/+nX3l+
   TEcTvOZRNyZjIgXvZYgo2r1X2DSdLwT+KMxFYF0neNJRz2/z0Wxvm7+VX
   KFQCsffSW1pGSsl4k+67bj3bjPLc5PwSqv94xEQeE8/5GpvA2yR3w7SqI
   nQHnfdM9qDiDJ3eglygqgU0X3HBxKQ+fR0SxmrL+DaG5PgGPs3CzT7yCq
   9HhBmOsw3dpapCH8ueW6uvRueJt5bKH97M1K0KwGGGoBvwHbNL9aVa9Rd
   Q==;
X-CSE-ConnectionGUID: IXzUa3WOQbifiilGJgWW8A==
X-CSE-MsgGUID: UgB6tCztSQ+CqB6YAQjVvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1615450"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1615450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 12:53:55 -0700
X-CSE-ConnectionGUID: Dj09to7/Sbe2r8g4P5Lwuw==
X-CSE-MsgGUID: qCd0O6T5QDOWwhS++gg2Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4710651"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 12:53:48 -0700
Date: Mon, 26 Oct 2026 21:53:45 +0200
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
Message-ID: <at-vyZ1sDhYPu0W5@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
 <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local>
 <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
 <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_125359_376622_6B9750A6 
X-CRM114-Status: GOOD (  40.02  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> On Mon, Oct 26, 2026 at 3:33 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > On Sun, Oct 25, 2026 at 2:44 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:

...

> > > > Some people might want to test the stuff. And sending too often you actually
> > > > will get the opposite results, people will be tired to even start reviewing
> > > > and/or testing your code as it's changed way too quickly.
> > >
> > > My thought process was that people wouldn't want to be testing code that
> > > had known bugs flagged in Sashiko reviews.
> >
> > Sashiko reviews are not visible in my or any other mailbox. To see them I have
> > to go to some URL and so on, meaning to waste time to see why on the earth the
> > new version has been sent.
> 
> Maybe the Sashiko reviews are getting caught in spam filtering or something?
> They are showing up for me and on the mailing list[0] so I'm a bit confused why
> you aren't seeing them. You shouldn't have to go to the web interface[1] to look
> up the reviews.
> 
> [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> 
> [1] https://sashiko.dev/
> 
> > It's better before addressing Sashiko comments,
> > reply to all people involved and to Sashiko's original email, so it will be
> > visible in the previous version why you issued (actually about to issue) the
> > next version.
> 
> Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?

It's up to the list owners / subsystem maintainers.

> [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mailing_lists.toml#L290
> 
> > And before even issuing it, wait for a while, people might
> > disagree with Sashiko judgement or your replies on how to address that.
> 
> I was assuming everyone was seeing the Sashiko reviews getting posted to
> the mailing list already. The are ending up in lore so unless someone isn't
> subscribed to the list I'm not sure why they wouldn't be seeing those reviews
> already.

I assume you already answered your Q. mailing list in this sense doesn't mean
recipients. I think it simply goes to the mailing list without forwarding.

You can ask at helpdesk@ how this is configured on the kernel.org side.

> > TL;DR: this mailing list is *not* a playground with you and Sashiko, the whole
> > community is behind it.

> > > > Settle down first
> > > > with something, put on the cover letter the answer why not all Sashiko's
> > > > comments are being addressed (for example, due to amount of patches or the
> > > > series being focused on a certain issue).
> > >
> > > So, in general I've been always attempting to resolve known Sashiko issues
> > > in every subsequent re-spin, so that would be a bit tricky since I wouldn't be
> > > aware of the Sashiko issues until after the series has already been sent.
> > >
> > > Usually the subsequent issues that get flagged are new issues only discovered
> > > after each new re-spin.
> > >
> > > I do have a bunch of UART/DMA related patches that don't have flagged Sashiko
> > > issues so it probably makes sense to try and review those first while the larger
> > > series that have Sashiko flagged issues are still stabilizing.
> >
> > Yes.
> >
> > > > > [0] https://github.com/sashiko-dev/sashiko/pull/389

-- 
With Best Regards,
Andy Shevchenko



