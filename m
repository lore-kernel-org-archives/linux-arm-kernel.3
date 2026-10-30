Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5974606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UVAy8CV8;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FTt5mfpN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C0/mwmzFbhrf2oh9K+Po1CByufDjKwjIEZTp3nBdSuk=; b=UVAy8CV8G0+PS1u4H5XJoHviwm
	Gc+uOKaUjhk0X6pOlLgALcaDaavhJdlQm/Pquihan9XANCTYiNfZfpcLc0g45AUWA8hVhpnCQlH2/
	vg9d9UyZRzUP3QxnrB0nPbaOl5bRISetpVcsyL+tPFw/24fFIoyapMsk6oviO0XSB/PnfhBJfelHL
	lelrkV+w3kdpWZnY5g9xSqG7NpDvhAN6eLAmkFYEohYrs1kTNtj6OmHuKY2PdEXsWHoGOBJkR5zP2
	pNLY5mGHnPZpZb/fYQsVTrWM8puc2tF66d5GOe2FTszWOfKltdxCPOWDzPWYJmQah6xMkMHQ7fO02
	4PwAFuag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjWz-0000000BML5-2NdZ;
	Fri, 30 Oct 2026 10:08:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjWx-0000000BMKX-009G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793354895; x=1824890895;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zOblnyUyv9NKvrPuHMLJ0x2zFEjfb1OCZnMziEeVx3Y=;
  b=FTt5mfpNahmYKtP54WqqmFsGzaBq5J/AGV82Gc5erynrV8cK3zhv11u7
   7buQcNSlLXgghfH22SaHQOvVaGyQ0BiBsjabF0vI6DrlLX5moUekOmz77
   GBRU1uAHz52PENMn4Pr4kcNs2ovI8BRN2xIhoiKnu+wvG3DvoAkH/gkDt
   401ppQ7VVi5zOelrqyDrFVD0PGT8TSIEKKi0IxZMZl9UtN8f0+YoE8/lZ
   ROIfgMoq5xk6IB7FDlU9gafm8DQbRjsnwMDjVkTMnibSylK9F1mwROL91
   iz9kZFtVTbvWHnQ9zVd7Wvb1T+JsEPQA02DDfc6ugM3l+/UyyQVBcFdNa
   Q==;
X-CSE-ConnectionGUID: +83xnmmgROSTXYCGDP/rhg==
X-CSE-MsgGUID: kLZCYEE7RXKCGW8D+zsUpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2217934"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2217934"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:08:14 -0700
X-CSE-ConnectionGUID: AHNzZJnuTeKLjfxz5wU0HA==
X-CSE-MsgGUID: 9I/0TBI1QOi05253dVUlJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5737947"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:08:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 12:08:06 +0200 (EET)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: James Hilliard <james.hilliard1@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
    Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616
 UART
In-Reply-To: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
Message-ID: <3e73ec0c-2623-d891-7146-dcf1c7a68c41@linux.intel.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <auHW9nkDqZUXeHNZ@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_030815_052578_5B36AF69 
X-CRM114-Status: GOOD (  23.29  )
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

On Wed, 28 Oct 2026, Andy Shevchenko wrote:

> On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> > component parameter register reads as zero. Generic 16550 probing leaves
> > the port using the 16-byte FIFO configuration and its trigger-level table.
> > 
> > Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
> > data. Use common Allwinner setup helpers to configure the transmit load
> > and receive trigger table from that depth.
> > 
> > Derive the receive thresholds from the documented 1-byte, quarter-full,
> > half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
> > and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.
> > 
> > Build the threshold table during setup and use the shared 8250 conversion
> > helper to select the nearest lower threshold for sysfs writes.
> > 
> > Serialize trigger changes with termios and hold a runtime PM reference
> > while programming FCR, preserving the FIFO contents. Propagate runtime
> > resume errors before changing either the FCR shadow or the hardware.
> > 
> > Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> > DesignWare termios path selects hardware CTS handling, so the capability
> > must be present for the corresponding hardware control to be enabled.
> > 
> > Select the fixed configuration through the platform setup callback.
> > H616 has debug-divisor and RS485 control registers at the offsets used to
> > detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> > those probes and retain the BUSY-safe integer divisor hook and software
> > RS485 handling.
> > 
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
> > termios changes. Its clock is a gate on the shared APB2 source, rather than
> > an independent baud-rate generator.
> 
> ...
> 
> > +	unsigned int fifo_size;
> 
> This is should come from DT (based on the property or compatible),
> 
> ...
> 
> >  	u8			no_int_count;
> > +	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
> 
> Why do you need it here? Can it be provided via driver_data?
> 
> ...
> 
> > +/* The trigger is the masked, unshifted FCR receive trigger field. */
> > +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
> > +{
> > +	switch (trigger) {
> > +	case UART_FCR_TRIGGER_1:
> > +		return 1;
> > +	case UART_FCR_TRIGGER_4:
> > +		return p->fifosize / 4;
> > +	case UART_FCR_TRIGGER_8:
> > +		return p->fifosize / 2;
> > +	default:
> > +		return p->fifosize - 2;
> > +	}
> > +}
> 
> You don't need this, just provide a set of numbers directly.

That was my first thought as well, but James explained that he wanted to 
reuse this for HW different fifosize which makes sense.

And these formulas are given in DW spec so I suppose we could actually 
infer these for all DW UARTs, not just these ones being added now, using 
the same formulas. (A future work item.)

-- 
 i.


