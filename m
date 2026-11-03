Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55F6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9dAD0iE;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A5b+VxCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jybwex6KEtiVVB5Q7MO/0FLbDCSae5cKl7r/Ekti9JU=; b=m9dAD0iEzDNdqcmul+DRhnRBKU
	HcYTih7Wexq2mZJwWxln/KffQt1GukvoA0ryvVAgpiRBtyufjeogthxNa2EtvZOuBgz+P1FRGPyql
	m1U4ecuxm/JaQ+Vhn+0IM8Li7xc65LZJWuDgprJlmuUDMW6tL/wYkK9Nh1ZfP8blhOhpH+hm2xeOY
	6diII98cJ3D/8vbu4Ss0nNMKHVyRH80wMDW7oYjW8U3d3gkp8/5Qeeky/Xlc3wZWIHzdK+pxxXYLK
	Zs38vvegV7JaKrn5nPYIB1DPapglJhOtKQEZMIIyqN3Si8w+E5NoIybxpG59JK9hONcXqDUCra013
	DF8nvA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOICZ-00000003ICi-2ovh;
	Tue, 03 Nov 2026 17:21:39 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOICS-00000003ICB-212A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793726493; x=1825262493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MsQh6jwB+YXfuoggHvsVrFxpE0KnVT/xHsMAp3keNjk=;
  b=A5b+VxCNZfb8XmH14blCsT7Jt5U5Q3Ch19jMODI3W+KRhRdu7/JLNzTX
   /+wLjzKTf1NVqRWlOTEfL4UnpfsLB856vl+kzPHCOn+l/19lhELVsmvrZ
   jVYzCjfuk2si7OfpNkYKPGUzVDMIq7bSqMYO74fBZNamZ0NW6vZFcEvsJ
   67P0HwVI+7ZtgNEb5KxUn8RMfYfdSrwC1FUQKfUZo0S5ROjlPzNf2bjvn
   oT9dQSaCYy492FgmAmtdNDxybz/45Py+NzMItoS2seAtlM0nrxXBO1/Ut
   tCvxPSffgtvTF7W2raZWiO2CB0o/wJizTX+O5MHOyZD5hqXYAAsxRuB15
   g==;
X-CSE-ConnectionGUID: HvEFRznCTg6hWyhh+y9/fw==
X-CSE-MsgGUID: ceMg9ACPTxqjdVY4+lyY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2369583"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2369583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:21:32 -0800
X-CSE-ConnectionGUID: 04u2Hyb+SN6wX57K1GcXbQ==
X-CSE-MsgGUID: mdIQ21nhR56Tg3Q1sMOFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6331418"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:21:25 -0800
Date: Tue, 3 Nov 2026 19:21:22 +0200
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
Subject: Re: [PATCH v9 6/8] serial: 8250: drain canceled TX DMA before
 reusing its buffer
Message-ID: <auoYEjduLH9GlAFp@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_092137_216501_AD0B34A3 
X-CRM114-Status: GOOD (  17.24  )
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

On Mon, Nov 02, 2026 at 04:14:33PM -0700, James Hilliard wrote:
> uart_flush_buffer() resets the transmit kfifo before calling the driver.
> serial8250_tx_dma_flush() terminates DMA asynchronously and clears
> tx_running, allowing a new write to replace tx_size while a detached
> callback has not yet run. That callback can then consume bytes
> from the new transmission. Reusing the reset kfifo can also overwrite the
> source of a transfer that has not stopped yet.
> 
> Reserve the flushed FIFO storage through serial core before returning
> from the flush callback. Keep tx_running set until a worker synchronizes
> the terminated channel, suppressing old callbacks and new submissions
> during that interval. Return the mapping to CPU ownership before releasing
> the reservation and waking writers. Normal transfers continue to use the
> FIFO directly.
> 
> Reuse the locked completion processing after retirement, including OMAP
> delayed register restoration and transmitter-empty handling. Take a runtime
> PM reference around worker UART accesses and drain the worker before
> releasing the channels. Shutdown releases the FIFO reservation after
> stopping DMA and unmapping its source. Serial core keeps writes and wakeups
> gated until startup or resume makes the port ready again.
> 
> Track a flushed FIFO separately from the transfer length. If termination
> fails, retain the reservation until normal completion and account the
> completed bytes without advancing the reset FIFO. After successful
> cancellation, process a zero-length completion once callbacks have drained.
> 
> The race was found by inspecting cancellation and restart while preparing
> H616 UART DMA support.
> 
> Retain the tx_running check in both completion callbacks. Releasing the
> reservation relies on the DMA provider draining detached callbacks when
> dmaengine_synchronize() returns; provider callback-lifetime fixes supply
> that guarantee for controllers which previously lacked it.

...

> -	if (!dma->tx_running)
> +	if (!dma->tx_running || serial8250_tx_dma_blocked(dma))
>  		return;

> -	if (!dma->tx_running)
> +	if (!dma->tx_running || serial8250_tx_dma_blocked(dma))
>  		return;

...

>  	guard(uart_port_lock_irqsave)(&p->port);
>  
> -	if (dma->shutting_down)
> +	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
>  		return;

Try to make these checks consistent. It's always better to choose the order and
be aware of the potential side-effects of the bit-wise operations.

...

> -	if (dma->shutting_down || dma->tx_running)
> +	if (serial8250_tx_dma_blocked(dma) || dma->tx_running)
>  		return 0;
>  	if (uart_tx_stopped(&p->port) || kfifo_is_empty(&tport->xmit_fifo)) {

-- 
With Best Regards,
Andy Shevchenko



