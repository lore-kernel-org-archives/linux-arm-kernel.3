Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0CyZJL7x;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1POeTUT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4Opxk4J3P/lQRYSzRzcyGA3GhbNDdUkf3ywTfHyPD5I=; b=0CyZJL7xHHAdCwTWn8ipVS12j+
	O6vKvW/LNUY+1QbcxJcPTnWgUl241Pv9JaSifqdlUFH8AQBTMDvYVtjUm6S6z47gHHG9G2ulmbPF9
	cJmi4xgQk/Dgcqr6KXLTqauZTU5Ia23h0wHGMUpRgL6aHxH2UQ2VJHsknYlebiylhDoKAHf8KXTw2
	1yN7pyONAf/RPGcXv1gqI1+F+yNKn6kXi6Utz+vaz6KIqfCRNv1zG8Dv2oQqjG3FjPm0zbqkh7F0j
	JWjjOgz1W17+78y+ZNjrW1n4wvXv5O0sLLiidXAsaXCfF2jA3v46clPdnVx0u1fB/wFcBYJKsLu2Y
	7Z1LNJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM080-00000006gYK-0HLM;
	Wed, 28 Oct 2026 09:39:28 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM07U-00000006gRA-0dEH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180336; x=1824716336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bypaJ8cdN/DdWj3569Ofb4Ox5IIISGZCyAhXfZcSDWs=;
  b=l1POeTUT10RAH8l4x3l5iUUYlF9LFWlTO8F3N2HK6j5asWXWYrnc3tP9
   yCtXgSujteg4xvKJQw/FR2hnIXepAzhnxhqKJ0o1639ySPPGLqbSYxFaV
   gqbzD7tWtyNsIjvnt3CVRGiq7PN6gwbghg4QE8zgmYJeb1yVPrbEnhLoJ
   WED5pHLMod9JRCMiF3ZBS6ph2E3g0x5H/FdE/VfhQO0R9Z09LrR+M7flu
   TYqCap/48SYzP6DqtKw/Tg4ZShlvdDZXXJumFPUGcMURcU0zZRRpdWVv1
   tqAAKLWCCYkIJU45VkmaiITQoQIw/Rzg/RNJHwrP0k0HOC2qGLc0NS8h+
   w==;
X-CSE-ConnectionGUID: 9zlue+iqTcmzH/hiTnLtrg==
X-CSE-MsgGUID: eaN1AyslTXGCPJOqKoKb6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1909720"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1909720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:38:55 -0700
X-CSE-ConnectionGUID: IcTlcG6QQJ2R3jBJHMmH1g==
X-CSE-MsgGUID: ugfwFS9kTnCQm0j4AQ8Pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4725820"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:38:52 -0700
Date: Wed, 28 Oct 2026 11:38:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
Message-ID: <auHCqZ8_SGSknC_n@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
 <805ee11d-c385-f509-456a-35205d8963b4@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <805ee11d-c385-f509-456a-35205d8963b4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023856_371031_E8F682F2 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, Oct 28, 2026 at 10:30:07AM +0200, Ilpo Järvinen wrote:
> On Tue, 27 Oct 2026, James Hilliard wrote:

...

> > +static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,
> 
> This looks way to complicated to be inline function so I think it should
> be kept in 8250_port and exported from there.

Fine by me! James, my tags I gave in another reply stays if you move to
exported function.

-- 
With Best Regards,
Andy Shevchenko



