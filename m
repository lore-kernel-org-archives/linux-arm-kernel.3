Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D9606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzEJaQFa;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNfg2tbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SIbHIkb59pVcJng8sKHppF6ubVcQlFLsBLXS2eUuU34=; b=AzEJaQFa0BmT3sP/JWZ/9wr/Pq
	9O3sM/7mTrEjWaDq6sL/TZMn5ufNYn1o0DxxMW/qstoWVnUeIT3ry58VlmL0A9vQBZJQ22Qx44twP
	clxSluz/bKfyk7ks6RPvsVn7+3W731v9D2PxjB8Zg3subAWA9mFuD4uHnIWOjPnTIuKFWZMVIdm6n
	t23iwQrf/qmov4VOytJkXSNnaGmQqGco6iCzhgSKbDfl4ZXjCZ7yg96EUt2LblFiCkvX51HyZulMG
	lUP2dv3neyZTg87DDr/ZLR7ZGCIVD3ufl526r8ZIv3GGcTzU/7X7/+ff2XeCfcqvUQaIS2Nnt9Zxb
	g8qFE7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1TN-00000006pFM-1amY;
	Wed, 28 Oct 2026 11:05:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1TL-00000006pF0-0NNU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793185535; x=1824721535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WX9L8EGH4Oa0aoSnq/yMQj4iV1Wl9LjJdHrn7K6+r08=;
  b=kNfg2tbkeBmEZ3FkWPr8LYjfGqlgWSdB8abutFhf+gdGwx7dS4Im1DV3
   qVsDKEWDIfb+X6A7GcmHtCpVgYM6TlEe6ehpMtuFyi4uzS7RLtyuS0k0b
   2fuC5QlmFig5uJCACucoiqwTtefHOm+XqavGzyiURI/YRA2cZwNAo89WY
   LqJO0r0RT6+culU0YC49iIAwsm0oOcWMo7FM8C6njR3YXjFAqnWuwTXd5
   LSSo8SiXoMA/vg2ZycTjsAGeuNNrLv49v4yL4Fnw8qzwW18qdLYfNPT2d
   vcSiu/K5fUo4WJW/gQbkGNUaYqVqc9GiNzgPSosMjHDTkyFpDw+wtZPpG
   g==;
X-CSE-ConnectionGUID: yrz4LgSoRGanXeaoTEotQg==
X-CSE-MsgGUID: FraDB11/SemCifl/GuZS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1994123"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1994123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:05:34 -0700
X-CSE-ConnectionGUID: 5CMJ/braQgCTYNPfY2aNKw==
X-CSE-MsgGUID: lH3Shlv+T+2rHVEDZRl8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5184240"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:05:30 -0700
Date: Wed, 28 Oct 2026 13:05:26 +0200
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
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040535_188383_435E649D 
X-CRM114-Status: GOOD (  19.89  )
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

On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
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
> Build the threshold table during setup and use the shared 8250 conversion
> helper to select the nearest lower threshold for sysfs writes.
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

> +	unsigned int fifo_size;

This is should come from DT (based on the property or compatible),

...

>  	u8			no_int_count;
> +	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];

Why do you need it here? Can it be provided via driver_data?

...

> +/* The trigger is the masked, unshifted FCR receive trigger field. */
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

You don't need this, just provide a set of numbers directly.

-- 
With Best Regards,
Andy Shevchenko



