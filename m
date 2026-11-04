Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF76606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l6XKzqdF;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZownUSi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jozP82KH6glhGWXgzZRzNLlRupxlnORo/58rZr7qZ9M=; b=l6XKzqdFZlPHUXLCjuL7KLrfTS
	y/wS69tHXe23IsnNvi0D6V1T3iijIxeziL/HzgU61pSE2HNJkqjAOONUj4UoKejyEbAX2DlkQWi9w
	6Id3pqQ7cFCE/OLPKd6IL893dSm6aGfdRfX76MPzWaMOgJZ55g0XRUUXegl7XQHBvgDFGrREMHslk
	J6Y46h3iFXJHr8/SvCC1wx4GCyGfbsNDV09mXnLL8ocubZbzQ/vFrVIVUxhMsAbkpMEKozNyTPtj6
	CboMiBWONUUntsjkL5DnGskb5v0VnWZG+dQEYPmVf/bMLrJ+x2pPR1HuL528oUxwPB2d+Pd6Og66K
	8pelhgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXP-000000052xl-0uy3;
	Wed, 04 Nov 2026 10:48:15 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXM-000000052x3-3eke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793789293; x=1825325293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9WOXcToYwIQoz7fhImQHKUc1KH3haX4Er1ncPbI21WA=;
  b=fZownUSiIhWy1NDFoqIJUMDiCpWvxVAKV9TvP1zyL35DDVrVyUv3NqTF
   k7eAclEu9pQqpNnsBvFTY9cfJNfZ7rBCTBGei803suZ0PnTxsc+6wg5E0
   r9JQmVIsNvawtxyQ0aVv1qbcZkbqFIN7nDuhjfcyL7pDYgC6O+O4rdLLE
   FlOIIlOFwBMgTgGN0wWnqr7Tt7hgolVCkizMtKEovLHiG3CIBgnlb3ej7
   BB1zGqugEXl9WJjGeFjhD/b27uR6gw1NrJaJQ/+49BVWtUI9Tj6jeqXvO
   qa9VhvgW/lp2sxoFjvvr4c65VducQT9JsGUfa9DubZUKn8KLAfxNoHvcH
   A==;
X-CSE-ConnectionGUID: qieF9K3XRAG5S/VHObOBHA==
X-CSE-MsgGUID: 4oNElGomSD66EiVP5ny83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2552444"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2552444"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:48:13 -0800
X-CSE-ConnectionGUID: h8C2zJTFRfq6dw4VZbAfEw==
X-CSE-MsgGUID: AZLoV3SzT9OTjAmHCmqQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8558196"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:48:09 -0800
Date: Wed, 4 Nov 2026 12:48:06 +0200
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
Subject: Re: [PATCH v7 12/12] serial: 8250_dw: configure RX trigger
 thresholds for Octeon
Message-ID: <ausNZqZrR3wqQjf7@ashevche-desk.local>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024812_925944_A614F551 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, Nov 03, 2026 at 02:40:05PM -0700, James Hilliard wrote:
> Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
> giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
> dw8250_setup_port(), so it does not install the common trigger callbacks.
> PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
> exposed.
> 
> Supply the fixed depth from platform data when firmware has not provided
> one and initialize the common trigger table before port registration.
> This makes rx_trig_bytes available while preserving the Octeon port type
> and register accessors.
> 
> Select DMA before filling in the default depth, as before when the 8250
> core supplied that default during registration. Thus the new trigger
> setup preserves which ports attach DMA and their existing burst sizes.

...

> +	if (!p->fifosize)
> +		p->fifosize = data->pdata->fifo_size;

In this case I would use ternary Elvis:

	p->fifosize = p->fifosize ?: data->pdata->fifo_size;

-- 
With Best Regards,
Andy Shevchenko



