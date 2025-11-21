Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC2ECFC28B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUWCvxpi6yN02JYD/ezJBruMSnXyrEhd3rz8Me29Xlw=; b=cTqfnikYopSfvr/6eE4J8dJHQH
	8O7hKyAvs6Grxc/3ZNwEQiptxSubTPJB5VZ1EHUsWW+T3ruWjW0JjCqQvSwsObmgNhbv6yLru/K0Q
	Y/66XQTqNf9x7OvT+vP3pFniP7p/ful7MAxrF6RhgwI/+toN6MJ2LD5M/wWnP04mHTJwyev/615Ge
	2x3gVBwy9x+Ur9rDTODIUA2ouxhAkBsYfQK8sB0fHChsUFSxJ797kCvmt0FJ3og01NmsW5RLpyeD0
	Xjll+/0m783na9j+C/fbeFI4uM/gTWUBb+ezrObJooYrbG3F7iqdUtzj1Zg+6RD9qaKHmH8skCQTc
	BbOw6YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSXZ-00000008YZn-0lSx;
	Fri, 21 Nov 2025 14:55:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSXW-00000008YYa-1ifW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cUWCvxpi6yN02JYD/ezJBruMSnXyrEhd3rz8Me29Xlw=; b=aO0PLSK7qfu/FovGYhfLS+dQiM
	jWQuzAs6xPj0Vr0IjwVw3gv6cdQwoc9+Yx0NbvWRI8UwmV3c7fAmavCZLEpmQ0fLazJtH9JTTzKsd
	dKPLG6xN2203lxzeTq9E1Dbb5rC1mGh1yBwhX7Udq2kzTZFv4U5l+7cQNyN1bH5Oi5lt1OzsxGGJt
	ev+SQZ1it8FDnn78f3rejJBbFH8pFxn2JL9qhi3E3E4i0DFoLOMk2l7+YNkAmOUt3nJGwqmEu985C
	6CU8IGKWREZcvV/e4EXDexO8eXzXmqgvtbgvgAQfU0k6FkZf6Tk5bsKXfA+UWeAnCUbXNq4E3guDR
	QECPI58g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMSXJ-000000007gY-3h78;
	Fri, 21 Nov 2025 14:54:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMSXG-000000005Qf-0QYl;
	Fri, 21 Nov 2025 14:54:54 +0000
Date: Fri, 21 Nov 2025 14:54:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: move stmmac_mac_finish() after
 stmmac_mac_config()
Message-ID: <aSB9Pfd0cAd4CQgL@shell.armlinux.org.uk>
References: <E1vMNoX-0000000FTBd-3Oup@rmk-PC.armlinux.org.uk>
 <0423d36b-05fa-4a2b-858c-e6ef5ff1560d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0423d36b-05fa-4a2b-858c-e6ef5ff1560d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_065510_720449_76D1637A 
X-CRM114-Status: GOOD (  22.43  )
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

On Fri, Nov 21, 2025 at 01:03:59PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 21/11/2025 10:52, Russell King (Oracle) wrote:
> > Keep the functions and initialisers in the same order that they exist
> > in phylink_mac_ops. This is the preferred order for phylink methods
> > as it arranges the configuration methods by called order.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 970c670fc302..d16e522c1e7d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -932,7 +932,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> >  	struct stmmac_priv *priv = netdev_priv(ndev);
> >  
> >  	if (priv->plat->mac_finish)
> > -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> > +		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> > +				       interface);
> 
> This is just a line wrap, I don't really see the connexion with the
> commit log :( Some missing hunks in the commit maybe ?

Oh, I thought I hadn't sent the patch, but I had... meanwhile I'd
updated my local copy to fix the line wrap, forgotten I'd done that,
rebased the patch and ended up with a patch with that description
but with only the reformatting. Bah. I'll move it out of patchwork.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

