Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrtELhIyCno0rfrMQS1AC+bze17pExz4ltwZ19FC44U=; b=dPRgiX1568JhwePr7S/HrFc+Bh
	JjUt1hPjE7txtIXFE9rQy1DxZm4RbNl/6N6gho/Zgms1Kvm1Aj99GwZjzNJkL/0VQMeNoE1Xe8fNJ
	vp/3th04WRLR+zf0EWB0deHnlEaOmC4hIVBIyUEX8qevOOcbeZ7lTn/Oq4NgwrTzHIS6vHAci8DlS
	VVpTOS+A3K9jdJeTiJzEBo6AI8SgoSWT7tBgjo7ynyhebps+Xa9282y6m4jJ7X8o5PIUQIGKl1dF4
	OMa3fttS0iGZaMAI5lgAOkXH7rai6BUYys0e13KQzV/GU2997nsP/EE2J5UVKXH74Yrc9Wmzuoj3T
	I+5Zk6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx6C-0000000FJIe-3dyF;
	Thu, 06 Nov 2025 10:20:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx69-0000000FJHc-3kyi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:20:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1787E1A18F0;
	Thu,  6 Nov 2025 10:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80676068C;
	Thu,  6 Nov 2025 10:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDB3A11850A23;
	Thu,  6 Nov 2025 11:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762424406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=MrtELhIyCno0rfrMQS1AC+bze17pExz4ltwZ19FC44U=;
	b=Jq/9kXCPQZi2LzDTzoftGVWN7+cckHIqtyzVMRR+OGRvHKd9ng3fc1Ww4RwZWNYgL3/iEO
	1SHMwYqYyR+eFMuTAVJ/diFehwENPQCVuDAXOXGmKRj6WD2pcjv0TqnEEd+6feojc2cHyI
	Wc9UiBrCIEjvzBi5zwdB6O373RN7mTK77/y223e7olYEQjrciaf8zqWz94AFvakX6tQKXn
	kRPLRgHoO0wcsraSP9zWQjOOL+KIc8xUXUcjqtPN5JTLzZXfpaVCvEdNSXOnIKHy1Ss/UQ
	C4PLgJrZgIbXH12G321STQlM8+0iVrlFs+oCo6jXVHvxcJBFo+p+4c9BSzIvgQ==
Message-ID: <168cefb5-4a44-4836-8e55-c9c76e99f2aa@bootlin.com>
Date: Thu, 6 Nov 2025 11:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 09/11] net: stmmac: ingenic: simplify x2000
 mac_set_mode()
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
 <E1vGvoe-0000000DWp8-37LQ@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoe-0000000DWp8-37LQ@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_022010_076544_B45997DA 
X-CRM114-Status: GOOD (  17.56  )
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



On 06/11/2025 09:58, Russell King (Oracle) wrote:
> As per the previous commit, we have validated that the phy_intf_sel
> value is one that is permissible for this SoC, so there is no need to
> handle invalid PHY interface modes. We can also apply the other
> configuration based upon the phy_intf_sel value rather than the
> PHY interface mode.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++--------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 7b2576fbb1e1..eb5744e0b9ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -122,39 +122,25 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> -			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		break;
> -
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = 0;
> +	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> +		       FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +	} else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
>  		else
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
> -				   FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
> +			       FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
>  
>  		if (mac->rx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
>  		else
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
>  				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
> -
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
>  	}
>  
> -	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }


