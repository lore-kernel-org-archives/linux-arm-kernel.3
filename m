Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C134CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2tHDy55HOk9ijWDaN+WcgImYxYAQUJs9dgbDmjxfPA=; b=WgWDUep6ROu0rCUPRaYRzGf/iC
	4Z4OLBBhuHuIjG4E9jDlqt+jkMwsep79ouZP9ineICblQQZBSSLfdFCPEjXQv2jqfeTj5/53okKaG
	/7Tl0azCRZ2RPWeXE3qbzHdpUIXQdSlvgIlAR9ex2ADTmVPIiprKZ9c+1C8iEc2GZWeSjFKZT68xn
	1T6PSBjixK+jnR8F3XcuqFNDTPmxj8Wk3wS7lV4cK764LgyWOdVBqsskePf20ZoT2DsbHOi5DoTHw
	KsxunxZJYTqVk3oYM+STCofZtIWu1t5jPC+o+obQnoZ06XgPD7e+brN1/wMt4LICwls29MFPrsW/q
	xtw3rfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBSB-0000000DlEU-3ca9;
	Wed, 13 Aug 2025 13:23:43 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBGP-0000000DjAG-0BGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090693; x=1786626693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q8TIZHVsbpGiRDf0kANTJMdQ12mBUINz3XeIl5TqG6M=;
  b=RxEgLO6qTdht6eSrG3r7qsqxy5aQJOzs9J9NdyTL2tmlaYH9JvQkE/vc
   DlCk5j5UGlnBwGX10u2Dsz3niY1yVhrsTbWSdGFpccAHizOJCpc0iAGbh
   Jm8ukuYNjT4cH9TMKkkOo+/tkkp8onJT50nh5bz4obOoI5IOp8yx/WMpL
   1cUcTCLXLGZZND2D0vBAf4P0Aviit2Z3wECT85ttweHVTXghMgW6qtTbB
   NSK79JnEOhH8jyMT24O+CVjIgq2CnsIgm2PJJgCzmNpSieGdFZRfQ9/D0
   qbOPeIhHCh32r9hrxfqwHhCvy2TQgyzhLPzn4DFwKLO5T9+/tXm6DnJr5
   Q==;
X-CSE-ConnectionGUID: U2ItcfFiSESSrx6mpcfsww==
X-CSE-MsgGUID: Ky8wz1NUQMK4tUZzpFf/tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57304121"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57304121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:11:31 -0700
X-CSE-ConnectionGUID: cMXgOAqRTC2XlX23mmY/7A==
X-CSE-MsgGUID: sRK+mKWDQBuKDzCZdZkvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170680302"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:11:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umBGF-00000005RPp-1iZD;
	Wed, 13 Aug 2025 16:11:23 +0300
Date: Wed, 13 Aug 2025 16:11:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Message-ID: <aJyO-5k29AAAnHdz@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
 <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061133_092463_06BA9B0A 
X-CRM114-Status: GOOD (  16.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Aug 13, 2025 at 12:50:35PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:

...

> >> Note: the patch is included in this series for completeness however
> >> it can be applied independently from the preceding patches. On kernels
> >> 6.3+, it restores I2C functionality even in itself because it recovers
> >> the controller from the bad state described in the previous patch.
> > 
> > Sounds to me like this one should be applied first independently on the
> > discussion / conclusion on the patch 1.
> 
> Yes. At least the users would have a working although not optimal solution in
> the meantime.

Then please reorder in the next version.

-- 
With Best Regards,
Andy Shevchenko



