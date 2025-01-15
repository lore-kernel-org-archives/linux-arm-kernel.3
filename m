Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302BDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMPOFGdyj84J2ye+wJ0aXvtsP3NEoSOPoej4rayVbzg=; b=0XIuPAPD8xcWBTNY+T8bKLrSW/
	39p1I0X+staSQ2EuM5RuyxOpVI222MczG8UrcCDtjCX5a0eiu/IKgCNrByP6c1vaYqvzvoQUgFJxb
	8oqN3+YbhrmfMQoCKpmCzs0p2Gd5OPzd8Ch7BtCaPgv0UKpEUp4yrRrO2ypbNDuLIHpGUvb0ZFiVN
	JB+m566D3G1CxVoZ9GOj8+9N6dA05oQWnFyLCQTFxvl/wUdh+YnEMVTLJo4uNkqvddh19GR/iqLxN
	5uWTb6vmOKCdTcVfOhIFStat9ue4umGnq0KfDsWfR/6fwXhw0Fx2SaQIvCAYcNxbXqUa54GO7mjU7
	lZQsFvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5lB-0000000CLRR-1qc4;
	Wed, 15 Jan 2025 15:56:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5ju-0000000CLIH-1XiX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YMPOFGdyj84J2ye+wJ0aXvtsP3NEoSOPoej4rayVbzg=; b=zWOfLaCmnzXYSVoMjQ65XsLomQ
	IcHHOuuGVV4U1LNofDaBuYtPJ872hC2P7bJ9dVTjYZViHT9pRHxzFAHa8JYGoZLesYZwt+gq2iuQC
	SF2SmXfmf30JI17Dc9MGpvmWUTnP2gdK7bwdpEgv6dBIY/wW9O4LyYBx1LYdx0GX809Y8LzPYeMLH
	VPQ4KZu2U6PMzeluXFEHxXoF72rao1XtyR8+9E4KDcXjzp+Gzf2jxplgmvkS2p6Gez5ztBe/D7GRV
	ht0r75ASPiJuASikd2K2BGADRs27BCcAwu+m+tJmbG0RsUyZgnumF6Ye+wRR1RsPbjL5LQJaytdz7
	Q5V0C9Fw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53616)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tY5jn-0001NL-2b;
	Wed, 15 Jan 2025 15:55:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tY5jl-0006HS-1G;
	Wed, 15 Jan 2025 15:55:21 +0000
Date: Wed, 15 Jan 2025 15:55:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH RFC net-next 04/10] net: phylink: add EEE management
Message-ID: <Z4faaYXMD13tSlT5@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhUp-000n0Y-BA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tXhUp-000n0Y-BA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_075530_407303_7727CF44 
X-CRM114-Status: GOOD (  30.33  )
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

On Tue, Jan 14, 2025 at 02:02:19PM +0000, Russell King (Oracle) wrote:
> Add EEE management to phylink, making use of the phylib implementation.
> This will only be used where a MAC driver populates the methods and
> capabilities bitfield, otherwise we keep our old behaviour.
> 
> Phylink will keep track of the EEE configuration, including the clock
> stop abilities at each end of the MAC to PHY link, programming the PHY
> appropriately and preserving the LPI configuration should the PHY go
> away.
> 
> Phylink will call into the MAC driver when LPI needs to be enabled or
> disabled, with the requirement that the MAC have LPI disabled prior
> to the netdev being brought up (in other words, it will only call
> mac_disable_tx_lpi() if it has already called mac_enable_tx_lpi().)
> 
> Support for phylink managed EEE is enabled by populating both tx_lpi
> MAC operations method pointers, and filling in both LPI interfaces
> and capabilities. If the methods are provided but the LPI interfaces
> or capabilities remain empty, this indicates to phylink that EEE is
> implemented by the driver but the hardware it is driving does not
> support EEE, and thus the ethtool set_eee() and get_eee() methods will
> return EOPNOTSUPP.
> 
> No validation of the LPI timer value is performed by this patch.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 133 ++++++++++++++++++++++++++++++++++++--
>  include/linux/phylink.h   |  45 +++++++++++++
>  2 files changed, 174 insertions(+), 4 deletions(-)

