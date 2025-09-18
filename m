Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DADCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZhxEQj8wZgmKlh5JqOaBLYYciKgqt6bF58Ec3MI89Q=; b=3um4v4Y1Bfl2xqS7tAlek4O3Hh
	HBt2QSSPAKEU3h0FHF410Mh+BvJVdRgL5T4YZCWu/uK6jCK4xgo9/YovCAAvJeNLAPYAAdypN22KL
	2gzPOe6DOmwzk1A6KNRf5+TbmgSE25Yc7rYDZfWSjt5W8VgVW2lOO5cMng1KKzLs7yxz2ydLmorJE
	cjqlfLWth7n11INLl/39b3NtjYrpfirsC8gyARDv/+9672H79FpGhIecvp2XlLzZZrUetSAX++J2C
	cG3/QzGQ8vxJK2UJcXUHWlsN0D59wOL+4+dpbfP1q/uDscKaXMBmCYe2/dIUyivbNKXtWJrIGef6T
	aTEALhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFAh-0000000014d-0rdj;
	Thu, 18 Sep 2025 13:59:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFAd-0000000012x-3Eqe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jZhxEQj8wZgmKlh5JqOaBLYYciKgqt6bF58Ec3MI89Q=; b=x0uhvtYBfqM4ev+QWxKV0Frpwg
	N9X8yEsVyXlcdquDplWJZyDSlAuYdBR/tphzRSDW0zb1xSWPXb5fyhb6wT625E6bya4WZyk3APlLp
	GVzyCnyrbryNoM1RQ6h5uepOBsoSK1fQX5fQ9KY3kEC7q/gLhn5VGtaDK7f0zZxqJU4MD8lIEVOp9
	C+vWkp3FiAdoyUyE+IeL/dsRBWh8fDVUt5eS1Fc01ftOWH7skmHklK/wGzAPgsLg+EfMgPIsZ2krI
	5P1StXX1neYRSzqDCeJDD34LPKo1UIlSvE9Mm0EohDvCDVEATdxJDVNrtVBUOsUeL0zLiWOp7wQoi
	93q80zzw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uzFAC-000000000ng-2pjn;
	Thu, 18 Sep 2025 14:59:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uzFA8-000000001EY-1H75;
	Thu, 18 Sep 2025 14:59:04 +0100
Date: Thu, 18 Sep 2025 14:59:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
Message-ID: <aMwQKERA1p29BeKF@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_065936_244164_A469056A 
X-CRM114-Status: GOOD (  50.56  )
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

On Thu, Sep 18, 2025 at 02:46:54PM +0200, Gatien CHEVALLIER wrote:
> On 9/17/25 18:31, Russell King (Oracle) wrote:
> > On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
> > > If the "st,phy-wol" property is present in the device tree node,
> > > set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
> > > the PHY.
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > >   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > @@ -106,6 +106,7 @@ struct stm32_dwmac {
> > >   	u32 speed;
> > >   	const struct stm32_ops *ops;
> > >   	struct device *dev;
> > > +	bool phy_wol;
> > >   };
> > >   struct stm32_ops {
> > > @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
> > >   		}
> > >   	}
> > > +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
> > > +
> > >   	return err;
> > >   }
> > > @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
> > >   	plat_dat->bsp_priv = dwmac;
> > >   	plat_dat->suspend = stm32_dwmac_suspend;
> > >   	plat_dat->resume = stm32_dwmac_resume;
> > > +	if (dwmac->phy_wol)
> > > +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
> > 
> > I would much rather we found a different approach, rather than adding
> > custom per-driver DT properties to figure this out.
> > 
> > Andrew has previously suggested that MAC drivers should ask the PHY
> > whether WoL is supported, but this pre-supposes that PHY drivers are
> > coded correctly to only report WoL capabilities if they are really
> > capable of waking the system. As shown in your smsc PHY driver patch,
> > this may not be the case.
> 
> So how can we distinguish whether a PHY that implements WoL features
> is actually able (wired) to wake up the system? By adding the
> "wakeup-source" property to the PHY node?

