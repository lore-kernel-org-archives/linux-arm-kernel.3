Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA15BCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whfl4QLl7rlDdWuJnD1FYGrTxAzK/P2e2aQDPSeDeSQ=; b=40FfdyommFm+MxpYR2UhYT4a4N
	3M/ckDfudAG9Tx/wrpH7z+7J58xwrhpEHxpY4YrCn8fTAt1/ubXb/NcwIUkUbeQqTLQJmjBEqT7j4
	Z4JiLxcvgeaufVZfl4h8XEcV3XkwiV7XV/jt4A4qP6JKBI30m7ZVQaKRsVog3CE6zHKu6YMyK0UUI
	IMqsC/3ayB8/ljnyaT2qe2ZTIiamb2dNbBMcy212mRIHMwfC6304HRwP3c5LH4fRxPV6SB1DwblIY
	pBhtjavsjagRuqrkBUxtKBSvs86TsNYcaPvXDH3M9FfZB0WwgLRlbK10nMVn9UW2g2NnfOME+d0rd
	vK19QX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEHH-000000074aQ-41Tj;
	Wed, 10 Jun 2026 08:27:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEHE-000000074ZP-2uMT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:27:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86151C5146A;
	Wed, 10 Jun 2026 08:27:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A7325FFC9;
	Wed, 10 Jun 2026 08:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81A4F106B9056;
	Wed, 10 Jun 2026 10:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781080022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Whfl4QLl7rlDdWuJnD1FYGrTxAzK/P2e2aQDPSeDeSQ=;
	b=1JqGYNOOL1Pl5I9EUrbk8Gh6N8JpYRafqUk235S6QQUxecR7HLECmGB54SN7PPv4uNYCcf
	0N503XbHO4hBTdwsh/tzzj5j7oLUxc8Wlt5VT0aBcomUHRwC44BrID/CP2VW4ZlcrIR/l7
	wPrerAVivv5Dta96h0JcuCaS69Uul6GoEWqp+ilBENCM90FKwZ187AmYNy7K0Z5VNUKIFO
	KSaURLkQpn7Ml/WV93S/y4viL5xCmFxdk1GYve8IGrdpBGpgUdF5oGnAx1oB1X3ictlFE8
	Ft7rQMA58/2cDT0y4WGvLyyQ8k5f3inDbfI6/9BvuK72Nzrb5G9RbANHO60Ibw==
Message-ID: <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
Date: Wed, 10 Jun 2026 10:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII delay
 properties optional
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260610012937.911-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_012708_904629_FE10653B 
X-CRM114-Status: GOOD (  17.27  )
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

Hi,

On 6/10/26 03:29, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Make rx-internal-delay-ps and tx-internal-delay-ps optional in the
> EIC7700 DWMAC driver.
> 
> The driver previously required both properties to be present and would
> fail probe when they were missing. This restricts valid hardware
> configurations where RGMII timing is instead provided by the PHY or
> board design.
> 
> Update the driver to treat missing delay properties as zero delay,
> allowing systems without explicit MAC-side delay tuning to operate
> correctly.
> 
> This aligns the driver behavior with the updated device tree binding
> and provides a safe default configuration when MAC-side delay
> programming is not required.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index 4ac979d874d6..ec99b597aeaf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -165,9 +165,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
>  		dwc_priv->eth_clk_dly_param |=
>  				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> -	} else {
> -		return dev_err_probe(&pdev->dev, -EINVAL,
> -			"missing required property rx-internal-delay-ps\n");
>  	}
>  
>  	/* Read tx-internal-delay-ps and update tx_clk delay */
> @@ -187,9 +184,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
>  		dwc_priv->eth_clk_dly_param |=
>  				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> -	} else {
> -		return dev_err_probe(&pdev->dev, -EINVAL,
> -			"missing required property tx-internal-delay-ps\n");
>  	}

I think then you need to handle RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID,
by using default delays for these (usually around 2ns), as here all delays
will be set to 0, regardless of the RGMII mode in use.


Maxime

>  
>  	dwc_priv->eic7700_hsp_regmap =


