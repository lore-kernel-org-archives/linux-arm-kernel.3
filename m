Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48040CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bGgLEC4Y2qlseHkvna0hra+hr+kYp5vS3lM/haR5zg=; b=tT2NAEvq7ftAfgoxX8Acgroyni
	mC7QB3OGMz9GLnmJZ+IWuHsNAf3UDXOR6XTXcC1nKZVKc/RFRP/y547lqlMXcYwtVkVsghxpqG6u6
	9rzI0UF9y6+ATbyE88hIFwayVWBYvQ0asUlCgWBvL8p4n59BClrmuIIMPgYJevGEUmIyUwVHz3/Cj
	2+ZXTJyfURRrr5OLukhnafoKrGFxudjCzekomNOX7fGpe7sSVZJKnt5K1THjcODd6LIigG6+dAfwb
	S8DZQhkiJLUptqpw45+q01y9mpOQ4TjYZjfSgtS//v7o+5cmrhjZr0I8hf/Uo0ggeYrylxGnBhNSX
	jiwvw83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxO-00000003gpo-0eTg;
	Wed, 19 Nov 2025 16:22:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxK-00000003got-3aD5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E49D560172;
	Wed, 19 Nov 2025 16:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE20DC4CEF5;
	Wed, 19 Nov 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569373;
	bh=bOZ9VsSLadY5qHCWXIgDU1673Fh1ooGTdtfaLRU7ric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOuK7cMwpmvuXliCZLru5zWoT3DiuHH19HM0Sj1lBHvCADMIe+LOuvWZvnnRe7uxn
	 W4o3tNtqHTTniBp/XDZfV5D7KOp8JZgWMMrOwN8VPk3SD9P7Q1Bozzg3QXgaX1yeC3
	 0KLkLM5QaQEQ0anjvmBdkKU9SivdjkXyC1cyQspMe3pE18XxzJ7VyrpipXlOFyEQgf
	 bkQlZNs/3gRPW2DAcKxdGsAuzndK7PhE+0ZhkKi1EUBLduJV5S+OnPFMbRuDX+KPKD
	 dVc1EOgYqromm9CHjpHb4XGAKDKU0NL//zhcBYX76TpJa/Wa+eMcTSVKjAhhEkri0k
	 a6lsM6e9dXfRg==
Date: Thu, 20 Nov 2025 00:04:58 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Doug Berger <opendmb@gmail.com>,
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
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3qqkgdqFS6dlf6@xhacker>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
 <aR3niy7_jwzQSJ33@xhacker>
 <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 06:11:53PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 6:09 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:
> 
> ...
> 
> > > > -#ifdef CONFIG_PM_SLEEP
> > > >     struct dwapb_context    *ctx;
> > > > -#endif
> > >
> > > But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.
> >
> > the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> > functions, but those functions are still compiled, so if we keep the
> > #ifdef, there will be build errors.
> 
> Is this an expectation or you can share the error, please?

drivers/gpio/gpio-dwapb.c: In function ‘dwapb_irq_set_wake’:
drivers/gpio/gpio-dwapb.c:368:51: error: ‘struct dwapb_gpio_port’ h
as no member named ‘ctx’
  368 |         struct dwapb_context *ctx = gpio->ports[0].ctx;


