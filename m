Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1857C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziV+qFWQFPGemtwtFuQ2yto/+aZFcx7ZXSBvpy3WpXs=; b=Mg0oD3LTP5C2/YGXdtKBJljULx
	4O+Gi7ZRiTYCbISfqpQFwJ7TJkOCusjJergG4UVR8/q8nb8oNAsgsoPV2yBILaxSASCoXpG75+/By
	TXbSiQjMJzBJtuaRPB4gcDxCOwE4U0444possOd7iZCJhAoo0dw1eJbukm++6Pn8tIJdDPfwgQCLM
	jNkSOsm14iPxzUn6Wh8h+4IqpksKEM7H8X6/WQUScvtPXyQnTqKk1MQhXTfPZwZwHo7gbjE3chBLI
	YOXBdaaicGjP/9QLvNFOr5Q1l5NE2k+36JFpJ9h89Aayrs8SyXl72WtP9F+njyRKjQ6S+R1BexyxT
	EB3RdYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5Pw-000000012ci-3FZt;
	Thu, 22 May 2025 12:53:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5Nv-000000012Ox-3bZM;
	Thu, 22 May 2025 12:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ziV+qFWQFPGemtwtFuQ2yto/+aZFcx7ZXSBvpy3WpXs=; b=Fe+uMmjtdt4LUngmv3HG9SnhGa
	ae1zfCnl9CkSjiudDhV24Xr3nhTqPUAd0fp+PeA8Dm7cZTkUmNC0BCN9fsFkZdNc+VRHiRJ6Ru+gL
	WKMEE9yXPOyV1bECHpNIcwT59ilUoK+dAMpkgpZoRtjOimeLgLMNSZDASTdZoGWju0Rw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uI5No-00DUjP-Ee; Thu, 22 May 2025 14:50:48 +0200
Date: Thu, 22 May 2025 14:50:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch
 adapter for RK3588 Jaguar
Message-ID: <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
 <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_055055_896711_3B6FEEEB 
X-CRM114-Status: GOOD (  26.92  )
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

On Thu, May 22, 2025 at 10:18:12AM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/21/25 6:25 PM, Andrew Lunn wrote:
> > > +&gmac1 {
> > > +	clock_in_out = "output";
> > > +	phy-mode = "rgmii";
> > 
> > Does the PCB have extra long clock lines to implement the 2ns delays?
> > 
> 
> Not that I am aware no.

So 'rgmii-id' describes the hardware.

> 
> The issue here is that I believe the Linux driver actually got the whole
> phy-mode thing wrong?

Quite possible, a few drivers do.

> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> 
> First, tx_delay defaults to 0x30 if absent, rx_delay to 0x10 if absent,
> which seems a bit odd but why not.
> 
> Then you have rk_gmac_powerup() handling the delays.
> 
> If RGMII, then use rx_delay and tx_delay. If RGMII-ID, use neither. If
> RGMII-RXID use tx_delay. If RGMII-TXID use rx_delay.
> 
> This is the complete opposite of what I was expecting?

This driver, and the aspeed driver cause a lot of problems....

> > Since this has a switch on the other end, its a bit more complicated
> > with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
> > to the PHY, and the PHY then does the delays. However, here you don't
> > have a PHY. So you have the MAC add the delays. This looks O.K. I
> 
> The switch actually supports adding delays on the port used for DSA conduit.

That actually looks to be the simplest and correct solution. Set the
MAC to 'rgmii-id', rx_delay and tx_delay to 0, even if they are
ignored. And in the switch, also 'rgmii-id' and let it insert the 2ns
delay. You can use rx-internal-delay-ps and tx-internal-delay-ps if
you want, but it seems to default to sensible values.

> I'm a bit confused by the following sentence:
> 
> """
> Normally, the MAC does nothing and passed rgmii-id
> """
> 
> is this something that the MAC driver is supposed to do or is the subsystem
> handling that somehow? How do I know how/when to rewrite the phy-mode passed
> to the PHY?

A small number of MACs have hard coded delays. You cannot turn the
delay off. So the MAC has no choice but to do the delay. 'rgmii' is
simply not possible, so -EINVAL. For 'rgmii-id', if you pass that to
the PHY, it will also add a delay, and 4ns in total does not work. So
when the MAC is adding delays, it needs to mask out the delays it is
adding before calling phy_attach() passing an rgmii mode.

	Andrew

