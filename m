Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A7AF531CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=febWsFLvFO+nAC4i5QRuslLmXizl8UntFXY3PRXCccU=; b=sqTlEpyowzj2OCYOxPH49Vadfm
	4J2qqq+BNS4x/qBXFj2G4LudGB+NSRIyY/s9KJ104IbJsJM5kMHu/nHYoN2WADgyzTnh1dMESvPGx
	0j61LCOy9sA2LpRXpxDVDYKdjVvHqm2zxkLYVAcm2htPZ2wB73HzvglhQIuIC5wMD4NrQxGgMkyR/
	r51uY+Jaoayg2DBuIMWIJOkLrFXMf8Ny7Av4ik18a+uJy1jjwkuh/1BWGcY+rLpEMikob4YfuBm7K
	inHmpgdX0n3GDI8FNCz/hn2wCz9R2QLIL6zDzi5zTSjACLgA5RysPmkVj/a/egQ2jhhmdhn1hDDLa
	KhsoqpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOHo-0000000GNDd-0H89;
	Mon, 13 Apr 2026 20:53:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOHl-0000000GNCq-0Gg3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 20:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=febWsFLvFO+nAC4i5QRuslLmXizl8UntFXY3PRXCccU=; b=vLWsNw4yrSnVL1MyPNtoLBeJFR
	dNR1laIW1YaEn2WBnyNmf050CEl866x6FEXs64r4omokFKkPqFSLhS9XApeQqB+CXZSCs4QMbVOyv
	6YDi5enkOTlVv4lXcbKJlJv3DaVER7PRFLmXYwm/LDi/APsSJESZPwiwNEHo45HKMVwqjFuFTaoWw
	oN6ujWepqt3v+uu+iWXv9BdWI6SdCqdnRx8oSll0jQC9XYbjIY8QQLnik+1jh0+PLJdzQWCHafwV/
	x6YRZ1oiQiNIx9YPyrQ5k8bCpUvzgnE15mXP/mGL5+WvmrvMJxGzXGlCIkuLpylrIFB0XlDVyXoT4
	kJmu9mFg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47442)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCOHe-000000000Hi-3rdM;
	Mon, 13 Apr 2026 21:53:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCOHc-000000000XQ-0jdz;
	Mon, 13 Apr 2026 21:53:24 +0100
Date: Mon, 13 Apr 2026 21:53:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <ad1XwxZ5WxbG1IL0@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org>
 <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <20260413135018.59fbd3a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413135018.59fbd3a1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_135333_105726_27F64387 
X-CRM114-Status: GOOD (  22.74  )
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

On Mon, Apr 13, 2026 at 01:50:18PM -0700, Jakub Kicinski wrote:
> On Mon, 13 Apr 2026 19:49:46 +0100 Russell King (Oracle) wrote:
> > > Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> > > dies?) is not a good idea.  
> > 
> > Well, I'm thinking that at least on some platforms, such as the Jetson
> > Xavier NX, unless a different solution can be found, we need the RBU
> > interrupt to fire off a reset of the stmmac IP when this happens to
> > reduce the PAUSE frame flood on the network.
> > 
> > If we can't do that, then I think stmmac on these platforms needs to be
> > marked with CONFIG_BROKEN because right now there doesn't seem to be any
> > other viable solution.
> > 
> > My intention with this patch is merely to start collecting the already
> > existing statistics so other users can start seeing whether they are
> > hitting the same or similar problem. If we're not prepared to do that,
> > then we should delete the useless statistics from ethtool -S, but I
> > suspect they're now part of the UAPI, even though without this patch
> > they will remain stedfastly stuck at zero.
> 
> Understood, thanks for the extra context. And the statistic we are
> talking about is rx_buf_unav_irq ?

Yes, correct.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

