Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE572E6BF2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJGHCJHC/C1S/dc48iAgg6S72Ja9f72htrzVxmHBznY=; b=xjzRAv1SaDJjcQ4Hg5HBsRgbqg
	+LZY6fxfOGPDycx1sMfOC4LGRfh6aJN/9ECRgfqsaUT6B8N5TMEmiBeMAZd/S7E3GKCb5tcgOX47p
	+hIbexsGFQqaO7z4uvUEcQv+dl7IdOSkAub12QDuBDgu6hVIFL7aaPCFUKHjbSxisXibEUqjPdixq
	5H85M6x+p2z+vi4xVjo9ksGGV0NGjGB49q13Psu6rlFx7bRtC2spiKgLgcICikI6u5qwqj/zGWiWe
	f3wsY1WdPiWpt/D0GJcBGk7mCCYJfZS8akGYBWAyGdH6jRAeDh9cn8Am1r50oGs1OhZsk+2EQnGMQ
	RIfdAUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsvr-00000001oKl-1qRw;
	Fri, 30 Jan 2026 18:09:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsvo-00000001oJu-2ago
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 18:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NJGHCJHC/C1S/dc48iAgg6S72Ja9f72htrzVxmHBznY=; b=y8g5IMvGwzIvn9WkzEVPh4AHot
	IhhlsFV8sIPDLGDtax1wUOk9cjSIdE3slCsK0mabLqDgtmwGIDcfBwEi0E/4UX/Wl7s24kMfe8Tu8
	bBA6ZgW1hDAYrFBJgDCUuzEnNC3CeL/cDDlgYJB1UNz9gvduqe34eGAgsaSzMh+7xC3RcurkARW78
	V8fuuT8N+sUlCYCX82GH0yKvOzWgh5dVUK8XwQBH3W3F2qOGg/GL0fQPkF+AUJCqK9G+Gn24ZuTjc
	k1azLxitSHg3NYX4yx9lGo1ieKhr+UPiKMCEHk3v7xTN7VHl5/YV97PgUcQH6S4K+XUAQJwSsF/xI
	UyDV2bGA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46880)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlsvh-000000001Km-0cQA;
	Fri, 30 Jan 2026 18:09:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlsvd-000000000it-3G8k;
	Fri, 30 Jan 2026 18:09:09 +0000
Date: Fri, 30 Jan 2026 18:09:09 +0000
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
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: clear half-duplex caps where
 unsupported
Message-ID: <aXzzxeRsbnF8-nAq@shell.armlinux.org.uk>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
 <E1vlmOQ-00000006zuz-0ffN@rmk-PC.armlinux.org.uk>
 <9dfdeee0-7758-439b-a2a5-a7f243427cf4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dfdeee0-7758-439b-a2a5-a7f243427cf4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_100920_652498_04AE3FE1 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, Jan 30, 2026 at 06:29:23PM +0100, Maxime Chevallier wrote:
> Hi,
> 
> On 30/01/2026 12:10, Russell King (Oracle) wrote:
> > Where a core supports hardware features, but does not indicate support
> > for half-duplex, clear phylink's half-duplex 1G, 100M and 10M
> > capability bits to disallow half-duplex operation and advertisement of
> > these link modes.
> > 
> > This will avoid the need for special code in the PCS driver to do this
> > based on the ESTATUS register bits, as the support in the PCS is
> > dependent on the same synthesis choice as the MAC core.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Gave it a quick test on socfpga, as this impacts all variants,
> and we seem to be good so,
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

If you look at /sys/kernel/debug/stmmaceth/ethX/dma_cap, it should
say whether half duplex is supported (I guess in your case it will
be, it's probably very unlikely not to be.) However, would be worth
knowing whether the if() is taken or not!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

