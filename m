Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS2zHmL8eJvwlmo1sEnhOq6r1rAGjvGYbp8ZEUGFl1Q=; b=yqZ8jPYTY1JZJyPgVJqGqkaCuP
	Xz0sDKDWlW7ET7XPP0iN+pNOQtGX4/fEKJKK/65/3tYxUYhRnV/zF5nzYnYyADlOcpzqCXhcE66Gp
	N1H9Fk3o9xonVkknm2DISRHmy6sY3K8JiqAqlDgvwcu/dYhNfxytJ7mcRW7JISjm5Jqlxh3+KSM7l
	eW8HNblq2p9CpY2xSDqa1kndn+LETMdxY0fd7bo6W6ro21gFd0O7EJNa2iH3REvV2lN/86Z/p7+Gf
	ptJjNjfOqZFgnVrHamhPY3srZaQoE3maaMOgTn7NVILad/zQmSewa6bcWEloWbyAVMZ27wGVcnBOc
	KTnwyzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtwY-0000000CKcf-29Mm;
	Thu, 09 Jan 2025 14:55:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtvL-0000000CKL8-0Dxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XS2zHmL8eJvwlmo1sEnhOq6r1rAGjvGYbp8ZEUGFl1Q=; b=e5HM2Lc7Oc/aGxpK7LuQgCbm00
	xw1HYHPDQtPmf7zSBPtz8vsJNAAMNfQQ2FuneHutnkBVy2KVQ1n5a4kMYJuQUBEgP+7S2ZbiK6OMw
	aaSH+H26CrsWNk4ic2+hnuMT9zDDAai41SWYjVi8Ia+UDfujLoXB0n/Kfdvx9zRwKk4g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVtvB-002vFx-GY; Thu, 09 Jan 2025 15:54:05 +0100
Date: Thu, 9 Jan 2025 15:54:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= v2 05/10] ARM:
 dts: aspeed: system1: Add RGMII support
Message-ID: <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_065415_111076_E171E580 
X-CRM114-Status: GOOD (  32.59  )
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

On Thu, Jan 09, 2025 at 08:25:28AM -0600, Ninad Palsule wrote:
> Hello Andrew,
> 
> On 1/9/25 07:21, Andrew Lunn wrote:
> > On Thu, Jan 09, 2025 at 10:33:20AM +0000, Jacky Chou wrote:
> > > Hi Andrew,
> > > 
> > > > > There are around 11 boards in Aspeed SOC with phy-mode set to "rgmii"
> > > > > (some of them are mac0&1 and others are mac2&3). "rgmii-rxid" is only
> > > > mine.
> > > > > No one in aspeed SOC using "rgmii-id".
> > > > O.K, so we have to be careful how we fix this. But the fact they are all equally
> > > > broken might help here.
> > > > 
> > > > > > Humm, interesting. Looking at ftgmac100.c, i don't see where you
> > > > > > configure the RGMII delays in the MAC?
> > > > This is going to be important. How are delays configured if they are not in the
> > > > MAC driver?
> > > The RGMII delay is adjusted on clk-ast2600 driver. Please refer to the following link.
> > > https://github.com/AspeedTech-BMC/linux/blob/f52a0cf7c475dc576482db46759e2d854c1f36e4/drivers/clk/clk-ast2600.c#L1008
> > O.K. So in your vendor tree, you have additional DT properties
> > mac1-clk-delay, mac2-clk-delay, mac3-clk-delay. Which is fine, you can
> > do whatever you want in your vendor tree, it is all open source.
> > 
> > But for mainline, this will not be accepted. We have standard
> > properties defined for configuring MAC delays in picoseconds:
> > 
> >          rx-internal-delay-ps:
> >            description:
> >              RGMII Receive Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable RX internal delays. If this
> >              property is present then the MAC applies the RX delay.
> >          tx-internal-delay-ps:
> >            description:
> >              RGMII Transmit Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable TX internal delays. If this
> >              property is present then the MAC applies the TX delay.
> > 
> > 
> > You need to use these, and in the MAC driver, not a clock driver. That
> > is also part of the issue. Your MAC driver looks correct, it just
> > silently passes phy-mode to the PHY just like every other MAC
> > driver. But you have some code hidden away in the clock controller
> > which adds the delays. If this was in the MAC driver, where it should
> > be, this broken behaviour would of been found earlier.
> > 
> > So, looking at mainline, i see where you create a gated clock. But
> > what i do not see is where you set the delays.
> > 
> > How does this work in mainline? Is there more hidden code somewhere
> > setting the ASPEED_MAC12_CLK_DLY register?
> 
> I think the code already exist in the mainline:
> https://github.com/torvalds/linux/blob/master/drivers/clk/clk-ast2600.c#L595
> 
> It is configuring SCU register in the ast2600 SOC to introduce delays. The
> mac is part of the SOC.

I could be reading this wrong, but that appears to create a gated
clock.

hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
	       		scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
			&aspeed_g6_clk_lock);

/**
 * clk_hw_register_gate - register a gate clock with the clock framework
 * @dev: device that is registering this clock
 * @name: name of this clock
 * @parent_name: name of this clock's parent
 * @flags: framework-specific flags for this clock
 * @reg: register address to control gating of this clock
 * @bit_idx: which bit in the register controls gating of this clock
 * @clk_gate_flags: gate-specific flags for this clock
 * @lock: shared register lock for this clock
 */

There is nothing here about writing a value into @reg at creation time
to give it a default value. If you look at the vendor code, it has
extra writes, but i don't see anything like that in mainline.

	Andrew

