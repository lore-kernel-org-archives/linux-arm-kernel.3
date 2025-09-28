Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399B0CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4AdV+djV+yTy0JX/TnMvSNKHPhRFNpLrO26oQgiLoA=; b=Ts8yn7i932ABDXzVmhpwUQb4sg
	tdaIR7zddYzqONpq11W1MKMartnDBqJzD0/d6dkKOz63sLynewdE1Wkd1FJ3fS/+2CjFtZECCvrG9
	XGgN8lPyDyr+DKbJPmppuZjsE3ST8EV525uANzrHdvdg1B8bMHbhPnPKRo15j/f2C2cMCCanNejbE
	pXdBGdTZB8LNt6UchzBuxa0rk5zGLJ/j5rD5rn2y+o2qHqGeJWnMugLW4b55s55iNCwSXOjVP/Ydx
	0rYHQWGNhsd7UoImBeYOZDlhmoXIQwB/Af48irkyKdCbzRRE76Ra+FcUXwRvVwezpjtEjqyycq8zK
	98g65WvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mfa-0000000EI22-1l0B;
	Sun, 28 Sep 2025 08:22:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mfX-0000000EI0m-1sfB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h4AdV+djV+yTy0JX/TnMvSNKHPhRFNpLrO26oQgiLoA=; b=oKHHqryOllCf4DGRx+mmOcOyYq
	qlL7l2DsPeXL7X9WQUyqSYuEtoQn4MyLneUOunlCH98RltxCZi4tAe6eaGjSBFD8c8C5WxbG4RbgQ
	71qVakVU13nw89eu/EaWEEzCptoyRj321RKwY0HCjwsUfaBCohb0GsMexIBpixwfh/iGlDvRCM+tg
	0EuVurCzgNP9xRX45J8KIo7ZcYNWb4o3rCf6ERoS7W27eiDbW1VcnmPKWjeTIHfN/eMRaJcvgBx6d
	ClmeBe0V5/qeQ3LXj984L1UvWEHENh6jDupX0gbWL6us97wJUkbdq84/koUNhOy+ryxJffEPe1Dh8
	9gwUPoOg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49782)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v2mfE-0000000057R-3ezc;
	Sun, 28 Sep 2025 09:21:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v2mfA-000000002QE-1riS;
	Sun, 28 Sep 2025 09:21:44 +0100
Date: Sun, 28 Sep 2025 09:21:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
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
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
Message-ID: <aNjwGHrefA5j3dOp@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
 <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_012207_491004_20BE2187 
X-CRM114-Status: GOOD (  15.96  )
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

On Fri, Sep 26, 2025 at 12:05:19PM -0700, Florian Fainelli wrote:
> I like the direction this is going, we could probably take one step further
> and extract the logic present in bcmgenet_wol.c and make those helper
> functions for other drivers to get the overlay of PHY+MAC WoL
> options/password consistent across all drivers. What do you think?

The logic I've implemented is fairly similar, but with one difference:
I'm always storing the sopass, which means in the wol_get method I
don't have to be concerned with the sopass returned by the PHY.
This should be fine, unless the PHY was already configured for WoL
magicsecure, and in that case we'll return a zero SOPASS but indicating
WAKE_MAGICSECURE which probably isn't great.

So, my new get_wol logic is:

        if (phylink_mac_supports_wol(pl)) {
                if (phylink_phy_supports_wol(pl, pl->phydev))
                        phy_ethtool_get_wol(pl->phydev, wol);

                /* Where the MAC augments the WoL support, merge its support and
                 * current configuration.
                 */
                if (~wol->wolopts & pl->wolopts_mac & WAKE_MAGICSECURE)
                        memcpy(wol->sopass, pl->wol_sopass,
                               sizeof(wol->sopass));

                wol->supported |= pl->config->wol_mac_support;
                wol->wolopts |= pl->wolopts_mac;

with:

static bool phylink_mac_supports_wol(struct phylink *pl)
{
        return !!pl->mac_ops->mac_wol_set;
}

static bool phylink_phy_supports_wol(struct phylink *pl,
                                     struct phy_device *phydev)
{
        return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
}

static inline bool phy_can_wakeup(struct phy_device *phydev)
{
        return device_can_wakeup(&phydev->mdio.dev);
}

This is to cope with PHYs that respond to phy_ethtool_get_wol()
reporting that they support WoL but have no capability to actually wake
the system up. MACs can choose whether to override that by setting
phylink_config->wol_phy_legacy.

Much like taking this logic away from MAC driver authors, I think we
need to take the logic around "can this PHY actually wake-up the
system" away from the PHY driver author. I believe every driver that
supports WoL with the exception of realtek and broadcom.c reports that
WoL is supported and accepts set_wol() even when they're not capable
of waking the system. e.g. bcm_phy_get_wol():

        wol->supported = BCM54XX_WOL_SUPPORTED_MASK;
        wol->wolopts = 0;

with no prior checks. This is why the "phylink_phy_supports_wol()"
logic above is necessary, otherwise implementing this "use either
the PHY or MAC" logic will break stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

