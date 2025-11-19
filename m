Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F3CF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TcFr3h+LVihu/tOI/ieqlvFNy3rp771LK1996Wp0Kc=; b=r3YkxM373hdQ78loKcSOmuUNNR
	UegAzwooSerzKJHEwjwTnqGIhMauewG/SURLQWld5k0K7zCpF25pNpBUTg4OUxLnH94i9ZKRwLDVM
	DuEEO7spePOwhI+GpB0G1HZXnPjaGZTJFmt4OBqbvuo67nSrwD7qGrNWienwKv1V5XVnbnajQs7Bi
	VlzGo/H4bxD1lG92JjEJ/zIKOguGKT60DqbOVB2NeVazxbQhnjeb/0IUbkBOM3inW0feRoZPdT47A
	rQF+ebRQF3Y1Fk8mmkh68FIK6IgdVFh3k+ZKfz8+n73ES6LZPizVwRbIrIli858jssXfsVNElC/uc
	a+J4ZLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhn1-00000003D8U-1T78;
	Wed, 19 Nov 2025 13:00:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhmz-00000003D7f-00ql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BB9F41A37;
	Wed, 19 Nov 2025 13:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5858AC19422;
	Wed, 19 Nov 2025 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557200;
	bh=G5xOyYYZxALWZkH3/Ty9TlHQ4sn9EtrWTd/CD0Bb0X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWihpCfKkpIVKL5tDSd0kx+Q90HusOdDbd+2zTLAf4hf1QDNiAuRlzmr7CHwBwtiX
	 xDa/iUgMFEsSNpB15VQbZAhQd2xpf/79xZV1+3NiqlEwyTc+DAE/J94BH3hhjUWcI6
	 Xnta0GH41LmlPZUb+8AIReWdaB774KxkOTRpPDHY1Ec1kyQ9Ah2fbULu7X3EF7DfED
	 bEdjtuHYPbaAlGgO2cOmP6Zc22UGpaJQmkfr1gwADbefGlZL3KpNh+HtNd4X0DhJz6
	 x7BQ8d7mJ+RNjzYb/phsZBnyp/Jvd8RqRnpyJZp/ZjORIhJI5z2j1BbyhsCH9xiROV
	 bCUhL9Cd59AAA==
Date: Wed, 19 Nov 2025 20:42:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR27HcbvUgvCEK2Z@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_050001_065288_C4A9975A 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> >
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> >
> > The dwapb_context structure is always embedded into struct
> > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv
> 
> SLEEP
> grepping
> 
> > dts dir, the max port number is 6, the berlin2q soc families, so this
> > means current we have wasted 216 bytes memory which is trivial
> 
> currently
> 
> > compared to the system memory.
> 
> I still think the embedding is not related to this change and should
> be justified in a separate patch. W/o that part the rest looks fine.

I got your mind now: it looks like you prefer a seperate patch for the
embedding. Let me explain why I have the embedding within this patch:
the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but the
PM funtions are still compiled, so w/o the embedding, it's impossible
to clean up the code with the modern PM macros.