In discussion with Herner, it came to my attention that the way I'm
restricting EEE modes in this patch is actually buggy. I've been
intending to update this patch once Herner's patch set has been merged,
but this morning, Jakub asked for changes to it.

So, rather than waiting for that, I'm intending to use a different
solution - rather than waiting for Herner's patch set and adapting mine
to it. So, the patch below will change the way EEE modes are restricted
in such a way that this is independent of Herner's series. We
basically apply our own restriction to the supported modes after
calling phylib's get_eee() method, and restrict the advertised modes
before attaching the PHY and before calling phylib's set_eee() method.

Once Herner's patch set is merged, maybe I can manipulate the
eee disabled modes mask instead, and leave this to phylib to deal
with.

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index c430ac2e5e9f..b561a8228612 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,7 @@ struct phylink {
 	u8 act_link_an_mode;		/* Active MLO_AN_xxx mode */
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -1623,19 +1624,6 @@ static void phylink_activate_lpi(struct phylink *pl)
 			    pl->mac_ops->mac_enable_tx_lpi, ERR_PTR(err));
 }
 
-static void phylink_phy_restrict_eee(struct phylink *pl, struct phy_device *phy)
-{
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(eee_supported);
-
-	/* Convert the MAC's LPI capabilities to linkmodes */
-	linkmode_zero(eee_supported);
-	phylink_caps_to_linkmodes(eee_supported, pl->config->lpi_capabilities);
-
-	/* Mask out EEE modes that are not supported */
-	linkmode_and(phy->supported_eee, phy->supported_eee, eee_supported);
-	linkmode_and(phy->advertising_eee, phy->advertising_eee, eee_supported);
-}
-
 static void phylink_link_up(struct phylink *pl,
 			    struct phylink_link_state link_state)
 {
@@ -2242,10 +2230,16 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		phy->eee_cfg.tx_lpi_enabled = pl->eee_cfg.tx_lpi_enabled;
 		phy->eee_cfg.tx_lpi_timer = pl->eee_cfg.tx_lpi_timer;
 
+		/* Convert the MAC's LPI capabilities to linkmodes */
+		linkmode_zero(pl->supported_lpi);
+		phylink_caps_to_linkmodes(pl->supported_lpi,
+					  pl->config->lpi_capabilities);
+
 		/* Restrict the PHYs EEE support/advertisement to the modes
 		 * that the MAC supports.
 		 */
-		phylink_phy_restrict_eee(pl, phy);
+		linkmode_and(phy->advertising_eee, phy->advertising_eee,
+			     pl->supported_lpi);
 	} else if (pl->mac_supports_eee_ops) {
 		/* MAC supports phylink EEE, but wants EEE always disabled. */
 		phy_disable_eee(phy);
@@ -3188,8 +3182,13 @@ int phylink_ethtool_get_eee(struct phylink *pl, struct ethtool_keee *eee)
 	if (pl->mac_supports_eee_ops && !pl->mac_supports_eee)
 		return ret;
 
-	if (pl->phydev)
+	if (pl->phydev) {
 		ret = phy_ethtool_get_eee(pl->phydev, eee);
+		/* Restrict supported linkmode mask */
+		if (ret == 0 && pl->mac_supports_eee_ops)
+			linkmode_and(eee->supported, eee->supported,
+				     pl->supported_lpi);
+	}
 
 	return ret;
 }
@@ -3232,6 +3231,10 @@ int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 	ret = -EOPNOTSUPP;
 
 	if (pl->phydev) {
+		/* Restrict advertisement mask */
+		if (pl->mac_supports_eee_ops)
+			linkmode_and(eee->advertised, eee->advertised,
+				     pl->supported_lpi);
 		ret = phy_ethtool_set_eee(pl->phydev, eee);
 		if (ret == 0)
 			eee_to_eeecfg(&pl->eee_cfg, eee);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

