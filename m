Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D06C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2WJT/kxEOUhaPow0205LOsDK8JhmSJ5YD08xubhx7Q=; b=mQptiQSUN236hrRfF4GV96XlUA
	/fzdWs9ppIXRGLB8JKKWyOBw/30bwdzBgnGn4YjCHXLKSWv2WHCDwogswp5XwrLQ36ZY8bumUkLkE
	bBaq1XYpLSW9qgGaFOpD7XcIOfBWXUXd8ycEIekEuQnbq7qXhmQP9dgJ2pIV5E5sZjwUQwbG2hZKT
	84+LRBra0FXYx49tgyxTEcu9RX7sMnuJGfa3/uazfcy0hFt5dcb9RiE4m3X6F2J4V4gbgccko+eQY
	WCQC1FdgydzykIcNlabjrArQFN557D2RwxKCTAJHeVVB+71Oh7pxq/7dghH6+oKN58iYlpIeMsZ8g
	wwx9xzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiv-0000000FIFy-2Oso;
	Mon, 28 Jul 2025 19:41:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS3R-0000000F97k-3iA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q2WJT/kxEOUhaPow0205LOsDK8JhmSJ5YD08xubhx7Q=; b=w/2kJuuqSsJEI0KehdTGiYkqcR
	dM2viPfSYwnUIBjCFJL7q4So1z0YVONyoC9eN9w1Hs1bIB/IeAHfb9lKJvR1bJ+QY/m3IXSCbfFkb
	DjPc2wG4L8i+e7biWmDrX5DUOFsFW3zBZcRwzHXi0xLsw1yPpjkmULobR0cq7cs9aX6CEWfITR/bT
	cUFc/RTcp1nl9sv4YkMfdd6jULWuM/QAAFBXQf5QSZcVFGD0U84+4XYjmiH29LHtWRwDjY/yxMxJy
	+2bGps5EpLl6Yc9vFkkLrxEMzuhI/0EV0WiFqsCHu33ocZoL6GG7zoYwqUbJVZqhr25a/pArX8sc7
	6XSkxvxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55998)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ugS3K-0000h8-0k;
	Mon, 28 Jul 2025 18:54:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ugS3G-0004wY-1k;
	Mon, 28 Jul 2025 18:54:18 +0100
Date: Mon, 28 Jul 2025 18:54:18 +0100
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
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: add helpers to indicate
 WoL enable status
Message-ID: <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105429_924443_4E403808 
X-CRM114-Status: GOOD (  19.49  )
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

On Mon, Jul 28, 2025 at 07:28:01PM +0200, Andrew Lunn wrote:
> > +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
> > +{
> > +	return priv->plat->pmt && device_may_wakeup(priv->device);
> > +}
> > +
> > +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
> > +{
> > +	return !priv->plat->pmt && device_may_wakeup(priv->device);
> > +}
> 
> I agree this is a direct translation into a helper.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> I'm guessing at some point you want to change these two
> helpers. e.g. at some point, you want to try getting the PHY to do the
> WoL, independent of !priv->plat->pmt? 
> 
> > -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> > +	if (stmmac_wol_enabled_phy(priv))
> >  		phylink_speed_down(priv->phylink, false);
> 
> This might be related to the next patch. But why only do speed down
> when PHY is doing WoL? If the MAC is doing WoL, you could also do a
> speed_down.

No idea, but that's what the code currently does, and, as ever with
a cleanup series, I try to avoid functional changes in cleanup series.

Also, bear in mind that I can't test any of this.

We haven't yet been successful in getting WoL working in mainline. It
_seems_ that the Jetson Xaiver NX platform should be using PHY mode,
but the Realtek PHY driver is definitely broken for WoL. Even with
that hacked, and along with other fixes that I've been given, I still
can't get the SoC to wake up via WoL. In fact, the changes to change
DT to specify the PHY interrupt as being routed through the PM
controller results in normal PHY link up/down interrupts no longer
working.

I'd like someone else to test functional changes!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

