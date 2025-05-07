Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700ABC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSSBaIc7lhetg1q7OBdHszfi+q4yGeQ3FVIW9kdOhfc=; b=azyXcRPLG9xfNq39JoLmtc08Ty
	DiM5+VEHieHjBFt/0LU1C/kFw9MHY2GfYae0mdPstf7o1/Ag6hkVZUVbWBMRZYMNFdBhK1VzbrbfG
	YsEKB3RDcBsZRbclt85SJPkUqn5AxowPzR4nrrwP4K1r+lEetFPpQbi+nu5lwDpXQKiWQzXGKOI2r
	EC4SSapDltN4ffnXxIADooJ5qogSd41i/b5cqOgDgknvAa59t7ulZ4bpyVBW4JSQn9WmWQz7g1ygC
	S+u73IWTCBxVAT/Yz/fxR6kWDdNaZ3k/BT9aMU5ktsaJf+imyFMFD8QGnzfkchhVwNqV3i5TtvtAa
	8zZd0gFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgja-0000000FypP-2Cjo;
	Wed, 07 May 2025 15:30:58 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgBd-0000000Frt7-3i7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:55:54 +0000
X-CSE-ConnectionGUID: LUzgsxRfSXaZxE3RaKQYYQ==
X-CSE-MsgGUID: j9BjXDu/QNCH+rVy60UwKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48381503"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48381503"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:55:46 -0700
X-CSE-ConnectionGUID: 4ZO337GzRVuRNVkfTZ2zdA==
X-CSE-MsgGUID: d0ykZMZiTeiZdxGpT2udZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136908212"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:55:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uCgBQ-00000003lHU-2h4G;
	Wed, 07 May 2025 17:55:40 +0300
Date: Wed, 7 May 2025 17:55:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: ml-ioh: use new GPIO line value setter
 callbacks
Message-ID: <aBt0bFTPUK3qh9H0@smile.fi.intel.com>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
 <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_075553_952433_23CDCC32 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 06, 2025 at 11:01:55AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



