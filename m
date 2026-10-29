Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DF6606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/7AUpC7;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmtggd95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YOVZz2rEk4lZKDa87ycfgL661H0zQluemrPyROYbb/Q=; b=W/7AUpC7uJe4NaljMiDF0sZo6m
	eF4XZJjRE//zE8w0M80VDNko9UiX4LM6drPZdjuBKf59D3p6Efd3ktwbH82zDuS0XB06/+agEALOa
	zeLubCVNFnBkqhNNhBwOhwf4ZeLTsG/GF1AIoNahXiJTyhWaJNJrLTmtelQprHbqdZkYKCfbBv+qM
	303nBO2/z2eQFQSY1PDjXMm/hMpzzI/pkK5dnFZev9zF6IiBlIJNK1h/9D27USenA1S1c65HgIAyL
	DFOGyP8NggUdmzXGbQ5SROrTPBPr3/EuAKmVyrGjhW4jaCfwb9/Myl64BRL8JxFxolgUSPlCFIJ0m
	IPfRLU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR31-00000009W4Q-3dGp;
	Thu, 29 Oct 2026 14:24:07 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR30-00000009W3k-0KTl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283846; x=1824819846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WhRRgDbVMLz+/BSdD0pXKUEHAh8FgmgnlTctJGj8+kQ=;
  b=mmtggd95Kae9nMp0HbMVQyU8PTfQKVFw0Y3naw2dNx0wragoJ90nDZ1B
   Wxp439esBx7mM91QSpWWeMkn8FXkLa2WxQ+x+YyipssBu/Uuu0gTGRvrl
   5BHRDutU54vQFZNol6R9A6u3f4bN1PNX6/8uEPJ/epv8eQ5nKDbuA45Nl
   iCIG5N0dASBlGhFCwIh612fmymBV0vK3FEf4Wb2WwgDtvOI2mWsMmrC1j
   DmZg5Pfo2ubeNzEuHCytfugyrQ3nzqLEMLKdIC8q0bA+xzFzC83y4Skhm
   7nvz3GGfxfrplu1o4Ddhd/uZFwxY6C53oDlPagU4anb4dQRyyDLNqz625
   g==;
X-CSE-ConnectionGUID: k48Tf1anQbqLUXNN42OLFQ==
X-CSE-MsgGUID: OXfyNmyATruMhOz1PFKJNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2054104"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2054104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:24:05 -0700
X-CSE-ConnectionGUID: D+lewELqRqCYi5Up37o2Mw==
X-CSE-MsgGUID: HmFeHfhUSC2AV3hAqUA+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5293371"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:23:59 -0700
Date: Thu, 29 Oct 2026 16:23:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
Message-ID: <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_072406_153711_5D544942 
X-CRM114-Status: GOOD (  15.99  )
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

On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
> serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
> before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
> the channels. If the provider fails to stop a channel, the DMAengine
> wrapper returns the error without synchronizing its callbacks. Hardware
> or a detached callback can then access the released storage and state.
> 
> Checking the error and returning early would not preserve their lifetime:
> serial core frees the TX FIFO after the driver's shutdown callback returns,
> and port removal can then release the callback context as well.
> 
> Require successful synchronous termination of both channels before
> releasing any DMA resources. Retry failed channels after a sleep outside
> the port lock, leaving channels that have already stopped and drained
> alone. Keep the shutdown gate and storage reservation in place throughout
> the retries.
> 
> A permanently failed DMA engine blocks close or removal. This deliberately
> retains the buffers, mappings, channels and callback context until the
> provider can establish that they are no longer in use.

...

> +	while (rx_ret || tx_ret) {
> +		dev_err_ratelimited(p->port.dev,
> +				    "DMA termination failed: RX %d, TX %d; retrying\n",
> +				    rx_ret, tx_ret);

> +		msleep(100);

Huh?!

> +		if (rx_ret)
> +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +		if (tx_ret)
> +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> +	}

This is unacceptable. Sleeping is okay, but value should really match the
baudspeed and other parameters of the transfer.

-- 
With Best Regards,
Andy Shevchenko



