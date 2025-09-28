Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A5CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4obhf2MMc+kaVAeVoHPf3nhTo/bKPGOyQwVk/dKIYA=; b=Mh9+LLTRdO+PgjELPuJ4UlWZj3
	qLkFuXZuNZCrr7c5G/gn8c+uurwiAQiCyjT+g6f4/pS+H9six870dZj6L1Lc3qyjsHKBFwnPACtS8
	R62atb8w16kfwejiTqSS4Huwr0Ct1XFi8cwj14Kik3/IdDs/D0KkZDS7F2wK0xH2+Ibxa2c4ZN5Fm
	QT++pyQskqZLdWozGH+J4v/AdUbx5TgJCHpDkEUwtETTEPQwXjvBngEPY1owtQpFwUsA+VRT8P49+
	z7nDV9yRNWdfobqsf2Ey5ijjb3erhWTdTRS6pYdG1loTYOqBfYEOVxm4iU6SngxRsBKwpid7ohFvI
	O0g4+P+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nln-0000000Eggi-02rc;
	Sun, 28 Sep 2025 09:32:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nlk-0000000EgeS-0Urw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 09:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W4obhf2MMc+kaVAeVoHPf3nhTo/bKPGOyQwVk/dKIYA=; b=S66go+d73VUiXXPjRKdmdmphgX
	fJSp4bLxi+AG0GdEXOovkaskpY4ph3IFxoWPlkw5KBlq8BCDaujWApl2reNhtFcjbYdO8NWLTAu/V
	4jlVxRjWuwXjBlWuN3blTKJRXUGJbIfujGydt2dCgCZIEqmEkDAd9oVT2mOQqCO7ldr59MR2+/rov
	sr5t7sQXGdcwWelHGX0LbcInHhXBZQG2QvKhdOThbQMeHV3+YdBNo41m0p+mCXk2XnC/CvR06IZBL
	hFHJHJHKFipbKSUM63/MTC3uqDEN9slMfDkAUlhX2C3f/dSobUTyU4JBwRkEJg+QyoR0+8N3pw81V
	7G/ljcAg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60784)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v2nlZ-000000005RS-1C6u;
	Sun, 28 Sep 2025 10:32:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v2nlU-000000002Si-1OQ2;
	Sun, 28 Sep 2025 10:32:20 +0100
Date: Sun, 28 Sep 2025 10:32:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: Re: [PATCH RFC net-next 3/6] net: phylink: add phylink managed MAC
 Wake-on-Lan support
Message-ID: <aNkApFc9wsnabXFW@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
 <E1v2nFI-00000007jXV-1BYa@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v2nFI-00000007jXV-1BYa@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_023236_156798_07D9A9E3 
X-CRM114-Status: GOOD (  19.33  )
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

On Sun, Sep 28, 2025 at 09:59:04AM +0100, Russell King (Oracle) wrote:
> Add core phylink Wake-on-Lan support.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 77 +++++++++++++++++++++++++++++++++++++--
>  include/linux/phylink.h   | 26 +++++++++++++
>  2 files changed, 99 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9d7799ea1c17..9a3783e719bc 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -93,6 +93,9 @@ struct phylink {
>  	u8 sfp_port;
>  
>  	struct eee_config eee_cfg;
> +
> +	u32 wolopts_mac;
> +	u8 wol_sopass[SOPASS_MAX];
>  };
>  
>  #define phylink_printk(level, pl, fmt, ...) \
> @@ -2575,11 +2578,17 @@ EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
>   *   can also bring down the link between the MAC and PHY.
>   * - If Wake-on-Lan is active, but being handled by the MAC, the MAC
>   *   still needs to receive packets, so we can not bring the link down.
> + *
> + * Note: when phylink managed Wake-on-Lan is in use, @mac_wol is ignored.
> + * (struct phylink_mac_ops.mac_set_wol populated.)
>   */
>  void phylink_suspend(struct phylink *pl, bool mac_wol)
>  {
>  	ASSERT_RTNL();
>  
> +	if (phylink_mac_supports_wol(pl))
> +		mac_wol = !!pl->wolopts_mac;
> +
>  	if (mac_wol && (!pl->netdev || pl->netdev->ethtool->wol_enabled)) {
>  		/* Wake-on-Lan enabled, MAC handling */
>  		mutex_lock(&pl->state_mutex);
> @@ -2673,6 +2682,17 @@ void phylink_resume(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_resume);
>  
> +static bool phylink_mac_supports_wol(struct phylink *pl)
> +{
> +	return !!pl->mac_ops->mac_wol_set;
> +}
> +
> +static bool phylink_phy_supports_wol(struct phylink *pl,
> +				     struct phy_device *phydev)
> +{
> +	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
> +}
> +

Yes, these need to be earlier.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

