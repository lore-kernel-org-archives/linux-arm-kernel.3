Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YHVlibe1;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jwxyrNsV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vFtK92loJ0xr1IzJVV1xwMCKKp55jpNQBYy00GgLoCA=; b=YHVlibe1VpE7JDGWsZ6/KmO1XF
	IEqm+o7ax9zedt94HoImhamYiteRNF40uUQB/lf1S1N4dkKUdpKywd2L8Da8QT7al3y6CllFzgWCn
	JnovJk5y4VuCUEVVgodFJadVrle70oDMc9aC8y83Ax9P1O5N+74jf71jcELhod/sR620oNy1oxReZ
	mlVsqqH+hxYDBVcVC/nEQBU/U58t+w89N0meAHIeH1POgtCi0qSMzv37cEgbcnvXJlKRUWnW1pOd1
	B1V0EJPDXpidDnnSXmUnAgKk6LkGY5PKGkm6AZ5jGfJHhiCfiakJTMwH71Lr6e7UvUWNjK08J1k+n
	P5mduYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqnu-0000000CKBj-0tNr;
	Fri, 30 Oct 2026 17:54:14 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqnr-0000000CKAq-3Izn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793382852; x=1824918852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IzqHLossDmxKbFc+aGxUKjOQbcSxP3c6buURWcuw2Tc=;
  b=jwxyrNsVCRRHE5mQY9GhsfqnkBThSiBT//ZjKQKsy+4yT7W//DJdJXVd
   LjswIJlqBKtCb76dFNB0wgdqc1WxrArKqF7od6TTjxRf2khyWai1TtCOC
   qNISN5Zg7HddG66wYHZgUFTwwlr1wspsNdmcXUOAjCKMj/F0lDtixnEPr
   yjBCAAy3FWhFY/nPYQ8o9dics1B0qf11vhl3QTmyvPQ9eNuGYmLYserVn
   ZkH/FNSM2iB2DNO4atD2HzHdmdfpnb3MZgilaqm4wusZPIEqZK38asMNx
   1S8ZOSas74XJUOvXw9llfiSxF6w74KYc/LXYg6D4xv9c8eVivZIGXyQet
   A==;
X-CSE-ConnectionGUID: VBlZJOfyQa+3CNm+nNQq/g==
X-CSE-MsgGUID: HrpmTU2XQZO+pjofD2QTXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2170304"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2170304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 10:54:07 -0700
X-CSE-ConnectionGUID: 4l33Hy4iTb6mNx52iAPxHQ==
X-CSE-MsgGUID: aoBFLn+ZRDe7lWiftDeSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5516478"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 10:54:01 -0700
Date: Fri, 30 Oct 2026 19:53:58 +0200
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
Message-ID: <auTZtteCFnuoMD3p@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
 <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local>
 <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_105411_887208_B9F8ABD1 
X-CRM114-Status: GOOD (  30.99  )
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

On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> On Fri, Oct 30, 2026 at 3:40 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:

...

> > > > > +     while (rx_ret || tx_ret) {
> > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > +                                 "DMA termination failed: RX %d, TX %d; retrying\n",
> > > > > +                                 rx_ret, tx_ret);
> > > >
> > > > > +             msleep(100);
> > > >
> > > > Huh?!
> > > >
> > > > > +             if (rx_ret)
> > > > > +                     rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > > > +             if (tx_ret)
> > > > > +                     tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > > > +     }
> > > >
> > > > This is unacceptable. Sleeping is okay, but value should really match the
> > > > baudspeed and other parameters of the transfer.
> > >
> > > This sleep is backoff after dmaengine_terminate_sync() has returned
> > > an error, rather than an estimate of UART transmission time. Each
> > > retry asks the provider to stop the channel again; elapsed time is
> > > never treated as evidence that the resources are safe to free.
> > >
> > > The particular 100 ms interval has no hardware-derived justification.
> > > However, I don't yet see a sound way to derive the retry cadence from
> > > baud rate either. RX can be waiting for input, TX can be held by flow
> > > control, and callback retirement is a separate requirement from
> > > moving bytes through the UART.
> > >
> > > Do you have a particular provider failure mode in mind where retrying
> > > termination should follow the serial transfer timing? I'd like to
> > > base the interval on the condition that can make termination succeed,
> > > rather than substitute a wire-time estimate for an arbitrary delay.
> >
> > Termination of DMA sometimes require to clean up internal FIFOs and other state
> > machines. That's what happens on HW side. In the software waiting for too much
> > may lead to the very big undesired latencies. The value of 100ms sounds insane
> > to me for the HSUART cases (megabaud range of speed). Also note, not every PCB
> > design uses HW flow control, so this may be even worse for them.
> 
> The 100 ms interval can add unnecessary teardown latency if a failed
> termination becomes retryable much sooner. There is no hardware-derived
> justification for that particular value.
> 
> The FIFO/state-machine draining is part of the provider's stop sequence.
> For example, DW performs its FIFO-empty polling inside
> dwc_terminate_all(). If termination succeeds, this patch proceeds without
> the retry sleep, regardless of baud rate. The sleep is only reached
> after an error during DMA release, not during normal RX delivery.
> 
> Baud rate can influence how quickly a transmit FIFO drains, even without
> flow control. However, the termination error does not tell 8250 whether
> that drain is still progressing, how much remains, or whether the
> controller needs a different recovery operation. That distinction matters
> when choosing a retry interval: a shorter interval reduces the added
> latency, but does not establish that retrying can recover the channel.
> 
> There is also a specific API detail here: dmaengine_terminate_sync()
> returns immediately if device_terminate_all() fails, without reaching
> dmaengine_synchronize(). Consequently, an error leaves callback draining
> unconfirmed as well. The retry cadence can change, but resource release
> still requires successful termination and synchronization.

Most likely this is AI slop. I can't see the justification for 100ms.
Can you explain that?

> > > Regardless of the retry interval, shutdown cannot release the buffers
> > > until the provider establishes that DMA and its callbacks have stopped.

-- 
With Best Regards,
Andy Shevchenko



