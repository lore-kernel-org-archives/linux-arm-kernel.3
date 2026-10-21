Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9331606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Axh+Shuu;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NC2Fk8+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH+tj3qwGYrTAo3UEfrdi4pIkMsrOAs19/q+eI5TIwo=; b=Axh+Shuua4g/z0cJGXNgiYZrVn
	Ars0LQQg65FfaeTcIzw9bp9033LNk5rkexNgtYS8vGXGz5xRw1k4Eq3V3y+eUONiUPCtOgvD+Ttg/
	3gZXI3tYntU/Qg4KSJ2zHJ8AUtqeNaMtLMheec8jtSpdAPoa0eu/pIkcISJPJICoDS1N93W73fb4D
	CxYyUCt8R4luHthRTLIFA4q/uOZ2V7DdE8LmsV/ZaS7gn8hA/RukY7KeIUKSa0PrlZJjvd9NnYoeM
	ycHzeNYDO6yJp5pVDKtlHOmrkOh/QvmiAH7GSdYGWLaMxCWoKusM8XTjNLMsVq+HbYha5Ob79WBPN
	R2tpm8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYaA-0000000CJ1J-43gy;
	Wed, 21 Oct 2026 15:50:26 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYa9-0000000CJ0d-0oUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792597825; x=1824133825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zq4wmiZbxWqtchaG+x8w3e154PofCX54MIWAg9+VRSc=;
  b=NC2Fk8+6LVjGD1HuQxAfMArOOByCtZaqXuUnk7aHY/CPiF/uyj9Y+Q04
   sHQwuQ5NGIuUA5f+XXBM4YXUpjgyPOvcHMNN/aoXyR8xF9C0YCbkQh9C4
   Yti87M0mi4v35sWXP8iWmZAz4Ll4NW/WCJIgxBQNzIu6lOiqqwH7HSUQy
   bAF033YExUkUuN60Tf34lg/l/aW4SPmuvlQWzTQirKEICgz+8SRpO6RLQ
   SswEKT3+KVmmjKmSj++F1VNrJt0kxppUMwen/MfuguGSKvvlB/Wg/gbRo
   lmkQ/NJcjyWSaOpXf/Wli/SxfPn05M32tVTdzP8GUFkRNYLIGsuDBBFfH
   Q==;
X-CSE-ConnectionGUID: /1BxG+ugSAG9X2YLdYTe4Q==
X-CSE-MsgGUID: r1Be6M5yTTaFe1T1wjey/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1200487"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1200487"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:50:24 -0700
X-CSE-ConnectionGUID: lBnd6AaxRv2xcIJRJe5Q1w==
X-CSE-MsgGUID: PKTA8ELZTbec/ZPagKbXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3519426"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:50:21 -0700
Date: Wed, 21 Oct 2026 18:50:18 +0300
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
Message-ID: <atjfOrjsxnKe80zh@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atjbpKxrW7x7Ohpq@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_085025_286297_931992BE 
X-CRM114-Status: GOOD (  19.70  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:

...

> > > > > Bart, anything needs to be done for this series to go in?
> > > > 
> > > > We don't have Acks from MIPS maintainers. :(
> > > 
> > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > the changes, please?
> > 
> > sorry, I was on vacation.
> 
> No problem, we now have more time :-)
> 
> > I'm fine with the changes, but I'm not, if they still apply cleanly...
> 
> Can you provide your formal Acked-by?

Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
Next and there is no conflicts.

-- 
With Best Regards,
Andy Shevchenko



