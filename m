Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54003CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE/by9xGlpliyTkU9/7ICSd2kT72lNbYlkzDGAbEjZc=; b=J8nUDmNS7bNfc2VRnT8eO9BIP2
	xdJWsDBtFZ+a4ywPMJnV/j+HU3uUYxpmLhrLf/8JJARLkEgD4MMGCdsL6fSTL88R9rx/0iavWTpyF
	v3PhrsLxVByypCaVXg4Z64poVptnIKm3+NWhH6z8aLIfXkVIp7XhcuI3gmZSPPGTE4kHprc7cNdTW
	HLEra0Apu6KKN0V/LkGISeCiInF7o+hTfz+WcItPkL1SSjkxCQn2K8UlcIl4M5eb+fvTA/a3HhDtY
	7c3NNnwFgz6DBTt9LpTCY6zLNexiezgyKTfD6wPipILzxM1YQld0FE98b1XlPnV6Groe/ALabMWj0
	4/hQGAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD7f-000000097hF-3ySI;
	Wed, 12 Nov 2025 15:51:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD7d-000000097g9-1ZVR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:51:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C69A31A1A2B;
	Wed, 12 Nov 2025 15:50:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89CD66070B;
	Wed, 12 Nov 2025 15:50:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36D47102F192F;
	Wed, 12 Nov 2025 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PE/by9xGlpliyTkU9/7ICSd2kT72lNbYlkzDGAbEjZc=;
	b=Rf52EPAv3ODh6rEa2D+DkHboNpH9TA7v+uh/li3aVbv7fRladsDLoyJgAI6HxP3Hk6C6W5
	IGZ+6yHtu4DrB/qEukmabXELTAlXzuXW7NIP8zBEv+3mg6jXK3TsC2OjEpapFBwbcx59wp
	H5KNfB0Aoh+HiicSaAy45d44XDzjHuUVNMuwNKI86smm5RZdZYHRErG6gnCO+rerHPkIog
	j/M1osJa7yPCH+GyisDOlOEHo8v5lgQVdpb6Z9MUJBQY6grbgfFIKTB4wAwSfs9tXYgXws
	6Qucm4a2vbXwvJYZNi8zak7TKlQK8PSlvHn0POq61xAecUBw1nPWwiTJYWKI8w==
Message-ID: <0383a8e8-1713-438e-86c6-69c8b01cfb48@bootlin.com>
Date: Wed, 12 Nov 2025 16:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/13] net: stmmac: mediatek: use
 stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075101_554028_E06DEB44 
X-CRM114-Status: GOOD (  19.21  )
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



On 11/11/2025 09:12, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result, and pass that into the
> implementation specific ->dwmac_set_phy_interface() method. Use this
> to configure the PHY interface selection field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index dcdf28418fec..0f32732efb75 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
>  };
>  
>  struct mediatek_dwmac_variant {
> -	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
> +	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
> +				       u8 phy_intf_sel);
>  	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
>  
>  	/* clock ids to be requested */
> @@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
>  
> -static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = phy_intf_sel;
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_SEL_GMII_MII;
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  		.tx_delay_max = 17600,
>  };
>  
> -static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> -				       PHY_INTF_SEL_GMII_MII);
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
>  		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct mediatek_dwmac_plat_data *plat = priv;
>  	const struct mediatek_dwmac_variant *variant = plat->variant;
> -	int ret;
> +	int phy_intf_sel, ret;
>  
>  	if (variant->dwmac_set_phy_interface) {
> -		ret = variant->dwmac_set_phy_interface(plat);
> +		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
> +		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RMII) {
> +			dev_err(plat->dev, "phy interface not supported\n");
> +			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +		}
> +
> +		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
>  		if (ret) {
>  			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
>  			return ret;


