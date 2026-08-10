Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC5BC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbpsTBGh3lADCL1zo0uhFPFIDxKrahOaQNcKSHdw/Kg=; b=CoYB6caLihREJwV5T+61xTnX3x
	dXPtLdgkHFmI1GQe2bXnazMnzdfe6nG8AlNbYuE6y6sGSk6HhwHkISDpex4eRdSAJhEOMoFtG4G5N
	gtDaJV6715PVCr4yRX/GjBfKa42M90GezjrNWoHpd5udA6PxcWzWerOQy3kuFpEm2xDfwjH0lUpEM
	I4gnEKfX5qStYyjrLbnEXzm6UXp8r/I+2JL00WMwtBoegUOqIAnT6DEkOdtyLdV/IedycR8hNul8r
	rkdwJ77k7Dk3wUaskERO2Xust7PUcG2o/4JRAe628XUH73JBlpyYUWQuZeQ4rbwQ/fUnUNE2SshVp
	offFLlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKV5-0000000BCic-1y5W;
	Mon, 10 Aug 2026 07:32:47 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKV2-0000000BCiI-3mx3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786347165; x=1817883165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3TGFlPgAJB1XJ2S22zKpSve6oasatRD0oXn0iV6g3Io=;
  b=kpoFHrLNr/jGUzHPHzJ2cKB1EZqQc+a6kGJ3hNlwFCFROwy3WbXk5jB8
   8udIHE/m4pWW8ZBl5jzJA7+gHP6Afw8RCz9kpZLY838BGItg0yec3Zjk2
   N51ZmLnCr4/DsUR1xFy1HtI9hHT5msHAjd8gpU72V/07GlN4NgUbECd3I
   l8hxhhFMdmVatZE42clUBy1LguD/LrEayTkyFUMn6x9zqqkE7gCdM0eNT
   sUrA54QqJ4bdxZOmtzNCHkT15o/FjtF+bSOadglalNS8ip8GbK1qOqW5l
   eqihQmYHU94X8vYD/wwe9cTJTVICD/CvL5a2ZXiJSXXfx64I1w5c33Udt
   A==;
X-CSE-ConnectionGUID: yW6j9xhLSreVFCymh+4Y+A==
X-CSE-MsgGUID: BNuxChDqQoOpka/hhPFdLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="90738860"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="90738860"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:32:08 -0700
X-CSE-ConnectionGUID: qBB2uY2ORJCTa/sU/SP/CQ==
X-CSE-MsgGUID: 3y0qq3kGR1OUDo6Spn0cwg==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:32:03 -0700
Date: Mon, 10 Aug 2026 10:32:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <anl-cYX-wUQr_Pvb@ashevche-desk.local>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
 <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
 <alnpMFK6_ZkdWlLi@ashevche-desk.local>
 <de947dc3-6d02-43de-a9e5-7f1e950231b9@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de947dc3-6d02-43de-a9e5-7f1e950231b9@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_003244_983662_11FF6996 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, Jul 28, 2026 at 08:58:10AM +0200, Petar Stepanovic wrote:
> On 7/17/2026 10:34 AM, Andy Shevchenko wrote:

...

> >> +static const struct regmap_config axiado_saradc_regmap_config = {
> >> +     .reg_bits = 32,
> >> +     .val_bits = 32,
> >> +     .reg_stride = 4,
> >> +     .max_register = AX_SARADC_DOUT_REG,
> > No cache?
> 
> No cache is intentional. The registers represent transient control, status,
> and conversion data, so accesses should always go directly to the hardware.
> Since REGCACHE_NONE is the default, it is not specified explicitly.

Perhaps add a short comment here to summarise the above?

-- 
With Best Regards,
Andy Shevchenko



