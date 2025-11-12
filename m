Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A5CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+HInJWYvj2EbsQSrQ08qaFvego5yMYy0Y/L5C536i8=; b=wpHnfXPhjwhYLHdYKiZYsSwe47
	NADCTemfQ7+awQcGSU5rQBLoHjJyw29O8sn8kVPdj8DCCDNyyzUYiNOmKT07uhSlcolutC9fLCnGH
	XhLbDo5gmpy9RdYSNcZVjUkleeQOiHBLCnB85i66K4ueZALyBa4m/SfaEAvtdaZsKpBKbH99iibRD
	dtXNXS5dYi2Aq48OUcd+wi8UeiOgt3v//xE7d/bzGfQm0uGOMym60XC0jrwLMoQQT/nzsHwj3syLv
	ZnHpm7YZdydu5XHBJvLlJyGiWDVZpdQD0Zn8Nypt8LOzoSxADQgo0w8hLQpW8Q+fmJN2nWmm125tM
	2nZIghMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD4l-000000095lE-2JoM;
	Wed, 12 Nov 2025 15:48:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD4j-000000095kO-3ATk;
	Wed, 12 Nov 2025 15:48:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24EE84E4165B;
	Wed, 12 Nov 2025 15:48:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C2F6070B;
	Wed, 12 Nov 2025 15:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC440102F1C26;
	Wed, 12 Nov 2025 16:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=p+HInJWYvj2EbsQSrQ08qaFvego5yMYy0Y/L5C536i8=;
	b=LnZMVGfYx4JIkgZ0Ij0YvUWtCZRvN4HKk6pXwIobuWFpTpxcBI9lfc8Tws8Zg4Dyd8b3k5
	LkzMbtgJ4Ef0ZgmANMNlmp6ENJAd+NpZ2ry/lM3aDENQytAuaRMP4GqLSei6QX63BvSGJ2
	eTSC/cw2nM6U2nWghrBpDforF1L5XcCQM866onJDZZecaj2TCiHCr/KbO8cVsZFA7jAnA/
	0Kdc2b4kVJeYheJNGtqM5yQxaBqdVzYAXirqATeEpI4AbKw7nGo578gTSvdFcJ0FCMWmvY
	x6s7BtQEM0BWunfkg/k8BALQhE6PXrlszHy4zMGP18q5B9MKxMZ7nbJsUC/hKA==
Message-ID: <69d274c0-8133-4646-bbac-d30e6573dda8@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/13] net: stmmac: loongson1: use
 stmmac_get_phy_intf_sel()
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
 <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074801_934761_94DAB385 
X-CRM114-Status: GOOD (  16.13  )
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



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 5f9f66fbc191..894ee66f5c9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -140,14 +140,9 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct regmap *regmap = dwmac->regmap;
>  	int phy_intf_sel;
>  
> -	switch (plat->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> -		break;
> -	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
> -		break;
> -	default:
> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
>  			plat->phy_interface);
>  		return -EOPNOTSUPP;


