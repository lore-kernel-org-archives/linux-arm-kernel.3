Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7FECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBJUNGHNoCsZ2OCx56e6rdnetXjqjXfaSWdUSlMOnE4=; b=NxUByJU8BU4/LxrOiX+UpuP0B6
	pcPqw7qwVfjvT312D6YKD5R5vi7Ju6tb1fw8QlrfO8lBinV4kvf/2pt7cCWy1Yc8LYSjuI61qwdaJ
	uBxK6jTUhbDz8MoguchBZpAp1PeG8Ly61XZCrhqZC6jAcEvxMiDZNwpUYT5HRe1K7mpIQcFXZSdtg
	VzihyIc9yUyZJxD1W1a1LTb0mDiUdjyLTRKfXIWeUOfF5jru3NOMPzkuBEc6sr1znO3NoOdg4biml
	Bp6Tx6yM+ZV0OUt9vMZ2mw34lcigSV/fo6Dj8sPl6acBtxR9ka6nTuilE2mN2oe5MXj1xHsrovCfH
	WgF8Nz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ7q-000000033rr-3HVM;
	Wed, 22 Oct 2025 13:43:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ7i-000000033oL-3iQJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:43:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 779E24E4113D;
	Wed, 22 Oct 2025 13:43:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E3B6606DC;
	Wed, 22 Oct 2025 13:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 860B5102F242F;
	Wed, 22 Oct 2025 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761140607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GBJUNGHNoCsZ2OCx56e6rdnetXjqjXfaSWdUSlMOnE4=;
	b=E34GmBMaVokVRFK9/DcbPWDvEDixYvzU/DHT/1OEDLbtWJFAnPGC1EHS/MxGfWSnM9PgkL
	SXUV+mfvrCrAG9D8UIVahsR0HZuwrhkfxR2amBTyvS+XLjusMJ19Fq41f8eSa3d14QVMmQ
	LVl+gTbgKkIjhkbuclL0SYlTqQAA0y4znWe0Ot047ghc71tmrY+AcE+nckzSTy/BtJFFIL
	ZFCwFuGTDhGKHEFKFTrxCCSxqJUAXCh14aIg52tKcon3o3lLQiz4MK3IRYeg9PG7IQKpp3
	zj/58g+NPeZGFWHsc5MioHlSQI69YMiLiaUXGrwUJXDhMPc0RYzpCIaF3r1lzA==
Message-ID: <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
Date: Wed, 22 Oct 2025 15:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_064331_062349_FAA900D5 
X-CRM114-Status: GOOD (  23.84  )
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

Hi Russell,

On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> when the PHY driver has marked the device as wakeup capable in the
> driver model, otherwise use phy_drv_wol_enabled().
> 
> Replace the sites that used to call phy_drv_wol_enabled() with this
> as checking the driver model will be more efficient than checking the
> WoL state.
> 
> Export phy_may_wakeup() so that phylink can use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phy_device.c | 14 ++++++++++++--
>  include/linux/phy.h          |  9 +++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 7a67c900e79a..b7feaf0cb1df 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -251,6 +251,16 @@ static bool phy_drv_wol_enabled(struct phy_device *phydev)
>  	return wol.wolopts != 0;
>  }
>  
> +bool phy_may_wakeup(struct phy_device *phydev)
> +{
> +	/* If the PHY is using driver-model based wakeup, use that state. */
> +	if (phy_can_wakeup(phydev))
> +		return device_may_wakeup(&phydev->mdio.dev);
> +
> +	return phy_drv_wol_enabled(phydev);
> +}
> +EXPORT_SYMBOL_GPL(phy_may_wakeup);
> +
>  static void phy_link_change(struct phy_device *phydev, bool up)
>  {
>  	struct net_device *netdev = phydev->attached_dev;
> @@ -302,7 +312,7 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
>  	/* If the PHY on the mido bus is not attached but has WOL enabled
>  	 * we cannot suspend the PHY.
>  	 */
> -	if (!netdev && phy_drv_wol_enabled(phydev))
> +	if (!netdev && phy_may_wakeup(phydev))
>  		return false;
>  
>  	/* PHY not attached? May suspend if the PHY has not already been
> @@ -1909,7 +1919,7 @@ int phy_suspend(struct phy_device *phydev)
>  	if (phydev->suspended || !phydrv)
>  		return 0;
>  
> -	phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
> +	phydev->wol_enabled = phy_may_wakeup(phydev) ||
>  			      (netdev && netdev->ethtool->wol_enabled);
>  	/* If the device has WOL enabled, we cannot suspend the PHY */
>  	if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3eeeaec52832..801356da1fb2 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1391,6 +1391,15 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
>  	return device_can_wakeup(&phydev->mdio.dev);
>  }
>  
> +/**
> + * phy_may_wakeup() - indicate whether PHY has driver model wakeup is enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting.

That's not exactly what's happening, this suggest this is merely a
wrapper around device_may_wakeup().

I don't think it's worth blocking the series though, but if you need to
respin maybe this could be reworded.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
>  void phy_resolve_aneg_pause(struct phy_device *phydev);
>  void phy_resolve_aneg_linkmode(struct phy_device *phydev);
>  

Maxime

