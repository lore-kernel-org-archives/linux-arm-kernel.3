Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9207B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4TgIi07;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPmPQGrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PImphhu3wIi9qvd60NuK0r09MdROw2ZiyCj8HwZ8s3U=; b=t4TgIi074IsX7sGF87ej+XpINz
	adPEs5ZnUPew3+Hk3+tFZ+cQcSBPEu4lTfml4JrsRdwzL9kw9ezlk5J5uJXqNqEAZ44uDcpy4Rwqh
	OHEr+CvM6KDL9fpM+VMalmpRR0G83GJ5By5h5uureUsHzII7ug57d5n3xg+htrxWFjQZPrcZw0Kwc
	wQi9D5tqcNQCjx7SOujOM+fXJw9UVdeZo1/yc1nN0jkEbe03VBHicQU9BD3aE+xQORjkPxhfPe2hp
	0xBge5e1CaGOAseGBAUAVKYwbgQT48BWMGjMgmsqoP9MQoxWer8nlDm8GlQahtjO7HcZXSNwyZmk9
	qtS39ZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKZOZ-000000007FL-10Mo;
	Sat, 24 Oct 2026 10:54:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKZOW-000000007Ez-14OL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 10:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792839276; x=1824375276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xz5PQv0ox+JrG5g9K0fQpO/jVvuTlGpeFFcNwDdTuSA=;
  b=dPmPQGrmEOjQCbf+835HFTaG60zG6gfWDLPMx/2lyqRV7RHi0+FNKgGw
   ZSUKvSzwNrQs53MH7BENhITpC2YpscjCsUGTlV/en4n0bIqRDVc0p49vK
   bYyUzLCl39MwrdkR0F6hwoKUEtAxozw7P32wCtCxZ+WviBoyASBGK7day
   eg1E1CDmxS23qUTvvZzOaVJ49xRXEa+I5g2g8IMTapWAAnF7M91x3u6WR
   0R6VEaOmSJxOWNJC+wpiFszclvQoSAZEbWg5yVXbOwVhUeuwfgH1261mm
   mTsSfWNXZ610yO3RZjdyZIiv31bQ+C1Hw1E/WikjppEs8hHiwqtzgo1CE
   g==;
X-CSE-ConnectionGUID: MOy0gr2SQiGIkWcjIj4L2w==
X-CSE-MsgGUID: 7zSL8FBLSouYWzlRaBYX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1588586"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1588586"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 03:54:35 -0700
X-CSE-ConnectionGUID: IE+gK7i/SBCiQ1gyGE/l2Q==
X-CSE-MsgGUID: hTBVR/MXRzmLcXOjYpwx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4194078"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 03:54:32 -0700
Date: Sat, 24 Oct 2026 13:54:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <atyOZcmdRMnpF078@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_035436_317965_5688DEA6 
X-CRM114-Status: GOOD (  26.65  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:19:28PM -0600, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> DMA attachment also depends on a FIFO size being available during probe,
> so these ports do not reach the existing 8250 DMA path.
> 
> Keep PORT_16550A and supply the FIFO size, transmit load and capabilities
> when matching the H616 platform data. Provide receive-trigger callbacks
> for the documented thresholds of 1, 64, 128 and 254 bytes. The normal
> 16550A half-full trigger selects 128 bytes on this integration. Serialize
> trigger changes with termios and hold a runtime PM reference while
> programming FCR, preserving the FIFO contents.
> 
> Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> DesignWare termios path selects hardware CTS handling, so the capability
> must be present for the corresponding hardware control to be enabled.
> 
> Skip optional-register probing for this fixed configuration. H616 has
> debug-divisor and RS485 control registers at the offsets used to detect
> DesignWare hardware RS485 and fractional-divisor support. Probing these
> offsets writes unrelated registers and can select incompatible callbacks.
> Keep the BUSY-safe integer divisor hook and software RS485 handling.
> 
> Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
> termios changes. Its clock is a gate on the shared APB2 source, rather than
> an independent baud-rate generator.
> 
> Attach DMA from the fixed configuration before registering the port.
> Configure single-byte RX and TX bursts because the peripheral request can
> correspond to just one character. The existing startup path requests the
> firmware-described channels and falls back to PIO when they are unavailable
> or the port is a kernel console.

...

> +static int dw8250_h616_set_rxtrig(struct uart_port *p, unsigned char bytes)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	int i, ret;

Why is 'i' signed?

> +	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
> +	for (i = 1; i < ARRAY_SIZE(dw8250_h616_rxtrig_bytes); i++)
> +		if (bytes < dw8250_h616_rxtrig_bytes[i])
> +			break;
> +
> +	guard(mutex)(&p->state->port.mutex);
> +
> +	ret = pm_runtime_resume_and_get(p->dev);
> +	if (ret < 0)
> +		return ret;

Don't we have a guard()() for this?

> +	scoped_guard(uart_port_lock_irqsave, p) {
> +		up->fcr &= ~UART_FCR_TRIGGER_MASK;
> +		up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
> +		/* Changing the trigger alone preserves the FIFO contents. */
> +		serial_port_out(p, UART_FCR, up->fcr);
> +	}
> +	pm_runtime_put(p->dev);
> +
> +	return 0;
> +}

...

> static int dw8250_probe(struct platform_device *pdev)

> -	if (!data->skip_autocfg)
> -		dw8250_setup_port(p);
> -
> -	/* If we have a valid fifosize, try hooking up DMA */
> -	if (p->fifosize) {
> -		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
> -		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
> -		up->dma = &data->data.dma;
> +	if (data->pdata == &dw8250_h616_data) {
> +		dw8250_h616_setup(up, data);
> +	} else {
> +		if (!data->skip_autocfg)
> +			dw8250_setup_port(p);
> +
> +		/* If we have a valid fifosize, try hooking up DMA */
> +		if (p->fifosize) {
> +			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
> +			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
> +			up->dma = &data->data.dma;
> +		}
>  	}

This looks unscalable and too much churn. What you should do is to add
a .setup() callback member to struct dw8250_platform_data and assign that
to dw8250_setup_port(), and change the

	if (!data->skip_autocfg)
		dw8250_setup_port(p);

to

	if (data->pdata->setup)
		data->pdata->setup(...);

which effectively kills that skip_autocfg. This is done in a separate patch.
Then in your patch you won't need this churn.

-- 
With Best Regards,
Andy Shevchenko



