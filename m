Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD55606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ong9YYnI;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJNJZifK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W7C9cpmzdFca870tYxpXsF2MjrgsKkdtNJLk6fjsOEI=; b=Ong9YYnIorRGJmaUI1NlGRuJtA
	R7GrH949DmU/wh8AziSBjXAfJjG+gHeXXYQH+lXLlaZnkxhijOjbZRLkWjperzLdFmrwOLVy9vPJu
	+OmVQ73bhanKxx//3hj8/EIKivA/Uj0KrCU183cfg/3xFhIeJYMdHpbf4yLYe5LCoGY+a++QokCJh
	IFms3SKzRvaOgJ9yTuUTSrDnTEpl+P+7ndsAoovw79lFP+g2KOPEeM7r7wJ+13kV4gJGzaxrZrVCX
	oj3DY0Y1Hvs2gS67YeCVNhbtqE9N4p8eFxstjevgscJanyHpa76xs32f5QXjpoCy5g9GpZxscIFk9
	V7y4Ewvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4h9-0000000D5Kj-2dwP;
	Sat, 31 Oct 2026 08:44:11 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4h7-0000000D5KJ-1oTo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793436249; x=1824972249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wn8SFowoel5epk8m5Si6mxTN8wfKc2MuePpSe+sjbLY=;
  b=MJNJZifKks8msiDDTcsubAz8Flw64AfLcsvFH3BruUk9obfl7QY2NXb3
   NpRsus+d2uLYRFgYZGOHVvhordHKa+0vmTubjylePTHxleVy03LDmFoe0
   EluMIMucdmTBJmInPRzTb69QuqzCUrOI0zKgCHGOabJLH7SwuOF2oMxxn
   4rct3ChXXshKoAH2i9KwXky8H4CeycU33xHzkXkSwoyd3dvqNsZ+Hpigj
   xojbqz76MwGxVzgwQzcnfXtIFY5cbZNbUqyltTmP9AFllcS3+jvzsyFzR
   XcjQkzmZlJbItfNVAxB8d3PKu6wCH2ZVjD1ittFhY/MVMxS4Mt7cQH8+m
   Q==;
X-CSE-ConnectionGUID: A7SzToZWQbyuQL2Cu3lvdg==
X-CSE-MsgGUID: 4AcXsUUbQGG1ObXs8yzQEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2185100"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2185100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:44:08 -0700
X-CSE-ConnectionGUID: kFJld0R6TF22hO1251niqA==
X-CSE-MsgGUID: vR+J2NnMRyGUqn4j6kuC/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6184723"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:44:03 -0700
Date: Sat, 31 Oct 2026 10:44:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
Message-ID: <auWqUIBUs0_7bnGU@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
 <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local>
 <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
 <auTZtteCFnuoMD3p@ashevche-desk.local>
 <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_014409_535187_8F0F5C4B 
X-CRM114-Status: GOOD (  34.37  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 12:08:52PM -0600, James Hilliard wrote:
> On Fri, Oct 30, 2026 at 11:54 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > > On Fri, Oct 30, 2026 at 3:40 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > > On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:

...

> > > > > > > +     while (rx_ret || tx_ret) {
> > > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > > +                                 "DMA termination failed: RX %d, TX %d; retrying\n",
> > > > > > > +                                 rx_ret, tx_ret);
> > > > > >
> > > > > > > +             msleep(100);
> > > > > >
> > > > > > Huh?!
> > > > > >
> > > > > > > +             if (rx_ret)
> > > > > > > +                     rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > > > > > +             if (tx_ret)
> > > > > > > +                     tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > > > > > +     }
> > > > > >
> > > > > > This is unacceptable. Sleeping is okay, but value should really match the
> > > > > > baudspeed and other parameters of the transfer.
> > > > >
> > > > > This sleep is backoff after dmaengine_terminate_sync() has returned
> > > > > an error, rather than an estimate of UART transmission time. Each
> > > > > retry asks the provider to stop the channel again; elapsed time is
> > > > > never treated as evidence that the resources are safe to free.
> > > > >
> > > > > The particular 100 ms interval has no hardware-derived justification.
> > > > > However, I don't yet see a sound way to derive the retry cadence from
> > > > > baud rate either. RX can be waiting for input, TX can be held by flow
> > > > > control, and callback retirement is a separate requirement from
> > > > > moving bytes through the UART.
> > > > >
> > > > > Do you have a particular provider failure mode in mind where retrying
> > > > > termination should follow the serial transfer timing? I'd like to
> > > > > base the interval on the condition that can make termination succeed,
> > > > > rather than substitute a wire-time estimate for an arbitrary delay.
> > > >
> > > > Termination of DMA sometimes require to clean up internal FIFOs and other state
> > > > machines. That's what happens on HW side. In the software waiting for too much
> > > > may lead to the very big undesired latencies. The value of 100ms sounds insane
> > > > to me for the HSUART cases (megabaud range of speed). Also note, not every PCB
> > > > design uses HW flow control, so this may be even worse for them.
> > >
> > > The 100 ms interval can add unnecessary teardown latency if a failed
> > > termination becomes retryable much sooner. There is no hardware-derived
> > > justification for that particular value.
> > >
> > > The FIFO/state-machine draining is part of the provider's stop sequence.
> > > For example, DW performs its FIFO-empty polling inside
> > > dwc_terminate_all(). If termination succeeds, this patch proceeds without
> > > the retry sleep, regardless of baud rate. The sleep is only reached
> > > after an error during DMA release, not during normal RX delivery.
> > >
> > > Baud rate can influence how quickly a transmit FIFO drains, even without
> > > flow control. However, the termination error does not tell 8250 whether
> > > that drain is still progressing, how much remains, or whether the
> > > controller needs a different recovery operation. That distinction matters
> > > when choosing a retry interval: a shorter interval reduces the added
> > > latency, but does not establish that retrying can recover the channel.
> > >
> > > There is also a specific API detail here: dmaengine_terminate_sync()
> > > returns immediately if device_terminate_all() fails, without reaching
> > > dmaengine_synchronize(). Consequently, an error leaves callback draining
> > > unconfirmed as well. The retry cadence can change, but resource release
> > > still requires successful termination and synchronization.
> >
> > Most likely this is AI slop. I can't see the justification for 100ms.
> > Can you explain that?
> 
> 100 ms was an arbitrary backoff to avoid a tight retry loop if
> termination keeps failing. It was not derived from the baud rate,
> FIFO depth, or a DMA provider's recovery timing.
> 
> That motivation explains sleeping between retries, but not choosing
> 100 ms. I don't have evidence supporting that particular interval.

Yep. And that's what my point is about. Any big sleeps has to be explained
and justified.

> > > > > Regardless of the retry interval, shutdown cannot release the buffers
> > > > > until the provider establishes that DMA and its callbacks have stopped.

-- 
With Best Regards,
Andy Shevchenko



