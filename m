Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE032C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5z8ft182EGxmEBZMG9FpMqxA6p7D9exlg19FFW3EQM=; b=N970HuuquXdmmSZt9winldGVs6
	tg8Jh5r+XQt+7P3OwDVUPULxN/tjopC6VErUTlCxTQCWvV5iyW0y+0CHXiirarJAeSvD9HPy790bo
	yc7ia7iap5/+h00UINfSyDhkidesnZqchJ0VjG289m/6DeJeAAQGDL+gFoZYG62+wRx+wJybAGSd4
	rLx5ZidEDmk3S3/elgXpZszzAbMMqtgvNJhBFciFEVq+ULWEdgqNHBoU4xGZXL3mygGbVKP41DceN
	NI1OFUGOENryHJvGfVbKRrDfHvkOGj819daUEmpuj+c9UtyPgCNfD/Dn2uzbAz6HVeI2wIJ0zyPXH
	R3JzregA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuYp-0000000FE6y-3cVv;
	Mon, 03 Feb 2025 11:24:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuXU-0000000FE14-3o60
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:22:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0823F11FB;
	Mon,  3 Feb 2025 03:23:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321D83F58B;
	Mon,  3 Feb 2025 03:22:49 -0800 (PST)
Date: Mon, 3 Feb 2025 11:22:39 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
Message-ID: <Z6Cm_4XTRHdDluhh@pluto>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
 <20250202104256.GA13402@localhost.localdomain>
 <Z6CPy89TVxV1jaDn@pluto>
 <20250203114722.GA20298@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203114722.GA20298@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_032253_037761_41243D11 
X-CRM114-Status: GOOD (  37.70  )
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

On Mon, Feb 03, 2025 at 07:47:22PM +0800, Peng Fan wrote:
> On Mon, Feb 03, 2025 at 09:43:39AM +0000, Cristian Marussi wrote:
> >On Sun, Feb 02, 2025 at 06:42:56PM +0800, Peng Fan wrote:
> >> On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
> >> >Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> >> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> >> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> >> >> --- a/drivers/clk/clk.c
> >> >> +++ b/drivers/clk/clk.c

Hi Peng,

> >> >> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
> >> >>  }
> >> >>  EXPORT_SYMBOL_GPL(clk_set_max_rate);

[snip]

> >> >
> >> >> + *
> >> >> + * Configure the spread spectrum parameters for a clock.
> >> >> + *
> >> >> + * Returns success (0) or negative errno.
> >> >> + */
> >> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> >> >
> >> >Does this need to be a consumer API at all? Usually SSC is figured out
> >> >when making a board and you have to pass some certification testing
> >> >because some harmonics are interfering. Is the DT property sufficient
> >> >for now and then we can do it when the driver probes in the framework?
> >> 
> >> I suppose 'DT property' you are refering the stm32 and i.MX8M SSC patchsets.
> >> I am proposing a generic interface for drivers to enable SSC.
> >> Otherwise we need to introduce vendor properties for each vendor.
> >> And looking at clk-scmi.c, we need a generic way to enable SSC, I think SCMI
> >> maintainers not agree to add vendor properties for it.
> >> 
> >
> >To clarify, from the SCMI point of view, I expressed the idea that it
> >would make sense to have a common SSC interface on the SCMI backend too
> >instead of a custom NXP since you are adding a common CLK framework feature,
> >BUT only if it turns out, from this discussion, that a common general way of
> >configuring SSC can be found...and I dont know that, so I am waiting to see
> >what this discussion with CLK framework and iMX maintainers goes before
> >excluding the SCMI CLK vendor OEM types scenario...it would be ideal and
> >easier NOT to use SCMI vendor extensions BUT ONLY if this NXP SSC/config generic
> >solution is deemed to be really generic and usable by any other vendor.
> 
> You may misunderstand. Using DT properties for clk-scmi.c to configure SSC
> of a single clock means to add properties under clk scmi node, such
> as:
> "arm,modfreq = <x>, <y>, <z>;
>  arm,moddepth = <a>, <b>, <c>;
>  arm,modmethod = <j>, <l>, <m>;"
> 
> And during probe in clk-scmi.c, the properties needs to be parsed and when
> clk is configured, the ssc settings need to be passed to scmi platform.
> 
> But per the i.MX8M SSC patchset that DT maintainers raised, 
> the properties(fsl,modfreq and etc) needs to in consumer side,
> not provider side.
> 
> So it is not feasible to add properties here.
> 

Thanks for the clarification.

> "assigned-clock-sscs" could be put under consumer node and clocks
> could be configured with SSC when needed. This is a generic property.
> 

Yes I understood this, the property that describes SSC that you are
adding is generic BUT are also the related params needed to describe
effectively the SSC

IOW, if we add, as desirable, a generic new SSC type in extended configs
instead of using a vendor oem, will these info down below passed to the SCMI:

+       /*
+        * extConfigValue[7:0]   - spread percentage (%)
+        * extConfigValue[23:8]  - Modulation Frequency (KHz)
+        * extConfigValue[24]    - Enable/Disable
+        * extConfigValue[31:25] - Reserved
+        */


... be enough to describe the required SSC config to any generic SCMI server
from any vendor using any HW ?

... or is it plausible and maybe frequent/usual that other vendors could
need additional specific params to be fed to the server, so that we
will end up using the new standard SSC only for NXP ?

IOW the property is generic, agreed, but are the described params above
generic enough too ? ... that was my concern from an UN-educated point
of view...of course, I am talking about the most common scenarios, if
some other vendor ends up needing some arcane/magic specific param that
cannot fit the above, they will be relegated to the OEM custom spaces
even if this common SSC is available.

> Back to NXP SCMI vendor extension, if SCMI spec could include SSC, NXP
> SCMI could move to align with spec and not use vendor extension.
> 

Agreed, conditional to the above doubts.

Apologies if I have asked dumb/obvious questions, but I am not familiar
with the subject matter enough...

Thanks,
Cristian

