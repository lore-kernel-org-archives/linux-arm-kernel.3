Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C86CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJC1ecETHQcoqSbhmGBKBQYTfQjbYdXTsCWcOEh1NPE=; b=A7gonFYySJiTxl3JaPgyx+ptU3
	UWN6v7FOsaV8eGzEHWtyAotST2kp8MJWV8GGfJAxCAKDJYgDsvu4r0iE6FHx5qYTpMpZaseRLoHcR
	BWjdlN0aADLXHUttB6aKzo77DiOQSfXRIVy+Y+ypQ26Qnqkc/DS8ibcW80NFRLe1Z1zmlZsNdpJ2v
	pA2DeJ+dt7V/h86RufRHqrDX6C1SRS+tN5mO++Rso/3sl5vrRDsLCqOvUqafYBY0AsFHvTBcf1BlJ
	xgf7KSJW/Nos09PmmwhiR7THE6W/YS++kVPql1lqK0R6j/uF0VYcNxnJarvpgNY+a3fFyHyR702UV
	ACxLTnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx1e-0000000FIql-01IY;
	Thu, 06 Nov 2025 10:15:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx1a-0000000FIqD-47GV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:15:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9041F4E41560;
	Thu,  6 Nov 2025 10:15:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66ADA6068C;
	Thu,  6 Nov 2025 10:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 886CC118507C0;
	Thu,  6 Nov 2025 11:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762424123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=oJC1ecETHQcoqSbhmGBKBQYTfQjbYdXTsCWcOEh1NPE=;
	b=Xu1/zo4oGkrhtXu+acmaU6SUTcYCqSnjGZK9EaFB6t0xEz/aKHfIMZoqoPdXM+pNlNhwt9
	+3XETErcxRA2C+Zvl6n9438ZXEtrqoLn0+rBcQKrosZj0i3hO449klUQgiUtN2NeKh1T0t
	G+0HO3djusOizRmF02Hf70ZROMwBMGgKRiNdwvwPfe9mWA84ai1AEAP4dgkgAm8E0WswpI
	TqC88ulR4tMIA7JhyhQbFOzW8sN9Tzx4rOwPXpeK6xPw5HrXQQ/zrQJtOpW/lfRMFj0sP9
	xsIi5VPFsSB3T3hoRPZ6vfOExUADsf8MGmQL3e6IGL6kmb43Q4cuQ6XGs1kpWg==
Message-ID: <60bd1571-e293-4748-adde-396bf193bac2@bootlin.com>
Date: Thu, 6 Nov 2025 11:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/11] net: stmmac: ingenic: simplify
 mac_set_mode() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoZ-0000000DWp2-2cxj@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoZ-0000000DWp2-2cxj@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_021527_159623_2E4585D9 
X-CRM114-Status: GOOD (  14.86  )
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



On 06/11/2025 09:57, Russell King (Oracle) wrote:
> x1000, x1600 and x1830 only accept RMII mode. PHY_INTF_SEL_RMII is only
> selected with PHY_INTERFACE_MODE_RMII, and PHY_INTF_SEL_RMII has been
> validated by the SoC's .valid_phy_intf_sel bitmask. Thus, checking the
> interface mode in these functions becomes unnecessary. Remove these.
> 
> jz4775 is similar, except for a greater set of PHY_INTF_SEL_x valies.
> Also remove the switch statement here.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 50 +------------------
>  1 file changed, 2 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 539513890db1..7b2576fbb1e1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -75,22 +75,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_GMII:
> -	case PHY_INTERFACE_MODE_RMII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
>  	      FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
>  
> @@ -103,16 +87,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
> @@ -123,16 +97,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
>  
>  	/* Update MAC PHY control register */
> @@ -145,18 +109,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
> -	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> +	      FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
>  
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);


