Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31991606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9SRo+Fp;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJvjNvX2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kV4jEv5sJ1fhwruuECh2r7bZz8ZxIRz2IHxBzvIfK/w=; b=u9SRo+FpWY2Vmcq2EzqeonbbLZ
	+LtF1NEmYPJd06QXycAgTJ9m/ZpzdYlzi3R9/imhzOfLPrlofUETM1+lVjg4lE7hqyTni1lljACV0
	6GCE3O2ktVTT9CzIY5j6hE02cR3oJgoW7UnIdrs7v7DmvAYW+vnBk1DWWJXM3KNpC1UYGXrMhif33
	8uX8+DHtDcr+Rgm0zMnuyBRMpVkPINLQRhhlZSw3Z4Q37H5/Fq1oS9rRMUarJ2czSqUEACawsQaN4
	86GD324EX8wkdztwzdbVhwK6yRHvkvHenxdrxAv01gzIi3zBih+Rf7g+btRyuuJngR4hFaLxxDmpc
	tpwNFCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLb4h-00000003s8o-1bfu;
	Tue, 27 Oct 2026 06:54:23 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLb4e-00000003s7r-2KpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793084060; x=1824620060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E54gxf4saca+RBeymUGcrO5/xiigxNpKbUqIJy908ig=;
  b=KJvjNvX2cw/ulcmwTLoCVqh3MGvfwbS3O5dXGeEhXyAPQLFCMK80z51s
   +6DfRmjmylEeb1f19P97j7GVMMjIyUCfekFxDvIeBwXIPPf7lTjdmnqSl
   U0xwcsDE6nFl6Yd3TBIvbb1WZWD4Q1HCYd2+eMHYRQLLND0QTwM6Y9DRB
   JFco9JWAuPxJpmUg7dhn5IOhBaJ4HbuSvq/BrFH/pQQEsx4SN00NdrpXh
   pagPx89EYUv8e+OQnd6wk3SN3Et1gxkk62qa672545epEkJN9XHplFqVD
   J1ipYA97n6g+ylVfQH2+Ke/x5Jc9DOmjXna+KX5Jexa2mnTrxpiTtQMCe
   g==;
X-CSE-ConnectionGUID: /37nYTNVThq6xWW34nCTJw==
X-CSE-MsgGUID: CG3P2ooaR16MQUhVWWZOzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1798039"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1798039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:54:19 -0700
X-CSE-ConnectionGUID: cEV2pnl5QWexlm2/6h19Ug==
X-CSE-MsgGUID: gXby9iudRf2Fmsjfa53UKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4865007"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:54:17 -0700
Date: Tue, 27 Oct 2026 08:54:14 +0200
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
Subject: Re: [PATCH v3 1/4] serial: 8250_dw: select port setup through
 platform data
Message-ID: <auBKlohJi7TV9uq3@ashevche-desk.local>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_235420_664718_869C6710 
X-CRM114-Status: GOOD (  19.30  )
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

On Sat, Oct 24, 2026 at 02:22:23PM -0600, James Hilliard wrote:
> Select feature discovery and DMA attachment through a platform-data setup
> callback. The generic callback probes the optional registers and attaches
> DMA when a FIFO size is available. Integrations with a fixed configuration
> can supply their own setup before the port is registered.
> 
> Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
> Octeon continues to skip optional-register probing while retaining its DMA
> setup; on 32-bit builds it retains the generic setup. Keep generic setup
> for devices without matched platform data as well.

...

> +static void dw8250_setup_dma(struct uart_port *p)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);

> +	/* If we have a valid fifosize, try hooking up DMA */
> +	if (p->fifosize) {

This can be written now as

	/* We can't setup DMA when there is no FIFO defined */
	if (!p->fifosize)
		return;

> +		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
> +		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
> +		up->dma = &data->data.dma;
> +	}
> +}

...

> +	if (data->pdata) {
> +		if (data->pdata->setup)
> +			data->pdata->setup(p);

Do we have users for this case, when pdata is defined and no setup is provided?
What I see, we may default it to dw8250_setup() and drop a lot of assignments
below.  Otherwise those special cases can add an empty stubs, which in my opinion
will be cleaner solution.

> +	} else {
> +		dw8250_setup(p);
>  	}

...

>  static const struct dw8250_platform_data dw8250_octeon_3860_data = {
>  	.usr_reg = OCTEON_UART_USR,
>  	.quirks = DW_UART_QUIRK_OCTEON,
> +#ifdef CONFIG_64BIT
> +	.setup = dw8250_setup_dma,
> +#else
> +	.setup = dw8250_setup,
> +#endif

I'm wondering if we can do something at runtime with these ugly ifdef:s
(yes, it's a preexisted inconvenience).

>  };

-- 
With Best Regards,
Andy Shevchenko



