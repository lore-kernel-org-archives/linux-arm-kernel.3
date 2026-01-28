Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9972AD25B4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISotn7edf+IUTj82nvFY2R7E+1j0WbBkqwZTBvRb3ws=; b=ceEU1IV2kU/t9OnWKfyP5fL7yP
	hVrw2o30KwDQ7z1dYZYGa8dsIbGXpYkrrDoBx17LIxkff4DC4+typAmTWaJeH1SJrFYPqWr2Okfvg
	BCsJBIEakUjjjVLEy4AoYUcEhO9aKHedOG/4waQ0nclqHdO00aLWG8fJXqlbNxq0ndFYrPODPqxzn
	CaSj4dJDBXbrIhiD+Pa93LLygnQFj6wX3V3yLfcnQOuKi2FHFeEm8Gw6LdD4K8K1MzcKsexJaDdQe
	GyIItTryzxl7Diag6KIQ4C3cSlnFWLlQKoB/OodEOOVprfu9ub8PYp7Vl6BPuyXsr3K0ZoGSNvwru
	MA1oqsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Wp-0000000FzIE-1WOD;
	Wed, 28 Jan 2026 12:20:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Wn-0000000FzHc-0A0e;
	Wed, 28 Jan 2026 12:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ISotn7edf+IUTj82nvFY2R7E+1j0WbBkqwZTBvRb3ws=; b=Qzi+YIXHL/nhOP7tltKeGwXgJm
	TDhTlh2TPDZxXVdv5t87t7vOJ8E4/MaWXYHiS3vl0HG23k3aakBDz6HFBXxIvKGrR4WDE1jFgF5e5
	t09PWIRt76FZjpVYVe+bi6M32aA+UjIgGmzOO4wbHYUHTB1dcSgRkEdDjgGamVIVfGfxN973Z4BIZ
	00yUAVQ48RWmURUaDLH8Wjkcu+8ZStYGULzBdOn8+AlwytvuLrmPYgTs6ywykk+O2ZFVpXoUEvGyN
	1HWJpcMJxB8wD/nUk5PFF9scmXJwRH3P2Y7Cu3DkQZfsLvXIXci9UP6mTJwFfKwdInatD5diUFl4P
	knpPGadA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55194)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vl4We-000000007Lo-18uM;
	Wed, 28 Jan 2026 12:20:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vl4Wa-000000006xo-3rF9;
	Wed, 28 Jan 2026 12:19:56 +0000
Date: Wed, 28 Jan 2026 12:19:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: rk: fix missing
 reset_control_put()
Message-ID: <aXn-7LWRk5cZjno8@shell.armlinux.org.uk>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
 <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
 <c8a10b5355b750cfc83a7f746347175ab40b64d7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a10b5355b750cfc83a7f746347175ab40b64d7.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_042009_075961_5F159658 
X-CRM114-Status: GOOD (  25.36  )
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

On Wed, Jan 28, 2026 at 01:04:21PM +0100, Philipp Zabel wrote:
> On Mi, 2026-01-28 at 10:58 +0000, Russell King (Oracle) wrote:
> > rk_gmac_setup() delves into the PHY's DT node to retrieve its reset
> > control using of_reset_control_get(). However, it never releases it
> > when the driver is removed. Add reset_control_put() to rk_gmac_exit()
> > to clean this up.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 5f8d2031b97c..bc69cbb5a7d4 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -1784,6 +1784,8 @@ static void rk_gmac_exit(struct device *dev, void *bsp_priv_)
> >  
> >  	if (priv->plat->phy_node && bsp_priv->integrated_phy)
> >  		clk_put(bsp_priv->clk_phy);
> > +
> > +	reset_control_put(bsp_priv->phy_reset);
> >  }
> >  
> >  static int rk_gmac_probe(struct platform_device *pdev)
> 
> This is fine because the driver sets plat_dat->suspend, and so
> rk_gmac_exit() is never called via stmmac_pltfr_exit() during suspend.
> 
> It does look a bit sketchy to release resources in the rk_gmac_exit()
> counterpart to rk_gmac_init(), which never requested the resources,
> though. Maybe use devm_add_action_or_reset() to register the release of
> the reset during remove?

Thanks, but I think a sense of proportion is required here. This
patch is the result of introducing the ->init() method, and AI
noticing that there was no cleanup of this resource. This was the
simplest way to implement that cleanup.

However, your review commit also applies to bsp_priv->clk_phy which
has the same problem - this also isn't obtained in rk_gmac_init(),
but in rk_gmac_clk_init().

Given that, and the fact that this entire series is already
considerably big (it was 21 patches, then 22, now 23, and with this
it's going to become 24 patches) I'm going to say that this issue
can be addressed at a later time.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

