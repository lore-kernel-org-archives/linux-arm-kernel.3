Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC7C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQMEJhzCoP6SsvcMRpV7hOEsBH8JgG7jjiRN9zw1N9o=; b=YV2Ede0ey1GrPakwUfjs6Ah1HP
	UAqSvlo2/NHefPXz9a4sorIWldarifxuH9IJNpd3jH3aR/pA135bhLwmgN/KURiBdQWTlJzRUSbbm
	PlPRYofh6Q3rxZ8VPkekgnh6iGKTUhpwfMcYFzD6i9vF+XrWagKUJJSqhDcZMyxAeuO9jN7IWaPk0
	gKDzGPQn+su87tndyksAB/1BhEOMCQDlUnPFgbqoy3SJBroFbtXyEn5xLJLu/0nzQ3mm1kxdP/D3o
	7+fwbBeCbOcP5tLUljcSGUPaI3BVr/BWgoQk+IDKz25liypvoDvrXofWHAovUKk5qeh9muDebkoZT
	AxBPZS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tet0u-0000000F2Ay-3Hcw;
	Mon, 03 Feb 2025 09:45:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teszY-0000000F1l7-2vIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:43:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDF11063;
	Mon,  3 Feb 2025 01:44:08 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96BF23F5A1;
	Mon,  3 Feb 2025 01:43:41 -0800 (PST)
Date: Mon, 3 Feb 2025 09:43:39 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <Z6CPy89TVxV1jaDn@pluto>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
 <20250202104256.GA13402@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202104256.GA13402@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_014344_829210_A75B704B 
X-CRM114-Status: GOOD (  32.95  )
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

On Sun, Feb 02, 2025 at 06:42:56PM +0800, Peng Fan wrote:
> On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
> >Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
> >>  }
> >>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> >>  
> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> >> +                           unsigned int spreadpercent, unsigned int method,
> >> +                           bool enable)
> >> +{
> >> +       struct clk_spread_spectrum clk_ss;
> >> +       struct clk_core *core;
> >> +       int ret = 0;
> >
> >The assignment looks unnecessary.
> 
> To avoid uninitialized variable warning.
> 
> >
> >> +
> >> +       if (!clk || !clk->core)
> >
> >How do you not have clk->core?
> >
> >> +               return 0;
> >> +
> >> +       clk_ss.modfreq = modfreq;
> >> +       clk_ss.spreadpercent = spreadpercent;
> >> +       clk_ss.method = method;
> >> +       clk_ss.enable = enable;
> >> +
> >> +       clk_prepare_lock();
> >> +
> >> +       core = clk->core;
> >
> >Why do we need to get the core under the lock?
> 
> Drop in v2.
> 
> >
> >> +
> >> +       if (core->prepare_count) {
> >
> >Why does prepare count matter?
> 
> I was thinking to configure Spread Spectrum(SS) before
> prepare/enable a clock. But it should be fine to not
> check prepare count.
> 
> >
> >> +               ret = -EBUSY;
> >> +               goto fail;
> >
> >We just left without releasing the lock.
> 
> True. Dan also reported this. Fix in V2.
> 
> >
> >> +       }
> >> +
> >> +       ret = clk_pm_runtime_get(core);
> >> +       if (ret)
> >> +               goto fail;
> >
> >We just left without releasing the lock.
> >
> >> +
> >> +       if (core->ops->set_spread_spectrum)
> >> +               ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
> >> +
> >> +       clk_pm_runtime_put(core);
> >> +       clk_prepare_unlock();
> >> +fail:
> >> +       return ret;
> >> +}
> >> +EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
> >> +
> >> diff --git a/include/linux/clk.h b/include/linux/clk.h
> >> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
> >> --- a/include/linux/clk.h
> >> +++ b/include/linux/clk.h
> >> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
> >>   */
> >>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> >>  
> >> +/**
> >> + * clk_set_spread_spectrum - set the spread spectrum for a clock
> >> + * @clk: clock source
> >> + * @modfreq: modulation freq
> >> + * @spreadpercent: modulation percentage
> >> + * @method: down spread, up spread, center spread or else
> >
> >Did we get cut off?
> 
> Sorry I not get this point.
> 
> >
> >> + * @enable: enable or disable
> >
> >Isn't 'disable' equal to spread_percent of zero?
> 
> yeah. Drop the last parameter.
> 
> >
> >> + *
> >> + * Configure the spread spectrum parameters for a clock.
> >> + *
> >> + * Returns success (0) or negative errno.
> >> + */
> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> >
> >Does this need to be a consumer API at all? Usually SSC is figured out
> >when making a board and you have to pass some certification testing
> >because some harmonics are interfering. Is the DT property sufficient
> >for now and then we can do it when the driver probes in the framework?
> 
> I suppose 'DT property' you are refering the stm32 and i.MX8M SSC patchsets.
> I am proposing a generic interface for drivers to enable SSC.
> Otherwise we need to introduce vendor properties for each vendor.
> And looking at clk-scmi.c, we need a generic way to enable SSC, I think SCMI
> maintainers not agree to add vendor properties for it.
> 

To clarify, from the SCMI point of view, I expressed the idea that it
would make sense to have a common SSC interface on the SCMI backend too
instead of a custom NXP since you are adding a common CLK framework feature,
BUT only if it turns out, from this discussion, that a common general way of
configuring SSC can be found...and I dont know that, so I am waiting to see
what this discussion with CLK framework and iMX maintainers goes before
excluding the SCMI CLK vendor OEM types scenario...it would be ideal and
easier NOT to use SCMI vendor extensions BUT ONLY if this NXP SSC/config generic
solution is deemed to be really generic and usable by any other vendor.

Thanks,
Cristian

