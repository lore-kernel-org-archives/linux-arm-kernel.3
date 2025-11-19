Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49007CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLNIhT97Bl/+ZuxGEHjNcOWI8DMJfq5FE/S6VoowUNU=; b=b5SMeDc96qmsICiBz5I6cOBERN
	igr7I6EAh4JUxZx0B/O4hmSfBSbHDWCSxS4IwzhhVqgDyKwr5oGyXCGmDHXCjIXn2beLDAHqiyyqU
	kFRn+m2WDo39HbS7hXaWuS6PbjjC+pRCUVtEs5riSEoI7ltKjwwIrjYZ5PeP52ql1rzB2OgyJRNh4
	K0GqJ+b+CfCHkORM1M25vtdafyySMNn+FrNmnU17K0XmjK3CcaKYdc7hmmRcOu6uoBcoOiLmW/Vpq
	kE6G0V72ul15nLC7ZfLpA68ItBjcUg8RqKwWgjkoLDy70r6chMnbDQe9DB4KxC0ct7idYXKc75TsU
	5IR8/KFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkqu-00000003eaG-2Jxz;
	Wed, 19 Nov 2025 16:16:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkqu-00000003ea1-0Kt0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08E4C6016B;
	Wed, 19 Nov 2025 16:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC07C113D0;
	Wed, 19 Nov 2025 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763568974;
	bh=hmoxcs1J4r1vAy4hNatH5Of3A1Db8qTiymbbgM0k4C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxpId7TqNXbStVPFHPH4xEAEXkFK5ANyvwq6YrYG6USNEK2ButctKZuoqnFzviN0h
	 tHlJELFs2HsAhqQfeIhIzf1sPz4OHFYiY/AcYEda32CCBu2u1TRjO/xtAeJkc20f/G
	 P137wL/kx4oCSnMenYNrlp4fabk3I3NwraMAq0qTlFE1Sc8/28cj0wg19AiX/IQiB9
	 u1NF2dCOOKRG+aLcuIf/Fua5IsYilvxya4zdfeZmRBJSZ7BMZqUvlrMaAd/sDy7W/h
	 MKKvUUa8wRJS+uoPWlN88AfrRj5gqnemrl0HKxwi73p6M2YDOh83rj+kRH04J8lk63
	 1/x8hkGq9GH6Q==
Date: Wed, 19 Nov 2025 23:58:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3pG7Em5RcRqAKT@xhacker>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
 <aR3mnWQedt7SMRP0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR3mnWQedt7SMRP0@smile.fi.intel.com>
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

On Wed, Nov 19, 2025 at 05:47:41PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > 
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> 
> ...
> 
> > struct pxa_gpio_bank {
> 
> ...
> 
> >  	unsigned long	irq_mask;
> >  	unsigned long	irq_edge_rise;
> >  	unsigned long	irq_edge_fall;
> 
> > -
> 
> As I already pointed out this is stray change. Why you ignored my comment?
> 
> > -#ifdef CONFIG_PM
> >  	unsigned long	saved_gplr;
> >  	unsigned long	saved_gpdr;
> >  	unsigned long	saved_grer;
> >  	unsigned long	saved_gfer;
> > -#endif
> 
> Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.

Now, I know why you commented like these... 
the pm_ptr() and pm_sleep_ptr() can optimize out the PM
functions, but those functions still need to be compiled. So if
we keep these #ifdef, there will be build errors in case of !PM

> 
> >  };
> 
> ...
> 
> >  static struct syscore_ops pxa_gpio_syscore_ops = {
> > -	.suspend	= pxa_gpio_suspend,
> > -	.resume		= pxa_gpio_resume,
> > +	.suspend	= pm_ptr(pxa_gpio_suspend),
> > +	.resume		= pm_ptr(pxa_gpio_resume),
> >  };
> 
> This is not a device PM ops actually. Is there any guarantees on the
> relationship with CONFIG_PM and these callbacks? If so, I think we
> need to have special macros somewhere in include/linux/syscore_ops.h.
> 
> Otherwise I'm not sure this will be a good patch at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

