Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25BE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0a9YwZP;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WnwBYyqL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sIAQApOwnlBHdqOEDUSf5m4YrfU7jMgmgx2VS57GmCE=; b=y0a9YwZPdwwlvbfSz+bZpy7T9q
	rPppu3T2Wxpmoe5LQNe3xjFfjGRisY/pEbcd8xu1eylvb5CY6/oxyCY7LTnRj5WXlsGhinVxMd4s2
	XoxEhIBeNpRY6e/iiSJmllSZmxA7i93rzMtoMJeIHnlzDdaP4ORzKoR2rNxruVflHwN60zwNrjtb4
	cvEqusCi/JCMiJzdsSUvi+E4d/FaH7GZfr0XJ6oSNgrGpt/SvfGMSKzml+Q/jQFDrBN3cZlzbq+DN
	RJbl9dZNANtVxS5KjIevGchlstZcGszdaq1ii5nVeXoeASI+joPW4p4FqW7ErjJIxd9GNCpKGTpHh
	xn2w8+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQxD-00000009VBQ-3yuF;
	Thu, 29 Oct 2026 14:18:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQxA-00000009VB3-4BCI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283485; x=1824819485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iUgkTmbEVGLMzWydqtXX3ASQZZhoDtXfz4hj/j8HhZA=;
  b=WnwBYyqLX6348L1TkZwaBhMJ+UFGQhAE7O7ry2Pugr4jcd/yMOLGj+W0
   G8O1dlS7vJOq/0Kk8Z/WCuh5RhXarcD8ywzCvwSVmeMs+9qwsE/YV5faD
   y5yqGYGDWkfXnX2XoNJzezMOIlgAAK28jMl2bgTIbnkCv6vwJQ3TSf58/
   cJa0L//kYrk9QER5UcmAmKsHEG9yxIpUZ/PX/bohtFHO49gB10rmrwlwR
   XngYIwQsm+ioU74E3rnLtHu+G70Rlkuyyd5ocpylI+Ij/J+z6e/ff64E0
   EnXHUkE7a/MD71qXn4ZA1Midnh6NJN8RHrO8NU+vk/Dpt8fCoSHVqUmfs
   Q==;
X-CSE-ConnectionGUID: PQANz6GESgmbJASOmJ9s5Q==
X-CSE-MsgGUID: Cf1ONBwcRnu0CkD0UFCkRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1920058"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1920058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:18:04 -0700
X-CSE-ConnectionGUID: T8QAYLthTXiOO95NU/4lBA==
X-CSE-MsgGUID: hFAuv5gvS4KywM5Cg6kQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5148330"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:17:57 -0700
Date: Thu, 29 Oct 2026 16:17:55 +0200
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
Subject: Re: [PATCH v8 2/6] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <auNVk_Y8iiAXyFa3@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_071805_050866_D1FB641E 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, Oct 29, 2026 at 01:36:58AM -0600, James Hilliard wrote:
> uart_write_wakeup() expects the UART port lock to be held. Several worker,
> DMA completion and interrupt paths call it without that lock, including
> indirect calls from uart_handle_cts_change() and the transmit helpers.
> 
> Take the port lock around these notifications or their transmit helper.
> Keep sleeping SPI and regmap accesses outside the locked region, and keep
> the FSL LPUART completion lock held through its wakeup. Acquire the port
> lock after releasing private channel locks to preserve the ordering used
> by UART callbacks. In the MUX timer, publish available FIFO space under
> the port lock and keep the hardware FIFO-drain wait outside it.
> 
> Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> path, since their interrupt handlers now acquire the same port lock.
> Preserve the caller's interrupt state when releasing those locks.
> 
> On SB1250, lock modem-state updates after reading and filtering the change
> status, and wake modem-status waiters after unlocking. Take the TX lock
> inside its service routine so RX-only interrupts need no acquisition.
> Keep that lock across x_char handling, FIFO consumption and the decision
> to mask TX interrupts: a writer must not enqueue data and enable TX between
> the empty-FIFO check and the interrupt-mask write. Each TX invocation sends
> at most one character.
> 
> Serialize CLPS711x TX servicing and its interrupt-enable state with the
> port lock. Disable TX interrupts without waiting in stop_tx(), since a
> threaded handler may need that same lock. Have an already queued handler
> leave stopped output untouched, and drain it outside the lock during
> shutdown before the transmit FIFO can be released.
> 
> SCCNXP handles interrupts under a controller lock which its UART callbacks
> acquire with the port lock already held. Collect the ports needing wakeups
> in an unsigned long bitmap while servicing the controller, then release
> that lock before visiting the set bits, taking each port lock and
> rechecking the wakeup threshold. Removal drains the IRQ or timer before
> unregistering the ports.
> 
> This serializes write notifications with port-locked serial-core state
> changes, allowing readiness and transmit-storage reservations to gate the
> notification without a check-versus-shutdown race.
> 
> Cover DZ TX servicing and JSM Classic modem notifications as well. On
> DECstation ZS, acquire the port lock before the SCC lock and notify writers
> after releasing the SCC lock. Defer normal TX restart after console output
> to a worker, since console output can already run under the port lock.
> Check transmitter readiness before consuming another character and drain
> the restart worker during shutdown and removal. Release Lantiq's hardware
> lock through the transmit helper's completion hook before notifying the
> line discipline.

...

> static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)

>  	struct uart_port *port = dev_id;
>  	u8 ch;
>  
> +	guard(uart_port_lock_irqsave)(port);

Why _irqsave?

>  	uart_port_tx_limited(port, ch, 256,
>  		!(*CSR_UARTFLG & 0x20),
>  		*CSR_UARTDR = ch,

...

Same Q everywhere (it might be legit in some cases,
it might be too strong in others).

-- 
With Best Regards,
Andy Shevchenko



