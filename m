Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE46CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxPWeNm+YRcGsylPmhFyIf8ssMNkrL6fNFfSq61DRNY=; b=bT7oylfc+nHM4XEvagrjzlemuL
	uXemZPzNFcUC9dAnklMDbd5APsXcxt+MaVmQ9FSDiosR04CkkEH775tpKmionTpQJs4GM3CqlXLAa
	hDgNPVBfZDnx9pf/n1BdmK7zpdewBACVEkwdCpmWFR9nsM5kCFyFGW8In265N74cRGfGmAmc96jbq
	IOPqER3g49mWWtBeoILtqM4CASw8/cYCxuFXgYpITfhZYBoMoL7VF4W7nbn8CZ3qVUxESMC49SRRe
	iuL9RuI8196o1HFGDn+SrElSBQWaJtHOG0oI5MyD2qoli5RTV8SWQ517VVAFSQlWnYkiSX59UwRCN
	dqKliV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5r-000000096Rc-3w59;
	Wed, 12 Nov 2025 15:49:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5Y-0000000965e-0M1H;
	Wed, 12 Nov 2025 15:48:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 864681A1A4D;
	Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A0AB6070B;
	Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F5A4102F192F;
	Wed, 12 Nov 2025 16:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BxPWeNm+YRcGsylPmhFyIf8ssMNkrL6fNFfSq61DRNY=;
	b=AFIU84LVCv9aPJV/SF2tYePN20e+huFLqBLkCZ+66e6kwA1D+2c2BnsoklPeHAC0VQJ9ko
	Jt7TwxQ+npNn2lutRD3zK8ZYbXWgHWAYhpeScp8WhdWA0Yz2yXxLZoqxstpuOZAJtDSm4v
	syciLtpAjhPCI2a6BXgejWJM24YkPPr5z95u0BXlQ1BtH9+xDFHxNAyekzrNABRoTsg5a0
	iUz05/Qe1gycpcQVqKpsA0Ax2RE+lgvSM1PfD8jvi+ye0VjvQAlST/Xo5VlQnuw+0Jpk5s
	tFxrS6XQXFdG+vjipIb7Is4JXA4zuHmzptCiPChilTqbIxx1CeODkYMid718TA==
Message-ID: <4d203e8d-64ba-4b08-9152-a059426a8a79@bootlin.com>
Date: Wed, 12 Nov 2025 16:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/13] net: stmmac: mediatek: use
 PHY_INTF_SEL_x
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
 <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074852_266455_F088697A 
X-CRM114-Status: GOOD (  13.30  )
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
> Use PHY_INTF_SEL_x definitions for the fields that correspond to the
> phy_intf_sel inputs to the dwmac core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c   | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index f1b36f0a401d..dcdf28418fec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -17,9 +17,6 @@
>  
>  /* Peri Configuration register for mt2712 */
>  #define PERI_ETH_PHY_INTF_SEL	0x418
> -#define PHY_INTF_MII		0
> -#define PHY_INTF_RGMII		1
> -#define PHY_INTF_RMII		4
>  #define RMII_CLK_SRC_RXC	BIT(4)
>  #define RMII_CLK_SRC_INTERNAL	BIT(5)
>  
> @@ -118,16 +115,16 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_MII;
> +		intf_val |= PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
> +		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_RGMII;
> +		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -297,17 +294,18 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> +				       PHY_INTF_SEL_GMII_MII);
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (rmii_rxc | rmii_clk_from_mac);
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");


