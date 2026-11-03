Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AD606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=azOaCtb/;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NcvufMpD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jIOfDT3IwsQpj8TnqlAW1aIsfN94rzEJ/Etbch7OzL0=; b=azOaCtb/z26b9Xl7mEA39qKm/s
	Hq/UmI34yG8CRpzO/h4LEhVk/rct0+APlElq959qC/kRYhAg/4dWLh+7nDn/+LFsLHmn8EFc5XZU+
	o3M5BePg7blB9KmeZ03FjSgI45PGj5Lu2nGGEyWMn2MkAEaBn2tQhtft9vQ2/TNAH/NhYjtGGXCQW
	g0W+mlnA8U5llZm9VTXihQIn3OJsjPrsYPKVbS4itDf1GNzAxdE4EoLvYhYbBm2bbBnhE4xw4xQPy
	RHlPraRbj0vi/e4DU3Svcx8LMwr3dvuA8As84Buzp0MTjx5fa4J1VjYJs21VGaD0Mz3EGjfxYUdj6
	WrpacMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLbh-00000003egg-1zqO;
	Tue, 03 Nov 2026 20:59:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLbe-00000003eg7-3UbH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793739587; x=1825275587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Is+02CMo7tmYzfkUqq4Kp6Vj8IvFPcMBCUl7ofrrCyo=;
  b=NcvufMpDikqG4vu6XUjJSnMawKoID6fkqe51fzAiZnmapIfNvQGtD7U8
   tqQTmwQhVg71Jz+XKJVf2K0eiINGi+nQaSldNqO8ozVil/DrO9OXr3Vfq
   DvlGlDyX5L/PY3yWKgMinrfxUTSzuK75H7nq77NYEm7JjJ/W7mqmQnrOg
   VfFPapRKxBXNNiFIbrIleWYi3qcdKfWH9MNFlPL3VGIt+qtOvn6YmiY72
   xGwDwHPTVE8bLRUj65JCJOhfwWA6QwXas1ZGsF3//sQE9N/Xe1HeIme7v
   ZH8zKrO0f6Q5CWMNPaL5w5O8BCjixy/1AR7DG9kUOcxtYnSqiiyT9m40O
   Q==;
X-CSE-ConnectionGUID: O3DLMFJRQoGSkrfad1lgow==
X-CSE-MsgGUID: RR69KjS2SJ+cxMAxtRxyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2381053"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2381053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:59:46 -0800
X-CSE-ConnectionGUID: KwHr3Wc1TcOeCFSLBDwGGg==
X-CSE-MsgGUID: +8NIkjyITqyhuWdXdCEudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6902774"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:59:39 -0800
Date: Tue, 3 Nov 2026 22:59:37 +0200
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
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
Message-ID: <aupLOfg4CGMoaW0c@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
 <auoa8OWBxqaQuKRq@ashevche-desk.local>
 <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
 <auoit0AkmVeCvXqk@ashevche-desk.local>
 <CADvTj4rwm5BH8veX9i5_4trvzQFRPbDrAby7sXuEth6H6zJH2A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4rwm5BH8veX9i5_4trvzQFRPbDrAby7sXuEth6H6zJH2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_125946_930804_0A82014E 
X-CRM114-Status: GOOD (  31.03  )
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

On Tue, Nov 03, 2026 at 11:16:46AM -0700, James Hilliard wrote:
> On Tue, Nov 3, 2026 at 11:06 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Nov 03, 2026 at 10:54:38AM -0700, James Hilliard wrote:
> > > On Tue, Nov 3, 2026 at 10:34 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:

...

> > > > > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > > > > +{
> > > > > +     struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, rx_flush_work);
> > > > > +     struct uart_8250_port *p = dma->port;
> > > > > +     unsigned int delay_us = USEC_PER_MSEC;
> > > > > +     ktime_t start = ktime_get();
> > > > > +     bool recover, retry, restore_rx;
> > > > > +     bool warned = false;
> > > > > +     int ret;
> > > > > +
> > > > > +     guard(serial8250_rpm)(p);
> > > > > +
> > > > > +     for (;;) {
> > > > > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > > +                     /* Shutdown cancels this work and drains both DMA channels. */
> > > > > +                     if (dma->shutting_down)
> > > > > +                             return;
> > > > > +                     /* Serialize reset with completion and shutdown notifications. */
> > > > > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > > > > +                     retry = dma->rx_pause_pending && !dma->rx_terminating;
> > > > > +                     if (retry) {
> > > > > +                             ret = serial8250_rx_dma_try_flush(p);
> > > > > +                             retry = dma->rx_pause_pending && !dma->rx_terminating;
> > > > > +                     }
> > > > > +                     recover = dma->rx_err;
> > > > > +             }
> > > > > +             if (!retry)
> > > > > +                     break;
> > > > > +             if (!warned && ktime_ms_delta(ktime_get(), start) >= MSEC_PER_SEC) {
> > > > > +                     dev_warn_ratelimited(p->port.dev,
> > > > > +                                          "RX DMA pause stalled: %d; retaining transfer and retrying\n",
> > > > > +                                          ret);
> > > >
> > > > _ratelimited() is a slop of AI without understanding the code. It makes nonsense
> > > > in combination with warned.
> > >
> > > The two controls have different scopes. warned is local to one invocation
> > > of the flush worker and prevents repeated warning attempts while that
> > > flush remains stalled. A later flush starts with warned cleared again.
> > >
> > > The rate limit applies across worker invocations and UART ports. It limits
> > > messages from separate stalls, rather than repeated retries of the same
> > > stall.
> >
> > How? The whole _ratelimited() is nonsense here.
> 
> dev_warn_ratelimited() uses a static ratelimit_state at the call site,
> shared by all ports. The intent was to limit warning bursts across ports
> and separate flushes, while warned only covers one flush.

Right and imagine if the two or more devices are trying to printing the same
message in parallel. What will this give to the user? Something like

	$DEVICE: ...error message...
	$FUNC: N callbacks suppressed

And one may not know how many devices are affected by this N callbacks that
suppressed.

> > > > > +                     warned = true;
> > > >
> > > > Altogether NIH _once().
> > >
> > > dev_warn_once() uses a static flag at the call site, shared by all ports.
> > > After the first warning, subsequent stalls would remain silent even after
> > > recovery or reopening the port, including stalls on another UART.
> > >
> > > The intended behavior here is at most one warning attempt per prolonged
> > > stall, while keeping later incidents diagnosable and limiting their
> > > aggregate logging rate.
> >
> > Yes, so what the point to use _ratelimited()?
> 
> It was intended to limit warning bursts across multiple ports and
> separate stalls, while warned prevented repeated messages for one
> stalled flush.
> 
> I'll use dev_warn() with the per-flush warned flag and one-second
> threshold instead. That keeps one warning per prolonged stall and lets
> each port report its own failure independently.

This sounds better.

> > > > > +             }
> > > > > +             /* Notifications also cover completion or shutdown before sleeping. */
> > > > > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->rx_pause_wakeup),
> > > > > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC));
> > > > > +             delay_us = min(delay_us * 2, USEC_PER_SEC);
> > > > > +     }
> > > > > +
> > > > > +     if (recover) {
> > > > > +             ret = dmaengine_terminate_sync(dma->rxchan);
> > > > > +             if (ret) {
> > > > > +                     /* Retain ownership and keep RX masked if DMA cannot be stopped. */
> > > > > +                     dev_err(p->port.dev, "failed to stop RX DMA: %d\n", ret);
> > > > > +                     return;
> > > > > +             }
> > > > > +     } else {
> > > > > +             dmaengine_synchronize(dma->rxchan);
> > > > > +     }
> > > > > +
> > > > > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > > +             restore_rx = recover || dma->rx_pause_pending;
> > > > > +             dma->rx_pause_pending = false;
> > > > > +             dma->rx_terminating = false;
> > > > > +             dma->rx_running = 0;
> > > > > +             if (dma->shutting_down)
> > > > > +                     return;
> > > > > +
> > > > > +             if (!restore_rx)
> > > > > +                     return;
> > > > > +
> > > > > +             /* Apply the current enables, including any intervening stop_rx(). */
> > > > > +             serial8250_out_IER(p, p->ier);
> > > > > +     }
> > > > > +     if (recover)
> > > > > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> > > > >  }

-- 
With Best Regards,
Andy Shevchenko



