Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB795C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGnkEZQrJ+KCotninbE6PxpnOQMilZmp9uMJbvlcMQ8=; b=mH7Ads9w/t7NQI7e38aE+dj+WK
	E6mSw/aMDn+D4wYEt+k/z/WcJTKYJA9dfCCMTYjImd4MxETU1jfoRmq6bXXJcrhwTaw6rV8MucPax
	+MeaoBC+wXh4Yg3y8AeduE9MjtK67Kfpi+W2TvB/pz7AGLVx19fHYHLJxM89HNYkqJ5/YECYR39z4
	QSA19D0ZOjBJ+U5ADycp7sxmup2w7wTO/QTtKbGXkAu0sK04TIzsuiFWsJPa1dEHG9R/osKUprgIe
	KB+95oFxDeOxmpPMeCfeO+WTly0LUTaroAsGt+E+jfaiG3D3c6H1SZ5d0Chz+lP09QpwfeMC7igWu
	0OvK4Whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueat0-00000005IDv-2e02;
	Wed, 23 Jul 2025 14:56:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaO8-00000005C0Z-1ima
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 14:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wGnkEZQrJ+KCotninbE6PxpnOQMilZmp9uMJbvlcMQ8=; b=g8TAycskRftknN7I5qk+Oh1vKa
	XMC4Bjn7iTfccsiY/vnnITO0PQk7GPx6zLqJLGwhzTxL6ojmsFudhTCkxcPWwZUefUvfMXt+R8PBp
	BUDjLcdZFuXBBGXSRzWF1jCV8F/TP/P6zPwioNQfXHGfuwfUx9PwuBmPesqPQ1gmisFU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ueaNv-002b7y-9m; Wed, 23 Jul 2025 16:23:55 +0200
Date: Wed, 23 Jul 2025 16:23:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <9f00a6cf-c441-4b4c-84ca-5c41e6f0a9d9@lunn.ch>
References: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
 <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_072408_451125_04DF552E 
X-CRM114-Status: GOOD (  16.68  )
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

> We can't retrofit such detection into PHY drivers - if we do so, we'll
> break WoL on lots of boards (we'd need to e.g. describe PMEB in DT for
> RTL8211F PHYs. While we can add it, if a newer kernel that expects
> PMEB to be described to allow WoL is run with an older DT, then that
> will be a regression.) Thus, I don't see how we could retrofit PHY
> WoL support detection to MAC drivers.

WoL is a mess. I wounder on how many boards it actually works
correctly? How often is it tested?

I actually think this is similar to pause and EEE. Those were also a
mess, and mostly wrongly implemented. The solution to that was to take
as much as possible out of the driver and put it into the core,
phylink.

We probably want a similar solution. The MAC driver indicates its WoL
capabilities to phylink. The PHY driver indicates its capabilities to
phylink. phylink implements all the business logic, and just tells the
PHY what it should enable, and stay awake. phylink tells the MAC what
is should enable, and that it should stay awake.

Is this going to happen? Given Russell limited availability, i guess
not. It needs somebody else to step up and take this on. Are we going
to break working systems? Probably. But given how broken this is
overall, how much should we actually care? We can just fix up systems
as they are reported broken.

I also think WoL, pause and EEE is a space we should have more tests
for. To fully test WoL and pause you need a link partner, but i
suspect you can do some basic API tests without one. WoL you
definitely need a link partner. So this makes testing a bit more
difficult. But that should not stop the community from writing such
tests and making them available for developers to use.

	Andrew

