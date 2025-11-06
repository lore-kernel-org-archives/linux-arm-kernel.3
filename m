Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C6CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5fJe9feAElneP/yta870eC//hgCpWA6xE5I2Oa5k7I=; b=TyYaHpj/d3NvLKlmhj+G9c2tax
	ErrU0DvmjqAigLrLSIVFZjtDmZK7U0VS0idp3x0S381KMARR3BKKQtI7XqYzO6qbZWEecsMzUIugF
	E9RSJg3gE6oQSGi2xSz7RV8vuAkt2vciWj4j1jyFkCbmVfU3A2r53YGVQgxHYPpnOJ6O9c8xF9wLk
	5cVPSPED5jR3tQFbSfxckA+YfTqL2UR7YURnQSzlmWYiCHKN5H2q653aqtEikYUiH+Rquq+xSsrwn
	C27SbvamTGyUXteF0mTx5NkBizhIuBKtGTbzHP5X6lQ8MjkmK/YqL5PnMR8y57UkQo52RUalau5ui
	dK40tflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx8v-0000000FJZ9-2E0X;
	Thu, 06 Nov 2025 10:23:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx8s-0000000FJYn-1ZXR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:22:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18353C0FA88;
	Thu,  6 Nov 2025 10:22:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 254486068C;
	Thu,  6 Nov 2025 10:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8707311850A2F;
	Thu,  6 Nov 2025 11:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762424574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=t5fJe9feAElneP/yta870eC//hgCpWA6xE5I2Oa5k7I=;
	b=ZQS17aoUlaouBr/Th7AG4xsr2oqMcu/GinPQqFkQmC3wjFGHIPu30a52ty9p2Q4qew1evE
	0uHxqGq5FRHTS2Gp6/WiT2uZXCPao8yiAmCEAFaWwqXbOD+H63m+VHZ9J12guey1poraFU
	W4SGyNZCJZzAmfuLAw4yUJCi3oSF0NcvWuYiBCjddbgoAT7P+ZLTv9ju4/PpqTApV8vppS
	OIspgVcfO0sFkL7CQlJRpohcS5djOzfo1lEhD1G+Y+UeSKJ9tI/V2bHUobpbe4fvTNKtMb
	l4NzZLq1bux1UE+pIbKvBrSpY6Z0aQs93ay8JMeyoX+CiJz5bRyW2JwP1ltIPQ==
Message-ID: <898f6533-2b6a-47d8-8102-1e89e1769c3e@bootlin.com>
Date: Thu, 6 Nov 2025 11:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/11] net: stmmac: ingenic: pass ingenic_mac
 struct rather than plat_dat
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
 <E1vGvoj-0000000DWpE-3b5C@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoj-0000000DWpE-3b5C@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_022258_597035_5998ADFB 
X-CRM114-Status: GOOD (  17.02  )
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
> It no longer makes sense to pass a pointer to struct
> plat_stmmacenet_data when calling the set_mode() methods to only use it
> to get a pointer to the ingenic_mac structure that we already had in
> the caller. Simplify this by passing the struct ingenic_mac pointer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 ++++++-------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index eb5744e0b9ea..41a2071262bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -64,15 +64,13 @@ struct ingenic_soc_info {
>  	enum ingenic_mac_version version;
>  	u32 mask;
>  
> -	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
> +	int (*set_mode)(struct ingenic_mac *mac, u8 phy_intf_sel);
>  
>  	u8 valid_phy_intf_sel;
>  };
>  
> -static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			       u8 phy_intf_sel)
> +static int jz4775_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
> @@ -82,19 +80,14 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
>  
> -static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1600_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> @@ -103,10 +96,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1830_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> @@ -116,10 +107,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> @@ -165,7 +154,7 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
>  			phy_modes(interface));
>  
> -		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
> +		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
>  		if (ret)
>  			return ret;
>  	}


