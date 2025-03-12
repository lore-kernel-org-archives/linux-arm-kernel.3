Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85803C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhPj1Rh7HI0/S7fNCaRYAxScHemryyChjRocg6w43Ck=; b=UtydjNBXUurQHExoiArWNypxBH
	0VptnX2n+EZ3We9XbS0wVJ1ZpTLokrERXqRmoQIaPc1s6fskmEL5QURAFY7tKRRm/YndHg/03EMdh
	ai9p91YVZF6tx4Hi60phaVMwpCo+n6HxX/S3dbg5kNmZ/dMaU1g7ztxvDwec09XRrTgeyFVhcOfuv
	39j/xv+ziRpnW3kR9HESKeRHXpfBX3MPGxFjM274OfzNb8k0s5BMEkxRtV42G2gYGnoZUk5HSknXw
	zQxiQ/AMQ1PgDsAjRmOVYNtwFCCO3W+9yS3A3WcPhlDp1yO1LGlKgKktI1rxa/WHilXA6xbaBzxPw
	SqIFOdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNjS-00000008nbK-3djO;
	Wed, 12 Mar 2025 15:10:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNgj-00000008n97-3YLN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:08:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D0DF1515;
	Wed, 12 Mar 2025 08:08:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A853F5A1;
	Wed, 12 Mar 2025 08:07:59 -0700 (PDT)
Date: Wed, 12 Mar 2025 15:07:50 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH NOT APPLY v2 4/4] clk: scmi: Support spread spectrum
Message-ID: <Z9GjRhQmsu0fBoWG@pluto>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
 <Z6SqeNsAqbZM8nr1@pluto>
 <20250303041125.GC13236@nxa18884-linux>
 <Z8iKErarE0lHWxEy@pluto>
 <20250310081635.GA16799@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310081635.GA16799@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_080805_928357_2D7C89E3 
X-CRM114-Status: GOOD (  19.02  )
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

On Mon, Mar 10, 2025 at 04:16:35PM +0800, Peng Fan wrote:
> On Wed, Mar 05, 2025 at 05:29:54PM +0000, Cristian Marussi wrote:
> >On Mon, Mar 03, 2025 at 12:11:25PM +0800, Peng Fan wrote:
> >> Hi Cristian,
> >> 
> >> On Thu, Feb 06, 2025 at 12:26:32PM +0000, Cristian Marussi wrote:
> >> >On Wed, Feb 05, 2025 at 05:49:54PM +0800, Peng Fan (OSS) wrote:
> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> 
> >> >> Support Spread Spectrum with adding scmi_clk_set_spread_spectrum
> >> >> 
> >> >
> >> >Hi,
> >> >
> >> >I forwarded ATG with our latest exchange on the possibility of using a
> >> >standard OEM type instead of Vendor one if it is general enough....
> >> 
> >> Do you have any update?
> >> 
> >
> >Yes I think you can go on with your original plan of using vendor OEM
> >types: as of now we are not gonna standardize a new commmon SCMI type
> >for Clock-SS, given there is really just one SCMI user of such clock
> >features...maybe in the future if more users shows up...
> 
> Thanks for updating me. Back to how to add extensions in clk-scmi.c,
> do you have any suggestions? I am thinking to provide vendor/sub-vendor
> for clk-scmi.c and use vendor "NXP" sub-vedor "IMX" for spread spectrum.
> 

Definitely based on vendors subvendors, not sure about how, I have not
really though about the details: you also shoudl consider that the new
clk ops for spread spectrum should be registered ONLY when you are on a
supported platform (of course) AND the OEM types nnamespace is per-vendor:
like vendor protocols your NXP OEM config type 0x80 must coexist with any
future possible OTHER_VENDOR OEM ConfigType 0x80.

Thanks,
Cristian


