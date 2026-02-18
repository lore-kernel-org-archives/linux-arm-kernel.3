Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91AE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+7zpy8WveexkWP3a1zJEdoHkT/j637tD1fWPhFuCLY=; b=4lhmatG9L8vo17eXsuORfqdekL
	DGahlq9xzxrXGk5c7R6QtS5nikUevxutwLPxba29cLSD5V9wVKbI7+NPYwrTYe9KFXu5EBwaOtK02
	0A0msvXE1WnLBqbfGZn/ht7CBbcpc70EcyVHEq84TGFGBDKR/ltlehQ1ZFgvvFfcmJi+iORoBkkty
	E3TLcayVu9WbpxMw/83p1RpdcZbU2vvy0XH1rOBjQ8dtXmDwvogBE5hkLNYhrrOijzikCRSE9+g9T
	sObfDrUEY3657ENjj5PMWwytVGvjS/cpQGKpW0tCX04vRxq6ha0h1b6iHozmrYyMMI0wMiYoOGT2v
	ZCjelB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdEo-00000009UaX-3Ben;
	Wed, 18 Feb 2026 08:48:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdEm-00000009UZv-00a3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g+7zpy8WveexkWP3a1zJEdoHkT/j637tD1fWPhFuCLY=; b=x+57rdakNzzgxDdVHb69WLTsxj
	UtamdmM7dJL2dorYYFY7wcpaD3P+4ZYJDSV1PBC/VRYQ9UtvYEXaw3LHjQIjrqLhrqam1dwTINQic
	0lp7qv9JseBabEwA10ZE2wwsCvfsuHMcqou2Ix8CZ5iwENLNZvZopmcjZKr79SoophgjbX69DA1+W
	SlfIJAKV6J9LkDIb68vVIXUgAUscURbyOlIy1fBh82yCQnS8IcyFHFFNWHRbWi8I2WKXn8+ryeVRs
	HcTqmjFx2zOpJZgzl9zoxxiJByq3aWwrCKJ+HuBWd1M9R+rkCycIxcBXP2tIBt34V2hzQeaGfaXFB
	Yf1BM2YA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48880)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsdEW-000000008Ls-0C6v;
	Wed, 18 Feb 2026 08:48:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsdEQ-0000000026q-3DPP;
	Wed, 18 Feb 2026 08:48:26 +0000
Date: Wed, 18 Feb 2026 08:48:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] net: stmmac: fix pinctrl management during
 suspend/resume
Message-ID: <aZV82iEs89PnSnXm@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218083618.67805-2-christophe.roullier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_004848_064216_66135515 
X-CRM114-Status: GOOD (  21.37  )
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

On Wed, Feb 18, 2026 at 09:36:16AM +0100, Christophe Roullier wrote:
> In the deepest low power modes the pinctrl are lost and never restored
> if the interface is down.
> This commit makes sure that pinctrl modes are set in all the cases.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c63099a77cc0c..067b17f03cd09 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8133,6 +8133,8 @@ int stmmac_suspend(struct device *dev)
>  		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
>  
>  suspend_bsp:
> +	/* Select sleep pin state */
> +	pinctrl_pm_select_sleep_state(dev);

This is wrong. Look above, this, and you will notice that
pinctrl_pm_select_sleep_state() is called _conditionally_, depending
on whether the MAC is doing WoL or not. If WoL is enabled, the MAC
needs to stay functional, which means its pins need to stay properly
configured.

So, we can't unconditionally call this. I suggest moving this to:

-	if (!ndev || !netif_running(ndev)) {
+	if (!ndev || !netif_running(ndev)) {
+		/* Select sleep pin state */
+		pinctrl_pm_select_sleep_state(dev);
                goto suspend_bsp;
+	}

>  	if (priv->plat->suspend)
>  		return priv->plat->suspend(dev, priv->plat->bsp_priv);
>  
> @@ -8194,8 +8196,11 @@ int stmmac_resume(struct device *dev)
>  			return ret;
>  	}
>  
> -	if (!netif_running(ndev))
> +	if (!netif_running(ndev)) {
> +		/* Select default pin state */
> +		pinctrl_pm_select_default_state(priv->device);
>  		return 0;
> +	}

This looks fine to me.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

