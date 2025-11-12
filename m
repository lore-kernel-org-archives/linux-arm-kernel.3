Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4KXq6vkaTt39JXbcQflKkjoNE2v/KM+S0WlsXZAnWY=; b=OnhCPVGHbJNhgMOBm6/AQbuKln
	ey2hWMrkX/FmjAK46NFdEoJI/9u7Yxd7P723AT56dn9m8QbTTFp4lcQFCJCB5nFJ3P+gNaFWG35Gb
	YdAdm8nDYGwotyy2mjgwQoZyfDjAKu501MgyzxsHTzirlF5+WKLCaTRK0V1wYhjYTVmsuJKzQTkIH
	j4BJcBvt1NN1DubcavwUKjC++cmmMgM+GM18uRi0ZMgUWQ5QmHoLM60GkikWnu40ySYNaI8G0+0wH
	9xiPUp9ZNs3uVpraezPyIQANUwdBY3qOb/o7mL+NFNXJlshjhWxHGBqN790e6cVLdRX9ppN+Vg293
	pJiO9ujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD9B-0000000981B-27ND;
	Wed, 12 Nov 2025 15:52:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD98-0000000980Q-2U39;
	Wed, 12 Nov 2025 15:52:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E69621A1A2E;
	Wed, 12 Nov 2025 15:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B917D6070B;
	Wed, 12 Nov 2025 15:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14C42102F1C6A;
	Wed, 12 Nov 2025 16:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r4KXq6vkaTt39JXbcQflKkjoNE2v/KM+S0WlsXZAnWY=;
	b=mH4S60asMSlrYa5LEl6HMPEaLrLHp3nTRcdY789GHstthPo+1ZKZOasDuBrvb/B7xSIJEn
	gLzFsmmQ0/YWMUZHd/Z8nE9LwO7kahUfw3IPS08jPLIbyJ1yFIKoMI2HU9OGN5Vztdt57z
	obPJXopwHPqceIemoztIMNv9uBZZYwgqEEGBlbSxJkL78OokCAW/aHVsokKNEOg1DXfpY4
	SqWYxCOGnZoqaZ9zVjUpQxVeBTpLPYJ0PY4dkUZ6rS3UkYEtghKVjpNqjJgew8uhSYn1Fa
	ljP0wuCUmm4Jp1567gNaGadL5i/B1bXOwL1NTRRMtnsEKZp0j9AqTV3k5nc9cA==
Message-ID: <a4dfe008-a7e2-4323-bed5-a444dcc6aa3d@bootlin.com>
Date: Wed, 12 Nov 2025 16:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/13] net: stmmac: mediatek: simplify
 set_interface() methods
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
 <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075234_771046_5DDFC796 
X-CRM114-Status: GOOD (  16.96  )
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
> Use the phy_intf_sel field value when deciding what other options to
> apply for the configuration register.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
>  1 file changed, 12 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 0f32732efb75..1f2d7d19ca56 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = phy_intf_sel;
>  
> -	intf_val = phy_intf_sel;
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= RMII_CLK_SRC_RXC;
>  	}
>  
>  	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
> @@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
> -	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= MT8195_RMII_CLK_SRC_RXC;
>  	}
>  
>  	/* MT8195 only support external PHY */


