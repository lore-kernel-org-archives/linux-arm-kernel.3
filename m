Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DyqbbA1ZUCcjEgFCs3V8UYrQ/Dy0tn2WnKs8noBz34=; b=gaex1Gn/jcuYDS4YpjxXjauuJC
	Z6b+YbApgCp/EAot1BSRyBmO02Bpr7xQLnC+Ib2GFllf96kVd7Yl7HTVG5UpNq/SFLpv/4qEytZqy
	2x28X4Sd6+u7Oq3a7B4SwYonb4SUc/MR+9oSj66KoAHjbY33cSRftlFykYGBi6rlVD0gn5KQRbuXH
	Z3trV9KYVBBGLPM57XiCB9G2kP0MYCCCe1UbOXgUte2H+LaCp6WhRze8d0PNHFvR2RyNXKTmJ47sf
	SABd/nTC87Z6V/3ffxbTbtW4yMJ0LnkyQWnms2PsZCTU6HT29TTYhCe5f/QBI+m8fVkS//WaOddxe
	ck94wlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJjv-0000000E33g-1SjR;
	Wed, 10 Sep 2025 12:15:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJjs-0000000E31h-3da6;
	Wed, 10 Sep 2025 12:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0DyqbbA1ZUCcjEgFCs3V8UYrQ/Dy0tn2WnKs8noBz34=; b=ZTbMEACNtDoGeX4I1SHmnsNMrg
	iEm2zkz90efE9oFDeUhbiIsb5hdpZBnsmCw5qWDN+4pIp92zVImepYnA3diWOoYcqv6VnFTxUzxQN
	x771697TzZ/BCD2nZWvEzBoxS5fhuIqiYU/YjUsdePp4WM5GpGbe/RI/iZ0dWJh0nQb8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwJjZ-007w5t-QA; Wed, 10 Sep 2025 14:15:33 +0200
Date: Wed, 10 Sep 2025 14:15:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kaison <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
Message-ID: <ec8a3649-3f8f-40b7-a534-041b3523efe4@lunn.ch>
References: <cover.1757322046.git.dkx@t-chip.com.cn>
 <42ae6d16ed9162582e7b03cbad661a7950c0db55.1757322046.git.dkx@t-chip.com.cn>
 <307a76a6-cc92-44a1-9ac0-97005bf51b4b@lunn.ch>
 <76B19AD42CA555FC+fff44db30522cf270802ec31912a9c19d29b2d39.camel@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76B19AD42CA555FC+fff44db30522cf270802ec31912a9c19d29b2d39.camel@t-chip.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_051552_903995_6D035D51 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, Sep 10, 2025 at 10:55:22AM +0800, Kaison wrote:
> hi,
> I'm very sorry. Due to the default configuration of my email, I didn't
> receive your email normally. I have fixed this issue.
> 
> On Tue, 2025-09-09 at 14:31 +0200, Andrew Lunn wrote:
> > > - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> > 
> > I actually only see the 2x 1G. Is the 2.5G not supported yet?
> The 2.5G Ethernet is based on the Realtek RTL8125 network controller of
> PCIe 2.0x1.

Ah, O.K. Maybe add a comment, because i was looking for something
integrated into the SoC, not a PCIe device.

> > > +&gmac0 {
> > > +	clock_in_out = "output";
> > > +	phy-handle = <&rgmii_phy0>;
> > > +	phy-mode = "rgmii-rxid";
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&gmac0_miim
> > > +		     &gmac0_tx_bus2
> > > +		     &gmac0_rx_bus2
> > > +		     &gmac0_rgmii_clk
> > > +		     &gmac0_rgmii_bus>;
> > > +	tx_delay = <0x47>;
> > 
> > What happened about my comment that "rgmii-rxid" is probably wrong?
> > 
> > If you think it is correct, you should reply with a
> > justification. Maybe PCB is very odd? In which case, a comment would
> > be good to explain who it is odd.
> The Ethernet part of the board is designed with reference to the
> rockchip evb1 board. 
> 
> link: 
> https://github.com/Firefly-rk-linux/docs/blob/rk3588/firefly-public/en/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> 
> 
> The document describes the usage of the rgmii-rxid mode:
> 
> When the hardware enables the RX delay of the PHY. Need to turn off the
> RX delay of the GMAC, and the dts configuration mode becomes "rgmii-
> rxid".

Vendors get this wrong as well, and give you bad advice. Please look
at:

https://elixir.bootlin.com/linux/v6.16.5/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L264

	Andrew

