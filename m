Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3144C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0LjCIeuPAwdgtlev8KvuzPXD9fmIY3MFzxNjZLLxnw=; b=xpBYDqjJci/lG/PnxCBCk+501J
	SdyyicnIb3gkSnoefeEsnDD4KMpJX/OrCMDxjMIlEC3wyf97yS27csBbHBSDuKOS5Rj5umMtNeFJW
	43IEtLifF1SQu2PK0OB60u2oVScmyKEu5VK1g1+u/VKwJssSXWTDhPkXyVxyFBbs0O6UrsbSmrPHe
	ZWLT6xCypYskEcMkfw1FyUoukQSRAK6DnbgOiTiQXoGunIfDFgshv1KVGc1s6asSRIEwmLyRaOt0t
	USm0IDWqXYVdGGKDUSRnUzR0tteamfg3ns8ynEwBlFTS1CHPtRw1utH6GMI5HjGH93ys5iooXQroP
	XKmI5zJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgt8T-0000000F0RB-2dAZ;
	Fri, 16 Jan 2026 23:21:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgt8N-0000000F0Qk-1zt6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I0LjCIeuPAwdgtlev8KvuzPXD9fmIY3MFzxNjZLLxnw=; b=uNmvPJQ+P2k4OgB8mxWlVT3Mo7
	iJia5uWsqTxGGMH6sVLoXn6X6YdcXxaXOI/KNMgkKeYT3u/8Xp0gy6N8FyS3n+IJemRDWFKlJzLe/
	MJ6NQV1Gqo5TBeJj9PHn+CEEH/h+9QXcU45Bxtqa93FI7sxn7ciRcGkluzgCrKBHTEDSVpylVZuXZ
	on4ZjHQ6Hyd68MveQuYFl00FLZI5BNxw5EOZIs7v047O4ebunzW4pMaRXR7ZwwfD3hNVDrtiGbz8j
	UDNiOFpIv/d9wlfeKd7caSQDi9UWo4Ky26LnSmVe0w0BGp/PiXmRV5RD/Ni1HOMaY7kReIHEXYyKQ
	XdX7rRzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46954)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgt8F-000000002lN-3lSf;
	Fri, 16 Jan 2026 23:21:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgt8C-0000000040s-17Iu;
	Fri, 16 Jan 2026 23:21:28 +0000
Date: Fri, 16 Jan 2026 23:21:28 +0000
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
Subject: Re: [PATCH net-next] net: stmmac: fix dwmac4 transmit performance
 regression
Message-ID: <aWrH-FAuWnqmbSaJ@shell.armlinux.org.uk>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <ab2d7cc9-e7d9-47fb-95ad-90ae4f5f1f67@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2d7cc9-e7d9-47fb-95ad-90ae4f5f1f67@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_152139_520752_CBCAD2BF 
X-CRM114-Status: GOOD (  24.90  )
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

On Fri, Jan 16, 2026 at 08:42:19AM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 16/01/2026 01:49, Russell King (Oracle) wrote:
> > dwmac4's transmit performance dropped by a factor of four due to an
> > incorrect assumption about which definitions are for what. This
> > highlights the need for sane register macros.
> > 
> > Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> > definitions") changed the way the txpbl value is merged into the
> > register:
> > 
> >         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> > -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
> > +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> > 
> > With the following in the header file:
> > 
> >  #define DMA_BUS_MODE_PBL               BIT(16)
> > -#define DMA_BUS_MODE_PBL_SHIFT         16
> > 
> > The assumption here was that DMA_BUS_MODE_PBL was the mask for
> > DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
> > 
> > The field is actually six bits wide, buts 21:16, and is called
> > TXPBL.
> > 
> > What's even more confusing is, there turns out to be a PBLX8
> > single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
> > and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
> > et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
> > which is for register 0x1004.
> > 
> > Fix this up by adding an appropriately named field definition under
> > the DMA_CHAN_TX_CONTROL() register address definition.
> > 
> > Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
> > renaming it as well.
> > 
> > Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
> > renaming it.
> > 
> > This removes confusion over the PBL fields.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Good job finding the problem ! However you need a Fixes tag, even though
> ths is is for net-next.

I really give up with when fixes should be added or not, because it
seems quite random when it's needed and when it isn't.

And no, don't quote the stable-kernel-rules nonsense that is
meaningless ot stable kernel people, when they use AI to analyse
commits and pick stuff completely randomly.

> It would also have been nice to be in CC, I spent some time on the bisect...

I thought you were, but I see now it was a different Maxime!

> Besides that, problem solved on an imx8mp setup :)
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

