Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1472606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsAP9oGE;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgEMMH/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7OtorZTCub4hIrC0NxSIXMmmJ1EiV6CLt9CpRNRER7w=; b=KsAP9oGEgQSgquJNCthwr++Tew
	IHhugCs1z58lvpQZEwlL3WGuTUA1Z+v5ORb7IZ3dgXG3cdzXm9qJmhOtpjegAPgNgf+uiLdLRiFxa
	DfLRkywIWTsMXvT2QxVK0F4tm6XctutXBr6LpLB+tyqfUv17VjrVPY/2O95F8dTPPqT/CNNH7DKQM
	01BLj6chwyS4A3J+pbeA5IDWyzpzgJ2Io2/eU483vQ1WMuIrmuPJvboYaK4XcsCu8/l+b1lJeCSP1
	FssTEqMHU9aYcEH2HK8gRLLkXWj02kJXo6L6yGv1Qb9pK5wkDr3i62Xh7+FrjXt9W+pQS/x74mvxu
	lLlrOcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOI0L-00000003H6A-0XiM;
	Tue, 03 Nov 2026 17:09:01 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOI0I-00000003H5W-3518
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793725739; x=1825261739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzOMXBdWLJQFKe7hbRAZJzr2q8dSOIdKIXVdm/WjI1A=;
  b=YgEMMH/p6LovTgmA23R4KcmYZt8OJjVm0+G6PCe7QI/P2OBtnMRHrHEn
   BoxhDVES4/8olMRSYHqsGfKBao7p668dznsdVGj/rSrWSX3aUgGisMjZ8
   2t6/eeOxLdxq7p2eB1ESS6Ipyl71NmuIJ3o0R77I/iFzt6d+L+OjgqwsH
   1OY3htUENjMvojS36/UbM7xQYJcOfD+v9oyG7cncaBj2pwqCBcY+uc0XA
   lvkTOUiUjTI4FpCqVwKIHoZPR0FPjnVGuPY+5uanZhKBhdHKqAJV0tmoR
   7zMQp9zFCpjjkhfCymZVc7on72bngX3GKOhS2CLKzEx2WxrTGhPxw/0ZM
   w==;
X-CSE-ConnectionGUID: mH2WLCtGSym94IM41OpHpg==
X-CSE-MsgGUID: 5l720OyTRcmZwsOl/YxT0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2343734"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2343734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:08:58 -0800
X-CSE-ConnectionGUID: l3z2TcvyTaalmoEHrpiZCQ==
X-CSE-MsgGUID: /HBnWMLARr6XaNehCmxvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6560590"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:08:52 -0800
Date: Tue, 3 Nov 2026 19:08:49 +0200
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
Subject: Re: [PATCH v9 5/8] serial: core: allow drivers to reserve flushed
 transmit storage
Message-ID: <auoVIR05PNyU8EEt@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_090858_813744_913B9760 
X-CRM114-Status: GOOD (  19.18  )
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

On Mon, Nov 02, 2026 at 04:14:32PM -0700, James Hilliard wrote:
> uart_flush_buffer() resets the transmit FIFO before calling the driver's
> flush callback. An asynchronous DMA transfer can still access that storage
> after the callback returns, while a new write can immediately reuse it.
> 
> Add uart_xmit_block() and uart_xmit_unblock() so a driver can reserve the
> flushed storage until its transfer and completion callbacks have retired.
> Serialize the reservation with FIFO producers using the port lock.
> 
> While the storage is reserved, write_room() reports no space and write()
> and put_char() accept no data. Defer write-ready notifications until the
> reservation is released, preserving one-shot TTY wakeups. Keep the flush's
> write-ready notification under the port lock so it cannot race another
> reservation.
> 
> Wake tty->write_wait after flushing even when writes remain blocked.
> tty_wait_until_sent() waits for the logical FIFO to empty, independently
> of whether its storage can be reused. Notify these drain waiters without
> invoking the line discipline's write_wakeup() callback, so a reservation
> does not prevent a completed logical flush from waking a drain waiter or
> consume a one-shot write-ready notification prematurely.
> 
> Suppress ordinary TX starts while the FIFO storage is blocked. Preserve
> high-priority flow-control characters, which use separate storage.
> Releasing the reservation wakes writers through the existing TTY wakeup
> path. This preserves immediate logical flushing while applying write
> backpressure until the storage is reusable.
> 
> Track port readiness separately from DMA ownership. Retirement releases the
> reservation even during startup or shutdown, while writes and wakeups stay
> gated until successful startup or resume. Reopening or restarting a port
> wakes deferred writers with either a new or retained FIFO. Restart queued
> output when reusing a FIFO after suspension. Keep its write-ready
> notification pending until the retained output drains below the normal
> wakeup threshold.
> 
> Publish resume readiness under the same port lock as the TX restart,
> without clearing any reservation. A concurrent flush can then reserve a
> new transfer without resume releasing its storage prematurely.
> 
> Assert the port-lock requirement at uart_write_wakeup(), alongside the
> reservation helpers, so callers cannot inspect readiness or release a
> one-shot notification concurrently with a reservation change.

...

> +	/* Retained output must drain before consuming a write-ready notification. */
> +	if (kfifo_len(&state->port.xmit_fifo) < WAKEUP_CHARS)
> +		uart_write_wakeup(port);

I believe I have seen this already a few times. Perhaps a helper with
documented idea behind it?

-- 
With Best Regards,
Andy Shevchenko



