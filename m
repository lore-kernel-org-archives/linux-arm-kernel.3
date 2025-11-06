Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A14FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRpXhhkIPMjFH3h5RapUBS8iw34S2D1EH/TxwZIqBzY=; b=UnOx0Mnvh828R6o3INGkljHqUz
	rn5Mts/H8T3SIC6txyGwSIcWwqb3OLqglMg7fMLjJyanUvnWhTX2IivnGZr9TGEQ38gpHH5n13U28
	difNrZbWZbGwG8bUYv3eTcK1CcWgSw5QSI7EVqRXx5tgkgVq+qJiIMDuHkT19dD1i8ObVh/zPdHP1
	pGQflowwkx7yv4K8hPmd4oIHhDPTPQCMJE7jaKibe2OwAH/PirtTpv73Bg57yIg5ZoypEIG5xK9Bc
	1fqlGapnJMqMDFbrmDk0GL4GCa/Hnjtme07w59qKdmT7sVA+44PkwtmI+S5BZaDm7LVoW0hbIaUtD
	BoRompCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwsA-0000000FHpL-11ad;
	Thu, 06 Nov 2025 10:05:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGws6-0000000FHn9-3OCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:05:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A2B11A18DB;
	Thu,  6 Nov 2025 10:05:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA04C6068C;
	Thu,  6 Nov 2025 10:05:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A255611850861;
	Thu,  6 Nov 2025 11:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762423532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CRpXhhkIPMjFH3h5RapUBS8iw34S2D1EH/TxwZIqBzY=;
	b=TMoJeyI6P8u2/CTYIEpP8w3bd8Ycd61GlWyBIE/GYjMJh6phwkcq5jMZQjnZR0Gmeln14h
	vojfgQ/tuSRw+IC/vLIU5I6wHxKYC+Vi8ED7Cya9IGlRu7xBTFEJFjZSGvw1fJbBiqECgq
	lrGPs5jNwsnzs4x7YnP8GhY5GEDJN3g/blWQcVqFWMdqkVzQKM+0qqMvHph2MeL7qjwPoG
	qm82aYr7W9TWcfinFI8F2Lr+Qj+elFQNxp15TMSqtnN0HB7zTM8Eo3w8kYwsWJdt9ZrOtQ
	NfmF/Q0AEsEwR4PFZ74u0QLPQwYy5toAuqSlZ3TVE1VWloZl9ITCEdaLzUhCYg==
Message-ID: <e9a03b93-50e2-4d1c-a20a-ad243366ebd9@bootlin.com>
Date: Thu, 6 Nov 2025 11:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/11] net: stmmac: ingenic: use
 stmmac_get_phy_intf_sel()
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
 <E1vGvoP-0000000DWon-1cOI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoP-0000000DWon-1cOI@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020539_121398_ED743AF1 
X-CRM114-Status: GOOD (  20.32  )
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
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result against the SoC specific
> supported phy_intf_sel values, and pass into the SoC specific
> set_mode() methods, replacing the local phy_intf_sel variable. This
> provides the value for the MACPHYC_PHY_INFT_MASK field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

This looks correct to me :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 55 ++++++++++++-------
>  1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 6680f7d3a469..79735a476e86 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -64,28 +64,27 @@ struct ingenic_soc_info {
>  	enum ingenic_mac_version version;
>  	u32 mask;
>  
> -	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
> +	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
> +
> +	u8 valid_phy_intf_sel;
>  };
>  
> -static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			       u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_GMII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -93,7 +92,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		phy_intf_sel = PHY_INTF_SEL_RGMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
> @@ -110,7 +108,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  
> @@ -129,15 +128,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
>  
> -static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -153,16 +151,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -178,17 +175,16 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -197,8 +193,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  		val = 0;
> -		phy_intf_sel = PHY_INTF_SEL_RGMII;
> -
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
>  		else
> @@ -229,10 +223,21 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  {
>  	struct ingenic_mac *mac = bsp_priv;
> -	int ret;
> +	phy_interface_t interface;
> +	int phy_intf_sel, ret;
>  
>  	if (mac->soc_info->set_mode) {
> -		ret = mac->soc_info->set_mode(mac->plat_dat);
> +		interface = mac->plat_dat->phy_interface;
> +
> +		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
> +		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
> +		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
> +			dev_err(mac->dev, "unsupported interface %s\n",
> +				phy_modes(interface));
> +			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +		}
> +
> +		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
>  		if (ret)
>  			return ret;
>  	}
> @@ -309,6 +314,9 @@ static struct ingenic_soc_info jz4775_soc_info = {
>  	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = jz4775_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_GMII_MII) |
> +			      BIT(PHY_INTF_SEL_RGMII) |
> +			      BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1000_soc_info = {
> @@ -316,6 +324,7 @@ static struct ingenic_soc_info x1000_soc_info = {
>  	.mask = MACPHYC_SOFT_RST_MASK,
>  
>  	.set_mode = x1000_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1600_soc_info = {
> @@ -323,6 +332,7 @@ static struct ingenic_soc_info x1600_soc_info = {
>  	.mask = MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x1600_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1830_soc_info = {
> @@ -330,6 +340,7 @@ static struct ingenic_soc_info x1830_soc_info = {
>  	.mask = MACPHYC_MODE_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x1830_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x2000_soc_info = {
> @@ -338,6 +349,8 @@ static struct ingenic_soc_info x2000_soc_info = {
>  			MACPHYC_RX_DELAY_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x2000_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RGMII) |
> +			      BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static const struct of_device_id ingenic_mac_of_matches[] = {


