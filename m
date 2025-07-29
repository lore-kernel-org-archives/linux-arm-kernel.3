Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84140C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7oOJG5KTLIajgCuDI26bWwy2UJFAttGvQUBB26YlI0=; b=GdOM2sSKLKklORkbAJLppkg7Jg
	6q7QW1pjSiLtIzu3we8FOMVlu8GtcUYx+4cVerbf86lGxFNS6OAaWnK9Sn3wBvrh+VRcb/oooEPS0
	bbTKXw44p4d/j40qe8vuxHXoNgNI8ScXNZfCw6PraWc+e6pQvAw5yUxPSCS5hT9ez3cSR74YIsJha
	i5y4bw69lYJvlSdr9QtdxxVcrJgaPL9qkT2odIub16FLmgk7QlSiZF/Soexm44hd1/1BURlUokTJc
	ouey1Etfj4aouhWY2lBLc1B7bSV/cuksa35sHA3Ltcx67iVrUjpvsAocPyzi28z+FdqBnAxQD1bYb
	19mnx5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg3K-0000000GITi-1RhA;
	Tue, 29 Jul 2025 08:51:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg0A-0000000GI3D-2KaG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 08:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P7oOJG5KTLIajgCuDI26bWwy2UJFAttGvQUBB26YlI0=; b=w9hTs92QWrfKsmkOfTZU3IzEK9
	/NKQF8UfFxhlytprmFOCd75wSELHVG+RUGnz4wM7Dx+2BPss78SGmtPdHHKqXTVoV+8J/kyMTLg/I
	hRViRpc1b1w3DMsWnVpCv6p54buc+jEfs+NYmwP4vuf7807MxGJTSNKyACuKF7NsdLYmIeK/zwHhi
	6rTY9HECZiKlsvCvt5yr4ekE9YHDNY01jZOJ1qgJQQMG36r0aFS4MlX9ZudxvFrYkCa2Z9Kux6Z8z
	zaUq7ikJI+pkp1WYuCTMqBTlJM0X1inAtGKp0jvRfT3AF6NHz39TTUui2BCr/k4YynT5kjqW0JN+N
	+vUvWBFQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47240)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ugg04-0001bH-0U;
	Tue, 29 Jul 2025 09:47:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ugg01-0007G2-2s;
	Tue, 29 Jul 2025 09:47:53 +0100
Date: Tue, 29 Jul 2025 09:47:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 7/7] net: stmmac: explain the
 phylink_speed_down() call in stmmac_release()
Message-ID: <aIiKuVwyzR4ZSitl@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ38-006KDX-RT@rmk-PC.armlinux.org.uk>
 <b612eaee-17f2-4cab-bc37-a1cb9560ffe1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b612eaee-17f2-4cab-bc37-a1cb9560ffe1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014802_595310_C5824E27 
X-CRM114-Status: GOOD (  20.33  )
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

On Mon, Jul 28, 2025 at 07:29:09PM +0200, Andrew Lunn wrote:
> On Mon, Jul 28, 2025 at 04:46:02PM +0100, Russell King (Oracle) wrote:
> > The call to phylink_speed_down() looks odd on the face of it. Add a
> > comment to explain why this call is there.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f44f8b1b0efa..0da5c29b8cb0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4138,8 +4138,13 @@ static int stmmac_release(struct net_device *dev)
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> >  	u32 chan;
> >  
> > +	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> > +	 * suspended when phylink_stop() is called below. Set the PHY
> > +	 * to its slowest speed to save power.
> > +	 */
> >  	if (device_may_wakeup(priv->device))
> >  		phylink_speed_down(priv->phylink, false);
> > +
> 
> Is there a corresponding phylink_speed_up() somewhere else? Does that
> need a similar comment?

__stmmac_open() does:

        phylink_start(priv->phylink);
        /* We may have called phylink_speed_down before */
        phylink_speed_up(priv->phylink);

So yes, there is a corresponding call, and it's unconditional, so such
a comment there wouldn't make sense.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

