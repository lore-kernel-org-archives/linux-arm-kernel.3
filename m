Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDDC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UnfqsWh1;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MUhmvyyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OGxTx5VTRibU/s9XnjHXs/1x5TiFEbymfoF86VCpiMU=; b=UnfqsWh1A8iBb2myMm/SMwai2I
	80D7tTXah4t5oBnkbSepaKVhngdHLPZ+/CDNizJ7BqWnqVU1kiENRUIhtFO4vSodvqDSABOLH3kdS
	tgqQ7oBU7ey/i3kPdWlTTz+kTeL0yEGgQ54++ZWeNuvE+q1iLpOkya/7qtmV1LisN+vlyXcx7fnyC
	rrjN+cTg2rT00yvurqCsh7fP8upR3u2i2OqrPNW1grCnuaZ0+uwD6SsgpqlZM+vjV5xNR9n3vsE+w
	lbIgNWzUYTyGgxmNFZK7lZQLNFbpT4ktJT2RFzuKiyz+jN4k/VTanVA9Wme0XStL2Z0dl3nEs/ZzA
	Sor/Yg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj5w-0000000BG1N-0xC3;
	Fri, 30 Oct 2026 09:40:20 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj5t-0000000BG0D-0AZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793353217; x=1824889217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oih7GtI7xMzGahP76vQil5qWDbgK0U9SZz4iJvlgoJY=;
  b=MUhmvyyNbsVN4Jj3dk12OSOjdSmQyC8Ro2WHdrb8M1ya7PbD5Uur79+6
   4YN2tY37yggpccsq+t9KiANiGAjrsZTtcrhL4iEnMeTsy33vkBBquvI5J
   SavhzHl2jV9LpNaET+Gmjn/uL4FfBEmoTfHypR+YR4afmgx5pQqaWJS1W
   sYpekYBkQSjQ8oBTSWlRelj8Dhq4ZKhiKiKeOH3Jzb9NldnW6ZJ566yPX
   fp+Rla8XZwWse3ftw6xW6AILHJjzs1N74+VAg8zN3CK6FR2L6APul8w1W
   aLQcN/gZHi6pI1MAdHLvU0IREHGpuOaBGC5oACjC4XhkbstuL9g5m4p+u
   g==;
X-CSE-ConnectionGUID: mD4CU3C/RhirWSMFcWuQ4A==
X-CSE-MsgGUID: P2gVgLjOQBqMzIplsRX2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2128793"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2128793"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:40:15 -0700
X-CSE-ConnectionGUID: 4kQkNl98Qy6vjhZtyQi8Sw==
X-CSE-MsgGUID: dJ/QkbhGQBS9LRHlVFiP0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7184902"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:40:10 -0700
Date: Fri, 30 Oct 2026 11:40:07 +0200
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
Message-ID: <auRl9ztbav4nHi7U@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
 <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024017_169069_617BABD4 
X-CRM114-Status: GOOD (  18.44  )
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

On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:

...

> > > +     while (rx_ret || tx_ret) {
> > > +             dev_err_ratelimited(p->port.dev,
> > > +                                 "DMA termination failed: RX %d, TX %d; retrying\n",
> > > +                                 rx_ret, tx_ret);
> >
> > > +             msleep(100);
> >
> > Huh?!
> >
> > > +             if (rx_ret)
> > > +                     rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > +             if (tx_ret)
> > > +                     tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > +     }
> >
> > This is unacceptable. Sleeping is okay, but value should really match the
> > baudspeed and other parameters of the transfer.
> 
> This sleep is backoff after dmaengine_terminate_sync() has returned
> an error, rather than an estimate of UART transmission time. Each
> retry asks the provider to stop the channel again; elapsed time is
> never treated as evidence that the resources are safe to free.
> 
> The particular 100 ms interval has no hardware-derived justification.
> However, I don't yet see a sound way to derive the retry cadence from
> baud rate either. RX can be waiting for input, TX can be held by flow
> control, and callback retirement is a separate requirement from
> moving bytes through the UART.
> 
> Do you have a particular provider failure mode in mind where retrying
> termination should follow the serial transfer timing? I'd like to
> base the interval on the condition that can make termination succeed,
> rather than substitute a wire-time estimate for an arbitrary delay.

Termination of DMA sometimes require to clean up internal FIFOs and other state
machines. That's what happens on HW side. In the software waiting for too much
may lead to the very big undesired latencies. The value of 100ms sounds insane
to me for the HSUART cases (megabaud range of speed). Also note, not every PCB
design uses HW flow control, so this may be even worse for them.

> Regardless of the retry interval, shutdown cannot release the buffers
> until the provider establishes that DMA and its callbacks have stopped.

-- 
With Best Regards,
Andy Shevchenko



