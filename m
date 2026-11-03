Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D555C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5IHMNcY;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZ64qWHN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w5lVWBJjRjA2krxM/KTY4SL80JsSZ9imdxqcG/GS5Zk=; b=F5IHMNcYKDFB/TaP5FIzAqRr6/
	wyz2W2xIKrfJIoR+xRXfCC+7tuZ66u0rbmYub6CjovKNyQr5eNk/F+tVsyNmdX22CuxMrVKVisY0p
	lm4GWr1CqrHzhQSxJLR5C4jOqRDQVq4aAfgCHZjj80XCWvmqaxB4vCs7TxtvphQp6guoJqATt7R/w
	kUp4a/vQGh0XukF9/Gc25nD3NDIySW308l3FaVLI+Yed6fx/b02RaFiFTYJufx4wXjg1Xe7HFYRIe
	TL2I9Za0+prFEqhyc/C8HUEWy0DLDKBkwzFFmCalndxOYV27fBk1dGO83V2JjS668jhf5Ie7iB4Bx
	AJge5Jiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIuS-00000003MZw-3XvK;
	Tue, 03 Nov 2026 18:07:00 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIuP-00000003MYr-2CXS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793729218; x=1825265218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bfpjoi+2x7WliPDN0Q0PNRLL9EnvniyukWyol0qacZo=;
  b=dZ64qWHN8Fcv2v6a9i2Mou5Yq/74AtEfaFOSv9fZKlObUMNjk9/oDVO1
   z25/Z1PlnGjKNiUZtQGDCRCSyYED9l+1HeSOsTp/G0PxtfyNjrqbaBv3d
   BEM+RaJDXtQNEsXqZqgD58qpLS8FH4wyezGhw58E90QqMpl6fiRC2H5+k
   8zp045CIIETeUWG8XFXqHBFDYbmWPvDO1YQ6tv3IatJO2xtEZU2eKoKL1
   hr25kXLHzDA+fcn9pFf7MNU2ONpgCea2N2HCPbwkLrql5WYvblrllVBju
   H7/5dAJKoGgSBGGTKkuyK4rSTs6c1L3Gj+YgKhd3npw2Sq86uT1nJTDOh
   g==;
X-CSE-ConnectionGUID: e0yaTGVXSdOfRR8CeROO6Q==
X-CSE-MsgGUID: 66e7V26tQsS+4ID3Y98bUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2497321"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2497321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:06:57 -0800
X-CSE-ConnectionGUID: 0DUEqvTGSyWP84YdvsRCVw==
X-CSE-MsgGUID: pmuQBEc9QCOEV5T43CA1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6503533"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:06:50 -0800
Date: Tue, 3 Nov 2026 20:06:47 +0200
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
Message-ID: <auoit0AkmVeCvXqk@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
 <auoa8OWBxqaQuKRq@ashevche-desk.local>
 <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_100657_575473_A97BBAA1 
X-CRM114-Status: GOOD (  24.80  )
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

On Tue, Nov 03, 2026 at 10:54:38AM -0700, James Hilliard wrote:
> On Tue, Nov 3, 2026 at 10:34 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:

...

> > > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > > +{
> > > +     struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, rx_flush_work);
> > > +     struct uart_8250_port *p = dma->port;
> > > +     unsigned int delay_us = USEC_PER_MSEC;
> > > +     ktime_t start = ktime_get();
> > > +     bool recover, retry, restore_rx;
> > > +     bool warned = false;
> > > +     int ret;
> > > +
> > > +     guard(serial8250_rpm)(p);
> > > +
> > > +     for (;;) {
> > > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > +                     /* Shutdown cancels this work and drains both DMA channels. */
> > > +                     if (dma->shutting_down)
> > > +                             return;
> > > +                     /* Serialize reset with completion and shutdown notifications. */
> > > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > > +                     retry = dma->rx_pause_pending && !dma->rx_terminating;
> > > +                     if (retry) {
> > > +                             ret = serial8250_rx_dma_try_flush(p);
> > > +                             retry = dma->rx_pause_pending && !dma->rx_terminating;
> > > +                     }
> > > +                     recover = dma->rx_err;
> > > +             }
> > > +             if (!retry)
> > > +                     break;
> > > +             if (!warned && ktime_ms_delta(ktime_get(), start) >= MSEC_PER_SEC) {
> > > +                     dev_warn_ratelimited(p->port.dev,
> > > +                                          "RX DMA pause stalled: %d; retaining transfer and retrying\n",
> > > +                                          ret);
> >
> > _ratelimited() is a slop of AI without understanding the code. It makes nonsense
> > in combination with warned.
> 
> The two controls have different scopes. warned is local to one invocation
> of the flush worker and prevents repeated warning attempts while that
> flush remains stalled. A later flush starts with warned cleared again.
> 
> The rate limit applies across worker invocations and UART ports. It limits
> messages from separate stalls, rather than repeated retries of the same
> stall.

How? The whole _ratelimited() is nonsense here.

> > > +                     warned = true;
> >
> > Altogether NIH _once().
> 
> dev_warn_once() uses a static flag at the call site, shared by all ports.
> After the first warning, subsequent stalls would remain silent even after
> recovery or reopening the port, including stalls on another UART.
> 
> The intended behavior here is at most one warning attempt per prolonged
> stall, while keeping later incidents diagnosable and limiting their
> aggregate logging rate.

Yes, so what the point to use _ratelimited()?

> > > +             }
> > > +             /* Notifications also cover completion or shutdown before sleeping. */
> > > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->rx_pause_wakeup),
> > > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC));
> > > +             delay_us = min(delay_us * 2, USEC_PER_SEC);
> > > +     }
> > > +
> > > +     if (recover) {
> > > +             ret = dmaengine_terminate_sync(dma->rxchan);
> > > +             if (ret) {
> > > +                     /* Retain ownership and keep RX masked if DMA cannot be stopped. */
> > > +                     dev_err(p->port.dev, "failed to stop RX DMA: %d\n", ret);
> > > +                     return;
> > > +             }
> > > +     } else {
> > > +             dmaengine_synchronize(dma->rxchan);
> > > +     }
> > > +
> > > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > +             restore_rx = recover || dma->rx_pause_pending;
> > > +             dma->rx_pause_pending = false;
> > > +             dma->rx_terminating = false;
> > > +             dma->rx_running = 0;
> > > +             if (dma->shutting_down)
> > > +                     return;
> > > +
> > > +             if (!restore_rx)
> > > +                     return;
> > > +
> > > +             /* Apply the current enables, including any intervening stop_rx(). */
> > > +             serial8250_out_IER(p, p->ier);
> > > +     }
> > > +     if (recover)
> > > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> > >  }

-- 
With Best Regards,
Andy Shevchenko



