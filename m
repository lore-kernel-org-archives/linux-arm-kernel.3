Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHz0SE5KeAh/7vSWzG3tdPmFQ5OyevIIxyddxPOiKM4=; b=g+/RIiNRP0XntDZW922o83yFTL
	QJ7xL6s/I0ffuZUNARbJmmclUl7Dy5lCXHnoyVUhYR1Xi1XjwcreAPmTUAuxb6XiUHg1bk9VuwiCw
	GqfBMaCosWtN8NBc0HjkX3vdIrxGR8mDI7VH8rUy6osBvjBsRefciQy0GM24ewADbzeb5CyJzFaQA
	80OuYwv8T9LV8XUHpVZ57538hGnkUEUAOgWZB+lwoZ4LUrPrpE2UdReTA803ixVPRYOzHxSkIcbTm
	ywvvE6BAoIeC9dIl5cghb9imrywCKPoTKvE/afvIzNgSkZ1IX2GyOto5rHK+qSu6h/+xSjQRSRM+C
	4OxjKU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxFy-0000000FKE5-1Gjd;
	Thu, 06 Nov 2025 10:30:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxFv-0000000FKDA-1SGc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:30:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76ADEC0FA85;
	Thu,  6 Nov 2025 10:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 817516068C;
	Thu,  6 Nov 2025 10:30:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A36211850AFC;
	Thu,  6 Nov 2025 11:30:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762425011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cHz0SE5KeAh/7vSWzG3tdPmFQ5OyevIIxyddxPOiKM4=;
	b=uWWq+fR0MPstUGwl/3vUxQTeBDXfOAak+9qHp87IXELB51kYoRhynbUS41wCrv6hmuSy4z
	t9yGxNdi9fTO8lzvJUn58Cu7EIIac7sgwVVHYGZN2++1xzmipHAbfiXXdz4gZrCEd1OKiI
	ROGNw6tA0C/BZw3Jdgd06ekD6s7toYBnFbRfsyRT4ZKVjpcAzbOhIaQ04KHdAH3IRHo5RW
	J7f6gg//hkrwq5jS8+ByYniXpD7xxSfu72BVBybHojL8V2z3OsvpO4HDBTYda/0gzix5g4
	KqNgLE7l17RRtkmi3JTWJFachP4Ii0H3TTrvpr7igeBj2oGswV8TDuKQQBdOOw==
Message-ID: <59a6705f-8e26-493b-84d5-424d373b68cf@bootlin.com>
Date: Thu, 6 Nov 2025 11:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 11/11] net: stmmac: ingenic: use
 ->set_phy_intf_sel()
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
 <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_023015_546873_7FACF712 
X-CRM114-Status: GOOD (  17.28  )
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
> Rather than placing the phy_intf_sel() setup in the ->init() method,
> move it to the new ->set_phy_intf_sel() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

This looks good to me, but I can't test however :(

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

BTW this series was very nice to review with all the incremental
changes, thanks !

Maxime


> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 41a2071262bc..957bc78d5a1e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> +static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = bsp_priv;
> -	phy_interface_t interface;
> -	int phy_intf_sel, ret;
> -
> -	if (mac->soc_info->set_mode) {
> -		interface = mac->plat_dat->phy_interface;
> -
> -		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
> -		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
> -		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
> -			dev_err(mac->dev, "unsupported interface %s\n",
> -				phy_modes(interface));
> -			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> -		}
>  
> -		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> -			phy_modes(interface));
> +	if (!mac->soc_info->set_mode)
> +		return 0;
>  
> -		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
> -		if (ret)
> -			return ret;
> -	}
> +	if (phy_intf_sel >= BITS_PER_BYTE ||
> +	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
> +		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +
> +	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> +		phy_modes(mac->plat_dat->phy_interface));
>  
> -	return 0;
> +	return mac->soc_info->set_mode(mac, phy_intf_sel);
>  }
>  
>  static int ingenic_mac_probe(struct platform_device *pdev)
> @@ -221,7 +210,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
>  	mac->plat_dat = plat_dat;
>  
>  	plat_dat->bsp_priv = mac;
> -	plat_dat->init = ingenic_mac_init;
> +	plat_dat->set_phy_intf_sel = ingenic_set_phy_intf_sel;
>  
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }


