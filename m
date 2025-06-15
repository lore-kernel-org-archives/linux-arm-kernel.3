Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96224C71151
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt4hHsFV36RpuWHyTnG4rPaSt9Cjr/5M4+STk580b1Q=; b=tjHhSBaH3hY3qzEjk08Wf1//gl
	Oqd5M9As0jIp5Wa1V4jj9kX/5M4pfxYl/Xi6/hcWfCTgvz3VdKBLeOx3ng7EUg+cKH5lvURSPGZZg
	qQ1/t0Dctt+cou4U6+pBvTc1s9iCGuw09MGrdA54K5n34BUgILM1T+eZqg5ORwkvpCXyqNMWYF9R7
	jSClDwD6TYWnS8bxqJlfdrrwr88YYQ2iK/fD1//mrT4eVFZQ/TM0m106h0ovAXsVMwJNDfW4BEOIy
	KGY1nxlt52+hKXWnHzjKNpkBjhmeBmxAptJaxgiInO9TdWC7JqZBat+CLd69ehu7jT3yZSapx/S74
	V5opzUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQomS-00000002Zki-1aC2;
	Sun, 15 Jun 2025 14:56:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQokE-00000002ZfI-2xA1;
	Sun, 15 Jun 2025 14:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kt4hHsFV36RpuWHyTnG4rPaSt9Cjr/5M4+STk580b1Q=; b=LJmbuP2dsPCX3BntYuenOEi+F2
	fO/EYVjq5NGyGgC8NEjJ6YhNYvo3jjWGMWDqGdiI23a313rtjNIRWwgYk/aGA9gZ4GGbsa5R42z5A
	saX7dG+ksnucnrSAxCCcWwG0Qzlwn/Ut05uDSCG0OjmEKZdtHKcX5ORFL9BpLdQoKQJ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uQok4-00FxY8-Lq; Sun, 15 Jun 2025 16:53:52 +0200
Date: Sun, 15 Jun 2025 16:53:52 +0200
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
Message-ID: <bb3486c6-93df-4453-acc6-deba3c8f7f0e@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
 <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
 <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_075402_744532_B8431E6E 
X-CRM114-Status: GOOD (  43.67  )
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

On Fri, Jun 13, 2025 at 04:27:54PM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/28/25 3:09 PM, Andrew Lunn wrote:
> > On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
> > > Hi Andrew,
> > > 
> > > On 5/27/25 6:18 PM, Andrew Lunn wrote:
> > > > On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > > > > > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > > > > > should do the trick to disable the circuitry according to the TRM?
> > > > > 
> > > > > I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> > > > > 
> > > > > 	Setting	Decimal	Actual TXCLK delay (ps)
> > > > > 	00	0	47
> > > > > 	0a	10	283
> > > > > 	10	16	440
> > > > > 	20	32	893
> > > > > 	30	48	1385
> > > > > 	40	64	1913
> > > > > 	50	80	2514
> > > > > 	60	96	3077
> > > > > 	70	112	3565
> > > > > 	7f	127	4009
> > > > > 
> > > > > 	off	x	-315
> > > > > 
> > > > > Setting = tx_delay (hex)
> > > > > Decimal = tx_delay (dec)
> > > > > Actual TXCLK delay (ps) = Measurement from oscilloscope
> > > > > 
> > > > > Plotting this we can deduce that one tx_delay unit is about 31ps.
> > > > 
> > > > Nice to see somebody actually do the measurements. Based on this, it
> > > > would be good to implement:
> > > > 
> > > >           tx-internal-delay-ps:
> > > >             description:
> > > >               RGMII Transmit Clock Delay defined in pico seconds. This is used for
> > > >               controllers that have configurable TX internal delays. If this
> > > >               property is present then the MAC applies the TX delay.
> > > > 
> > > > For the moment, please limit it to just the device you measured it on.
> > > > 
> > > 
> > > What exactly do you mean with "limit it to just the device you measured it
> > > on"?
> > 
> > Nobody seems to know if rx_delay & tx_delay operate the same across
> > the whole range of SoCs. I don't particularly care if these properties
> > are difference between SoC, they are vendor properties, with
> > undocumented magic values. However 'tx-internal-delay-ps' is
> > standardised, and has a very clear meaning. I don't want it used
> > unless somebody has performed a measurement and we know that 2000
> > produces a 2ns delay.
> > 
> > > I'll need to implement reading the delay from the stmmac driver to use this
> > > property, do I need to restrict reading this property to the SoC we tested
> > > (RK3588)?
> > 
> > Yes, please only allow it to be used on RK3588, and any other SoC you
> > can test and verify its behaviour.
> 
> Coming back to this topic, I'm unfortunately the bearer of some bad news.
> 
> I implemented the suggested logic (see at the end of this mail) and then
> went to validate it with Jakob's help. Unfortunately, it seems that the
> delay value really isn't stable or reliable.
> 
> We tested the same adapter with two different main boards (the same product,
> just two different units). With a value of 0x40 for tx_delay (which should
> be ~2000ps if we have a 31ps per tx_delay unit as empirically decided), we
> have one board with 1778ps and one with 1391ps. Following a hunch, we
> started to stress (or cool) the device (with stress-ng/a fan) and it did
> slightly change the result too. Changing the CPU operating points (and by
> extension at least CPU clocks) didn't impact the result though.

Thanks for taking such a scientific approach to this. Most developers
try values until it works, and call it done. It is nice to see
somebody doing some real study.

Russell quoted the standard, which says the delay needs to be between
1ns and 2.6ns, which is quite a wide range. So for a tx_delay value of
0x40, nominally 2000ps, your two values are within that range, and so
conform to the standard.

> While this could be observed with tx_delay property too, this property
> doesn't claim to provide a value in picoseconds that tx-internal-delay-ps
> would (but at the same time this didn't stop it to be implemented for the
> DSA switch we have which claims "more than 1.5ns" and nothing more, so maybe
> that would be acceptable?).
> 
> I feel uncomfortable contributing this considering the wildly different
> results across our very small test sample pool of two units and slightly
> different operating temperature.

I can understand that. But there is another way to look at this. I am
making a big jump from just two boards, but it seems to me, tx_delay
and rx_delay are pointless, if they produce such a wide range of
values from what should be identical boards. They cannot be used for
fine tuning because the same value has a 387ps difference, which is
huge compared to the 31ps step.

It seems to me, rx_delay and tx_delay should be deprecated, set to 0,
and let the PHY do they delays. If i remember correctly, that is what
you ended up with for you board?

	Andrew




