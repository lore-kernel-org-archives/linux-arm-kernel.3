Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE364C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfG8oDF/1xfuwIlPa33zocKwhCoNwlP0Owke+vJ4IoM=; b=VRdbif+p7+Y/OfFZ70swgGtNHq
	dfaJWr2gvoLij1nCBQmdCnl6vMc2BGXpH1KnqAF0mge9LsnVyUEYXr1popJq9VM1Bn5KNrEUCPGA7
	Mk5ZGJqua8Hg87QFnkTvTE4Pgtpp2PVWy1oTZiyZaqz27pCTnTi5y0m3LPKekMzp0cwC2pHpJtEiH
	al5M5irgh61OmcsT/kg+TggeRX/F9741wl17cxTxFn8c8kwq2xrffnTe57eRBu6htYQyS+Zi+RyJA
	gDpoG2nXSPbuieI7fVUIVm/32rqmxd9h+819rpFP/7Eenm7q4JN3uQxGWBverfOuEUKKw/ojJSd8p
	6lxQ2vow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBZk-0000000Dm5n-1lF8;
	Wed, 13 Aug 2025 13:31:32 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umB7b-0000000DhnU-41Fc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090148; x=1786626148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UrNfwORQz/pjonuLGQ/m/+0Y7ZK7KSJP6xwUgBaSYEU=;
  b=VZYtFpfYmO7ECO8HxhHTO/jVjc519CADScqaAa9c1Y0Z5rUFWMOfZEB1
   EArIIX8oYvRZER7pzzDjErOsqlbC/VZaCxeAFqlTO+cZmlReIq+ydj7Ts
   8caJOsPYpzKj1/hPdo7OqsYoC2JoAOWd/5cmmIrLx4khLT4WChFu1wNdq
   BW/7BnVVKrOty3mhRWQleethM6EfIOe8a7pfvDBhSgFpgh7nK1JU6t4rh
   Dm8CHxieX+nUa4hzmZdZtIyY7mipGtANcsTyt2YIbgGs/EeFr/BYfzSpp
   sFQneF2raGgrrSbkXe0uJ/kH0z+DEuBcBEx8ld0yq6t01X4DAeWnxWip8
   g==;
X-CSE-ConnectionGUID: optOYaAUQW2YYHYWArbnNw==
X-CSE-MsgGUID: 6FvIPbhrSluobeipNceI0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68757648"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68757648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:02:27 -0700
X-CSE-ConnectionGUID: P26DlPJmSKSnJKimNPvhcg==
X-CSE-MsgGUID: eE8ENaBWROa8sRBaVXMLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203643671"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:02:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umB7U-00000005RKR-2yW7;
	Wed, 13 Aug 2025 16:02:20 +0300
Date: Wed, 13 Aug 2025 16:02:20 +0300
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
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
 <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_060228_008026_0EEE3041 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Aug 13, 2025 at 12:13:26PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:

...

> >> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> >> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> > 
> > I didn't get this SoB chain. Who is Imre here and what is his role in all this?
> 
> Imre reviewed the patches before publishing those, but we were unsure about that
> the Reviewed-by tag can be used when it is offered privately before the
> publicaton, so we decided to use the SoB tag instead.

It's exactly what should have been done. As a such the SoB chain is confusing
(taking into account the authorship of the patches).

> It can be changed to the Rewieved-by tag if that is applicable in this case.

Please do so.

-- 
With Best Regards,
Andy Shevchenko



