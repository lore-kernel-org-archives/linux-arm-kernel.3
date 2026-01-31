Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC77AE7C6FB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 23:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIes9y28tS53Qgsq8mlA/hmeh5zQSe+vuQTcGCaQLH4=; b=Aoa99onqij24Wrqr3qkPTBde+G
	CoMm3XooU8vIWSQwjkUL50bSsl1wQuWZJbD94urxPl6ZAJvac1+7BbTMLLyRAF6gB8G5zL7gBsEfT
	/9wpMnci06Omfdrz+JqEB4oCipC8ASmkjIgMmatMLEOrYKGZ2dAzPHAlJpJc0WbDsw64r0OWy7XzV
	AjRWVBy9QMDv3nqMFeEBwuUJsu/zlxNDPhSB5w3Yz/CIS2Gn8rSeWYmZEQUE/I5r0fXsixL/aEg4e
	un3TufKBQnqDZkT26oBLoidfSkBZlCbPxSr6o+Sz9NW/GQMWdipWS3TgynB65MEh6ptZd1ID3MXMv
	Zf/YolPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmKNz-000000035dN-27QG;
	Sat, 31 Jan 2026 23:28:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmKNv-000000035cr-3lMJ;
	Sat, 31 Jan 2026 23:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kIes9y28tS53Qgsq8mlA/hmeh5zQSe+vuQTcGCaQLH4=; b=SnP/VPBuH22KxGVfdB2UJKAixc
	XVM2hHoezwF+JSBRIjcXee6VRY+f2A2Dt8SxHuoKhtphXFXjaLuHEqKGOmAlW/LGPuas7yAWsp0Jv
	+q112L2P5WjDSye8Mkp2L6t+G6inKJkalVVwZ74B6RKQkUb5AvfLngK0Ml7yFtERFVPgNhxWIKQdy
	Bn6PBryzaRjkQ+NZDn0lTUQTo/xfRl5SUmchU/R2jQqCdkRGsuOCXhSNKhJu432u4NrePBebZNL2k
	qd8fHOJ6Bl025nTCABmPilcoTvfFB1h3eR/tOP1xHq14+tUNIiMBeNtu2p9w4c7cQpMxrL4yMMsel
	rfFTFUlQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55010)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vmKNe-000000002aH-2I5S;
	Sat, 31 Jan 2026 23:27:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vmKNY-000000001sG-1Jn3;
	Sat, 31 Jan 2026 23:27:48 +0000
Date: Sat, 31 Jan 2026 23:27:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: rk: convert to mask-based
 interface mode configuration
Message-ID: <aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
 <E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
 <20260131140850.3c35f95a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131140850.3c35f95a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_152812_224337_7A7644B7 
X-CRM114-Status: GOOD (  12.09  )
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

On Sat, Jan 31, 2026 at 02:08:50PM -0800, Jakub Kicinski wrote:
> On Fri, 30 Jan 2026 11:00:14 +0000 Russell King (Oracle) wrote:
> > +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	intf = ret;
> > +
> >  	ret = gmac_clk_enable(bsp_priv, true);
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> > +	    bsp_priv->gmac_rmii_mode_mask) {
> > +		/* If defined, encode the phy_intf_sel value */
> > +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> > +
> > +		/* If defined, encode the RMII mode mask setting. */
> > +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> > +				      bsp_priv->gmac_rmii_mode_mask);
> > +
> > +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> > +		if (ret < 0)
> 
> missing
> 	gmac_clk_enable(bsp_priv, false);
> here?

Opinions vary on whether errors from regmap_write() should be handled.
See the recent thread:

https://lore.kernel.org/r/aXh9lcfw6D6KouI_@stanley.mountain

Seems that if regmap_write() fails, it's "buy a new computer" realms.
If that's case, is it worth cleaning up resources, or even checking the
return code from regmap_write() ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

