Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D73E6F077
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEk39s4EUEiPzn8QUrMy0dlOdorZCmMf4fjGiDLyucY=; b=wEu04UtO+/8lCBF0Y59HMRxtdA
	lgTTfIPF7eHDjSpigA49gDV5aWKeO8T4/FHwOFiweiTxVINRLsKk6BdZpZ6eKEAJJ4+ZaHvI3jFnI
	QyyZnqFlF6gvbOIeqIa8GFfum09qtkz49Q42NLRwS/4znKGgxLdvtYNqNE/FzIU7GfSaDBqZsdGjj
	CyGDx8E+ZhpcPtGYTVjhWRftbMyo1ZuikFEp4mM74WTuiRFPDSqzccw19VMctEdXRKHuCIZdJMHhU
	En3Yb2hCmLLsr4T432++IuzScftyNxH7g0iMsg/n5Lyu4z8MzTLFjgkI8tj7aK4htrcmqMc3Y9fIs
	eB37qDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXySs-0000000EjLn-3tyx;
	Tue, 23 Dec 2025 09:13:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXySq-0000000EjKH-0rPE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=HEk39s4EUEiPzn8QUrMy0dlOdorZCmMf4fjGiDLyucY=; b=pM
	Fy6O32zXiYSnuByU6S4Pnh4CTm2w1pkPqd/2RU0oPjhbC0146rEV6+5nHEmctSJJD3ysmjpFcr+nu
	bwyGbv8CIM+GI9DWjEl6tL6olkcK0AB7+kWr1JxniPo/ZRmB53AMXxXG7zWWaLUsxaQmWR/+lTVm/
	gutJkDs26RLuB48=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vXySY-000HP0-F1; Tue, 23 Dec 2025 10:13:38 +0100
Date: Tue, 23 Dec 2025 10:13:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?6Kyd5pS/5ZCJ?= <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
 <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011356_442848_704E1A3F 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Dec 23, 2025 at 09:49:02AM +0800, 謝政吉 wrote:
> On Mon, Dec 22, 2025 at 5:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +&mdio0 {
> > > +     status = "okay";
> > > +};
> > > +
> > > +&mac2 {
> > > +     status = "okay";
> > > +     phy-mode = "rmii";
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_rmii3_default>;
> > > +     fixed-link {
> > > +             speed = <100>;
> > > +             full-duplex;
> > > +     };
> > > +};
> >
> > That is an odd combination. You enable the MDIO bus, but don't have
> > any PHYs on it, no phandles pointing to it. And you have this
> > fixed-link. It makes me think you have an Ethernet switch on the bus,
> > and this connects to it?
> Thanks for the clarification.
> Yes, there is an Ethernet switch in the design.
> The MAC is connected to the switch via RMII using a fixed-link
> configuration.

What make/model of switch is it? Is it unmanaged, or does it use SPI
or I2C for management?

	Andrew

