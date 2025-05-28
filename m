Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1768C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZV21XWo54z3BlML2GgcnFBxYilTl6UY75ewquPky//0=; b=4xf9sjwqVhGsoxouOaukBKMiBr
	+0/MhcdQc2628CbsZHNev9DqkCx5QdO2z/5wUFQGfWZyBXM2a2Kp85tJa7fBFaKkTs46sDywcQKoN
	GAemGp6hWe0M8GhmwWIPDFKcorQyAVa07odB6gzEp9ni2o+SgmjscR+ADonyUhYmWhJWi395LDqcp
	cWudjuwMnxQvONOVHzX5Ed/8XAZDifSOWpbiKKQsqHCc8sv7x7VcHerqP8mb9gLtOnXr6MJzR/o4l
	OGGTQLvbJgWUXW54/TqhbcCjDqqW429Iv4sR+A9XEy1/xuRr/NGqgOBJkMqglvIu3IwiLvFkW8Bqg
	J5feuHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGdQ-0000000DDD3-2bzu;
	Wed, 28 May 2025 13:15:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGX1-0000000DCZL-1lx6;
	Wed, 28 May 2025 13:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZV21XWo54z3BlML2GgcnFBxYilTl6UY75ewquPky//0=; b=04EQCtkqm1WGgwmHxnkzaZVswO
	YWaYfyUBEy3FlMgziPdZR/K/J827iN6UiI5z7CLCw/osQIXDF6Em8y0ApXmUIb3i4glqqbe2IxV4S
	FekvfBg5UTXIa/wAbIJglu+DaVebiqoyYB1nYhIcw1UKe5xK65NuJYXfGtj6NrpyltAM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKGWs-00EB2C-6J; Wed, 28 May 2025 15:09:10 +0200
Date: Wed, 28 May 2025 15:09:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jakob Unterwurzacher <jakobunt@gmail.com>, foss+kernel@0leil.net,
	conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
	jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_060919_544225_607B02E6 
X-CRM114-Status: GOOD (  30.80  )
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

On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/27/25 6:18 PM, Andrew Lunn wrote:
> > On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > > > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > > > should do the trick to disable the circuitry according to the TRM?
> > > 
> > > I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> > > 
> > > 	Setting	Decimal	Actual TXCLK delay (ps)
> > > 	00	0	47
> > > 	0a	10	283
> > > 	10	16	440
> > > 	20	32	893
> > > 	30	48	1385
> > > 	40	64	1913
> > > 	50	80	2514
> > > 	60	96	3077
> > > 	70	112	3565
> > > 	7f	127	4009
> > > 
> > > 	off	x	-315
> > > 
> > > Setting = tx_delay (hex)
> > > Decimal = tx_delay (dec)
> > > Actual TXCLK delay (ps) = Measurement from oscilloscope
> > > 
> > > Plotting this we can deduce that one tx_delay unit is about 31ps.
> > 
> > Nice to see somebody actually do the measurements. Based on this, it
> > would be good to implement:
> > 
> >          tx-internal-delay-ps:
> >            description:
> >              RGMII Transmit Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable TX internal delays. If this
> >              property is present then the MAC applies the TX delay.
> > 
> > For the moment, please limit it to just the device you measured it on.
> > 
> 
> What exactly do you mean with "limit it to just the device you measured it
> on"?

Nobody seems to know if rx_delay & tx_delay operate the same across
the whole range of SoCs. I don't particularly care if these properties
are difference between SoC, they are vendor properties, with
undocumented magic values. However 'tx-internal-delay-ps' is
standardised, and has a very clear meaning. I don't want it used
unless somebody has performed a measurement and we know that 2000
produces a 2ns delay.

> I'll need to implement reading the delay from the stmmac driver to use this
> property, do I need to restrict reading this property to the SoC we tested
> (RK3588)?

Yes, please only allow it to be used on RK3588, and any other SoC you
can test and verify its behaviour.

> I assume you're then expecting tx-internal-delay-ps only on this new DTSO's
> gmac1?

I would like rx_delay and tx_delay to be marked deprecated, with the
end goal they are no longer used, the standard properties take there
place. But to get there, we need more measurements from real hardware,
or some other way to be sure what we have the correct delay.

> Would you still want rx_delay/tx_delay to be set to 0x00? Maybe only
> rx_delay since we won't have a companion rx-internal-delay-ps for now (until
> someone from Rockchip answers :); adding Kever back to the Cc for that)? Or
> should I remove both of them?

rx-internal-delay-ps and rx_delay should be mutually exclusive. If
both are present -EINVAL. We have to keep supporting rx_delay for
rk3588 otherwise we break backwards compatibility, but ideally no more
instances of it should be added once rx-internal-delay-ps is added.

	Andrew

