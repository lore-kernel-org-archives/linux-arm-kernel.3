Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C668CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXaqcsYENogvAnvlB2KNNelAI84J4RkeUSRS8e50eXg=; b=k69qTQPrEZwashXanqvBRVpHSZ
	UN/8TY+eZZiVocOuXlDYY+ACk8ZLKKpD3dyTDALcjDBp1xCsD2DtG0MuxUEWMbj+Sv0uqA5k0k/il
	HQz6aYPAn0tanPlKfr0gKGS6QPpaIBw202OsxHrEKG8wQG7c99UgwVj/FRQHhcWOd92Anhfx0td8O
	aL5brgjvX3DOENjs7dwaXe2qm0aUI+ebbAZOI44E8VDqa90r5cPbTuXXhVMaDGPWHWigJvzsO4yaF
	SQ02mENl6MAKbsR/eJM4LbxCoArve1D4gZHAyFvtsJr5I3m1OThAaWFkJmSIwxivQgd8G2Rs2kPXr
	DbzdEczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyb1s-00000008pbA-0Vjo;
	Tue, 16 Sep 2025 19:07:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyb1p-00000008pZ4-0QAE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EXaqcsYENogvAnvlB2KNNelAI84J4RkeUSRS8e50eXg=; b=L0qSGYez+AX/bZrlmzh1BNLW0E
	EtKNdzLn0IOSUqLJ95hkAkKr/WHGXbRVqtBgnw6ggf6aJDSJttdau3MVJyP/oD0PcpfSqDKX7qm0E
	CVa8efe7MTJIwxmBA6mnF+ERrenn5O8SrFw7wUx2vWKbMVm/U76tRW8JqQwbgcR5PZts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyb1b-008bIv-HR; Tue, 16 Sep 2025 21:07:35 +0200
Date: Tue, 16 Sep 2025 21:07:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <3f5e82ec-d96e-4258-b117-9876313f5402@lunn.ch>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
 <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
 <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
 <92bcdac9-44b1-4fc8-892a-01ef0ed0b7e0@bsdio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92bcdac9-44b1-4fc8-892a-01ef0ed0b7e0@bsdio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_120749_137457_9B26FA4A 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, Sep 16, 2025 at 12:40:15PM -0600, Rebecca Cran wrote:
> On 9/15/25 18:37, Andrew Lunn wrote:
> 
> > And does it have a PHY? On an MDIO bus? Unless i'm mistaken, you don't
> > describe the PHY, a phy-handle pointing to the PHY, and don't have
> > phy-mode = 'rgmii-id'.
> 
> I've been trying to figure this out. Yes, it's connected to a PHY (an
> RTL8211E).
> 
> At the moment it's being detected by OpenBMC as:
> 
> ftgmac100 1e680000.ethernet: Read MAC address 9c:6b:00:43:0b:bd from device
> tree
> RTL8211E Gigabit Ethernet 1e680000.ethernet--1:00: attached PHY driver

So what is probably happening is that the ftgmac100 is creating an
MDIO bus. It does not matter if there is no node for it, it still
creates the bus, and the PHYs on the bus are found. You should be able
to see this in /sys/class/mdio_bus/. Then, since there is no
phy-handle, it uses phy_find_first() to find the first PHY on the bus,
and binds to that.

Now, it looks like all other aspeed-g5 boards also don't link to the
PHY. But the driver does seem to support adding an 'mdio' node within
the ethernet node, and listing the PHYs. Something like:

       mdio {
                #address-cells = <1>;
                #size-cells = <0>;

                ethphy0: ethernet-phy@0 {
                        reg = <0>;
                };
        };

And then you can add a phy-handle to point to it.

Then the question is, did Aspeed mess up the RGMII delays for g5? You
can try phy-mode = 'rgmii-id' and see if it works.

    Andrew

