Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88CAE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNiml1fPOFHSDNSX5TbGB94poy4lCrg+gQJDPIQHDZk=; b=EnTG/B4g0Oy+x1jNKklqFMmoZu
	07AMHSaT53VfTPdArH/FxrNT/W0tComkOhaF0zW1MSUH7U/mwGDWEjffgrC//2ewzS59PEb3U/P7k
	JwrtZxQ9FeTx1mVViNGnO/AaFkeX7h5HD4ZPJSJ2q7/RSOTgyPWtNQFX5pMY8x3PrCTg6U46yCLzb
	yNbgr/DU4VQWGY76rOwU/UU3DX1sASGcOvyqpVoKtmBvKnj7+8shmuP9zl20Hk0FiEKUeNS59dIFm
	MLFhl3x+3paEyofSrsXHOBrXfMs3S/VU/aK5xm6M7Z3AASNLpZ6b5bmFuer7vrCGnr8CFOoYl074m
	UjsiRaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdLF-00000009V6N-2uwU;
	Wed, 18 Feb 2026 08:55:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdLD-00000009V5u-2Lzh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HNiml1fPOFHSDNSX5TbGB94poy4lCrg+gQJDPIQHDZk=; b=v474WJygVfbum/Tr2SmpOSwNnM
	ind4ll1vgxaTYpEaV+Ui0Z6TjzgUC+ZNQv47MOAyzt+wfHlnOlP+MtUyBizqlU9RvDEqfljJoKe+/
	agrajN4fc2lWs+tPPxPShkMETDQWMJXNWBirhLXK9hE5meefnGGnH7MznCEUlNOnd3g5GgV3O/YUD
	osNK2JQEgeo0ozA43GEzWB90grbWJ0W1JGWrkJzYNpwhWKf55LWkMBuK73SqmDucjqEoTwcOYngxO
	aBp7tobs0OOlnGaXy1ifdn1ZSa76x0656VVNDPU/HHB/IjyFpBqTp318/vSUMwBK8xF+vhXYGvHDu
	tY09byBw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35660)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsdL2-000000008Mi-1YYB;
	Wed, 18 Feb 2026 08:55:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsdKx-0000000027A-40OQ;
	Wed, 18 Feb 2026 08:55:11 +0000
Date: Wed, 18 Feb 2026 08:55:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Roullier <christophe.roullier@foss.st.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
Message-ID: <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218083618.67805-3-christophe.roullier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_005527_600751_4C5E92AA 
X-CRM114-Status: GOOD (  15.43  )
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

On Wed, Feb 18, 2026 at 09:36:17AM +0100, Christophe Roullier wrote:
> when system suspend or unbind, need to set pins
> to low power state to save IO power consumption.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 067b17f03cd09..3d4f0e4cb53fb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
>  	mutex_destroy(&priv->lock);
>  	bitmap_free(priv->af_xdp_zc_qps);
>  
> +	/* Select sleep pin state */
> +	pinctrl_pm_select_sleep_state(dev);
> +

I'm not convinced this is correct, there's nothing to match it in the
probe function, except what the driver model core does. However, the
driver model core also doesn't clean up the state if probe fails.

Adding LinusW for comment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

