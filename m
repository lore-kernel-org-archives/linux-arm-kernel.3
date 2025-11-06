Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F66BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUzCMD/zXAKLues4eh9rQeqDZK1DbWkuv062LLflVL4=; b=gPVMLH+TvqblQ/15vc4jur16Dm
	BH8Z4QsDy5aHHGrO6WA5sCL4gkWpVr1u0XQSt9ZB73alt/zU0DyafLFPwd76KuJa0TcmnJAJD2M5G
	scuxXAWyJwrW3zTwTtQkU1PxK2HwW4XaIPrTaiu6ZvGT4GCuJ6ZCT302LWceH/CmWEYtpSP0ZJLqg
	Jmr+bYeoBp7u/KbFvuHegJUIuSub304wwsbP0Fq8MB5vxUoma+2KgbDE9Qvl4cKmdXxcTYlKnYQY/
	B5wSMBFHyzlxDOt6cFjg2Z0Y6l2yCNK9iJhfb9fYJac+1Txwf2vua7yaCbcgbze0vBDVC4UNeiM1N
	GX6zWOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwmx-0000000FDzi-2Wt0;
	Thu, 06 Nov 2025 10:00:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwmu-0000000FDyT-3uhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:00:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E3574E41562;
	Thu,  6 Nov 2025 10:00:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 533D86068C;
	Thu,  6 Nov 2025 10:00:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B1401185084C;
	Thu,  6 Nov 2025 11:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762423214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fUzCMD/zXAKLues4eh9rQeqDZK1DbWkuv062LLflVL4=;
	b=YrjL7w8UXqJlkgZO52td1MVfoQwZK4LlPP0faOmhLRUQX3s9/m/uzyn3uAsuAjclIfV7y/
	S7wc9M2ECXrcqbFz+rA8mVWACpPwUqIvX/T6gCdBq8K5Eefzi9FcK830yaAnBeXqfmbFYW
	w7E8KDCWOeFXxpwHQPlpRq4dQcwtDBGgyGDpGjkLSi8j/tdA6RIfZVJqv+wR+sNulwpUoY
	4zdCO93iz6SxON2jxGsafFOzrteRo0bgmvABtTFbPP3FjsYcnAQc9yuv+x+vD8JVFQXm9k
	OEPTXuISE4UDE6kD5G2wQNoTpct+0xh5SwBvSSt64U5Q11mRnitZnZWY2THQFg==
Message-ID: <01429961-6d7d-4c83-8712-f065e78a1be9@bootlin.com>
Date: Thu, 6 Nov 2025 11:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/11] net: stmmac: ingenic: use
 PHY_INTF_SEL_x directly
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
 <E1vGvoF-0000000DWob-0c8R@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoF-0000000DWob-0c8R@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020017_247015_D595B44C 
X-CRM114-Status: GOOD (  13.66  )
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
> Use the PHY_INTF_SEL_x values directly in each of the mac_set_mode
> methods rather than the driver private MACPHYC_PHY_INFT_x definitions.
> Remove the MACPHYC_PHY_INFT_x definitions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 5de2bd984d34..b56d7ada1939 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -35,10 +35,6 @@
>  #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
>  #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
>  #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
> -#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
> -#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
> -#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MIIReviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> -#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
>  
>  #define MACPHYC_TX_DELAY_PS_MAX		2496
>  #define MACPHYC_TX_DELAY_PS_MIN		20
> @@ -78,17 +74,17 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_GMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_GMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_GMII_MII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -96,7 +92,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
> @@ -138,7 +134,7 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -160,7 +156,7 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -183,7 +179,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -191,7 +187,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, PHY_INTF_SEL_RGMII);
>  
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);


