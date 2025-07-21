Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00420C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZUgBqx92qBG7YxcgchOSk9zrFJ4dI1nB3VhodBS568=; b=Fi7BNTf9nHAYKsR29m2pk28sy3
	lBBkmsuYZGcd6Fn21ufOyoW1mD6uLtShoHhdymHKPYxWXUWfjSGKXHl5AVV1cI4KoIsxf8qVB84KZ
	2JCquAzu1g96u2l89mQVxdHC1L0vtgCwZQBMpXoNDCoBAzX7jIDN2ZItYsblLgoqN8QXokgwPw7n5
	v6h9kEFE05vBJJb5dkOg5imxUmIWMbgSlohtPn8NYY6LwJ6WHsTfMyGt+vBUg7g/reJXfWtn15MGN
	YJrLzSTE25miTN9wPxrKPGxo9ExBnTx44dSv+E+o0D/K+O0QgLsxzG5aZPnozwv04zxGm3fglZCJU
	L2jKGYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqOe-0000000HMrm-3wFw;
	Mon, 21 Jul 2025 13:17:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udohN-0000000H5PF-3uNn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0ZUgBqx92qBG7YxcgchOSk9zrFJ4dI1nB3VhodBS568=; b=0Dw7LcU4IbmDlG8F3HK/dH3mNC
	kmeTh2bcWVTzXjyJVMqXg3wQ76dFrx/HO3L7pLaA2sJKblmKg0f4P7Bxnp3HSv3Usb8hLtY4eXo9R
	04yA3YHQoqwdYfT4R8gseeR8PYNpoGtiRwDVB0fo5QDED4IGKQz6lgqGAdrzVTGq7VWBgP2hFrvK+
	3leX5BI1MRCdfce+CLH6smel8QBOLGKhFRa9Vz2800x6OP7S0lGSN0qDyRptpSi+v22YP2dO2w3ga
	uix/Z+iEhNHoA7BzmNAiRbuLDeUrmWV7Po1TtNtdNqMAFOjsEJg8Hu5TD6892xi9HOn2CTtaNqBeQ
	c6L+ElgA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51126)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1udoh1-0006cW-0F;
	Mon, 21 Jul 2025 12:28:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1udogu-00067a-2M;
	Mon, 21 Jul 2025 12:28:20 +0100
Date: Mon, 21 Jul 2025 12:28:20 +0100
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
Subject: Re: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
Message-ID: <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_042850_257750_133740CE 
X-CRM114-Status: GOOD (  15.76  )
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

On Mon, Jul 21, 2025 at 01:14:45PM +0200, Gatien Chevallier wrote:
> +static int smsc_phy_suspend(struct phy_device *phydev)
> +{
> +	if (!phydev->wol_enabled)
> +		return genphy_suspend(phydev);

This should not be necessary. Take a look at phy_suspend(). Notice:

        phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
                              (netdev && netdev->ethtool->wol_enabled);
        /* If the device has WOL enabled, we cannot suspend the PHY */
        if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
                return -EBUSY;

PHY_ALWAYS_CALL_SUSPEND is not set for this PHY, therefore if
phydev->wol_enabled is set by the above code, phydrv->suspend will
not be called.

> +
> +	return 0;
> +}
> +
> +static int smsc_phy_resume(struct phy_device *phydev)
> +{
> +	int rc;
> +
> +	if (!phydev->wol_enabled)
> +		return genphy_resume(phydev);
> +
> +	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
> +		return 0;
> +
> +	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");
> +	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
> +			   rc | MII_LAN874X_PHY_WOL_STATUS_MASK);
> +
> +	return rc;

Note that this will be called multiple times, e.g. during attachment of
the PHY to the network device, when the device is opened, etc even
without ->suspend having been called, and before ->wol_enabled has
been set. Make sure your code is safe for this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

