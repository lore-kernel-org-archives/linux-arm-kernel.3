Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0014CD65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCJamRcv160IaLBk591jHJ5/fIg4GfMqcqO3NZ/cgPo=; b=k84gwyC1eDiOG67WJa5OQ31EmT
	e9cNoRRux9AZxScUPz3yS2ALgtD+MXGFzl68+NGlaOLNw7EzPeqmCDKP34rYbxCM7D9mD+3I2Q3p8
	E3t6CVK347/P5IwqRXCpVM/86MA5DRKMqvtPgFvSeRi5C1WE1hmWNM7cFZ0U3h0eX5Vluuc59Y086
	9Mzd+a2tDJQOaZwiyVEw6yDfxakXL4iyAK0xDUxB6LgYCj7gP5PvSQ32j4NLNltlkVafB1ZPQK8pi
	YbMgcScqjimm03/c71Yeh6AP356NIcCZkyaY9MKbre8/AbnjP0XUt6z78EbwmGFpWu0gCzlPyXQPl
	XhIx/YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBx5I-00000002wyE-0nvA;
	Fri, 15 Nov 2024 14:14:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBx4N-00000002wnx-1joS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kCJamRcv160IaLBk591jHJ5/fIg4GfMqcqO3NZ/cgPo=; b=FgChEBy7f0xHqUezBIeOC59p8L
	ZIl1QDD3C+5HuUow1dNSNJBICuq78SuDCZidjKnpgYbz8kTvrQ7BDv2gYrDf0ktiu7yXzVHyHSc55
	58DVQAbV7yLJ1fpaTsghTN3jaGpHaX5Nvycf8LC8uIQNtLGSzTP4Br5xO63HQnQg9EodOdiswdHae
	f0Not3t/g8D22gAMIno8lPfFIAsDMjdfZTdeGJ3mQgBlfnnkfQtG5Sk/ahvHrUh5KaX0yuenCVC1e
	BhKEX/Gb/ggnrH/pzQJ53h0MT4qu4Kx46tv/SWxVHuxlLgax/+P6gra19Hbu/fA2wsn6QAvUKByJm
	NM4ZvpPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54080)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBx45-0001So-23;
	Fri, 15 Nov 2024 14:12:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBx3z-0002Bd-09;
	Fri, 15 Nov 2024 14:12:43 +0000
Date: Fri, 15 Nov 2024 14:12:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
Message-ID: <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_061307_453470_34CAFEA3 
X-CRM114-Status: GOOD (  20.26  )
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

On Fri, Nov 15, 2024 at 02:41:54PM +0100, Heiner Kallweit wrote:
> On 15.11.2024 12:11, Choong Yong Liang wrote:
> > From: Choong Yong Liang <yong.liang.choong@intel.com>
> > 
> > When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
> > the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
> > the driver side is disabled. If we try to enable EEE through
> > 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
> > matches the setting required to enable EEE in ethnl_set_eee().
> > 
> > This patch series will remove phydev->eee_enabled and replace it with
> > eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
> > will follow the master configuration to have software and hardware in sync,
> > allowing 'ethtool --show-eee' to display the correct value during the
> > initial stage.
> > 
> > v2 changes:
> >  - Implement the prototype suggested by Russell
> >  - Check EEE before calling phy_support_eee()
> > 
> > Thanks to Russell for the proposed prototype in [1].
> > 
> > Reference:
> > [1] https://patchwork.kernel.org/comment/26121323/
> > 
> > Choong Yong Liang (2):
> >   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
> >   net: stmmac: set initial EEE policy configuration
> > 
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
> >  drivers/net/phy/phy-c45.c                         | 11 +++++------
> >  drivers/net/phy/phy_device.c                      |  6 +++---
> >  include/linux/phy.h                               |  5 ++---
> >  4 files changed, 13 insertions(+), 12 deletions(-)
> > 
> 
> Russell submitted the proposed patch already:
> https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
> So there's no need for your patch 1.

Patch 1 is an updated version of that patch, minus my authorship and of
course no sign-off. I've already marked this series as requiring changes
in patchwork (hopefully, if I did it correctly.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

