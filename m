Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uGPzTUwr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2RuYrMI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OMTWKoka/WJZWYrKcZxYXVvF/9BfOI9GPrShvLim+Pk=; b=uGPzTUwrTnWPrDlxg23uxQ3ry/
	SCq+WhH4ijYM5FNkhRvO17CWs6G8vk+ulTzARqOzOcZQOInuPgSyPrzLYDvh6idRUXBakOr5BXpm9
	hpzzbxzO5BDaCWk6u3fGpjM1nJQKpaTshHRZY9D9ACvAuchQ0ssXCVydZ/itwe8yMeYxmqJDLZEnx
	XwFDmWLCOCCTW1HfvaH1BHwI1qcERW8piHkbjULgU1wbOpRcjggF1a349NJz1csOQG3QoybVcWxeX
	dzeKALu7CBRAPqHBywiQVQ+x7PokKXLsxYz3vLZckgiTNXBZXWukfvHMwk3SixBLnRTDxdaVVDLmB
	qWR/CVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIQI-00000003JpG-3502;
	Tue, 03 Nov 2026 17:35:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIQG-00000003Joc-3eCJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793727349; x=1825263349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fIwZFXRauHVGTvmkvF0p5ts2dhitRW5zxXOPkRVPeoQ=;
  b=B2RuYrMIZTuWLlfJChn3dkhjwrUXTTZ5P1b+LHkokTmYjKnZ8WTkg3Yr
   oekEyEgowAcVUVBzRpicgFFQA4BzZphHPq/2zjUBWu/bpBkrWi/gONKlX
   R3sFSSGw91lkArejqTMxUcLwD5nNtfE7Q0Wr0hJRErEL1pvTHYXT+Wg1K
   TAf1TEMOPU6pqXHLpPn7WwpmEGnIxjdJ9ZhP/GKm8/EwEbTH085RhAttb
   F8KMpc3NsROvZZ65zmMa4V2QKbPRomh2O9Wn7Z4rsbhw0axBZl691WWV7
   1h/mx76UeKQU1JrUmlc4BFRx21abtyd1v0jrgY2Eo11WtIEEpyNmBaYlP
   A==;
X-CSE-ConnectionGUID: dYPObzKzR2CYBH4AV5Rgng==
X-CSE-MsgGUID: mB4//x9nTe+UKk8zp2WkbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2554347"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2554347"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:35:49 -0800
X-CSE-ConnectionGUID: cOWXPWO/THODlghOQi+WaA==
X-CSE-MsgGUID: yU58d79/R8mJ9+oiuIlMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6498070"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:35:42 -0800
Date: Tue, 3 Nov 2026 19:35:39 +0200
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
Subject: Re: [PATCH v9 8/8] serial: 8250: retain DMA resources when
 termination fails
Message-ID: <auoba7ZhfzaMTkzw@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_093548_955803_13C2AD27 
X-CRM114-Status: GOOD (  20.38  )
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

On Mon, Nov 02, 2026 at 04:14:35PM -0700, James Hilliard wrote:
> serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
> before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
> the channels. If the provider fails to stop a channel, the DMAengine
> wrapper returns the error without synchronizing its callbacks. Hardware
> or a detached callback can then access the released storage and state.
> 
> Checking the error and returning early would not preserve their lifetime:
> serial core frees the TX FIFO after the driver's shutdown callback returns,
> and port removal can then release the callback context as well.
> 
> Require successful synchronous termination of both channels before
> releasing any DMA resources. Retry failed channels after a sleep outside
> the port lock, leaving channels that have already stopped and drained
> alone. Keep the shutdown gate and storage reservation in place throughout
> the retries.
> 
> Start retries with a 1 ms sleep and double it up to one second. This
> makes short-lived failures responsive while bounding sustained retry
> activity; neither delay is a hardware timeout. Report the initial failure,
> rate-limit ongoing failures with the elapsed time and current RX/TX error
> codes, and report recovery once both channels have stopped and drained.
> 
> A permanently failed DMA engine blocks close or removal. This deliberately
> retains the buffers, mappings, channels and callback context until the
> provider can establish that they are no longer in use.

...

> +static void serial8250_terminate_dma(struct uart_8250_port *p)
> +{
> +	struct uart_8250_dma *dma = p->dma;
> +	unsigned int delay_us = USEC_PER_MSEC;

Don't use multipliers without a number, it's harder to read (when syntax
highlighting is on) and follow in general.

1 * USEC_PER_MSEC

> +	ktime_t start;
> +	int rx_ret, tx_ret;
> +
> +	rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +	tx_ret = dmaengine_terminate_sync(dma->txchan);
> +	if (!rx_ret && !tx_ret)
> +		return;
> +
> +	start = ktime_get();
> +	dev_err(p->port.dev,
> +		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
> +		rx_ret, tx_ret);
> +
> +	/*
> +	 * Shutdown cannot return while DMA owns storage or callback state:
> +	 * serial core frees the TX FIFO afterwards, and removal frees the port.
> +	 * Retain both channels and retry outside the port lock. A permanently
> +	 * failed DMA engine therefore prevents teardown from completing.
> +	 */
> +	while (rx_ret || tx_ret) {
> +		fsleep(delay_us);
> +		/* Retry promptly at first, then limit sustained retry activity. */
> +		delay_us = min(delay_us * 2, USEC_PER_SEC);

Ditto.

> +		if (rx_ret)
> +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +		if (tx_ret)
> +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> +		if (rx_ret || tx_ret)
> +			dev_err_ratelimited(p->port.dev,
> +					    "DMA termination still failing after %lld ms: RX %d, TX %d\n",
> +					    ktime_ms_delta(ktime_get(), start), rx_ret, tx_ret);
> +	}
> +	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
> +		 ktime_ms_delta(ktime_get(), start));
> +}

-- 
With Best Regards,
Andy Shevchenko



