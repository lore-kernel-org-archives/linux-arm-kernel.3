Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE3606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgqiP3Js;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcotnTt8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J1cJunRtziCQSI57V0U3l58lyDmUupWkdJUEjrp/6ac=; b=WgqiP3JsO9xvOO7pi8Cm00zTuV
	GTf0JZy2C7GDrm6bl+Y4c6y6+QrfBjHiP61yDBUYd4LfhB1gmQgfVTD0cAT66aftL9qpt484LOOQr
	lCEbb1mE0kCDlKE3J8g7tdwKaHZS4rrAm3FtuuPDjTimZLrFRXD7cCE9dcKCv38t4JXzuHvHM7C5O
	2fCsdmGU7YoQVr87PYbpXICXKI07/oQfNjf3kSS0/ubLm7EZ89ZTjWAa6mZ/p12IGsyTQDFB7LcGf
	IInWVGRCM5XAdAvpkytBhhdvrHS0xxoHfQmDr4kMvE+9ia8qUf7/s0xAKMLHgKpAsjt33RO8xrRxR
	nsPOQnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsj9-0000000EATF-2omB;
	Thu, 22 Oct 2026 13:21:03 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsj7-0000000EASn-1rjk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792675262; x=1824211262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPtVW+zJYuGYEvqqnTvxnUJoTo1amg8ZRAWoVfiCZ18=;
  b=UcotnTt8jrjV6BCokWMpZGOJ7il40IpAplil3gxvglI0+6irLlNy1n0t
   vmYs/1RkrJruKJcGC9iW9gZ5B/W8NsBs98krcYXvW6he7qKzHtBOjhpcv
   vlcsS8N2cbXFmomMj2imk1JDM2k1LO+l8iaC8pL3ILG2MWV/d8ivNgud/
   19wcGePQ4QHjXt2aAtcsjq6wC+2zAflyyeaaUKuw6974Yj4U2822X2sXm
   VCU5ULq96XgNS9pIeubkoZmaEF4KihtGAm/t9fIm1zMhfljJoe3KdTon3
   hrQ2gbR4/Qa3FreY6V6vdIB+anb1JF4i5zgcqTUkBgcjCKJVq5Yv5xv5I
   Q==;
X-CSE-ConnectionGUID: a6DVYr1SQPGlQ4RVP+0BZg==
X-CSE-MsgGUID: CNoSNyf9SnqeYjwjPXyM/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1456208"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1456208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 06:21:00 -0700
X-CSE-ConnectionGUID: 81646FC0QK+lTVLsXp90pg==
X-CSE-MsgGUID: Ef+DEytISBOPzyqcvoN+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3293950"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 06:20:57 -0700
Date: Thu, 22 Oct 2026 16:20:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Manish Narani <manish.narani@xilinx.com>, stable@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when
Message-ID: <atoNtka8rCO3Cil3@ashevche-desk.local>
References: <20261021225356.625288-1-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021225356.625288-1-kapoorarnav43@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_062101_547791_825D6160 
X-CRM114-Status: GOOD (  18.59  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 04:23:34AM +0530, Arnav Kapoor wrote:

 Subject: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when

when what?..

Please, read what you about to send. Most likely you used AI for all this and
hence people tend to stop checking all the crap it produces...

> ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
> ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
> channel specs and lets ams_init_module() fill them for the AMS node and
> each of its children, without telling it how much room is left.
> 
> For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
> "channel@N" child after the 10 fixed PL channels. The binding allows
> reg values 20..50, so a PL node can have up to 31 such children, i.e.
> up to 41 PL channels, while only 31 are budgeted for it. Together with
> the 13 PS and 7 AMS control channels, this writes past the end of the
> buffer. Since the modules are filled in device tree order, the fixed
> channel blocks copied after the PL node can overflow as well.
> 
> ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
> unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
> far out of bounds.
> 
> Pass the remaining capacity down to ams_init_module() and
> ams_get_ext_chan() and fail with -ENOSPC when a module does not fit,
> instead of writing past the buffer. Also reject reg values below 20, as
> the binding requires.

> This was previously reported by Weigang He, but the thread stalled
> before the changes were picked up.

Convert this paragraph to Reported-by, Closes, and respective Link tags.

...

> +		ret = ams_get_ext_chan(fwnode, channels, num_channels,
> +					max_channels);

Perhaps a single line?

...

>  	if (fwnode_device_is_available(fwnode)) {
> -		ret = ams_init_module(indio_dev, fwnode, ams_channels);
> +		ret = ams_init_module(indio_dev, fwnode, ams_channels,
> +				      (int)(ams_size - num_channels));

Why do we need casting? is ams_init_module() is aware of negative numbers?
If so, it can also be aware of some "big" number.

>  		if (ret < 0)
>  			return ret;

...

> static int ams_parse_firmware(struct iio_dev *indio_dev)

>  	device_for_each_child_node_scoped(dev, child) {
> -		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
> +		ret = ams_init_module(indio_dev, child,
> +				      ams_channels + num_channels,
> +				      (int)(ams_size - num_channels));

Ditto.

>  		if (ret < 0)
>  			return ret;

-- 
With Best Regards,
Andy Shevchenko



