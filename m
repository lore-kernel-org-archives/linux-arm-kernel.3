Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DA3C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3H6MWK6GwyDeXeOh9tGK2U19UW/15BQhpRWg3MHlJEI=; b=mw7grhgZY2PnLYYBIqQT+RecLJ
	OQWrNRqq+8S5sPdeUkJjwoDnoRNjMm2BPsNagx9fPErS++kfqHofGxyU6w721WFhprM3zCDM7GST4
	AeWmyDViqeU05pjiGuv6KiTO4Td8vgR6hy7uHQ4U82fXCicwjDPIi/yBTU2bm5potvYrALHHId6ls
	coD6DWFzfrnd4b7UVp3IbpF2gaid11fUEII/tK5TrzjpkBsMXRTcZp9c/vDr1xxsLHicPtHdOilr+
	sCssOvl9WO7lVkRPydLO30Zuvxo1/TRPlZWZHu9U10tarSuFqqwgl+T+RQo74jJ9pZ7tIGavu0BpD
	WlD5WzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL1E-00000009itU-2qCP;
	Thu, 30 Jul 2026 07:17:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL1B-00000009isn-0gkW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:17:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6EB3B4E41000;
	Thu, 30 Jul 2026 07:17:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F5D9602B8;
	Thu, 30 Jul 2026 07:17:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CCB511C15761;
	Thu, 30 Jul 2026 09:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785395835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3H6MWK6GwyDeXeOh9tGK2U19UW/15BQhpRWg3MHlJEI=;
	b=qvBTU4UgiJERlymmlQTYl2oKQFff1y6cSPjY4Im1uWQm4Sqm5IGQjyP2HYoq+190piGqib
	CUll1NMoV7VRPpQdXp9Et998bquRUIrxsZx51WMRPKQ00AjYZRy0PJJa3xhWA2J1gcJJrV
	UtH9+vCGVyD4IyPPveHs9JrMRqV1Nyp5t0Tu95xhJsYEdV2GXO3bUIYHNQCdUHm9Oo51Tr
	M3VokwPpJ4O5V4hwcKsyQVsCT9FqffbrI9IZ08Nzto1LJxRikgn8MWOXPTSM09EtT46x30
	2l8ioYFCQbcXGu7IgWSqqos2+JHDe3JByWUQEMCZTcZbtnIdqf6UJcNp7kmecg==
Message-ID: <d0f6d828-1c73-42af-aac6-e48330b77dea@bootlin.com>
Date: Thu, 30 Jul 2026 09:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Select sleep pin state after suspending
 phylink
To: Fabio Estevam <festevam@gmail.com>, kuba@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Clark Wang <xiaoning.wang@nxp.com>
References: <20260729224535.506598-1-festevam@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260729224535.506598-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_001725_370681_5E8225C9 
X-CRM114-Status: GOOD (  18.65  )
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

On 7/30/26 00:45, Fabio Estevam wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> When MAC Wake-on-LAN is disabled, stmmac_suspend() selects the sleep
> pinctrl state before calling phylink_suspend().
> 
> phylink_suspend() may access PHY registers over MDIO while stopping or
> reconfiguring the PHY. If selecting the sleep state muxes the MDC and
> MDIO pins away from the MDIO bus function, these accesses no longer work.
> 
> Select the sleep pin state only after phylink_suspend() has completed.
> 
> Keep the transition conditional on MAC Wake-on-LAN being disabled so
> that the pins remain active when the MAC must receive wake-up packets.
I think we need that fix, but it does raise even more questions:

How about when the PHY handles WoL ? We may have to access it early at wakeup,
possibly even before the MAC has woken up and restored the pinmux for mdio ?

The mdio bus may be shared with other PHYs as well, they may race on suspend
as well if the stmmac instance that drives MDIO quiesces before the other MAC
that needs the other PHY ?

All in all the question is, should we instead deal with MDIO muxing independently
of MII muxing, especially for suspend/resume ?

Maxime

> 
> Fixes: 90702dcd19c0 ("net: stmmac: fix MAC not working when system resume back with WoL active")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> [fabio: Reworded subject/commit log for clarity and made it priv->wolopts conditional]
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Based on the NXP kernel fix:
> 
> https://github.com/nxp-imx/linux-imx/commit/7905fa71ed07d8c2f1da88ad9fffd5ac5e89461f
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0de4bc949913..36ab66ad80fd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8183,13 +8183,15 @@ int stmmac_suspend(struct device *dev)
>  		priv->irq_wake = 1;
>  	} else {
>  		stmmac_mac_set(priv, priv->ioaddr, false);
> -		pinctrl_pm_select_sleep_state(priv->device);
>  	}
>  
>  	mutex_unlock(&priv->lock);
>  
>  	rtnl_lock();
>  	phylink_suspend(priv->phylink, !!priv->wolopts);
> +
> +	if (!priv->wolopts)
> +		pinctrl_pm_select_sleep_state(priv->device);
>  	rtnl_unlock();
>  
>  	if (stmmac_fpe_supported(priv))


