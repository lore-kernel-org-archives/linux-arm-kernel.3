Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526BBCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rp655FzXH2A2y43WF7aasYvRN2DWp9+Yw7ifAbM4T4s=; b=cP5EC5dKqgVjk/29LEdAKP77i3
	GyKZq/xBSRRFKtqJRxnReItpnhcPKF8PejrDvB2ByIFfpYZFdPkTdpzjzUKett07EwtspZoc234XA
	384BKpc5Hk2W7HcmnkzoI8M032w6xDbV/QQIOaiNs5t3BCB4mPgcbbwlE5mMNKH62s6z3CwI5v9wf
	C5DkN+wkyyXu7XmKL48XNP/F2yV1Z0+416pLd1PijCYDNlDyMg1L1HfPvtAFeVRSOYQ890NCQfOgT
	Ogf5D2ALB4NPM3W2m5EvyaPiXIXISxgf9V5Ll4mTRUksgJUesYh0FtUaZpp23gjOBKWArSqtHryIF
	6PHwjbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGweG-0000000FD4b-2ggv;
	Thu, 06 Nov 2025 09:51:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGweE-0000000FD4B-3m8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:51:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A5FC1A18F0;
	Thu,  6 Nov 2025 09:51:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2FF176068C;
	Thu,  6 Nov 2025 09:51:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 110B1118507AC;
	Thu,  6 Nov 2025 10:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Rp655FzXH2A2y43WF7aasYvRN2DWp9+Yw7ifAbM4T4s=;
	b=IkUon86Z+RDlE597yLWPPOBguIwZMMLqkyH88Ax/Ro3PxgqGFe/LUJOlH6HdPmxmcyTu2C
	88xrMwWPQFUseuhkje88DLxczeeLfhkOY7YW9ae25Is+DAPDnr5Rj3zXRdAvY02j/Sriet
	GUZHgvJdOzmZh7NatnBqg2xAbmBPf6mUfeS2z5bsa6R9UeehNEBXdoUzotmtOW1iZS0hp9
	5Z66CG461rwL53FJqKqocwYlxU/FcoXc3L7Dhl5XHKqP5zvFoEFJPtioCANfNYnFVqVEDH
	oI0DkpodK2DI5k7+nQsB+xfPWQrfjwt3tu7ZZJDJvMB1b2l9l739qRrKDz4K6w==
Message-ID: <0a7f90b1-3962-440f-ab18-ef6542b92af0@bootlin.com>
Date: Thu, 6 Nov 2025 10:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] net: stmmac: ingenic: simplify jz4775
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
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdWk-0000000ClnU-0cVZ@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGdWk-0000000ClnU-0cVZ@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015119_076532_CFC6762F 
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


On 05/11/2025 14:26, Russell King (Oracle) wrote:
> All paths configure the transmit clock as an input. Move this out of
> the switch() statement to simplify the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 8d0627055799..c6c82f277f62 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -78,20 +78,17 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_GMII:
> -		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_GMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_GMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -99,8 +96,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> -			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
> @@ -110,6 +106,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		return -EINVAL;
>  	}
>  
> +	val |= FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
> +
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }


