Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC27C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDFgvpxeNH47zHq3fHRhSdiyobaPeh1TJdswOnDN/Yk=; b=nVgx0J4MyIEOlIw4h5PQl0046o
	/Shb95l7PTrZWV4yWcbKzeNU1nosv2CUnNsUxI75qmsGhdFFRNfjBf59nwTd5qUuUXR6LKVYPlmG1
	e+2QhVI0ISqCTmkHL356Kl+ptAnXgYpflNNEamAw0lk1bFWVEdTMPW+zpfMTU7kuPxUdMHSpyDSiV
	HoHy4K0iuz7hi3fQcn3CyflTkQGoWmB5Wl1uQZFSDDBOpZAboSIpQJeDo9d14wx5ABvpicQIC3aiR
	a863uwEowCZp68ed3oeTQkUVi6dDf6WfV4RNyQ0dQmnZyKiG4rRMtqytcP+3Wh0d0aZGpHB3XFCou
	AWkxIMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSDz-00000008Kp7-2lAL;
	Wed, 09 Jul 2025 10:40:27 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQNV-000000080JN-1YoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752050529; x=1783586529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3XPMV1lacpivhZnrO2POSB/TElhb4nz0PFA3nyPNTak=;
  b=XipEfE1gk6P9LgirI1rY3IL2RAGkDkThVUC7LvnwgXZYkPtHecSgwqS7
   k9EleXx5PcGNlBMSJwZof1IuQz2pMsb/5EQlXFyqSCzgZ9ghSfL94+L6F
   8cHpvbbqdst6XJmuFTEIpScgUjknSzKHB0ywP0ZuqwDtQJQ7Ol02bB/uY
   bUE0EDOdtY1dAjkAuDQUWOHMxf4aNAcq5Iv0qKiaG/tUDe9+ywMq1akU0
   lqct2rIJif26SeSr/NuHx315h7VHQK3fo/4uyP+zNzwG+rjLg511BpWKs
   Cxx2Ok8DLm5/wkLxe2GwRy64EwNHNXLlbzDvTU9lvKDN5jsuYCAIB7LC7
   Q==;
X-CSE-ConnectionGUID: +uAMy1ysT7ahH4va+XOOUQ==
X-CSE-MsgGUID: 4Nu9TZNpSNaNfLVjAQr8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65365755"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="65365755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:42:05 -0700
X-CSE-ConnectionGUID: Y26OhDB7R8WrLKKzVJ3KEw==
X-CSE-MsgGUID: Q5veKF8tRZCRNUSvKVy+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="192906534"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:42:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uZQNJ-0000000DoM8-2nVm;
	Wed, 09 Jul 2025 11:41:57 +0300
Date: Wed, 9 Jul 2025 11:41:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
Message-ID: <aG4rVW5m6HSnSJnv@smile.fi.intel.com>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
 <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_014209_476710_F4FEC4B5 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, Jul 09, 2025 at 11:32:40AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 9, 2025 at 9:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> >         if (value)
> > -               regmap_set_bits(wg->regmap, reg, 1);
> > -       else
> > -               regmap_clear_bits(wg->regmap, reg, 1);
> > +               return regmap_set_bits(wg->regmap, reg, 1);
> > +
> > +       return regmap_clear_bits(wg->regmap, reg, 1);
> 
> return regmap_assign_bits(...);

Btw, since you are doing sometimes two patches, it might worth to have
a prerequisite that changes set/clear to assign and then your patch will
be cleaner.

> Otherwise LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



