Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ADACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm64gM8EXxiCL6h3Shnl5SuMXJZ/nOwqbkGzDPWYn9E=; b=xZnpqFEJ0/8rFGh5dr8kzqX8oJ
	aXZ46g4RRjQ6k84uNv4LCcP/nSX+ULW0mHBjRG6GF4mQp9KDG96sxkOPPL4h9JQ0MVGlLhPI4y7yn
	c01MJBGjhQw9Bbb1XFIH/3J7c2qNbb3LYeJypfKJslED7HAMkWFBDTUwUnPfU3HJJBr7JQSJHyEqw
	RatuPsDV2z4oryGLlvXSI8QLBm0Ol9d3Dl6UdZoMB6yxwztvAHL1dan46SErKEU1y6+qXcOYPJ/VS
	z8lwM8d8EIV057Nfj0OThvSjVOvM7E6V9LkA78EaM5wPOn9gMDRTWxSZvmyO9maUIXLH9kskqj45A
	T0E2z24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwd2-0000000FCto-2uEz;
	Thu, 06 Nov 2025 09:50:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwd0-0000000FCsk-2Rgt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:50:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E4734E41562;
	Thu,  6 Nov 2025 09:50:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D256D6068C;
	Thu,  6 Nov 2025 09:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74FAF1185082B;
	Thu,  6 Nov 2025 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mm64gM8EXxiCL6h3Shnl5SuMXJZ/nOwqbkGzDPWYn9E=;
	b=L1a3WepOX0khJ/Ur85az6tTXBpWZEK6J3cxK9BR4VanbsnRCJAPCgMjbP9n1/cQAqS9W/y
	80NmkjLcdsCoDMu3nR4a2wIJXck4IgFqHKldChNWb8dq4vQGYb6KXAjOLzUIki1xazaQvu
	5CRQeViz8SsJILlwtGKgWP+0CYKkOp3K7cL9BtJiE1joAtQUKdnj0bZK6e3qvfYXe5lwRT
	ic2C2OTTNCUcYZU/MHwD2IC1EGDbdN7UYu/OivteDmiujRxBszMrGplq/wQxRIMU3atPo0
	h3/JvgD9im0KBT3bqnum8wMp5G617rq5Rmi82aByxxrZYMeef8Sh8SyRi7V1GQ==
Message-ID: <a51db9ea-a6e9-476d-915a-2aa532fa3392@bootlin.com>
Date: Thu, 6 Nov 2025 10:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/11] net: stmmac: ingenic: move
 ingenic_mac_init()
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
 <E1vGdWf-0000000ClnO-03pS@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGdWf-0000000ClnO-03pS@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015002_768975_54733CA5 
X-CRM114-Status: GOOD (  16.51  )
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
> Move ingenic_mac_init() to between variant specific set_mode()
> implementations and ingenic_mac_probe(). No code changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index c1670f6bae14..8d0627055799 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -71,20 +71,6 @@ struct ingenic_soc_info {
>  	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
>  };
>  
> -static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> -{
> -	struct ingenic_mac *mac = bsp_priv;
> -	int ret;
> -
> -	if (mac->soc_info->set_mode) {
> -		ret = mac->soc_info->set_mode(mac->plat_dat);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
> @@ -234,6 +220,20 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> +static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> +{
> +	struct ingenic_mac *mac = bsp_priv;
> +	int ret;
> +
> +	if (mac->soc_info->set_mode) {
> +		ret = mac->soc_info->set_mode(mac->plat_dat);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ingenic_mac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat_dat;


