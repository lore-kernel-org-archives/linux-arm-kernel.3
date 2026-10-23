Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F97606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TwDMwM5K;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hota32Zp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1kTIFoe6i1xDHtfLoz66uWP64coXUajiqWJkaCC3as=; b=TwDMwM5K2Tkct405OaRlJUFMXV
	5neTgk4P6mBYbWiQI9AS56PuIGZxeEHgmBDz/wK9kIpncv4Wq7H3inXz2Ye35+qGoeu05qe2YSlGY
	mKEj0nNewo14eT/hIskiJVxMxUWCt4GpQ+/JYiIQqiIAbrumxaGJ/2OA4vvY4qRtAylc4PkIEbkSR
	tiZ3EbvU6Le7anl5patEknjefo/E00biNX4oxAbIGPkLZuJ72WID0AW4+4aJord1yWg3LBxSjCYf/
	S5cUFFP44XRZ8w0mLiyOmz//arPjKoQ9Lp6THcRP8WHuZHeDs51BfDzDt9/duMfh1OGr/slxbFDds
	BtfjmHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAt3-0000000Fwr7-1iaZ;
	Fri, 23 Oct 2026 08:44:30 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAt0-0000000Fwqn-02eZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792745066; x=1824281066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OsCnZCSIZp91hbEsolldC49llZuGKebJONP9W/QrldE=;
  b=hota32ZpFJxbGttxSIABoXGqiZ//rA9rwaszX9DepEUGS+OhgDr9YI2b
   ib0wHXfc/A2Tslpmtc+jB0pOZ4n3VvNAF/FCT55yCx5uvsiZDyovCI4Fp
   xu9JqKGoahay+my1NIHnp1OV2En34mz5ZHT+6smLj6pLKmsHu9i3ctrCg
   D7muOt5NSu9LRD9BNLsRq7irC1pUGlFSHGGpCZDh0AuBQT48OCQcLrecK
   kFH4igzCWu3OX6lQ2bZSz+iYoWnulc62jrmQll75z2PtKunYQsraAfZDi
   kPyUrAwvzV8Gaz/Jl9Bgq44RW7lO61sNQnEiLqGCFfA5YZM6QrlKM42gX
   A==;
X-CSE-ConnectionGUID: Pt5jE4afRJuZJpxltFM2pA==
X-CSE-MsgGUID: lU0nSrX3QFWnaQ61fOz/uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1393235"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1393235"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:44:24 -0700
X-CSE-ConnectionGUID: 6QZyP2KcSEOiTNAvKkm0rA==
X-CSE-MsgGUID: uXTOKeiJRTuoCZGli0F6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="5408334"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:44:21 -0700
Date: Fri, 23 Oct 2026 11:44:18 +0300
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
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <atseYvQUYvpMFEIM@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_014426_139843_95704492 
X-CRM114-Status: GOOD (  18.15  )
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

On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> DMA attachment also depends on a FIFO size being available during probe,
> so these ports do not reach the existing 8250 DMA path.
> 
> Use a fixed port configuration for the H616 compatible, with a 256-byte
> transmit load and the documented receive thresholds of 1, 64, 128 and 254
> bytes. Select the quarter-full receive trigger by default.
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
> Attach DMA from the fixed configuration before registering the port. The
> 8250 core installs its FIFO defaults during registration, after the probe's
> FIFO-size test. Configure single-byte RX and TX bursts because the
> peripheral request can correspond to just one character. The existing
> startup path requests the firmware-described channels and falls back to
> PIO when they are unavailable or the port is a kernel console.

...

>  	/* Internal 8250 only */
>  	UART_PORT_AIROHA		= 124,
>  	UART_PORT_AIROHA_HS		= 125,
> +	UART_PORT_DW_APB_256	= 126,

Why? Besides the poorly chosen name, what prevents us from modifying the
corresponding parameters at probe time by leaving the one of the existing
types?

...

>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	u32 cpr_value;
> +	/* Use a fixed configuration instead of probing optional registers. */
> +	unsigned int type;
> +	unsigned int dma_maxburst;

This sounds like a hack.  Why do we need type here? The address of platform
data is enough, no?

>  	unsigned int quirks;

-- 
With Best Regards,
Andy Shevchenko



