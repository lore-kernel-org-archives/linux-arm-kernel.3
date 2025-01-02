Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2/lJMrShdKFF/LCN9VGIHz6yfGl2Ad/fJkiczIYxJk=; b=WVafgLwHoXjPIsBzU/o4huozHr
	mf6nwavqZPSMdmNzZHmtuqfaBWMCJRShgbvRuK8WBSpjm7jRFJ8AJoWTv1rc3ERosNQQR9BrmloCH
	LWLT6/+8kMPnAhjgPMCeYzopfn5cLWcgGKNzZS7rKdfK3RAnp+Yf6Dka1lzk6aNN4M6Ug+059NT9b
	Rf1nytrHiH2k3OmHKM3PLYdInMv6HFzxvHCQADHxmc6yVO3EaCv/kgXvba5l/AR2LShTYtd10li9w
	99lwo1GfHZZzU1PTY5M8M24zddT7AqtZT5dFeheInu0pxg23khfub/EUA+niTdgslo0ljBwVZtG8T
	tLHGQkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHDh-0000000A1E7-1EzF;
	Thu, 02 Jan 2025 09:10:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHCL-0000000A0vE-19aJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N2/lJMrShdKFF/LCN9VGIHz6yfGl2Ad/fJkiczIYxJk=; b=L4pPXnCQ9/MJcPrdVq87EETWV0
	YDKENkOXhbSxIPBk+Fja0LuH8yLVErcGMrtKbOeNwLJrx0Q1b1cVhgbCsdctxHwteht7k98Ox7cLK
	MoRfX66zRHw7bblH1gYjqVZYzwdvk0Gj4o/vArejDnQkzany+qP73vcTOikSRfaME3xbZR7kxP0pw
	soBjvplC+RcHJpTBAxSoixRJaUArYlSYFBFjx1INgvnf6nBptKYRysgz0dkMaqUF5tukvPeVtAAmL
	Enhth10wOgC4RkuAx5idJIPV/id+reUcAeYsNI709XYEVelZVerZKiQABcdZZ3Uw/GIpbH+lcf0Y8
	yT9odH4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43370)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTHC9-0001nF-0g;
	Thu, 02 Jan 2025 09:08:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTHC5-00008P-0K;
	Thu, 02 Jan 2025 09:08:41 +0000
Date: Thu, 2 Jan 2025 09:08:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: use PCS supported_interfaces
Message-ID: <Z3ZXmAIAHmYVbdbl@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
 <20241217141912.34cdd5ae@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217141912.34cdd5ae@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_010857_329136_D33DD915 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, Dec 17, 2024 at 02:19:12PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Fri, 13 Dec 2024 19:35:12 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Use the PCS' supported_interfaces member to build the MAC level
> > supported_interfaces bitmap.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d45fd7a3acd5..0e45c4a48bb5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1206,6 +1206,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
> >  	struct stmmac_mdio_bus_data *mdio_bus_data;
> >  	int mode = priv->plat->phy_interface;
> >  	struct fwnode_handle *fwnode;
> > +	struct phylink_pcs *pcs;
> >  	struct phylink *phylink;
> >  
> >  	priv->phylink_config.dev = &priv->dev->dev;
> > @@ -1227,8 +1228,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
> >  
> >  	/* If we have an xpcs, it defines which PHY interfaces are supported. */
> >  	if (priv->hw->xpcs)
> > -		xpcs_get_interfaces(priv->hw->xpcs,
> > -				    priv->phylink_config.supported_interfaces);
> > +		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> > +	else
> > +		pcs = priv->hw->phylink_pcs;
> > +
> > +	if (pcs)
> > +		phy_interface_or(priv->phylink_config.supported_interfaces,
> > +				 priv->phylink_config.supported_interfaces,
> > +				 pcs->supported_interfaces);
> >  
> >  	fwnode = priv->plat->port_node;
> >  	if (!fwnode)
> 
> I think that we could even make xpcs_get_interfaces a static
> non-exported function now :) But this can be done in a subsequent patch.

Yes, that can definitely be done. I already have a patch for this.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

