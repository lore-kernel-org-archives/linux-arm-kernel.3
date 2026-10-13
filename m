Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25C3CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhpzh1R7pHE2ibrH/oLzhVXyWjE77EiAh70/V2MZ6BM=; b=HclIY6XxgP+9brkPb9ogWmaS0W
	eBcZilTA4D1dSoWOXSrE+YtaP+bOPA/0kfhLMl6y+5qTJM56qPK70LT8a0CeYKquRTa7SptbLvcWH
	nIaeKzkV+yGsJLJOSByPfFWlQ0hXcZte83Ic7zus1IGjLS8HI6vyPkxehJ0sjhIWOqGy/b4FKrzGo
	+kBlfHXDxwaS0HLe+aqGiPCSB+I8+ZnWBGvyq9DUbThhA+KRmqJ1iXFt10O6Jwp86e0ZoRLPtoIus
	lvPwtYQSUpmPGEUvfve2raFAk3GYEnvp2MEzYg4F+r6QPd9sxKV/F1ECjlAX74oDl+AR4Kqvci4bZ
	3xdR18nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcFz-0000000CutR-15AA;
	Tue, 13 Oct 2026 13:09:27 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcFw-0000000Cut2-1e4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791896965; x=1823432965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UpLDrnSBhRg6iXoSIzOWUiTrJH1KftLjMwLndDqjc5g=;
  b=cP3bhlOz3ynsvu+BY91bMc1glYxAVJrgMpD4RouwtnfZ/WTtMHzPiVM9
   18PeSl2abyWO5SHkpfMwRyC2yCbGRenrNkk9xOzw68L0Qc79AmKocFPW8
   AUO8HyyTFIRSLy2zVo/ZbqOPEHxqCyrTjY9bc+tolhDXmBzEaS8IFXlTi
   1oDOVVmjd/6rwAYKEqAy9mRf+HRclkL7mWqBM1N7RUOcHl2+lUKtRydXd
   A3EaxyzBc7HIYYe9mrhvxkI+k/07CpG2Nk0K9UeG2gt5PxA0NSc3SsMzv
   zaZkEvo3H+bjt0hYJs8YHaqF2+8fcCaZlK0DDVnp6e42uJCb83EX8aPIM
   A==;
X-CSE-ConnectionGUID: Asq+SOKlRlyUnEKX3/hD8Q==
X-CSE-MsgGUID: sBdNhcjoQ6qPJvvQngW0dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="505927"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="505927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:09:22 -0700
X-CSE-ConnectionGUID: oYbbfUsLQUuknHb9gH/1MQ==
X-CSE-MsgGUID: UOJ0k6MYQCCqCp2CcQRkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1269436"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:09:18 -0700
Date: Tue, 13 Oct 2026 16:09:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <as4tep73cAI57Yk7@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060924_507634_FF884646 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > small series we kill gpio_request_one() and leave only two legacy calls
> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > a few users and high chances to be killed soon as well.
> >
> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > with possible immutable branch for others. Please, ack.
> 
> The kernel is clearly a better place after these patches than before it, so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!
Bart, anything needs to be done for this series to go in?


-- 
With Best Regards,
Andy Shevchenko



