Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF5E937E4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bZQaaA9y+PfxKdKkmD3Tt08LTFDotVPzB4Utjfybes=; b=L4anIXCO0NAEG4YTjm3lU8Y0U4
	2P8hznz4iFeaOGX06/8O4aTgzLrD5JCaHToP6ZtAu8cK/GQ4LKYzSNk6Z8Mbm3phr0301FOstRhu+
	DcsnO5xXNQM9xId0XdrDZJqX2lbpY8VP6Tmfh/xvq6M/Ug97pDJatMgViFjJkI03Gztlg9pOKxjJC
	EkckI9sOF2vcWQ31LvYA87HbEyYn6GaUPDzSx7rbpHygYCf0TusDw5wFvAREJlCBaxK6SX/XXy2/e
	gfTy0WpinnotrLPgmdRiow7BVu7bdbYXr28fjSJJFvzu9sDCnyurEDuGgs6493Nk18FsTKnXXwVvn
	sSppDKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvjF-0000000ENgv-3Zb4;
	Sun, 12 Apr 2026 14:24:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvj8-0000000ENcp-0YDc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/bZQaaA9y+PfxKdKkmD3Tt08LTFDotVPzB4Utjfybes=; b=1uwnsKge/Xsow/UXYATYTv5+JC
	4eEi/y/HAERoQHiG6FCixsZYLHu2e5FE/sVGKVh4pfwa5iy3BrAj5hDU78KtkIL9ljgZM07lFbJj5
	OIxZ8+d52hzEcdEewFgX0MMWvarxyXDkld3wN9mJH52UTJjlbZpyPpY6LPbW0EtX+Q2xVLymxdJUk
	+FGc0wedZufgbPy0v9yirPNdM9w9b8soAgiRLxsoyGqVOpVsGc0JcQepZqG+yyYWbWGP+39qy7KDV
	hcehgKYkkmtlnEAgAL1I9QV5+GCVTW9KZqg0xJL8v2dzC70n5zQozupnsRKg86PTlb08T94nskf+9
	TI26aymQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBviy-000000007GH-0wVq;
	Sun, 12 Apr 2026 15:23:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBviu-000000007iS-2XGL;
	Sun, 12 Apr 2026 15:23:40 +0100
Date: Sun, 12 Apr 2026 15:23:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_072354_169429_9DE13589 
X-CRM114-Status: GOOD (  21.20  )
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

On Sun, Apr 12, 2026 at 04:01:59PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 10/04/2026 15:07, Russell King (Oracle) wrote:
> > Enable receive process stopped and receive buffer unavailable
> > interrupts, so that the statistic counters can be updated.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > Since we are seeing receive buffer exhaustion on several platforms,
> > let's enable the interrupts so the statistics we publish via ethtool -S
> > actually work to aid diagnosis. I've been in two minds about whether
> > to send this patch, but given the problems with stmmac at the moment,
> > I think it should be merged.
> 
> Looks like my reply to your original RFC was lost in limbo as the review/test tags are missing.

Thanks. Unfortunately, I can't run iperf3 against stmmac on the Jetson
NX because stmmac just totally screws itself (at the first RBU, the
receive side irrevocably collapses.)

Against i.MX6 (which is limited to around 480Mbps,) it's recoverable by
taking the interface down and back up a couple of times.

Against x86 (which will saturate the link) its pretty much
irrecoverable without entire system reboot - if one tries the down+up,
we then get arm-smmu errors because it seems that, despite stmmac being
reset, it still attempts to access a previous receive buffer from
before the down/up sometime after the up. Moreover, transmit stops
working - packets get queued but they are never processed by the
hardware. This is a scenario that I can only rarely test myself (as
it depends on my physical location.)

As the dwmac 5.0 core receive path seems to lock up after the first
RBU, I never see more than one of those at a time.

Right now, I consider this pretty much unsolvable - I've spent quite
some time looking at it and trying various approaches, nothing seems
to fix it. However, adding dma_rmb() in the descriptor cleanup/refill
paths does seem to improve the situation a little with the 480Mbps
case, because I think it means that we're reading the descriptors in
a more timely manner after the hardware has updated them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

