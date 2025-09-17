Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAF4CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7ZqalwnvjICi7kuOiOIafiliCtJGxrARFdp8W4lXxY=; b=srG2hh7AgxfeuDd67vyUFkhKx+
	llMANNQRWhEekWN9Yejaj2xYPbtY78t7eUHpEdSSGXp4Pxea8SYSqesmpaQoBaT6DbKTW/XLna4wS
	/1pHVLnkz12Q6VIfRTkPjgUSyq+S8snuhL7ZQriMsyF8jTUGGDNVB4Q7TJ62IkamiFlIVbuy9//6Y
	1XwI4chA+wTC+D2fGC1+uI4yvPR33JnGUqmCZf8ocDWQZhROpDEEadNg5aZQIkRt0XPLcEggsvpPx
	e9XveegLQQa64XOWrcqYPtJ+DKtmvNnxFxzMMXhHbHcCQEmoRgu1xQej7BMUSkM2B24ynicIIGhXS
	t3ASSd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv4E-0000000DBuC-3tUu;
	Wed, 17 Sep 2025 16:31:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv4C-0000000DBrC-1XNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t7ZqalwnvjICi7kuOiOIafiliCtJGxrARFdp8W4lXxY=; b=lqNmbubTKYTpthGWHPykLNREkq
	a6h0sXLqwZcvzf1kHFi8/4wqRzTLPZ5t4JG0CX4Ax83EBEIolNl3BmwHrN5NmNiZX671xdmPJSgH2
	nFtq7ceA+M5n1PeBvkOVPFNvRXxDrq8tYVBobWZmNDyHpKQmZ158OQtCadM+oLJDaOmnk77cmCPYl
	IFMBaQIdpJj0yuWqNpTnxRkrKexCbJs00Ef7dR2v3QxXq/JjrV8aDwIZKLzlbVv7iTPkFIPpFwXkb
	d6e9GNwiy2bH5R5G8dIxQjEYUZwXZcz8KvO6Swi1xoMfVcDOTSVBZeIUeAISi+cACfrpX4OE/tHJs
	d90qzIPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyv3v-000000005BG-32EF;
	Wed, 17 Sep 2025 17:31:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyv3s-000000000LJ-1mOb;
	Wed, 17 Sep 2025 17:31:16 +0100
Date: Wed, 17 Sep 2025 17:31:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
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
Message-ID: <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_093136_409146_BCF62C7B 
X-CRM114-Status: GOOD (  29.50  )
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

On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
> If the "st,phy-wol" property is present in the device tree node,
> set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
> the PHY.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -106,6 +106,7 @@ struct stm32_dwmac {
>  	u32 speed;
>  	const struct stm32_ops *ops;
>  	struct device *dev;
> +	bool phy_wol;
>  };
>  
>  struct stm32_ops {
> @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>  		}
>  	}
>  
> +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
> +
>  	return err;
>  }
>  
> @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->suspend = stm32_dwmac_suspend;
>  	plat_dat->resume = stm32_dwmac_resume;
> +	if (dwmac->phy_wol)
> +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;

I would much rather we found a different approach, rather than adding
custom per-driver DT properties to figure this out.

Andrew has previously suggested that MAC drivers should ask the PHY
whether WoL is supported, but this pre-supposes that PHY drivers are
coded correctly to only report WoL capabilities if they are really
capable of waking the system. As shown in your smsc PHY driver patch,
this may not be the case.

Given that we have historically had PHY drivers reporting WoL
capabilities without being able to wake the system, we can't
implement Andrew's suggestion easily.

The only approach I can think that would allow us to transition is
to add:

static inline bool phy_can_wakeup(struct phy_device *phy_dev)
{
	return device_can_wakeup(&phy_dev->mdio.dev);
}

to include/linux/phy.h, and a corresponding wrapper for phylink.
This can then be used to determine whether to attempt to use PHY-based
Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
PMT-based WoL if supported at the MAC.

So, maybe something like:

static u32 stmmac_wol_support(struct stmmac_priv *priv)
{
	u32 support = 0;

	if (priv->plat->pmt && device_can_wakeup(priv->device)) {
		support = WAKE_UCAST;
		if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
			support |= WAKE_MAGIC;
	}

	return support;
}

static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
{
	struct stmmac_priv *priv = netdev_priv(dev);
	int err;

	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
	if (phylink_can_wakeup(priv->phylink) ||
	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
		err = phylink_ethtool_get_wol(priv->phylink, wol);
		if (err != 0 && err != -EOPNOTSUPP)
			return;
	}

	wol->supported |= stmmac_wol_support(priv);

	/* A read of priv->wolopts is single-copy atomic. Locking
	 * doesn't add any benefit.
	 */
	wol->wolopts |= priv->wolopts;
}

static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
{
	struct stmmac_priv *priv = netdev_priv(dev);
	u32 support, wolopts;
	int err;

	wolopts = wol->wolopts;

	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
	if (phylink_can_wakeup(priv->phylink) ||
	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
		struct ethtool_wolinfo w;

		err = phylink_ethtool_set_wol(priv->phylink, wol);
		if (err != -EOPNOTSUPP)
			return err;

		/* Remove the WoL modes that the PHY is handling */
		if (!phylink_ethtool_get_wol(priv->phylink, &w))
			wolopts &= ~w.wolopts;
	}

	support = stmmac_wol_support(priv);

	mutex_lock(&priv->lock);
	priv->wolopts = wolopts & support;
	device_set_wakeup_enable(priv->device, !!priv->wolopts);
	mutex_unlock(&priv->lock);

	return 0;
}

... and now I'm wondering whether this complexity is something that
phylink should handle internally, presenting a mac_set_wol() method
to configure the MAC-side WoL settings. What makes it difficult to
just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
that could be a "force_phy_wol" flag in struct phylink_config as
a transitionary measure... so long as PHY drivers get fixed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

