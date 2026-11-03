Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24D606D817
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KzsiBjCl;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iP3E73ke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aFDkJvc0SlO0FoZdt7sy/omFWAvQLp/LHRh9YqnoHDQ=; b=KzsiBjClDKNOiF4FoXhsCA498L
	AZIh0IqeLdNM5dpHxSwN6PJMfuHPPTM+iwQVJbLpZAEEWYwsvIOk0VeCkW+QWuJZIVyAkyB8aZ/Zt
	ZtXiajuXTxUYqhqmF60xlYDCRN36kBpeV86hPthFJH0RCWjNVI6eDRQY83ve9H697JEVc7mh4zi4f
	FFCFo1z//3bFdHtrzN/V/E0ghHAqBqKkOMdu/jCsX1eJ5XKs8Qlt9tmdBpxZCb4LfQtMLEewzYMMe
	azlLN5zQJ1QjJpIylmlnalKHli0oGrB0MFxxLzHgz1ozVEzH0bA9wVZCKQIWY2jfs1/CyAYAMqSmA
	conontrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEg-00000002JPL-32Pc;
	Tue, 03 Nov 2026 12:03:30 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEd-00000002JLm-2j51
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793707408; x=1825243408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ms+g3QoZSUyFHUMK9wfol68PI8V8MBi/mm/vsDLdkK8=;
  b=iP3E73ke/4VXjN7wG/ZgaRrbunnDMhquffN2oF1ewpryG4aQVB/2AmEM
   cI345xCHwoYLWHdzB9hkzBwUQAiOojwNt+rsCT923ATkPBXnJVwh1LZMT
   N8CQgM7uhLrgf7dFtLIxkx7yvWXt9lsbmQGqHrZIFczqpZd06cdVJwxHJ
   qrmYWXLAYHCShM76fKUzQWJBVeob9YXHwKez0xFMyXROO6fd1dZ9P2nPr
   MMXNJhRBqyo9uPGrzcTcnO07h+Si0FY9IW6UO0r5uYJWCvCHgDE16ovyO
   X+ukxuiP3rz3THRqAqWBsd52Iq/6r2XRVIMmEZL6s7ZSPthgPOUHT1O2S
   Q==;
X-CSE-ConnectionGUID: PgZ+ULMzQR6ndvrJMWD+oQ==
X-CSE-MsgGUID: oXmaeL8xTwaxlcpT5UZezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2336008"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2336008"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:03:28 -0800
X-CSE-ConnectionGUID: u0dGWKT/S9WdmDpo9aqLlg==
X-CSE-MsgGUID: 772hCfvgTIKLnsT8dX0suA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6737785"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:03:23 -0800
Date: Tue, 3 Nov 2026 14:03:21 +0200
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
Subject: Re: [PATCH v6 4/8] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <aunNiQcpKMrc88EK@ashevche-desk.local>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
 <20261102-submit-h616-uart-fifo-v1-v6-4-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-4-25afcb346b0c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_040327_710829_E15653B0 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, Nov 02, 2026 at 12:55:19PM -0700, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> 
> Keep PORT_16550A and supply H616's fixed FIFO depth through platform data.
> The 8250 core derives the transmit load from that depth.
> 
> Allwinner encodes receive thresholds relative to the FIFO depth: one byte,
> quarter-full, half-full and depth minus two. Construct the RX trigger
> threshold array on the fly so other FIFO sizes can reuse the same mapping.
> For H616 the thresholds are 1, 64, 128 and 254 bytes, with the normal
> half-full FCR setting selecting 128 bytes. Use this array for both RX
> trigger callbacks and the shared bytes-to-FCR conversion.
> 
> Serialize trigger changes with termios through the port mutex. Hold a
> runtime PM reference for the register access and the UART port lock while
> updating the FCR shadow and hardware. Changing only the trigger field
> preserves the FIFO contents; a runtime resume failure leaves both the
> shadow and hardware unchanged.
> 
> Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
> DesignWare termios path's hardware CTS handling.
> 
> Select this configuration through the platform setup callback. H616's
> debug-divisor and RS485 control registers overlap offsets used to detect
> generic DesignWare features. Use the fixed configuration with BUSY-safe
> integer divisor programming and software RS485 handling.
> 
> Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
> Its clock is a gate on the shared APB2 source rather than an independent
> baud-rate generator.

I'm not sure I followed previous discussion, but as far as I get it Ilpo
mentioned the possibility to have that FIFO trigger threshold helper to be
available on 8250_dw level (meaning dwlib). Or was it decided against this?

...

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

> +	up->fcr &= ~UART_FCR_TRIGGER_MASK;
> +	up->fcr |= fcr;

	up->fcr = (up->fcr & ~UART_FCR_TRIGGER_MASK) | fcr;

(as is also okay)?

> +	/* Changing the trigger alone preserves the FIFO contents */
> +	serial_port_out(p, UART_FCR, up->fcr);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



