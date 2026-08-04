Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8ADC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUW+r4FCY0U+LwKfUl0eF3OjFw9eBKouwZVjhFevUS0=; b=33vePEViAIKRm5CUzwBJte17sz
	FXZ2l7rrtzCzJlcVI120PsRWHUdTLMSefYhUMSX+l8P85jCb2pBRoyiumN3/M2GlmFSySmSz5aYqk
	1yxUeEAaMcycRw2sGX9f/U3COfFVJYMZIqIhr4tZYVLyZcYUGxCIp1Uuv/w4DdES7iB5L6aS5MQwe
	t7YrpnRf9VwfLZwV5GYgOH5f8vO9SvmLQnXKsCn70E9goyt8pBip0YV9hWCw+Vbp1AgrEXOIruBta
	N9gw5e72j9lp4PsyiK7qi1ianxyiCDkMwCjEBKUVeIMYd4SpkC2dzcUXiHcVKJKH0SMF9ARkuByGQ
	VOPYRE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGNr-000000026y2-2ZfN;
	Tue, 04 Aug 2026 14:44:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGNp-000000026wq-0yIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ZUW+r4FCY0U+LwKfUl0eF3OjFw9eBKouwZVjhFevUS0=; b=SG
	p5NuD0aiUnNJjW4FKOYvaYgoP4X/Ix960dvodpnmGbRjCai+YeB/TCF8XaaaudsWFgyHIpAiKTYrh
	dK6kK5FMbbagl36kF8brz2qoAKbdkDLy24ADVx5bzSs99CAZ1YmIaTsrSEgOrVnOYYNJ4vpg2YGXU
	l935Tc2gKon+n3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrGNb-00G0KA-Ov; Tue, 04 Aug 2026 16:44:31 +0200
Date: Tue, 4 Aug 2026 16:44:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liu Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Message-ID: <f2dc4bbb-ed90-4661-ad5c-f8c51075138e@lunn.ch>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-7-andre.przywara@arm.com>
 <ad2e46d5-53db-49b2-a128-7c54883e18eb@lunn.ch>
 <CAGb2v64yH+grXMbxg1te6XHt1PxhUc4Jzch_OdUW50tq2Eg1cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64yH+grXMbxg1te6XHt1PxhUc4Jzch_OdUW50tq2Eg1cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_074445_271014_18BEB332 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, Aug 04, 2026 at 11:11:04AM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 4, 2026 at 10:53 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +&gmac1 {
> > > +     clocks = <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&rgmii1_pins>;
> > > +     phy-mode = "rgmii-id";
> > > +     phy-handle = <&ext_rgmii_phy>;
> > > +     phy-supply = <&reg_cldo3>;
> > > +
> > > +     tx-internal-delay-ps = <200>;
> > > +     rx-internal-delay-ps = <500>;
> >
> > 500ns is quite big. How did you come to this value? Do you have the
> > schematic & gerber files? Does the lines look unbalanced?
> 
> Unit is ps, not ns.

Yes, sorry, wrong units. But still 500ps is very big. You have the PHY
adding 2ns, due to rgmii-id, and you add another 500ps?

       Andrew

