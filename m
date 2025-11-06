Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C2BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ximp9a4IDmgxJZytTPrygSnU5qt872YCT1Ldh4VuFU=; b=NelvoaL5jjAaeEUk+yBjrEeoIW
	ov+51dzUy8AhY+9CTIrBvV+vxJSKgsLK+TMnGFIE6OXSIvsL3ynZ6rs1zpHHrSlcgSASGDlZMhxsa
	LjkymZTae7kRW6iez1CujAKsaWWvs6KJFFIPxRcuVDV+85UdU2dl1KfUcZZgkH6L3A7zwctR3Ymke
	gvQ9OcSKqx1M7RTdNPbj/dWcQowW2LJZORKM/N266Poi5t7wOwUkl/8gUs1UM9Jr0fHLtq+KxC1u4
	PmNeJnT6o/tEYHPt6ZsHi89BFFBSAaAOqOPn0PueAOKGAxnHNQ90PGyx8Lr7S+h0+PKKUTXNXyveD
	fZTJabDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwnr-0000000FEGC-0C2J;
	Thu, 06 Nov 2025 10:01:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwno-0000000FEF5-0iU8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:01:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA74B1A18F2;
	Thu,  6 Nov 2025 10:01:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F1566068C;
	Thu,  6 Nov 2025 10:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D9CD11850850;
	Thu,  6 Nov 2025 11:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762423269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/Ximp9a4IDmgxJZytTPrygSnU5qt872YCT1Ldh4VuFU=;
	b=LdOnRkoY6K/bIgJtnGiQsaOKa1XEKBZLXgKUeON5opBq0cd8VP2ymeNAKofkuBkkr16e6T
	1knMoKiyD6GlGUevfppUrC2szEGQqQ+IUJFnSZZ9oQ9ti+8bs9s2pVoHCFuPYSlYyDrru3
	qu45iJSk1pUj1Qg6OwUTECg8RrtVLSYSeX7rZNhAjV4o2l4FY9l8CrVXIWpCUblEKiAjni
	k1BagL5/0qW+kDq9iUewXaVhJYjlNhy2/il2ckSCZ47lPneZGTjhew/X1eAxZWIyc9S3MY
	vzM0ignHs6A3SFm5bvPkLs4DC/bunaj/wpNxnGj7mKpvKGzrsCCXSSFKiBpR2w==
Message-ID: <39e143f2-a0fc-4b3e-801b-23983d546461@bootlin.com>
Date: Thu, 6 Nov 2025 11:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/11] net: stmmac: ingenic: prep
 PHY_INTF_SEL_x field after switch()
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
 <E1vGvoK-0000000DWoh-15Ge@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoK-0000000DWoh-15Ge@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020112_351371_29B3BBCD 
X-CRM114-Status: GOOD (  14.53  )
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
> Move the preparation of the PHY_INTF_SEL_x bitfield out of the switch()
> statement such that it only appears once.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 34 +++++++++++++------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index b56d7ada1939..6680f7d3a469 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -71,20 +71,21 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> +	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_GMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -92,7 +93,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
> @@ -102,7 +103,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		return -EINVAL;
>  	}
>  
> -	val |= FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
> +	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
> +	      FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
>  
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
> @@ -131,10 +133,11 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> +	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -144,6 +147,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		return -EINVAL;
>  	}
>  
> +	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
> @@ -152,11 +157,12 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> +	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
> +		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -166,6 +172,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		return -EINVAL;
>  	}
>  
> +	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
> @@ -174,12 +182,13 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> +	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> -			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
> +			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -187,7 +196,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
> +		val = 0;
> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
>  
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
> @@ -210,6 +220,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		return -EINVAL;
>  	}
>  
> +	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }


