Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KYZxA4YJH9uVQqfnlIQeaSC+UTHBZf1ocK/1v86G9k=; b=hZpf9TcypRaxvjy0qodh2Z9QM4
	D8tZrF5CuBhn41I3bYYgq1zjc4BGoYfvhsGnSXsAzxtz1XU9Vo1MiWOU2vnX0O6DdH611mnAX9of8
	oitDCu0mK3pkBeQnSfh4HlE/fW4qqULDb78yMxHgyYKv3KO2cU7X2jSu82tNMBAYr9e+cThIOP92e
	4w2bkYMY8V2RSH7AdAOMzB0mqdgofwbONzwTG764Hqh44gXjVnwTWbehL7hI/FYjsBQroQKpxSMO6
	/yEW6wphtm7pbV+ZJ6/PleGfa7QOJq63QTLKG7XXnFRb1PAyNDSUV5cfnb2TCoDdKFawovWPGliZC
	65k6rmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwzg-0000000FIgA-22V4;
	Thu, 06 Nov 2025 10:13:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwzd-0000000FIfG-2a68
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:13:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D1011A18F0;
	Thu,  6 Nov 2025 10:13:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECFA46068C;
	Thu,  6 Nov 2025 10:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7297111850A0C;
	Thu,  6 Nov 2025 11:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762424002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5KYZxA4YJH9uVQqfnlIQeaSC+UTHBZf1ocK/1v86G9k=;
	b=GtiPL+uhuD6tubpnA1wX5x0gydoJzaIP/M2RCEs6N0EpDQUAyJwVJPNOyCNoRRTor4p0X7
	qKbiJpt7eDnPvdc3jveKsjXVmfXObYahALXWQxV67DJJBEymH/Yw3Jjmm59DrLUDbSuRKr
	86a4A2cS2rJ3ETB9OsEHW2O0M2a7IAeRGkDDXkQKW4F7/9A5hJ/XOOsxxdO7pjRSN2UTiy
	Jm6nGoChz1DGptw0qcIwMWiiNhLvmmW274HQALDPwrjc5ai+FShrnjWhbNXdZ2OOdp4cvG
	zp7VHXnU/EzuMWGVuWb/Ucb6qPd/322sTJDaNvFC2D8Z+/kssCtx5Xm9a7yMfA==
Message-ID: <a8147104-9799-4151-8469-ad05b0aa4a9c@bootlin.com>
Date: Thu, 6 Nov 2025 11:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/11] net: stmmac: ingenic: move "MAC PHY
 control register" debug
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
 <E1vGvoU-0000000DWot-29Rw@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoU-0000000DWot-29Rw@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_021325_814927_9E70DA23 
X-CRM114-Status: GOOD (  14.35  )
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
> Move the printing of the MAC PHY control register interface mode
> setting into ingenic_set_phy_intf_sel(), and use phy_modes() to
> print the string rather than using the enum name.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c    | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 79735a476e86..539513890db1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -77,22 +77,12 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_GMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
>  	default:
> @@ -115,7 +105,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -136,7 +125,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -160,7 +148,6 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -185,7 +172,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RGMII:
> @@ -205,7 +191,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
>  				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
>  
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
>  	default:
> @@ -237,6 +222,9 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
>  		}
>  
> +		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> +			phy_modes(interface));
> +
>  		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
>  		if (ret)
>  			return ret;


