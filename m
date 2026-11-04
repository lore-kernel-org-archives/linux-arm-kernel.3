Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EE606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4Bptc22;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lO2zPylm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9nviUxxklDz1e7RQotS+S5xXIzfCLzTAm+63a1Agefo=; b=i4Bptc22YtqnprqQryFguv2B6P
	lXkMd6xZpZy9xQXnhoTw7HgDc4/sMk5uOEwMsxyWh0tviQPCSM/jOrCB5PuPAW5+RSBg73rk5mRwO
	xjC/k0uFjHQQPNdu5qxetj1dJxNn1urdQ9cOvIHqwWQI1/1+TP7g0rHfbluWArqYexUfzbDSbKKxy
	RbIvr7AvU/t1YSdy4Q4jQIhKdPZTcglwb2toZxxr4kpVNhZWNWQP4RJT6rehk4dVZLIjdqmE2/E7V
	yi3DS8jTVdI8YRI1BaW/hDnXpZuRITUpWVC4/Wf/SCyaPPijwaz3ZUGfq+K1RbG2o4hGKQo59andZ
	rT3Y+2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYPb-000000051J0-0Hup;
	Wed, 04 Nov 2026 10:40:11 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYPY-000000051IO-2pDm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788808; x=1825324808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gS4Z3hxrWiNXk0PZbDdWd9RFAdHS8/Nmmvft9Q2f1Dg=;
  b=lO2zPylmlpdkiG5iXIBjiuCtDqNt0WR53uDoXSuaaBCw+R0BEamP3Hh4
   EWLj0n9E+tgQ777UEyBoCHcn16eYqHeP0tmTC6q56onn4x5ewsU+1YKdy
   b3tyWHQiss5harF+tvg6VH7MQ9Pnm4PMWY6cuqv1fmJXEZXHOUkFwA42m
   JfNjVDTgD+iHgl6sylgrHYBLiZsIw1WoJXDHLS37Jsn87DzPucjQIDcVK
   hKiPXNfzgEijUg6r3T+zrLuWKqIB3Y2Vwn4B04lwbYKPgDbiqFEUhcICJ
   EeLO4cWhfbghwrONp0399llxuaxeXaZi5NnlgigxHMcGDW75pSLd++s8c
   A==;
X-CSE-ConnectionGUID: Y6dSkN8jRceFb1TJDIm0zQ==
X-CSE-MsgGUID: kRTgLfhsTEqAlFO9HCceHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2436338"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2436338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:40:06 -0800
X-CSE-ConnectionGUID: xHuM0kqnRyy5PTiMdZKYlw==
X-CSE-MsgGUID: IJOAm2dLQRCs+ce9hVyt8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7007981"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:40:03 -0800
Date: Wed, 4 Nov 2026 12:40:01 +0200
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
Subject: Re: [PATCH v7 05/12] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
Message-ID: <ausLge5yYc2W00zi@ashevche-desk.local>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-5-c9e248d685c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-5-c9e248d685c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024008_749274_A291919F 
X-CRM114-Status: GOOD (  18.77  )
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

On Tue, Nov 03, 2026 at 02:39:58PM -0700, James Hilliard wrote:
> DW_apb_uart uses receive thresholds of one byte, one quarter full,
> one half full and two bytes below full. The generic 16550A table describes
> these encodings only for a 16-byte FIFO. For example, the half-full setting
> on a 64-byte DW FIFO is reported as eight bytes instead of 32, and a sysfs
> request for 32 bytes selects the 62-byte encoding.
> 
> Build a per-port threshold table from the discovered FIFO depth in dwlib
> and install receive-trigger callbacks for CPR-described FIFOs, including
> LPSS ports. Keep the setup helper available to integrations which obtain
> the depth without probing the optional DW registers. Validate that each
> threshold is positive and representable before constructing the table.
> 
> Serialize FCR updates with termios and the port lock, acquire a runtime PM
> reference before accessing the device, and propagate resume errors without
> changing the shadow or hardware. Update only the trigger field so changing
> the threshold preserves the FIFO contents.
> 
> The FCR mapping is documented in the DW_apb_uart databook, section 6,
> FIFO Control Register. The existing default FCR encoding is unchanged.

...

>  static int dw8250_setup(struct uart_port *p)
>  {
> -	dw8250_setup_port(p);
> +	int ret;
> +
> +	ret = dw8250_setup_port(p);
> +	if (ret)
> +		return ret;
> +
>  	return dw8250_setup_dma(p);
>  }

Split out a change that moves from void to int for _setup_port() and do it
before the patch that creates _setup_dma(), so it will be less churn overall.

...

> struct dw8250_port_data {

>  	/* Hardware configuration */
>  	u32			cpr_value;
>  	u8			dlf_size;
> +	u16			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];

Put it first after the above comment. Check with `pahole` before and after
results.

>  	/* RS485 variables */
>  	bool			hw_rs485_support;

-- 
With Best Regards,
Andy Shevchenko



