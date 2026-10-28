Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LpK3hLJd;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fLLRjBZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yr7vo+fVBon7I3trLOUfnB9wqi3Kp5C3SbSgaKixCUs=; b=LpK3hLJdqphXGq44QOLwRI7kRd
	xVy+x/gMNsVKkzOBvK4i41RAaJS+Zppg+tZCRA6N5zU9aDLvRIZ0QW4rHNJ3iKgz+skaOvNASTh44
	WD0bwHfN1GSxjqtGQolwPi9Te/EUERQ1qo9QGNhvAO8l/8n0Dw7TgJSzJOMTdOaKHM38kpRM2gtPZ
	y3gqr0GKHXp9A4WeeV+XajqMw1chxzY33KqlA+EKWZrQ/lx44qjn45+/gYjKbVrRqLoSmwIV9le/v
	PKp1Cwvl+1zFMkWRuOGQjEW6/UKVdnp2FICaJn4hZQDJtnEB+8JFoqzAbXhzI/kPB9MF0Jrunnjqx
	AIisrZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM08n-00000006gfI-17kt;
	Wed, 28 Oct 2026 09:40:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM08k-00000006ger-40qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180415; x=1824716415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmTJDFG1OVFNRYcrPeKwvBgsRAc5MJM+e8SIzVNVGsA=;
  b=fLLRjBZ+p0MHtXpXliHf40fJ0R0RThQmoXTWywRa+U8/kfjXVnoBi26f
   LvOFXco6Dhetfj+lCy5MEs0QIdRHdplfppple/O+ppUFp346u1e/HoneJ
   zDS3GB4GtTLj1Cx84hSGRjnDicJy3x4td4J4pi+N9LsAjhNjDtqwyygDh
   cr2Xz2tlmugb2/N2AZgKYxcnL71d8ii7cgmlwVgEnwGZJuMKGbPu/pDAH
   5Flf+ARICNQb0KTPSSfsRsQe9uxvUoJgUw2eEs64Yj8Vp+f57yl85A/F2
   wT7AibM8LXEnYjkgCCgHgLj4aQcmrEtgM1k/782l1GAYCeqMnnjDkASTe
   w==;
X-CSE-ConnectionGUID: DVo5E4+QQkasagV8YEXbzQ==
X-CSE-MsgGUID: Jwaa4vaTTzK5NVGeB6cJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1788425"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1788425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:40:14 -0700
X-CSE-ConnectionGUID: PKQU2Xj1T3m4vmaxgjChxw==
X-CSE-MsgGUID: hrIrWirVSpeNIiBVTI7E7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4805839"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:40:10 -0700
Date: Wed, 28 Oct 2026 11:40:07 +0200
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
Subject: Re: [PATCH v4 1/5] serial: 8250_dw: select port setup through
 platform data
Message-ID: <auHC9-louZoF5Nlk@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
 <auG4rIHPQZXKOd6j@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auG4rIHPQZXKOd6j@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_024015_040777_584D827F 
X-CRM114-Status: GOOD (  12.10  )
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

On Wed, Oct 28, 2026 at 10:56:20AM +0200, Andy Shevchenko wrote:
> On Tue, Oct 27, 2026 at 05:05:29PM -0600, James Hilliard wrote:

...

> > +	if (!IS_ENABLED(CONFIG_64BIT))
> > +		dw8250_setup_port(p);
> 
> I believe the Cavium OCTEON  is 64-bit only platform, so you can just drop this
> conditional altogether.

Yes, confirmed. The only single ifdef is required when we use __raw_readq().
The second can be dropped. I will send a patch for that.

-- 
With Best Regards,
Andy Shevchenko



