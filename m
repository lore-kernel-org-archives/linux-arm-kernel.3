Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4780C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv7BpdqbrC4MIJGIoyaCveI8US7dxRJU75TQa1FCYWA=; b=5CL8u/cs1MMR1u/FZc8TTrG2nm
	wlULhGROg7xiLQz4NL14mEOWr6Gcehom2wVoELrLG50ekIEBfOisUKMgXZMiEFriYiMYBNJ6PEWz8
	FeDsPW/x0LxQBlZLaH6WZd/REr8GDx+8abEy65G/RzzFFmUb1t92mCqLmyYJSX2rJTbHCiL72m6rT
	YunzgrC/8WWVXA9LLg9jsAqXW/5tDE5QbS6bDrZ7QVQgcOGCv5vaojBIAmBHWAw5H37iwq23YAatB
	adbuDiil5xP4HwyqyhY3dDm8JUb81y7q6u/Q5kgJggsbVhZepWKNsFJxN0KU8b3VsgjX+BoE3v0ic
	J1Cf+6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ap8-0000000B022-3qJn;
	Wed, 16 Apr 2025 22:01:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5AmX-0000000AzUv-1w8h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 21:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vv7BpdqbrC4MIJGIoyaCveI8US7dxRJU75TQa1FCYWA=; b=NT3H4zDAb3vOVqUUyDgEmkwU9n
	pvPgcGIqiVzK4o8M5YI4G/C8hwYJPfzV4/S54epdX+OQhaL0Dx2z9T0K64QX0GPD8SHQlsSxh9652
	pIq8tf5KvaUfHe9ltDsx3EtN31ZmxU8oIatReKyLyh9zdL7xVFN5Nqq2gpjavK+SXyVg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5AmI-009hQk-EE; Wed, 16 Apr 2025 23:58:42 +0200
Date: Wed, 16 Apr 2025 23:58:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [net-next v5 2/6] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2
 switch description
Message-ID: <2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
References: <20250414140128.390400-1-lukma@denx.de>
 <20250414140128.390400-3-lukma@denx.de>
 <06c21281-565a-4a2e-a209-9f811409fbaf@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06c21281-565a-4a2e-a209-9f811409fbaf@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_145857_498915_F96122AA 
X-CRM114-Status: GOOD (  15.93  )
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

> > -		eth_switch: switch@800f8000 {
> > -			reg = <0x800f8000 0x8000>;
> > +		eth_switch: switch@800f0000 {
> > +			compatible = "nxp,imx28-mtip-switch";
> > +			reg = <0x800f0000 0x20000>;
> > +			interrupts = <100>, <101>, <102>;
> > +			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> > +			clock-names = "ipg", "ahb", "enet_out", "ptp";
> >   			status = "disabled";
> from my understanding of device tree this file should describe the hardware,
> not the software implementation. After this change the switch memory region
> overlaps the existing mac0 and mac1 nodes.
> 
> Definition in the i.MX28 reference manual:
> ENET MAC0 ENET 0x800F0000 - 0x800F3FFF 16KB
> ENET MAC1 ENET 0x800F4000 - 0x800F7FFF 16KB
> ENT Switch SWITCH 0x800F8000 - 0x800FFFFF 32KB
> 
> I'm not the expert how to solve this properly. Maybe two node references to
> mac0 and mac1 under eth_switch in order to allocate the memory regions
> separately.

I get what you are saying about describing the hardware, but...

The hardware can be used in two different ways.

1) Two FEC devices, and the switch it left unused.

For this, it makes sense that each FEC has its own memory range, there
are two entries, and each has a compatible, since there are two
devices.

2) A switch and MAC conglomerate device, which makes use of all three
   blocks in a single driver.

The three hardware blocks have to be used as one consistent whole, by
a single driver. There is one compatible for the whole. Given the
ranges are contiguous, it makes little sense to map them individually,
it would just make the driver needlessly more complex.

It should also be noted that 1) and 2) are mutually exclusive, so i
don't think it matters the address ranges overlap. Bad things are
going to happen independent of this if you enable both at once.

      Andrew

