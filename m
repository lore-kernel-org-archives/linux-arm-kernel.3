Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0761AE6BF1E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXe//ENorTTfM0niimm1e9yrY55w/0fMrZ/qt/A7EwM=; b=g34kqg0HRHhgDwOWNGwWuQZotX
	u7NaKvRtrVDQOrTe2tF/qawBS4wOZkq8W0XSaulxukux9VYLhrxt5MAx25xcr7j9IPidxkwwLZeE/
	dyzCyHZxfho6STd+w8sDb7BNEnoBK5dl/yqSzuc7gOkgzB3CccBSLhqoWUxv3LTUW7607oYRnp7wg
	nX2qjWWBpiPowGcSDvOeZDwm6WC9Q+8gvUbkxNVu7/q9IqfqclcK/xH0Xy3pD3fuH3VKuCsLwXBKn
	o8IHYO/1zBAxe01N6YfLVTEzQAlh/0UUjFSidOLffu/cqCxmDcr96G6oiQd0osWfU7tQ1SmURkqvb
	rX0mYPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqo8-00000001gT2-47ww;
	Fri, 30 Jan 2026 15:53:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqo6-00000001gRv-3ecx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HXe//ENorTTfM0niimm1e9yrY55w/0fMrZ/qt/A7EwM=; b=aS+ac/s20VY5WOMnOTrrKTXkqw
	CvUccuNW8erl31P/A6aO0RTRQyLv9VkiYGK0m6u5zBmV5IGGnas6fK1PiuUMqhkUiFn72vVs+igMx
	xwSPo1it4HcrWcdKwA5gPvudx5huDaj0jFHempG5JHTFClIelb5fWTlgXb4/b0yC+EKGOZVzfurK5
	q/ocekDnstsspNsC+ZRwBg6LMMu5lSaCp+ifYdpEwxVhOFwbEPKScaDUTp5xfiPfKaUWos/tLpPXE
	UnDVNlFvJNhhae9c26rIO/ItRBMJQ9ASIMNaYrFECF/CamkXwyvk8uSGl9oVu+kqqAgGkkVSappfI
	40fVGUlw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55186)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlqnq-000000001Fc-0kyn;
	Fri, 30 Jan 2026 15:52:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlqnl-000000000dd-2qfp;
	Fri, 30 Jan 2026 15:52:53 +0000
Date: Fri, 30 Jan 2026 15:52:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed
 interface
Message-ID: <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
 <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
 <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_075314_906756_0A58C04C 
X-CRM114-Status: GOOD (  26.30  )
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

On Thu, Jan 15, 2026 at 12:27:05AM +0100, Marek Vasut wrote:
> On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
> > I think I'm going to start over, trying to figure out what happened.
> > 
> > c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
> > 
> > Did the conversion, and it always called stm32_dwmac_clk_disable() and
> > where it exists, dwmac->ops->suspend() on suspend, provided
> > stmmac_suspend() returns zero (which it will do, even if the interface
> > is down. On resume, it always calls dwmac->ops->resume() and
> > stm32_dwmac_init() before calling stmmac_resume().
> > 
> > The conversion added hooks into ny new ->suspend() and ->resume()
> > methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
> > dwmac->ops->resume() and stm32_dwmac_init() steps.
> > 
> > However, in 07bbbfe7addf I failed to realise that, in order to keep
> > things compatible with how stuff works, we need to call
> > priv->plat->suspend() even if the interface is down. This is where
> > the bug is, not in your glue driver.
> > 
> > Please try this:
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a8a78fe7d01f..2acbb0107cd3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
> >   	u32 chan;
> >   	if (!ndev || !netif_running(ndev))
> > -		return 0;
> > +		goto suspend_bsp;
> >   	mutex_lock(&priv->lock);
> > @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
> >   	if (stmmac_fpe_supported(priv))
> >   		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
> > +suspend_bsp:
> >   	if (priv->plat->suspend)
> >   		return priv->plat->suspend(dev, priv->plat->bsp_priv);
> This works too, thank you.
> 
> Will you send this fix ?

Sorry, I appear to have dropped this patch on the floor, and just
tripped over it. I'm just build testing it and will send it later
today.

This problem affects every user of the platform ->suspend/resume()
stuff, so is not just a stm32 issue.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

