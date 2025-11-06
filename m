Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C564FCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xPwKSiR+8qRIcjkMOf4GQBuNI5KSYXz+hCD8bwMBFQ=; b=yIv0HcIJcwpe3VnlTZwSiwI9RA
	vdfBxYPQX6b+h9PeW/mR3vwTJGz6jKV7+64HqLY2REiH44ZDfItMELXXlnzZQBMREJPTO13ssjXwO
	3T/Hxe2N9bFaZpRmaXZfL634JjwsXcl+i7BhxtOvei73io9rk38YgcJMMMNvjvy2N15EGfN0Pse2i
	xQ/7QrH/wrrqkU+CFaoSpb63FOT/mnN+CQLEwwiDaFfc9k/Tbd+bAUnXPElW5SORDURuwl3Ryno6c
	GnklrynRvXUSehk2m1nBpqlxAfP6EcphaWsugehj8fzcbzUjcAeiFK57CezdqJU/1tujz4MUg7amH
	+XnjaPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwlP-0000000FDg4-0LK5;
	Thu, 06 Nov 2025 09:58:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwlN-0000000FDfU-03bF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:58:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E73B4E41562;
	Thu,  6 Nov 2025 09:58:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D70A76068C;
	Thu,  6 Nov 2025 09:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93FF611850798;
	Thu,  6 Nov 2025 10:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762423118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0xPwKSiR+8qRIcjkMOf4GQBuNI5KSYXz+hCD8bwMBFQ=;
	b=unwm1zfqRBi+OJfuCQcPAavSk8jiei0QPcox1LFunOUFkp+7zt4Mwq1DVZ3izAOMimnhSE
	4eGDJydu1rqz3vP6wwkiS+C2zWxJWrRtDI9hNLRikhL3KwofuXk5IvB9jaREq+EZsbppAA
	0od94fTyO7HbhZaW2En/k4QZv4crcxTzYMOU2k8wvKRqy6Q/a4jF93UBTekDnClA/VY6O7
	mTrTJCjUDMWBX8jr2oNRmeozWPBvSu5jq5wiskBJNZTUsNROEpxZ1e+fY2TXsyhO0qasc1
	Cy1OWOzcVvXyFi0Z4te4UeiRXwmoSL52ZyZDBv2exvyZQRO7A4PZJcIc9BDNvw==
Message-ID: <9a6614b1-7df6-4f40-b62a-e8df9f38637c@bootlin.com>
Date: Thu, 6 Nov 2025 10:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/11] net: stmmac: ingenic: move
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
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvnz-0000000DWoJ-3KxL@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvnz-0000000DWoJ-3KxL@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015841_188956_25DA8DA6 
X-CRM114-Status: GOOD (  16.42  )
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


