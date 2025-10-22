Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt5HidSb6xkRGWxoBaNt52wPsH3u1Zf7gYVwAQOjbyE=; b=0zZjtLYa+vGcwaweJV/ATou7RB
	NXFX322qsFNbNJti+E8/TWcUDHrWIYLgKmKFLAwqv18tL2GOrpRwOXGXY3PzldZurUw7yp5G5dTHG
	kSWLUW4J0NHt1r/nTOowCnB3mAjIqXzJ1zsC3SEZl+clrjV+wkBv0Y/tZX0Xz6HN/lH7fHAjCI0sq
	4Y19GW996VPCYs03pSvud+ZPXXp8nt3dVDndfgE+UQDCftHsAHDP/P7UQTCpF//QwFYIATTDV+JcC
	oYBRnrHLE/Zwd9pXtGHP/6ljSJ9LsUsRZgHWHW4A5nEaEQNN95C6XE8Kpzu55zkyduD7rGHh1PYqK
	2+08Pk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdUj-00000003yYl-3IWh;
	Wed, 22 Oct 2025 18:23:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdUh-00000003yYC-1V5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kt5HidSb6xkRGWxoBaNt52wPsH3u1Zf7gYVwAQOjbyE=; b=KRV2gabIuAHKCA2bR3TFyg37Ot
	8grILVv1y2mAuzQh8SM6YPUPC6DVTocs8MCRSgLTJTs+luotqmjScfW0CB6UwsnCpZL72KRjpgoFJ
	28sAaCiJ+UjCEel7jcqgd2okiqhaIw36zpO+CtaP4ajUm72ADnAV58C4lbUM4i4kmmDN9okFLtvoH
	IXHu6WJBu70qAWnRCa8AvANYNesWBbgtSyOxAgpPc36uCl6z6iw0b9NTt8zdba21Q0scwDPDDkBVR
	5VviXoafsaPQ2ifn2UwD0JyCO8oHRWh+fRHKvLO0PPIA4EMbOH/5ZBmsGoZBjoPOVzT8tEMfTGtVA
	AcDDVXEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55460)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBdUc-000000005JH-1XpL;
	Wed, 22 Oct 2025 19:23:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBdUa-000000000vO-2zLy;
	Wed, 22 Oct 2025 19:23:24 +0100
Date: Wed, 22 Oct 2025 19:23:24 +0100
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
Subject: Re: [PATCH net-next 3/6] net: phylink: add phylink managed MAC
 Wake-on-Lan support
Message-ID: <aPkhHIMJAYNEj_6Z@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
 <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_112331_415100_9FEB1628 
X-CRM114-Status: GOOD (  14.30  )
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

On Wed, Oct 22, 2025 at 04:06:00PM +0200, Maxime Chevallier wrote:
> >  int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
> >  {
> > +	struct ethtool_wolinfo w;

...

> > +			phy_ethtool_get_wol(pl->phydev, &w);
> > +
> > +			/* Any Wake-on-Lan modes which the PHY is handling
> > +			 * should not be passed on to the MAC.
> > +			 */
> > +			wolopts &= ~w.wolopts;
> 
> When PHY drivers gets converted to the new model, we'll have to look at
> how the .get_wol() behave WRT how they fill-in their wolopts.
> 
> The Broadcom driver for example may not set w.wolopts to 0 :
> 
>   https://elixir.bootlin.com/linux/v6.17.4/source/drivers/net/phy/broadcom.c#L1121
> 
> You'd probably end-up with garbage here then. But not blocking for your series.

Good point. We should initialise 'w' in the same way other users do, so:

+       struct ethtool_wolinfo w = { .cmd = ETHTOOL_GWOL };

Does your r-b still stand with this change?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

