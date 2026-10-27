Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE587606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFeLj5Xb;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HgF9bfWj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AVTyXl56KTAD9qthFvNCSvQI53NTnxNb8lASUJ9aXqI=; b=PFeLj5XbaK6AWTNTsCfjcqSLfi
	sANcpPT9LZQXUM2EIb4P2OMAQwb7kUIN7ZE9RlyT2qwWQckgdi3SVjRAnIgV1HDBZZBvCpcSXqeep
	UJb/MiYWzP0ve2wfQV4tAJDwGD+WHveNc4g/2UUsXZumOCEjDFZvsLgUHB8qI9VkJNjUdg5UFmRDe
	d+ONccnokocg6Q+zGz6eFCxqobkRmgy3z0d7El3rzXKYFKEcwTYfxbGbAl3izqlI0wntvcCWW5A4t
	wfr54X5SwdAsPgreFnhxdcxr7fx1Ycl31prAPCcXZsmd9bv9bqQ4vmc04ZIQRPZ7hZS/TCT+I6DA9
	KN3z5A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbVQ-00000003tYb-0kmh;
	Tue, 27 Oct 2026 07:22:00 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbVO-00000003tYE-0e0O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 07:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085719; x=1824621719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTLEDAupRY2oWJwjRjfzsKaWR6SmrpHN+eBe2aIhJOs=;
  b=HgF9bfWjz1qk1YImG10vMCySEYlQwbzJNY56bSipTljGZ/K9qSh8ENoN
   GaBewe3lERB/mld+3N8jaCbjDOVz5Dpv2qxG0oOL7g+dgert/lNXtgBnF
   bZcKMo2BieLda3OIvsjJuyvZhVmI7yW9OW3MLLjOcfpsJa1f03ojie7UM
   tyA2IAZei/Otc+MERiZ2Fw/vUw7wc0GjGzMXsicb5hXVw8Wjtunavrso9
   HLqBwVYWgADp2kuXDpnPK48jvqVlFHcJvYSVTNaOLchCh1a+/R0IoFhf7
   r107BJZOai8juKHr7BBJPVFJgpjvYyMV60wrxtqfj0EfMJN5mMSdZN29+
   Q==;
X-CSE-ConnectionGUID: pmvnya7aRkCUPLdhYOQ2Vw==
X-CSE-MsgGUID: nuWUFVRBRMS72DFpYGaMQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1670533"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1670533"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:21:58 -0700
X-CSE-ConnectionGUID: QQ7qj2MiSJqvvbsyjg+eug==
X-CSE-MsgGUID: QbVb4ynrSgWUyDG3mhGFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6317598"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:21:54 -0700
Date: Tue, 27 Oct 2026 09:21:51 +0200
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
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <auBRD7Ny6u_a9X7p@ashevche-desk.local>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_002158_228413_B8D6AF23 
X-CRM114-Status: GOOD (  23.88  )
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

On Sat, Oct 24, 2026 at 02:22:25PM -0600, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> 
> Keep PORT_16550A and preserve the FIFO size read from firmware by
> uart_read_port_properties(). Use it for the transmit load and derive the
> receive thresholds from the documented 1-byte, quarter-full, half-full
> and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128 and 254
> bytes; the normal 16550A half-full FCR setting selects 128 bytes.
> 
> Serialize trigger changes with termios and hold a runtime PM reference
> while programming FCR, preserving the FIFO contents. Propagate runtime
> resume errors before changing either the FCR shadow or the hardware.
> 
> Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> DesignWare termios path selects hardware CTS handling, so the capability
> must be present for the corresponding hardware control to be enabled.
> 
> Select the fixed configuration through the platform setup callback.
> H616 has debug-divisor and RS485 control registers at the offsets used to
> detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> those probes and retain the BUSY-safe integer divisor hook and software
> RS485 handling.
> 
> Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
> termios changes. Its clock is a gate on the shared APB2 source, rather than
> an independent baud-rate generator.

...

> +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	unsigned int i;
> +	int ret;
> +
> +	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
> +	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
> +		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
> +			break;

Can we provide an array of the possible values and deduplicate this loop?

drivers/tty/serial/8250/8250.h:

static inline int serial8250_bytes_to_fcr(unsigned char *rxtrig_bytes, unsigned char bytes)
{
	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
		if (bytes < rxtrig_bytes[i])
			/* Use the nearest lower value */
			return (--i) << UART_FCR_R_TRIG_SHIFT;
        }

        return UART_FCR_R_TRIG_11;
}

drivers/tty/serial/8250/8250_port.c:

static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
{
        const struct serial8250_config *conf_type = &uart_config[up->port.type];

        if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
                return -EOPNOTSUPP;

	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
}

(this split should be done in a separate preparatory change).

And here

	u32 fcr;
	...
	fcr = serial8250_bytes_to_fcr(...->rxtrig_bytes, bytes);

> +	guard(mutex)(&p->state->port.mutex);
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(uart_port_lock_irqsave)(p);
> +
> +	up->fcr &= ~UART_FCR_TRIGGER_MASK;

> +	up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;

The right side is embedded in the above mentioned helper.

> +	/* Changing the trigger alone preserves the FIFO contents. */
> +	serial_port_out(p, UART_FCR, up->fcr);
> +
> +	return 0;
> +}

...

> +static void dw8250_h616_setup(struct uart_port *p)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +
> +	p->type = PORT_16550A;
> +	p->flags |= UPF_FIXED_TYPE;

> +	up->tx_loadsz = p->fifosize;

So, here you can precalculate the array of possible FIFO thresholds.

> +	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
> +	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
> +	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
> +	p->rs485_config = serial8250_em485_config;
> +	p->rs485_supported = serial8250_em485_supported;
> +	up->rs485_start_tx = serial8250_em485_start_tx;
> +	up->rs485_stop_tx = serial8250_em485_stop_tx;

Please, add more new lines, so we see the groups of different callbacks and add
comments on top of some to explain, like

	/* Custom FIFO trigger thresholds since it differs to standard 16550A */

> +}

-- 
With Best Regards,
Andy Shevchenko



