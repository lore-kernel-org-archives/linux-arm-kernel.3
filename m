Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+3AhYDq;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CGGxzaGq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7TANQUlPJemcIf+d7Vgd+PAva9YTSJD/DfMucJVKdTo=; b=z+3AhYDqM8PjDoI8/iBs5cEJJV
	g2ke5M2vc/++t0vtSTpS5AjtH6FHzZHwxrz28WV9casC6x3mC6ZJyDvJTuYzPuL5NCa8Db7vPCu61
	kG1mkm2Z5DSMzAz4LG4K4EFpoNNZnHVOaa/x7vrTdKxGFAC8wVLg8LO4AXwuJGzTEtoM4O/ZK51SD
	sNMDER9M53eFjEwMxtob3AtBc6xhpkisz4ZL38cgXgbaFC0/Nju1E87WR/olmvJICsxFP8t75yAgm
	sVaKrR+EOQu5usz2deaiA2O8RyyDuPzG+Xba3lLqrUJ7g49owMxYadeuS0Cf97fyTEOh5tdbMfFE5
	lzL1PSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjGz-0000000BI9A-26Ve;
	Fri, 30 Oct 2026 09:51:45 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjGw-0000000BI8O-3x2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793353903; x=1824889903;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rXmmZvQwk7weAWQRbOTp6l9G3HUkrXfcFgXXPPhBVhA=;
  b=CGGxzaGqdr8pA984MoSv1LRANcHLt7qT/qdQJcNEhEeb6tw2leU952pO
   umEaK0Vc1eo78ewqTErI/w/cF+IPtb+ItVZsRXqH1z4auNG2P0puKZa7O
   Yiy3utzoVV4/009gCFB6iR7CgDP8adH+BTVjfWOIEvtuzQXBOlN2vCfhr
   ijieQIXeWabMgKMPofeTGx/E6p61UZo1+wNfv6aiAjZi/PG0Te3VFS5im
   QyiT6XWKVKosKwtJwuAKP5n0nEqo8PPTBtJiNTDUTSVSqqB4OPRbmhwJP
   Sqig5JGHEFGBtkvAXOixKIH7wMpOWL61PIClkDL/7mL8p+zkS74yAdGf+
   w==;
X-CSE-ConnectionGUID: 3Q7xTWNgR3aqbiKaorhGYw==
X-CSE-MsgGUID: 5Xfw5LkOTfS5yA3vWqAdqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2129643"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2129643"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:51:41 -0700
X-CSE-ConnectionGUID: NiscU6zERACwhqfm6w+v5A==
X-CSE-MsgGUID: yynxe+GeTci66Hb2PFxNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7187531"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:51:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 11:51:32 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
    Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 4/8] serial: 8250_dw: configure the Allwinner H616
 UART
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com>
Message-ID: <0809accd-0db3-c923-0396-2d45db7b0d82@linux.intel.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com> <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_025143_042903_2D603FE6 
X-CRM114-Status: GOOD (  35.71  )
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, James Hilliard wrote:

> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> 
> Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
> data. Use common Allwinner setup helpers to configure the transmit load
> and receive trigger table from that depth.
> 
> Derive the receive thresholds from the documented 1-byte, quarter-full,
> half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
> and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.
> 
> Allwinner encodes these thresholds as fractions of the FIFO depth rather
> than fixed byte counts.

This feels repetitive wrt. the previous paragraph so I'd instead start 
the previous paragraph with this sentence.

> Building a per-port table from that depth keeps
> the mapping in one place for integrations with different FIFO sizes,
> including those that report their depth through FCC. It also lets the
> shared 8250 conversion helper select the nearest lower threshold for sysfs
> writes using the same table as the read callback.

Instead of this long fragment of text, I'd just say something like this:

Construct the RX trigger threshold array on the fly so that other fifo 
sizes can reuse the same mapping.

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
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 98 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index a546cf2de7b6..3bc6735fc253 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -19,6 +19,7 @@
>  #include <linux/io.h>
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -63,6 +64,7 @@
>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	u32 cpr_value;
> +	unsigned int fifo_size;
>  	unsigned int quirks;
>  	int (*setup)(struct uart_port *p);
>  };
> @@ -81,6 +83,7 @@ struct dw8250_data {
>  	unsigned int		in_idle:1;
>  
>  	u8			no_int_count;
> +	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
>  };
>  
>  static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
> @@ -652,6 +655,93 @@ static int dw8250_setup(struct uart_port *p)
>  	return dw8250_setup_dma(p);
>  }
>  
> +/* The trigger is the masked FCR receive trigger field, in register position */
> +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
> +{
> +	switch (trigger) {
> +	case UART_FCR_TRIGGER_1:
> +		return 1;
> +	case UART_FCR_TRIGGER_4:
> +		return p->fifosize / 4;
> +	case UART_FCR_TRIGGER_8:
> +		return p->fifosize / 2;
> +	default:
> +		return p->fifosize - 2;
> +	}
> +}
> +
> +static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +
> +	guard(uart_port_lock_irqsave)(p);
> +
> +	return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
> +}
> +
> +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	int fcr, ret;
> +
> +	fcr = serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
> +	if (fcr < 0)
> +		return fcr;
> +
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
> +	up->fcr |= fcr;
> +	/* Changing the trigger alone preserves the FIFO contents */
> +	serial_port_out(p, UART_FCR, up->fcr);

Hmm, the current do_serial8250_set_rxtrig() only takes tty port's mutex?
Does it lack something it should be doing (RPM or taking port's lock)?

I was going to suggest putting the actual FCR update into generic 8250 
code and lockdep asserting the required locks are held. But then noticed 
the taken locks seem do differ.

> +	return 0;
> +}
> +
> +static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +
> +	/* Allwinner RX thresholds differ from the standard 16550A table */
> +	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++) {

Add include for ARRAY_SIZE()

> +		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
> +
> +		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, trigger);
> +	}
> +	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
> +	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
> +}
> +
> +static int dw8250_sunxi_setup(struct uart_port *p)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +
> +	p->type = PORT_16550A;
> +	p->flags |= UPF_FIXED_TYPE;
> +	p->fifosize = data->pdata->fifo_size;
> +	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
> +
> +	dw8250_sunxi_setup_rxtrig(p);
> +
> +	/* Use software RS485 with the Allwinner register layout */
> +	p->rs485_config = serial8250_em485_config;
> +	p->rs485_supported = serial8250_em485_supported;
> +	up->rs485_start_tx = serial8250_em485_start_tx;
> +	up->rs485_stop_tx = serial8250_em485_stop_tx;
> +
> +	return 0;
> +}
> +
>  static int dw8250_probe(struct platform_device *pdev)
>  {
>  	struct uart_8250_port uart = {}, *up = &uart;
> @@ -875,6 +965,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
>  	.usr_reg = DW_UART_USR,
>  };
>  
> +static const struct dw8250_platform_data dw8250_h616_data = {
> +	.usr_reg = DW_UART_USR,
> +	.fifo_size = 256,
> +	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> +	.setup = dw8250_sunxi_setup,
> +};
> +
>  static const struct dw8250_platform_data dw8250_octeon_3860_data = {
>  	.usr_reg = OCTEON_UART_USR,
>  	.quirks = DW_UART_QUIRK_OCTEON,
> @@ -926,6 +1023,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
>  
>  static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
> +	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> 
> 

-- 
 i.


