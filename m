Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED51DCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nw2OofHpblVcdJ2j4tuRfgOcs1fPbWOJnXy8DzdEw8=; b=wqwz7734ZeG6tsTunojYNGQTOo
	phNeaQn4DyMRj8tm3nuHBOejHtOW9TXd+zk0KnhXV1DwKla00rbUfjV05549Xi6n7DZXcIHUjy+Ev
	T3KdO+OIg7jM+Tf14fWgoeTfHLEJNaBDqEH+l1wuXRKLRuTOipkk4HPj70YSZFz6/vAZY1HGQEgwe
	qgz5bEy/03q2P/7itPvlFoXJSnnEoeSPAN+t0MEBmarxLmMB6AwM0acSy4DvPh523i12k3FkcqUg4
	sJMQvvG31QNzbCok2C/zvWpHLaBTzBTmT5CsjFrGSD70/4TWcANd29DvNQk9N8WhjywPJiyDaOT0p
	9EtQVS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7x0-00000001lJJ-0RNq;
	Wed, 29 Oct 2025 15:19:02 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7wx-00000001lIe-2gD0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751139; x=1793287139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EpzLFVZD5xI2UDK/Ftwn8JnCSoKvTCCWS6Wjlz1OKXY=;
  b=dfDQMlpCqSu2VHXgFtbtHcOAc2LfXaLrrBKWf6gBa2dE3hYTyZ1WURgj
   6L46+Z/c9JU55d883uorOh9sF/QepKM989yfrLc5cT+vGjkathpJpIffp
   r92BAB/oj0et9K89P9oRbKSebltxU6Bh+CIkBpjM4V8IUPigmtTz3oS5B
   v9HSIPLWLNvZx2nPX9UgIt+W1nc+YXTvp7y10fH48FaMxZHqbjTAtXtkr
   YsjVctVKfm4R10AeeV3b/JdaPsk37aWQ3akB5vkTK5PRZ1mQXuSysXQLL
   OAVNVvuFUjvLUfIBUj6oNOpR2+XAXnMD/3vw6X92j6P46kHPgOILbpkex
   g==;
X-CSE-ConnectionGUID: oPj93bs5RTyaKglUJxHmgA==
X-CSE-MsgGUID: TcVmBqF1R5m1NFotcTX4Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51449588"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="51449588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:18:59 -0700
X-CSE-ConnectionGUID: KJvar1HiTFalTC2etZtyxQ==
X-CSE-MsgGUID: 0IvhDGTqSICuASuA8EuEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185391702"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:18:52 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7wn-00000003eOA-15u8;
	Wed, 29 Oct 2025 17:18:49 +0200
Date: Wed, 29 Oct 2025 17:18:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
 <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
 <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_081859_690518_F1852A59 
X-CRM114-Status: GOOD (  30.76  )
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

On Wed, Oct 29, 2025 at 01:39:34PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:45 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> > >
> > > This module scans the device tree (for now only OF nodes are supported
> > > but care is taken to make other fwnode implementations easy to
> > > integrate) and determines which GPIO lines are shared by multiple users.
> > > It stores that information in memory. When the GPIO chip exposing shared
> > > lines is registered, the shared GPIO descriptors it exposes are marked
> > > as shared and virtual "proxy" devices that mediate access to the shared
> > > lines are created. When a consumer of a shared GPIO looks it up, its
> > > fwnode lookup is redirected to a just-in-time machine lookup that points
> > > to this proxy device.
> > >
> > > This code can be compiled out on platforms which don't use shared GPIOs.
> >
> > Besides strcmp_suffix() that already exists in OF core, there are also some
> > existing pieces that seems being repeated here (again). Can we reduce amount
> > of duplication?
> 
> I'm afraid you need to be more specific here.

You can simply browse the file, it's not long to find and think about it.
I'm _thinking_ that it's possible to improve the situation overall by
try our best of deduplicating (or rather not duplicating) things.

...

> > > +#if IS_ENABLED(CONFIG_OF)
> > > +static int gpio_shared_of_traverse(struct device_node *curr)
> > > +{
> >
> > I believe parts of this code may be resided somewhere in drivers/of/property.c
> > or nearby as it has the similar parsing routines.
> 
> I don't think this is a good idea, I want to keep it within the
> confines of drivers/gpio/ and the use-case is so specific, there's
> really no point in putting parts of it under drivers/of/.
> 
> If I could only iterate over all properties of an fwnode, I'd have
> skipped using OF-specific routines altogether.

The problem is that every subsystem considers "it's not a good idea" or
"historical reasons" or other excuses. Since you are adding OF-specific
stuff that has something already done inside OF specific code, why to
spread it over the kernel by duplicating in another place(s)?

-- 
With Best Regards,
Andy Shevchenko



