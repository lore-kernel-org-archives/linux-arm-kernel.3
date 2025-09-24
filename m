Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1FDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y68HKP5ZWM2nZLoIp6G0xyl57vLEVKukBRq+ymXstjI=; b=byR0TG1qGIcWA3QNl6oGzPcRhH
	MBdcJG4jorNNMwmeX4nXCdWaNWmQDb/cy56bsuI4WXqdgzJ9c3cRBMlz+ieJFAMxVRO25RoPoQvU4
	GyCNoHjDXjZjJJ4uUDzrxkeJGRmFKLRJmVesZ65pAOQNvXvTDpyhVOKVfYCEoKD7e68TP4rIQv3Te
	cUgj2bp8Oxy0MocYhnxqoiCL1Nrc5CwmIniFjVKLIiPDIuxZ+gHE3QE4bZue0DajCBqT+2l1EfY+w
	Xgp0FHqpe8x+d8NEiVGNeHiS/DKrZJ5WaY4wuLzydZ7KReE/Dqn65Htmcvohzq6+5ZGul98JZHY83
	bdR5GKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P6N-000000001Ua-0ucI;
	Wed, 24 Sep 2025 13:00:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P6J-000000001U9-41IC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:00:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00617106F;
	Wed, 24 Sep 2025 05:59:54 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A9E93F5A1;
	Wed, 24 Sep 2025 05:59:58 -0700 (PDT)
Date: Wed, 24 Sep 2025 13:59:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sebin Francis <sebin.francis@ti.com>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Dhruva Gole <d-gole@ti.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for NXP i.MX95
Message-ID: <20250924-versed-auspicious-bullmastiff-19de2e@sudeepholla>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-5-5a2cee2f0351@nxp.com>
 <5f508f1d-2d08-4687-86cd-d1944caa0a49@ti.com>
 <PAXPR04MB8459CE9F22CD56A9BFDB5E78881DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <082735e7-956b-4574-952e-06ba69db41f1@ti.com>
 <PAXPR04MB84590D5AAAB56ED7E1CBDE05881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <c34157c5-cd13-4e85-a9ee-22446111f633@ti.com>
 <aNPmydbv6Xm0Tj9B@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNPmydbv6Xm0Tj9B@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_060004_082417_AE6C083F 
X-CRM114-Status: GOOD (  43.23  )
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

Hi Cristian,

On Wed, Sep 24, 2025 at 01:40:56PM +0100, Cristian Marussi wrote:
> On Wed, Sep 24, 2025 at 05:45:32PM +0530, Sebin Francis wrote:
> > Hi Peng,
> 
> Hi ,
> 
> > 
> > On 24/09/25 17:13, Peng Fan wrote:
> > > > Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for
> > > > NXP i.MX95
> > > ...
> > > > > > >         SCMI_CLOCK_CFG_OEM_START = 0x80,
> > > > > > > +     SCMI_CLOCK_CFG_IMX_SSC = 0x80,
> > > > > > 
> > > > > > TI is also planning to implement the same in our upcoming platform.
> > > > > > so can we use a generic ID instead of vender specfic message ID?
> > > > > 
> > > > > I tried to push to new generic ID [1] in half a year ago, but in the
> > > > > end ARM decided not to add generic ID for spread spectrum support.
> > > > > 
> > > > > To i.MX, it is too late to use a generic ID and waiting spec, i.MX
> > > > > firmware has been public for quite some time and passed several
> > > > external releases.
> > > > > So I need to use what our firmware adds and spec allows: vendor
> > > > > extension.
> > > > 
> > > > Thanks for the quick response,
> > > > Since this implementation is specific to i.MX, can you move this to a
> > > > vendor specific file, so that it will not break i.MX's firmware and TI can
> > > > implement SSC in TI specific file.
> > > 
> > > i.MX has encountered issue with pinctrl-scmi.c and pinctrl-imx-scmi.c
> > > both supports SCMI PINCTRL. Current linux scmi does not support
> > > both drivers built in kernel image, because scmi devlink issue.
> > >
> 
> Yes indeed, BUT the vendor protocol extensions mechanism was meant to
> serve the development of vendor custom protocols and drivers, it was
> NEVER meant really to allow multiple alternative drivers implementation
> on top of the same standard protocols like it happened with pinctrl-imx-scmi...
>  
> > > Sudeep said he would address the devlink issue in 6.19 cycle.
> > > 
> > > Given the current situation, I'm hesitant to introduce a new driver
> > > saying clk-imx-scmi.c.
> > >
> 
> Even if the devlink issues will be solved, in THIS case the problem is
> handling custom vendor extensions inside a standard protocol, as it is
> allowed in this case...
> 
> > > What I'm unclear about is whether moving to a vendor-specific file
> > > implies creating a new driver (i.e., clk-imx-scmi.c), or if it could be
> > > handled via a callback or another mechanism. Could you help
> > > clarify the intended direction?
> > 
> > My intended was to handle it via callback or something similar, so that TI
> > can its own callback for the TI's SSC implementation.
> > 
> 
> This is exactly what is needed, the ability to extend with vendor
> extensions callback the behavior of a standard protocol where
> allowed....this is NOT currently supported and sincerely that was the
> reason months ago I proposed initially that maybe we could have standardized
> a new common clock extension SSC instead of using the OEM extensions since:
> 
> 1. it seemed a pretty generic operation
> 2. any per-vendor extension callback of std protocol was NOT ready :P
> 
> ...then this proposal never went anywhere with ATG...AND now looking at
> this thread I think that it is good at the end that we did NOT add a new
> standard extended clock config instead of the IMX OEM, since now it
> seems that TI wants its own non-compatible implementation...
> 
> So yes the ideal solutiomn would be to extend in a generic way the SCMI
> framework so that you can add in these cases custom handling of vendor
> extensions for standard protocols (and then generalize the current
> clk-scmi IMX support and add the new TI one...)...but I have not thought
> about this and I certainly dont have enough bandwidth now to work on
> this...beside having already in the pipeline other stuff/fixes like
> a proper fix for vendor drivers coex like Peng askes (rightly so a few
> months ago)
> 

Thanks for the detailed response as usual 😄. I don't have much to add
in case anyone is expecting different or more info from me.

-- 
Regards,
Sudeep

