Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NueSzK31DadYmmhRVawstIJJP48eqaOR7oYF5vEnWFE=; b=mhuMf07Ny8aPZWsVHaLZ3OxiHH
	O/t6Pd+qWgrlQW6YgYIRr7y7WvmtdkQaq/3egHQ8JOwI1goHsuVsz4QNzrFpEyx3h9TBkXFe5PuE9
	JY/Qy668NVwXIunZ7OWAaJuimtRVGzomExOC4Uppc64/7tCyRwftQA/qMQS6N0XCcBpYdYMKS3Gbj
	xzBEW3Fw6I2pqWVHcYk72tbSI/V9j2PhOwq8hm598vHrcqNSwmJ30RzJn636If90yWTuCFZHbgHuP
	/R4lX6xRz9ky0DSkl1CsxVwXEI06SlMWl1mLCfhAWmfC2gLVOrXL2GeNEr7HR6RhzSbsQvgUtb9a0
	4iKQQI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObPe-000000045m9-3Cdy;
	Mon, 09 Jun 2025 12:15:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObNR-000000045V8-3HCL;
	Mon, 09 Jun 2025 12:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NueSzK31DadYmmhRVawstIJJP48eqaOR7oYF5vEnWFE=; b=GELQe7zlFulZ3w8scQGOg8Bdph
	qmSuWlEQovDrrtDkxsJHB8b7o9FWIvW5gzD/DF+r0DMgiYc5LOhBBw+OhvM2B1pPGkUzM7riKoSc7
	xsFzUDNgO29L1XHNB9QZWzUSYJBTUV4grY00EkB+ig27NwqE82kIMJl39FuFa8HLAvVQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uObMx-00F9CK-5J; Mon, 09 Jun 2025 14:12:51 +0200
Date: Mon, 9 Jun 2025 14:12:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, daniel@makrotopia.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, djakov@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, jia-wei.chang@mediatek.com,
	johnson.wang@mediatek.com, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	lorenzo@kernel.org, nbd@nbd.name, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Message-ID: <9d27e0d3-5ecb-4dcd-b8aa-d4e0affbb915@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-7-linux@fw-web.de>
 <cc73b532-f31b-443e-8127-0e5667c3f9c3@lunn.ch>
 <trinity-87fadcdb-eee3-4e66-b62d-5cef65f1462d-1749464918307@trinity-msg-rest-gmx-gmx-live-5d9b465786-mldbm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-87fadcdb-eee3-4e66-b62d-5cef65f1462d-1749464918307@trinity-msg-rest-gmx-gmx-live-5d9b465786-mldbm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_051321_821465_1699B46F 
X-CRM114-Status: GOOD (  24.03  )
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

> > > +			gmac0: mac@0 {
> > > +				compatible = "mediatek,eth-mac";
> > > +				reg = <0>;
> > > +				phy-mode = "internal";
> > > +
> > > +				fixed-link {
> > > +					speed = <10000>;
> > > +					full-duplex;
> > > +					pause;
> > > +				};
> > 
> > Maybe i've asked this before? What is on the other end of this link?
> > phy-mode internal and fixed link seems an odd combination. It might
> > just need some comments, if this is internally connected to a switch.
> 
> yes you've asked in v1 and i responded :)
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250511141942.10284-9-linux@fw-web.de/
> 
> connected to internal (mt7530) switch. Which kind of comment do you want here? Only "connected to internal switch"
> or some more details?

"Connected to internal switch" will do. The word switch explains the
fixed-link, and internal the phy-mode.

It is not the case here, but i've seen DT misused like this because
the MAC is connected to a PHY and there is no PHY driver yet, so a
fixed link is used instead.

> > > +			mdio_bus: mdio-bus {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				/* internal 2.5G PHY */
> > > +				int_2p5g_phy: ethernet-phy@f {
> > > +					reg = <15>;
> > 
> > It is a bit odd mixing hex and decimal.
> 
> do you prefer hex or decimal for both? for r3mini i used decimal for both, so i would change unit-address
> to 15.

I suspect decimal is more common, but i don't care.

> 
> > > +					compatible = "ethernet-phy-ieee802.3-c45";
> > 
> > I _think_ the coding standard say the compatible should be first.
> 
> i can move this up of course
> 
> > > +					phy-mode = "internal";
> > 
> > A phy should not have a phy-mode.
> 
> not sure if this is needed for mt7988 internal 2.5g phy driver, but seems not when i look at the driver
> (drivers/net/phy/mediatek/mtk-2p5ge.c). The switch phys also use this and also here i do not see any
> access in the driver (drivers/net/dsa/mt7530-mmio.c + mt7530.c) on a quick look.
> Afaik binding required the property and should be read by phylink (to be not unknown, but looks like
> handled the same way).

Which binding requires this? This is a PHY node, but i don't see
anything about it in ethernet-phy.yaml.

	Andrew

