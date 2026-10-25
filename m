Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hsx61PMf;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jli6RjVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EanEzITabyL5hHZuLfjLX/O3m0p6a+JE+WfvVu35z0A=; b=Hsx61PMfJxyO7B2GAOWzp2/P8P
	XxFiWGn+rtcZlIfOn5uniAGInJA99FlkY6mQxt15Is48mD2vFBnGM7I3aFPn3DrhZ4a8B1rjm72FM
	mXlMRbgizzbwkvKkEgqCwymRjWfOzlE0ZCXI5bK3T22dmLkcSrHnarzQ/gxFoUilmSpfN/dL752ha
	W3f8CYa/uWJBOfZLOjN+xT32YH2Cz9GkNbHgaxfr3SJ6btw3TNMLsx+NnCltegAYFjPhTjBNXUYIB
	JSf7WJBqa+JsTeqaski3Hfj0ZoQHy2sV2MXTtIhlkerc0aq8hf9q+Ct99zNqLT5V7Km7PepopaCgA
	F0nlNFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzvN-000000019yg-3thn;
	Sun, 25 Oct 2026 15:14:17 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzvL-000000019yG-2ce0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 15:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792941256; x=1824477256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMuoICu3+/kegamQPU1fMK0Jut2zai+WN1izIEFxGgY=;
  b=jli6RjVwxBfHfVzLeHvQlcXhkHfDc9zxsDXob9pSOVSJaBPFj3IkOxL8
   9Cd2fEEXoax15GLgHP1OKWBe893y+MBDIxJcaveBu16J8BKXHWtX9L5hw
   WW71dFlveddzeCqkLgtk4DIxSlgvzbOe2Rea1MAKQZp4FS1c4jw8sKAUw
   RWvvEfTpH1HTs/cyYP7BxBYykph2TmOvXdNzioZlu4My1dN0BLhRgAjDK
   3K4nonHQP8rl8T00X2wH5WTRqOMfiR+qK4cXEGfhlkDLZ2blJxYqRoSiG
   QBR0t8Y3mDZE4fVylzxACsqV4ugwTl2qU9rHXPy19152kg79prijOnH3t
   Q==;
X-CSE-ConnectionGUID: LLwozi+2RfKqK5BmhbStZg==
X-CSE-MsgGUID: WGmFz/qXS/akC1u3DX2AkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1623521"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1623521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:14:15 -0700
X-CSE-ConnectionGUID: RDohAcVYTJKTr0jTExw2+A==
X-CSE-MsgGUID: leqgv13GQjy/DN5fHtD87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4188329"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:14:09 -0700
Date: Sun, 25 Oct 2026 17:14:06 +0200
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
Subject: Re: [PATCH v6 2/5] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <at4cvnsjHndzY5o3@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v6-2-6f366591f566@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v6-2-6f366591f566@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_081415_733854_2027FEC1 
X-CRM114-Status: GOOD (  23.45  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 02:52:27PM -0600, James Hilliard wrote:
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
> Serialize CLPS711x TX servicing and its interrupt-enable state with the
> port lock. Disable TX interrupts without waiting in stop_tx(), since a
> threaded handler may need that same lock. Have an already queued handler
> leave stopped output untouched, and drain it outside the lock during
> shutdown before the transmit FIFO can be released.
> 
> SCCNXP handles interrupts under a controller lock which its UART callbacks
> acquire with the port lock already held. Collect the ports needing wakeups
> while servicing the controller, then release that lock before taking each
> port lock and rechecking the wakeup threshold. Removal drains the IRQ or
> timer before unregistering the ports.
> 
> This serializes write notifications with port-locked serial-core state
> changes, allowing readiness and transmit-storage reservations to gate the
> notification without a check-versus-shutdown race.

...

> -static void sccnxp_handle_events(struct sccnxp_port *s)
> +static unsigned int sccnxp_handle_events(struct sccnxp_port *s)
>  {
> +	unsigned int wakeup = 0;

unsigned long

>  	int i;
>  	u8 isr;

> @@ -491,20 +491,43 @@ static void sccnxp_handle_events(struct sccnxp_port *s)
>  		for (i = 0; i < s->uart.nr; i++) {
>  			if (s->opened[i] && (isr & ISR_RXRDY(i)))
>  				sccnxp_handle_rx(&s->port[i]);
> -			if (s->opened[i] && (isr & ISR_TXRDY(i)))
> -				sccnxp_handle_tx(&s->port[i]);
> +			if (s->opened[i] && (isr & ISR_TXRDY(i)) &&
> +			    sccnxp_handle_tx(&s->port[i]))
> +				wakeup |= BIT(i);
>  		}
>  	} while (1);
> +
> +	return wakeup;
> +}
> +
> +static void sccnxp_write_wakeup(struct sccnxp_port *s, unsigned int wakeup)

unsigned long

> +{

> +	int i;

Why is 'i' signed?

> +	/* UART callbacks take s->lock with the port lock already held. */

> +	for (i = 0; i < s->uart.nr; i++) {
> +		struct uart_port *port = &s->port[i];
> +
> +		if (!(wakeup & BIT(i)))
> +			continue;

NIH [1] for_each_set_bit()

> +		scoped_guard(uart_port_lock_irqsave, port) {
> +			if (kfifo_len(&port->state->port.xmit_fifo) < WAKEUP_CHARS)
> +				uart_write_wakeup(port);
> +		}
> +	}
>  }

NIH syndrome is one of the weakest points of AI, please, read and study
the code you are changing.

[1]: https://en.wikipedia.org/wiki/Not_invented_here

-- 
With Best Regards,
Andy Shevchenko



