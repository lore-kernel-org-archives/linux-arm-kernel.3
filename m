Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1yPJ7pzu;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/zDPAgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HCorhxQxJT3W15/Ol75aTGcFGkkBMt7oxlNw+Tltp1E=; b=1yPJ7pzuT0r77OXNmH37fuAkBC
	XuEWDbPGi9jBcjfadJUN6TAtdew806t4mfIh6gOTiY0lYlt7lnh3Gefp+h9axpFBbNIgHd7NRfqvL
	icz3MChtG8nsW7iEvj50oczQ8sSIB9fMPlLjWYOImYc0FNBT037Tm6O04mWslE4D0TR4hADKtYZUf
	tP77ZOC7wO8IEUHgnBRCXTyTtPb0gvTOji0tdMyAs6AGWocbSF+dx0KNi5rR5Y3oXr13Ay8JEw9l8
	+oqGkmTzcdvLe7fkSpZebB2TQfHdTrMMWwVqYdqfmlnM3tBaZnW520+/ApOzA535/0t3HTBAYnPz+
	NC03kTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD74-00000002IBo-1iwi;
	Tue, 03 Nov 2026 11:55:38 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD71-00000002IB3-2esq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706935; x=1825242935;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NRlGTsFdID6TOhr7uHXdva//9pjtlPak/4evBt26tjw=;
  b=T/zDPAgzuEFD59j2H+Sgu94i7H8U26fZpKFi/mkdTUOyCM8ppp+TE9Uk
   ggfFDmdQJmH49gQB6KyhdPLznJdP+QU7zXzuJpc940liIvJgbwsb3ny2T
   TxpxOTkUug8+kpvmxGMtkEB7LTlqfvnljcd+l7YQ72tDpU+STOpcyUT2b
   j4dupaAr/mSPsjCZJtkgdLgPGL8hpSgL6ZxOg7EY6/VPWORl4EfM55+lc
   ZMNVY72Tv2BFmqAHiUKLaL1QuH2NyP1A0mlibe5i6TEgenhysisX9+C7Q
   /V8pMLtCKHcaWoJb+5U9zZVF0QQiC2veL/uyOEppPfXvtdt/ipM/H5Yum
   g==;
X-CSE-ConnectionGUID: ZOhM/BGnSa+4Yc9MlhAKRg==
X-CSE-MsgGUID: KcDp6BBGR2mNZc60TZgH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2454761"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2454761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:55:34 -0800
X-CSE-ConnectionGUID: UXG0LlmJSGON8WP14xs+zg==
X-CSE-MsgGUID: /usHt9haTsq5iys1QJ0A4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6265075"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:55:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Nov 2026 13:55:20 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
    Peter Ujfalusi <peter.ujfalusi@ti.com>, 
    Vignesh Raghavendra <vigneshr@ti.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion
 and flushing
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
Message-ID: <a95c92c6-afe3-52e3-c320-6d7ccd357965@linux.intel.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_035535_697936_67BD589D 
X-CRM114-Status: GOOD (  20.94  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026, James Hilliard wrote:

> Moving RX DMA locking out of __dma_rx_do_complete() left the DMA
> completion callback calling it without rx_dma_lock. Shutdown and runtime
> suspend flush RX under rx_dma_lock but without the port lock, allowing
> these paths to overlap the callback's buffer accounting and flip-buffer
> insertion. RX submission and UART interrupt handling also require the
> port lock.
> 
> Take rx_dma_lock inside the port lock in the completion callback. Hold
> the port lock around the shutdown and runtime-suspend flushes, matching
> the existing interrupt-path lock order. Assert both locks in the common
> completion helper and the port lock at the flush entry point.
> 
> Fixes: 789898416749 ("serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index b6f108d34854..322403cec2de 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -771,8 +771,10 @@ static void omap_8250_shutdown(struct uart_port *port)
>  	guard(serial8250_rpm)(up);
>  
>  	flush_work(&priv->qos_work);
> -	if (up->dma)
> +	if (up->dma) {
> +		guard(uart_port_lock_irq)(port);
>  		omap_8250_rx_dma_flush(up);
> +	}
>  
>  	serial_out(up, UART_OMAP_WER, 0);
>  	if (priv->habit & UART_HAS_EFR2)
> @@ -898,7 +900,7 @@ static int omap8250_rs485_config(struct uart_port *port,
>  #ifdef CONFIG_SERIAL_8250_DMA
>  static int omap_8250_rx_dma(struct uart_8250_port *p);
>  
> -/* Must be called while priv->rx_dma_lock is held */
> +/* Must be called with the port lock and priv->rx_dma_lock held. */

Nit, following kerneldoc's style, this would start with Context: (you 
don't need to make it full kerneldoc but it is useful to follow the kernel 
doc style where possible).

>  static void __dma_rx_do_complete(struct uart_8250_port *p)
>  {
>  	struct uart_8250_dma    *dma = p->dma;
> @@ -911,6 +913,9 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
>  	int			ret;
>  	u32			reg;
>  
> +	lockdep_assert_held_once(&p->port.lock);
> +	lockdep_assert_held_once(&priv->rx_dma_lock);
> +
>  	if (!dma->rx_running)
>  		goto out;
>  
> @@ -977,7 +982,8 @@ static void __dma_rx_complete(void *param)
>  	if (dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state) != DMA_COMPLETE)
>  		return;
>  
> -	__dma_rx_do_complete(p);
> +	scoped_guard(spinlock, &priv->rx_dma_lock)
> +		__dma_rx_do_complete(p);
>  	if (priv->throttled)
>  		return;
>  
> @@ -995,6 +1001,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
>  	unsigned long		flags;
>  	int ret;
>  
> +	lockdep_assert_held_once(&p->port.lock);
> +
>  	spin_lock_irqsave(&priv->rx_dma_lock, flags);
>  
>  	if (!dma->rx_running) {
> @@ -1811,8 +1819,10 @@ static int omap8250_runtime_suspend(struct device *dev)
>  		}
>  	}
>  
> -	if (up && up->dma && up->dma->rxchan)
> +	if (up && up->dma && up->dma->rxchan) {
> +		guard(uart_port_lock_irqsave)(&up->port);
>  		omap_8250_rx_dma_flush(up);
> +	}
>  
>  	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
>  	schedule_work(&priv->qos_work);
> 
> 

-- 
 i.


