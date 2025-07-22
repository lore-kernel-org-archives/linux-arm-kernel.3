Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81450C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8qiQBG36WBSmQUwYyp0uzxMsuI5XvwcDQhc2TTCUsM=; b=RATiVR01vH4+vSgfIUTxkRW5vE
	SSgHRiiNjmjpp6+wuOvgS2XRJpvtndKTBylcsZx/NdAQy7AfXnaw/ioSWx1/KbxG64DkGdgJy5lU8
	mE0iK1dRqYXKiDf/LfeTEHZf73xE7kAdzlcM/zM8Usz2jhIs9RPb0FEUr6M3XEbuskcl+W3izOxWe
	x6y6VNCpqPiG4cm8If/9g8id73rzugQVNql28kngvcxdGOkNIUUXIA+oKjCjVQDjej/8jXoHDRtpS
	HVGvhHcIFgA8ssGBD1lO2YaFxB/MWyopo3DciIdhQvNRvfLbbh2RTynjJtPiGoAyoTY87U0f3JQU1
	+UFDqQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDtP-00000002gea-0f9P;
	Tue, 22 Jul 2025 14:22:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDEN-00000002ZvJ-3rwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 13:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J8qiQBG36WBSmQUwYyp0uzxMsuI5XvwcDQhc2TTCUsM=; b=1+uOPwRXEBL1bsymdavVsthvYW
	PIxAm0lVjGxP5QIRq9kR9moqG69iPLRejLM6DR8ey+R6MoRoChI7PhS95xy5RDt21pHF5hI0Lnbpm
	/MRewzSUzB7pzCLs42MWPvp1XDtZuWHHwPs+XSCnNM5XnUzm6Rc+gzje3gyTJ3ixqr7k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ueDE8-002TAs-HI; Tue, 22 Jul 2025 15:40:16 +0200
Date: Tue, 22 Jul 2025 15:40:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_064031_959894_EEF2B777 
X-CRM114-Status: GOOD (  15.94  )
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

I know Russell has also replied about issues with stmmac. Please
consider that when reading what i say... It might be not applicable.

> Seems like a fair and logical approach. It seems reasonable that the
> MAC driver relies on the get_wol() API to know what's supported.
> 
> The tricky thing for the PHY used in this patchset is to get this
> information:
> 
> Extract from the documentation of the LAN8742A PHY:
> "The WoL detection can be configured to assert the nINT interrupt pin
> or nPME pin"

https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt

It is a bit messy, but in the device tree, you could have:

    interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
                 <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
    interrupt-names = "nINT", "wake";
    wakeup-source

You could also have:

    interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
    interrupt-names = "wake";
    wakeup-source

In the first example, since there are two interrupts listed, it must
be using the nPME. For the second, since there is only one, it must be
using nINT.

Where this does not work so well is when you have a board which does
not have nINT wired, but does have nPME. The phylib core will see
there is an interrupt and request it, and disable polling. And then
nothing will work. We might be able to delay solving that until such a
board actually exists?

	Andrew

