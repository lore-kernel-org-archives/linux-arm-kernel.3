Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CABC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S42DDkPynBO+hlx/lydV1Jlo7tr53yug/v0X8twoOEg=; b=nDJmxVlM/CqevEo91zWpNHb6Ze
	ZqO3hXHEPky6dTifJCKgGqam30EX/PMe5+NTnaP4bEKFLdhKFoAxgad+tZrJ+zTfaltytHCZEWQAE
	uoMPltwaRTLJ2tSAigT5+DbXN6nxtq2bxHxtJEHZd8Q8mOp+rOsdvKOcN3msCJeXa9FKnljyrTwef
	iS7Y6TmmS/k9xwzGQn3V7/MRsO1jlEsYUouiJRWv5SbwPfgHIxayRrdfhDa6Q7CTRwUbtJnmsCdI6
	LoXNxjOAlLEIxpHKbd1REL9bsWITROzBTy2zzZ5wjxhWZ4FUfPkVHrh3ftydEVEJWgmZkhhscXhmX
	BGpq8HQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5cd-0000000CKGM-0JC9;
	Wed, 15 Jan 2025 15:47:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5bM-0000000CKA1-0GRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S42DDkPynBO+hlx/lydV1Jlo7tr53yug/v0X8twoOEg=; b=l8/w4QtnpRqEdettHBVyIuwDZc
	FQUDLsKUwDsfX0FU+R6R6zH+4kJxJiXIusCizXwSzL9CDrdmB1o9Z80eWzDXY3N66R9sX1BOGThV5
	sX1gWOwdxP/KtnYUtwHXW2nOh8mSgg0XoQWKHuQbEz6+sPBhg1Iw6bECzNYzayfHXc3/erhqLcMBX
	iqnwITC6lTI+h+iZaiWVzf6cKHmOuZSHK537q+kFKlXc/fGWNpgwZM+1EN5oURRfVsdRn6gKBHK5z
	lDFgQPB1PaDAZE9XwDJqu4ddD5hWi63LZ4/DkYq/Xbc6zn1UrxhsJtIgnb9EZFFPB/rKul1Wl/aK3
	lIcmiF4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56716)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tY5b9-0001MY-2b;
	Wed, 15 Jan 2025 15:46:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tY5b6-0006H7-2H;
	Wed, 15 Jan 2025 15:46:24 +0000
Date: Wed, 15 Jan 2025 15:46:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH RFC net-next 06/10] net: mvpp2: add EEE implementation
Message-ID: <Z4fYUAxIG6k0Uuka@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhUz-000n0k-IY@rmk-PC.armlinux.org.uk>
 <20250115155354.0acdacc7@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115155354.0acdacc7@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_074640_103863_672EAF53 
X-CRM114-Status: GOOD (  21.01  )
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

On Wed, Jan 15, 2025 at 03:53:54PM +0100, Maxime Chevallier wrote:
> Hello Russell,
> 
> On Tue, 14 Jan 2025 14:02:29 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Add EEE support for mvpp2, using phylink's EEE implementation, which
> > means we just need to implement the two methods for LPI control, and
> > with the initial configuration. Only SGMII mode is supported, so only
> > 100M and 1G speeds.
> > 
> > Disabling LPI requires clearing a single bit. Enabling LPI needs a full
> > configuration of several values, as the timer values are dependent on
> > the MAC operating speed.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > --
> > v3: split LPI timer limit and validation into separate patches
> > ---
> >  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  5 ++
> >  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++++++++++++++++
> >  2 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > index 9e02e4367bec..364d038da7ea 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > @@ -481,6 +481,11 @@
> >  #define MVPP22_GMAC_INT_SUM_MASK		0xa4
> >  #define     MVPP22_GMAC_INT_SUM_MASK_LINK_STAT	BIT(1)
> >  #define	    MVPP22_GMAC_INT_SUM_MASK_PTP	BIT(2)
> > +#define MVPP2_GMAC_LPI_CTRL0			0xc0
> > +#define     MVPP2_GMAC_LPI_CTRL0_TS_MASK	GENMASK(8, 8)
> 
> I think this should be GENMASK(15, 8) :)

Bah.

Thanks for spotting... and people say GENMASK() is better than using
hex. I've disagreed with that, but tried to conform, but I keep making
mistakes with GENMASK(), but never have with hex notation. Maybe I'm
just different from most people, having been programming computers in
assembly since the 1980s, where the choices were decimal or hex!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

