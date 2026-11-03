Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C99606D801
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYbm54GV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yxima1mh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lZloWcPDVM4dVpS9WmdN8nPPZc7i9no9wyUqZ5qH2JA=; b=hYbm54GVJH8SJAIH6JWy76ejb1
	1xb0Zeoh8qlgi5+H6aW9Sd6k0fbYfn++JAStvOUtjhfb4/8GoPtJKoflFyhI8ZiA+SJujNJ2D5pQS
	uiu/oYmi7OnY4RnUuL6KdAJFOS1IfJ07XkCnGQAGF0+MQQCSjmcsYdXPKBZxmgiwrSgfRfG+d6Gvg
	4J5Nmam4Pr6B1FHKNpwfmNJa8m84ohSReMjkMAQ8mwFKFQzSVu9yljQIDfuFLZO0x3dJDNUdEngtE
	tVCzpE7/3Jk+dVFNcnmHy2kiMrGyhywh97fmBztO4ukO7Q5+WwBYzYJht8DYsBrfTOUiCPSV728f/
	HpTSlurg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODL6-00000002Kjm-0Jdl;
	Tue, 03 Nov 2026 12:10:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODL3-00000002KjF-21pK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793707806; x=1825243806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HPAWnSLRmzqkl6s9RYyuENxxp9+uYSex0FG9pduGwWo=;
  b=Yxima1mhhhJFWTD6SJx0EVMAxcTojfZzeD9dsfYvryIEFwZYM89QDNw6
   NhicQr7w59Li1oPVae2DkFy5xad36vwL90SD9KVOrTwrAqu2MJYp6r48V
   +HuL9GlToqx2h5l36aXaXXIq6Lpy6f9aCNTB/wn8R7pnrvQOmQ3IpgRE1
   8T4PRtsEirJUrGPaqT6w0tVvG/7jAlzH5suM8sdoOz5n8/SCZRlNqi17L
   8fxrTklvRAQRhj5QHigYx7cyTq26zupat8vhs3OeZr4czyjuz9nvjOsVs
   PbAKgW9rVd3QmO+6wEnU+763Rr9SS+RnuZDfnW2+dK5DaNBP70MDHF0ji
   g==;
X-CSE-ConnectionGUID: 0k9fCzfVTz6tKFB5asJGZQ==
X-CSE-MsgGUID: IzpVchq5S/CnIOyQquQ0Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2308618"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2308618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:10:05 -0800
X-CSE-ConnectionGUID: DLS/RsaYQMKYDRjLO0nS9A==
X-CSE-MsgGUID: c+UbXbirSpmEEJdXix7DlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6944952"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:10:02 -0800
Date: Tue, 3 Nov 2026 14:09:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v6 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
Message-ID: <aunPFy2TCljGvV2q@ashevche-desk.local>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
 <20261102-submit-h616-uart-fifo-v1-v6-7-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-7-25afcb346b0c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041005_620330_4D1B71BC 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, Nov 02, 2026 at 12:55:22PM -0700, James Hilliard wrote:
> The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
> on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
> its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> 
> Read this field in the sunxi setup callback when platform data does not
> provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
> its 256-byte configuration without accessing FCC. The probe has already
> enabled the clocks and deasserted reset before invoking the callback.
> Leave the FIFO clock-control bits untouched.
> 
> Validate the depth before generating the RX trigger table or setting the
> transmit load. The quarter-full threshold must be positive and the
> FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
> trigger API. Report an invalid depth and fail probe instead of generating
> zero or truncated thresholds. This bound follows the current 8250
> table and callback types, not a hardware FIFO-capacity limit; support
> for larger thresholds would require widening that interface.
> 
> Select this setup for the A523 compatible. Derive the transmit load and
> RX threshold table from the discovered depth using the common sunxi
> helpers. This handles the different FIFO sizes with one compatible and
> one receive-trigger mapping.
> 
> Like H616, this integration has Allwinner-specific debug-divisor and
> RS485 registers overlapping the generic DesignWare feature probes. Use
> the common sunxi PIO setup, BUSY-safe integer divisor programming and
> software RS485 handling. Keep the APB clock gate enabled during termios
> updates with SKIP_SET_RATE.

...

>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	u32 cpr_value;
> +	/* Fixed FIFO depth; zero selects discovery during setup */

But make the code clearer in this sense.

>  	unsigned int fifo_size;
>  	unsigned int quirks;

I'm wondering if we can encode the FIFO size (as power-of-2) into quirks,
but this might be harder to follow in the code.

>  	int (*setup)(struct uart_port *p);

>  	p->fifosize = data->pdata->fifo_size;
> +	if (!p->fifosize) {
> +		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
> +
> +		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
> +	}

	if (data->pdata->fifo_size) {
		p->fifosize = data->pdata->fifo_size;
	} else {
		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);

		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
	}

> +	/*
> +	 * The byte-sized 8250 RX trigger interface requires positive,
> +	 * representable thresholds. Larger thresholds require widening it.
> +	 */
> +	if (p->fifosize < SUNXI_UART_RXTRIG_QUARTER_DIV ||
> +	    p->fifosize - SUNXI_UART_RXTRIG_FULL_MARGIN > U8_MAX)
> +		return dev_err_probe(p->dev, -EINVAL,
> +				     "invalid FIFO size %u\n", p->fifosize);
> +
>  	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;

-- 
With Best Regards,
Andy Shevchenko



