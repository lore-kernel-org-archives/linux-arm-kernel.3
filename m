Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7843FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QekdXNQU2gB5u6wAx4HFWIhwWvDRVo65LWC/6zm1k0s=; b=oQk2OpdPjJTInYd/6pibjcBSOB
	KCK9SvgnzZTgIcv3b2g/yuaDhith21mPp+6w6lfIkoSPQb6qm/fBy16mqdWg6krVl1zWj1KMarCVS
	Dr8xeR57PbNvcGhv+D5GfwsJC7JaQR9OOzdigK53lhyzAj2TZLi1WFdyogOVXa3cOAxYGZKp/Z3Hr
	MGYK8XNBCGIuLoQz/HNjV726FsQRLUyiPUAb4rEiE8rl+Ev92fwBNCSsATyCyI1xBxsiuVb2PC6Zp
	NzzBRs3dQ9Vx+6Q6+/GbS8seGjVfRBKr7DmxsTR9XH1UIakFI4hg+naYS791+w5EXsvJ9B/cAj3hp
	JLh9Rewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKu3-00000003Xsn-0ObQ;
	Tue, 22 Jul 2025 21:52:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKig-00000003Wvw-1yu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 21:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QekdXNQU2gB5u6wAx4HFWIhwWvDRVo65LWC/6zm1k0s=; b=aX37a1Rz2YzyNrGAowMhxVDcRg
	arIHJPBJkAEkkPtbjiC0svOsEC4EvGT0Z0R8NoxNQYMfpulErUWNaBuh/yKy7odP2J7DkW083mbIM
	CPAMjoE9TGoJHHTUNHnS5qnY5uSz2WCPorKksvp8dASKu9BU69Ymtp6HQXCiRnI8BXNWH2LPnCOz4
	lxrrbmd7P47utevVl/XfQqwnlTF0Tup/8OckYwp1zGawnPLhorxrkS8nUhDX287pGn1Xc4Ci8hoiH
	E94mOUnJHd2N9YQJW9i/E753Dy/mj7PDOhsMMwhnBYZlUv47rhBy8ZBtnH/+wXCqQv5C+YgdZWivq
	Abd//GWw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53462)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ueKiM-0000f5-0Q;
	Tue, 22 Jul 2025 22:39:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ueKiH-0007U5-22;
	Tue, 22 Jul 2025 22:39:53 +0100
Date: Tue, 22 Jul 2025 22:39:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_144018_516434_7EA755EE 
X-CRM114-Status: GOOD (  25.81  )
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

On Tue, Jul 22, 2025 at 10:59:51PM +0200, Andrew Lunn wrote:
> >         if (!priv->plat->pmt) {
> 
> Let me start with maybe a dumb question. What does pmt mean? Why would
> it be true?

->pmt being true means the MAC supports remote wakeup (in other words,
magic packet or unicast), and the glue driver has not set the
STMMAC_FLAG_USE_PHY_WOL flag to force the use of PHY WoL.

->pmt being false means that the MAC doesn't support remote wakeup
(in other words, has no ability to wake the system itself) _or_ the
platform wishes to force the use of PHY WoL when the MAC does support
remote wakeup.

> 
> >                 struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
> > 
> >                 phylink_ethtool_get_wol(priv->phylink, &wol);
> >                 device_set_wakeup_capable(priv->device, !!wol.supported);
> >                 device_set_wakeup_enable(priv->device, !!wol.wolopts);
> 
> Without knowing what pmt means, this is pure speculation....  Maybe it
> means the WoL output from the PHY is connected to a pin of the stmmac.
> It thus needs stmmac to perform the actual wakeup of the system, as a
> proxy for the PHY?

stmmac itself doesn't have an input for PHY interrupts, so a PHY
which signals WoL via its interrupt pin (e.g. AR8035) wouldn't go
through stmmac.


I mentioned above the STMMAC_FLAG_USE_PHY_WOL flag. To see why this
flag is needed, on the Jetson Xavier NX platform, a RTL8211 PHY is used
with stmmac - I think it's RTL8211F (without powering it back up, I
can't check.) This PHY supports WoL, but signals wake-up through a
dedicated PMEB pin. If a platform decides not to wire the PMEB pin, WoL
on the PHY is unusable.

rtl8211f_get_wol() does not take account of whether the PMEB pin is
wired or not. Thus, stmmac can't just forward the get_wol() and
set_wol() ops to the PHY driver and let it decide, as suggested
earlier. As stmmac gets used with multiple PHYs, (and hey, we can't
tell what they are, because DT doesn't list what the PHY actually is!)
we can't know how many other PHY drivers also have this problem.

So, the idea put forward that ethernet drivers should forward get_wol()
and set_wol() to the PHY driver and only do WoL at the MAC if the PHY
doesn't support it is, I'm afraid, now fundamentally flawed.

We can't retrofit such detection into PHY drivers - if we do so, we'll
break WoL on lots of boards (we'd need to e.g. describe PMEB in DT for
RTL8211F PHYs. While we can add it, if a newer kernel that expects
PMEB to be described to allow WoL is run with an older DT, then that
will be a regression.) Thus, I don't see how we could retrofit PHY
WoL support detection to MAC drivers.

So, while it is undesirable to have a flag in DT to say "we can use
PHY WoL on this platform" and we can whinge that it isn't "describing
hardware", DT _hasn't_ been describing the hardware, and trying to fix
DT to properly describe the hardware now is going to cause _lots_ of
breakage.

I can't see a way forward on this unless someone is willing to relax
over what seem to be hard requirements (e.g. no we don't want a flag
in DT to say use PHY WoL.) We have collectively boxed ourselves into
a corner on this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

