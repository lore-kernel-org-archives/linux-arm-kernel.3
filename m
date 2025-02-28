Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA946C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tXnve9p7OqPOELNgMc2EsgP+Zfm3xXu92ERqG5r7f4=; b=tLl4He34BYjhAi91aslQsX4xEW
	exvMDbM2hU6S/aR+JurngeJ48Uk9oXInxtoMAKVvc6lzgpkycHCOrejQ5dvKWhYIrSBI2LF+Xxled
	0X2pxu7suY1lGkhuLPXGoZtoA/2IBMpOIz9AWDn/W5bojlaj/J/6jVPU+KgUD2Lygq5zNQPyeKOtL
	5RcQWatR2EdteclASVAm7nYy2Hnv37l26IQrD9x0nwieiKc/6ciV6ByHaDRIEhPwX6kc0fyIj9EFy
	jXfom1+vtjnzjMJBNU/+f767/SLsyFHj0GpDIBPWg3kaG8DHopS0iOwvc4F3C0NH3iZHhZvs3SHps
	In2J+bMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1ll-0000000BLaV-1jvw;
	Fri, 28 Feb 2025 14:55:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1XS-0000000BIFg-01FA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3tXnve9p7OqPOELNgMc2EsgP+Zfm3xXu92ERqG5r7f4=; b=iFtcGjYqiy3IOCZDaithdJHkh4
	CU+JJwQVo5k7U4sa3fUv8ige18h8zr+4GdMraoHFGWeOf4zC+u0c/rC+w6HK0gP49RT7j0ZhNXdYg
	Xo0KXs9QxxcaNvZTTX9c09YPKLWKeegsJ7GPzyGiAHfN+evABjifq7qMKSvG4BvNKB80RdVvgcklS
	XvpK8Y3ZuS4oSi0ailoVgdn2R2bUyWK3YCkr4INHGO+1wYFhQHxMt/f694g/CGw/Et7wAHt15uHPz
	K+TSiPZlvmG36cQbvbMTkzQXYQkABeFoOITqOMqdJnWJP9MQeYJ9o/vzo79Fuz01tErck8kn4uUTE
	ZDLZ2BvQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40904)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1to1VK-00027b-2s;
	Fri, 28 Feb 2025 14:38:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1to1VH-0000oR-2d;
	Fri, 28 Feb 2025 14:38:15 +0000
Date: Fri, 28 Feb 2025 14:38:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 1/5] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <Z8HKV4ytpJJ9NJw8@shell.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
 <20250228153122.00007c75@gmail.com>
 <7706823a-a787-4c7e-a6ac-9a4feaf76dee@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7706823a-a787-4c7e-a6ac-9a4feaf76dee@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_064030_043490_2E76EBAE 
X-CRM114-Status: GOOD (  26.91  )
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

On Fri, Feb 28, 2025 at 02:14:29PM +0100, Andrew Lunn wrote:
> On Fri, Feb 28, 2025 at 03:31:22PM +0800, Furong Xu wrote:
> > On Thu, 27 Feb 2025 15:05:02 +0000
> > "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> > 
> > > Phylink does not permit drivers to mess with the netif carrier, as
> > > this will de-synchronise phylink with the MAC driver. Moreover,
> > > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > > path is also wrong as the link may not be up.
> > > 
> > > Replace the netif_carrier_on(), netif_carrier_off() and
> > > stmmac_mac_set() calls with the appropriate phylink_start() and
> > > phylink_stop() calls, thereby allowing phylink to manage the netif
> > > carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> > > methods.
> > > 
> > > Note that RE should only be set after the DMA is ready to avoid the
> > > receive FIFO between the MAC and DMA blocks overflowing, so
> > > phylink_start() needs to be placed after DMA has been started.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>  
> > XDP programs work like a charm both before and after this patch.
> > 
> > Tested-by: Furong Xu <0x1207@gmail.com>
> 
> Thanks for testing this.
> 
> Could you give a little details of how you actually tested it?
> 
> The issues here is, when is the link set admin up, requiring that
> phylink triggers an autoneg etc.
> 
> For plain old TCP/IP, you at some point use:
> 
> ip link set eth42 up
> 
> which will cause the core to call the drivers open() method, which
> then triggers phylnk.
> 
> The carrier manipulation which this code replaces seems to suggest you
> can load an XDP program while the interface is admin down, and that
> action of loading the program will implicitly set the carrier up.

It won't. See
drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c::stmmac_xdp_set_prog():

        if_running = netif_running(dev);

        need_update = !!priv->xdp_prog != !!prog;

        if (if_running && need_update)
                stmmac_xdp_release(dev);

	...

        if (if_running && need_update)
                stmmac_xdp_open(dev);

stmmac_xdp_open() and stmmac_xdp_release() will only be called if
netif_running() returns true as explained yesterday (but maybe
without enough detail). This tests __LINK_STATE_START in dev->state,
which is set just before calling .ndo_open(), and cleared if it fails
or before calling .ndo_stop().

Thus, netif_running() indicates whether the net core thinks the
device is adminsitratively "up".

Therefore, in the old code, if the programme is changed while the
device is administratively down, netif_running() will return false,
if_running will be false, and neither stmmac_xdp_release() nor
stmmac_xdp_open() will be called.

Hope that addresses your concern.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