Andrew's original idea was essentially that if the PHY reports that it
supports WoL, then it's functional.

Sadly, that's not the case with many PHY drivers - the driver
implementers just considered "does this PHY have the ability to detect
WoL packets" and not "can this PHY actually wake the system."

Thankfully, all but one PHY driver does not use
device_set_wakeup_capable() - my recent patches for realtek look like
the first PHY driver to use this.

Thus, if we insist that PHY drivers use device_set_wakeup_capable()
to indicate that (a) they have WoL capability _and_ are really
capable of waking the system, we have a knob we can test for.

Sadly, there is no way to really know whether the interrupt that the
PHY is attached to can wake the system. Things get worse with PHYs
that don't use interrupts to wake the system. So, I would suggest
that, as we already have this "wakeup-source" property available for
_any_ device in DT, we start using this to say "on this system, this
PHY is connected to something that can wake the system up."

See the past discussion when Realtek was being added - some of the
context there covers what I mention above.

> Therefore, only set the "can wakeup" capability when both the PHY
> supports WoL and the property is present in the PHY node?

Given that telling the device model that a device is wakeup
capable causes this to be advertised to userspace, we really do
not want devices saying that they are wakeup capable when they
aren't capable of waking the system. So I would say that a call
to device_set_wakeup_capable(dev, true) should _only_ be made if
the driver is 100% certain that this device really can, without
question, wake the platform.

If we don't have that guarantee, then we're on a hiding to nothing
and chaos will reign, MAC drivers won't work properly... but I would
suggest that's the price to be paid for shoddy implementation and
not adhering to a sensible approach such as what I outline above.

> However, this does not solve the actual static pin function
> configuration for pins that can, if correct alternate function is
> selected, generate interrupts, in PHY drivers.
> 
> It would be nice to be able to apply some kind of pinctrl to configure
> the PHY pins over the MDIO bus thanks to some kind of pinctrl hogging.
> This suggests modifying relevant PHY drivers and documentation to be
> able to handle an optional pinctrl.

How would that work with something like the Realtek 8821F which has
a single pin which can either signal interrupts (including a wake-up)
or be in PME mode, where it only ever signals a wake-up event.
Dynamically switching between the two modes is what got us into the
crazy situation where, when WoL was enabled on this PHY, phylib
stopped working because the pin was switched to PME mode, and we no
longer got link status interrupts. So one could enable WoL, plug in
an ethernet cable, and the kernel has no idea that the link has come
up.

So no. In a situation like this, either we want to be in interrupt
mode (in which case we have an interrupt), or the pin is wired to
a power management controller and needs to be in PME mode, or it isn't
wired.

Which it is can be easily identified.

$1. Is there an interrupt specified (Y/N) ?
$2. Is there a wakeup-source property (Y/N) ?

States:
$1  $2
*   N   we have no idea if an interrupt (if specified) can wake the
        system, or if there is other wiring from the PHY which might.
	Legacy driver, or has no wake-up support. We have to fall back
	on existing approaches to maintain compatibility and void
	breaking userspace, which may suggest WoL is supported when it
	isn't. For example, with stmmac, if STMMAC_FLAG_USE_PHY_WOL is
	set, we must assume the PHY can wake the system in this case.
Y   Y   interrupt wakes the system, we're good for WoL
N   Y   non-interrupt method of waking the system, e.g. PME

I'd prefer not to go for a complicated solution to this, e.g. involving
pinctrl, when we don't know how many PHYs need this, because forcing
extra complexity on driver authors means we have yet more to review, and
I think it's fair to say that we're already missing stuff. Getting the
pinctrl stuff right also requires knowledge of the hardware, and is
likely something that reviewers can't know if it's correct or not -
because datasheets giving this information aren't publicly available.

So, I'm all in favour of "keep it damn simple, don't give people more
work, even if it looks nice in DT" here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

