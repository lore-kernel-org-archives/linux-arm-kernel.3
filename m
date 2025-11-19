Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D177CF34AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSgvoS14gu49AohoIwEK/d3zXXZoTl+e9urrXlCuOVI=; b=zsrOrLrUV9T8rHdId/rNFzC8l6
	fujABqSZpARHKWgcwO/R+DTbXnFe1PubXmhshZ63tmxoBfF4V0EDin6nQ7tbIIQUYFOoXEuLHErn3
	rJCRkYOZ6k/B5pLIk2eGJI49m8ek4UsXmxZCxDPRlFXSTipTCNSWwFO2FyA2F3bHcIpzgLlA+ADAQ
	fAoJQn/o88X/JYKnQbB+xj/gdBylUEIPXLrsRGOwbLyz6XyXPiYT7KnIqSHMEHZAT/1D+ZaWkj55n
	qJTIQ0D76C2D8yky6EUePebBQ6kLLVGSudBHqih0Uo4x+1+w6fPV3Fut28C4AxGnYM9mOmth7u6Dt
	WLQlaCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi3Y-00000003Gey-0k3A;
	Wed, 19 Nov 2025 13:17:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi3W-00000003GeZ-0VpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65EBA42AE1;
	Wed, 19 Nov 2025 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893AEC2BC9E;
	Wed, 19 Nov 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763558225;
	bh=JXSrd7AS3plurZH18pOineLNFbtf/RNitoM8R5NVDc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0QAw68F5WILJt/cARL3GavnTHZwI0glHVNZ7rp0OlqIxcPmZzqszBZsgX4VaPALE
	 v4N5gp5eAhQNn4JvdnhJX6YTYz6aEb1GUfwPQXkuMxQhM8knmcVb+EsRb3acoqD9F/
	 uhhjdBnplRB3p1X2hGZu3flHmX6vsMFIE6DH8s8zOvKuzQW7iqMHNlBwzt7K0VAodF
	 TXlvwSU9j9FT8IIqXPsC9Jg7qutVU+b5HWLrQ42GiPOFmmb7wKgepv56Z3i95+Qf3q
	 HDamHxsUjCNJTakvfTJYRsnD0mCPVKi70bFRN9DZVIJQ9y1CxjGGXPID8nouNub5oC
	 MhHRkJLARfIUQ==
Date: Wed, 19 Nov 2025 20:59:05 +0800
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
Message-ID: <aR2_GVi6E5gLeS47@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
 <aR27HcbvUgvCEK2Z@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR27HcbvUgvCEK2Z@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_051706_220993_26DCF79D 
X-CRM114-Status: GOOD (  28.25  )
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

On Wed, Nov 19, 2025 at 08:42:05PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > >
> > > This has the advantage of always compiling these functions in,
> > > independently of any Kconfig option. Thanks to that, bugs and other
> > > regressions are subsequently easier to catch.
> > >
> > > The dwapb_context structure is always embedded into struct
> > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv
> > 
> > SLEEP
> > grepping
> > 
> > > dts dir, the max port number is 6, the berlin2q soc families, so this
> > > means current we have wasted 216 bytes memory which is trivial
> > 
> > currently
> > 
> > > compared to the system memory.
> > 
> > I still think the embedding is not related to this change and should
> > be justified in a separate patch. W/o that part the rest looks fine.
> 
> I got your mind now: it looks like you prefer a seperate patch for the
> embedding. Let me explain why I have the embedding within this patch:
> the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but the
> PM funtions are still compiled, so w/o the embedding, it's impossible
> to clean up the code with the modern PM macros.

For dwapb, I can still acchieve the clean up w/ only embedding the
pointer. But I'm not sure whether embedding the struture deserve a seperate
patch.

BTW: as Michael mentioned during v1 review, the driver allocates the
struct with kzalloc and stores a pointer to it, so considering the
pointer itself and the kmalloc overhead/alignment etc, current gpio-dwapb
have an overhead in the same order of magnitude when PM=y

