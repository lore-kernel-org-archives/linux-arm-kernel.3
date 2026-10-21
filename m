Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qXZ1JgDr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XEdg3YyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZHhvUFusfypBe6CsTjwmGtc9b99XDIJ0VZhK2ZvLFI=; b=qXZ1JgDrDj4nnFFmiZiKfLGwr3
	aNmZROUGBbiiWDV9x/X2GX6YIlxi/bxHJeHZBnKX8e3q5SFLX5RwUKPDKEu3LZWptAyW3ftws99pu
	N5OhE2cEg/+ncTsFuGviySlqjaW0zzn4JEF05y7QkiHbGx4i1lQ4zlSXZmGXLQbMEP9TkVqXU7b4J
	j2ZLRBA0kdd6SbMXizQDgsWQE5n8UW7geARiq3yzRaFhRiID9NwTTovCY/ZqRbqtJIhZH7iVCCSQj
	zw84E4rlYPwmHvaZSWh973+FFWX57YmhTyhBz1nXnXMatrUUwgNzwQQ3qItH6maOwaBxineca4/Ly
	liQsPFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYMI-0000000CHDh-3pm6;
	Wed, 21 Oct 2026 15:36:06 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYMF-0000000CHD9-3qWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792596963; x=1824132963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HsIFHqOoewiHI3/nH/Ctq+4QfATKLpJxW4Tp8y7fuz0=;
  b=XEdg3YyTqzKkaLSGQtltoR4rb+5zqM/kve2D0zJFwMrnf27xrBb7auPE
   zaXFfcl+bQB3TgJKZBaWJId1bkPFcAGX/g6yAVzkZuK61W3mGQjeeN/d4
   yZ3DQydf8//QEPnUdZz1+7bvAa9GgN7ImX3mqfw9JPO1nQ/5/psBHD8RT
   TmxGy4hfX6bZneF7ohGuyfvTrm7CC75PI4wSWLHldpXqTTARMhpU4qUkw
   4tCnknwoCl6g6OVbCLuUOSY3XpTSsO1/MiKwJJGo3YJT37Re9sxCB5GXE
   IBZusbV+QBcRRom9ZN/UnVZ5dDifX0Bhjh6YOlN9u+RPE4+spKH78i0Ul
   A==;
X-CSE-ConnectionGUID: TcWf755tQ0yAIBNmtKH0fg==
X-CSE-MsgGUID: AoftGJ5/Sq67sipuzsVoGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1325001"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1325001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:35:06 -0700
X-CSE-ConnectionGUID: TT0ERoC8Q/ugkw4XVOyFBw==
X-CSE-MsgGUID: tUGEurUCQYG6eqD9ygyXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3064106"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:35:02 -0700
Date: Wed, 21 Oct 2026 18:35:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <atjbpKxrW7x7Ohpq@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atjBsoY8mjGw9fQ8@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_083604_034438_2D9DE207 
X-CRM114-Status: GOOD (  22.97  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:
> > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> > > >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> > > >> <andriy.shevchenko@linux.intel.com> wrote:
> > > >>
> > > >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > > >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > > >> > small series we kill gpio_request_one() and leave only two legacy calls
> > > >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > > >> > a few users and high chances to be killed soon as well.
> > > >> >
> > > >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > > >> > with possible immutable branch for others. Please, ack.
> > > >>
> > > >> The kernel is clearly a better place after these patches than before it, so:
> > > >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> > > >
> > > > Thanks!
> > > > Bart, anything needs to be done for this series to go in?
> > > 
> > > We don't have Acks from MIPS maintainers. :(
> > 
> > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > the changes, please?
> 
> sorry, I was on vacation.

No problem, we now have more time :-)

> I'm fine with the changes, but I'm not, if they still apply cleanly...

Can you provide your formal Acked-by?

-- 
With Best Regards,
Andy Shevchenko



