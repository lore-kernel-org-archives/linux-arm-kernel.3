Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6B3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rile4f14cDJIakjmIfK3sT/0p2MCzB68TdqYyaWZuXk=; b=vwMoTDgW0GMvjqBf624wj90Gju
	PBMLIy3Xdd858VpPnZVs3762B2UsrP4d0/fiWb9GiHfYvtHV/YHH8oDlXsbvXSmFjoqIHm/DErn+/
	zzQXdoAuTP2DzD3c4oBh5sO4joNxsiY94BYxVqhuapTJZ7K5thefMMFHswjkNqX3kPuOF5OaKg/z+
	2laBdq4LuJ0/oCtCuJwrbWKeQq7AuERHkcGXRgXzc4/bc+or6G+geraHbcdJpZHZt9My761SHE9op
	3+OrHG48fBW8gAT3DdwPM9sNamA0tk1HV508Urlx0hUT49uOLzKEPMF/I7sw+IRGvb2J+7v2SFLzf
	PSU/Ls6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZpM-00000003Dl0-0OPV;
	Wed, 22 Oct 2025 14:28:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZpJ-00000003Djy-0s9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:28:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7EFCEC0AFF6;
	Wed, 22 Oct 2025 14:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D2A8606DC;
	Wed, 22 Oct 2025 14:28:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECA3C102F243E;
	Wed, 22 Oct 2025 16:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761143309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Rile4f14cDJIakjmIfK3sT/0p2MCzB68TdqYyaWZuXk=;
	b=EfUfHj6TGyD85vx69BNLmM9lTYrjeeIyiEMZC+be04ailGl2Q8ZdwxWyqvaufndbyYjWUe
	ojVSXNeyQnT3Tl5zDP9APeAm1CcTdqL2qNBsUcKHuOiqpdYW+Xjy2b3vwMMZjJPGhfYC9X
	+yfzDHBiRPH44Vxw4VW3sLphgBtACQNXX2Vb6MJ/OP1ntVUOkywzDRiXDhZSm7G9ozY+Zz
	dMzKLxvBF/Tco4nJLoaCWhkcqwyX8EyLhFmjaJdvs48d/HDN533WWSx8kfoPGqNfcwMIE9
	Z7DFASR+DWFtEKW7wx/HqgSeum/GPR680fiQqq4RABycvJDJwUQiynS0Yva5bA==
Message-ID: <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
Date: Wed, 22 Oct 2025 16:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/6] net: phylink: add phylink managed
 wake-on-lan PHY speed control
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072833_452167_DE8BA025 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Russell,

On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Some drivers, e.g. stmmac, use the speed_up()/speed_down() APIs to
> gain additional power saving during Wake-on-LAN where the PHY is
> managing the state.
> 
> Add support to phylink for this, which can be enabled by the MAC
> driver. Only change the PHY speed if the PHY is configured for
> wake-up, but without any wake-up on the MAC side, as MAC side
> means changing the configuration once the negotiation has
> completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 12 ++++++++++++
>  include/linux/phylink.h   |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 939438a6d6f5..26bd4b7619dd 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2576,6 +2576,12 @@ static bool phylink_phy_supports_wol(struct phylink *pl,
>  	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
>  }
>  
> +static bool phylink_phy_pm_speed_ctrl(struct phylink *pl)
> +{
> +	return pl->config->wol_phy_speed_ctrl && !pl->wolopts_mac &&
> +	       pl->phydev && phy_may_wakeup(pl->phydev);
> +}
> +
>  /**
>   * phylink_suspend() - handle a network device suspend event
>   * @pl: a pointer to a &struct phylink returned from phylink_create()
> @@ -2625,6 +2631,9 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
>  	} else {
>  		phylink_stop(pl);
>  	}
> +
> +	if (phylink_phy_pm_speed_ctrl(pl))
> +		phy_speed_down(pl->phydev, false);

Should this rather be phylink_speed_down, to take into account the fact
 that the PHY might be on SFP ? either here or directly in
phylink_phy_pm_speed_ctrl() above ?

Maxime

