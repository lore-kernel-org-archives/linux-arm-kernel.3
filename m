Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87300C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62BhX69mt+FQ1/nAowHZZeanKaiAAITWTNXpapK76TM=; b=Sr+PgIcGlHAuthc6zIOWDAT0dl
	tfa+s/p3nMVFAW4/FRYyc+k/keJIN9PQtqQQsGlCOl1OK9pGb3JqmVOXIf98FyCGTrXYm4eUjQYYE
	yB7a6Iw2evCj049ioKnzKhE9ubn6rlq4latS9BjrIC7ydPsY45ZdNBgdZC+rNa5UBzzuvZF6nZI92
	7WyJuMCp8hrjRh5wL4NsdwR4P83zE9PfXajIgegXDI/Mw+L/ifbUKS5p1pvRfnGJIjAt1o0kCNE9E
	pMEdBNwwWmmmYVmp5Svl7eSvs+pMlRaEA4qcZoea9oeLUqFEGBTTHYD3yNDwG97CZjUJPdWJvlbLl
	opJGWkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZqq-0000000FRp4-1ear;
	Thu, 29 May 2025 09:47:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZkx-0000000FQyJ-2iCi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=62BhX69mt+FQ1/nAowHZZeanKaiAAITWTNXpapK76TM=; b=QZQy4S+jSFdT1G4qH1jtTKXTOD
	lR8nYl95sgn39OWK5pGfqFmkCqc0xzJGoFWVa+uZj8edkdflc4whX+K0QDMWeFrGV21x04XlvgDCF
	1xSWYA4vSVInQg+J74NM6QmErNMDvNNXEKSiSQ55chLmIUdU2CVDumOowl4P5wgclk1VUxwpXUpjL
	M60fXXjEKMJRA29pIlWk9DNtfaPnS9eRyYACu4vnogjU3m4a93hH678R1x24PDc5L8o9FJYO602eZ
	fy61JMEkdHF17UHHWvLxebiLQtpGAvVMiBw13AiluwLevN3/NzFFY7XbbiRM3eGRPNCZQPi76NU6p
	HCMxvAHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKZkc-0001CY-2z;
	Thu, 29 May 2025 10:40:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKZkY-0003Ln-2W;
	Thu, 29 May 2025 10:40:34 +0100
Date: Thu, 29 May 2025 10:40:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jijie Shao <shaojijie@huawei.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	"shenjian15@huawei.com" <shenjian15@huawei.com>
Subject: Re: [PATCH net-next v5 07/13] net: phy: phy_caps: Allow looking-up
 link caps based on speed and duplex
Message-ID: <aDgrkog2BcLjF1VV@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-8-maxime.chevallier@bootlin.com>
 <5bbf1201-e803-40ea-a081-c25919f5e89d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bbf1201-e803-40ea-a081-c25919f5e89d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_024059_965021_2A486652 
X-CRM114-Status: GOOD (  18.02  )
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

On Thu, May 29, 2025 at 05:36:11PM +0800, Jijie Shao wrote:
> Hi Maxime,  fc81e257d19f ("net: phy: phy_caps: Allow looking-up link caps based on speed and duplex") might have different behavior than the modification.
> My case is set 10M Half with disable autoneg both sides and I expect it is
> link in 10M Half. But now, it is link in 10M Full，which is not what I
> expect.
> 
> I used followed command and trace how phy worked.
> 	ethtool -s eth1 autoneg off speed 10 duplex half
> The log is showed as followed:
> ethtool-13127	[067]	6164.771853: phy_ethtool_ksettings set: (phy_ethtool ksettings set+0x0/0x200) duplex=0 speed=10
> kworker/u322:2-11096	[070]	6164.771853:	_phy_start_aneq: ( _phy_start_aneg+0x0/0xb8) duplex=0 speed=10
> kworker/u322:2-11096	[070]	6164.771854:	phy_caps_lookup: (phy_caps_lookup+0x0/0xf0) duplex=0 speed=10
> kworker/u322:2-11096	[070]	6164.771855:	phy_config_aneg: (phy_config_aneg+0x0/0x70) duplex=1 speed=10
> kworker/u322:2-11096	[070]	6164.771856:	genphy_config_aneg:	(__genphy_config_aneg+0X0/0X270) duplex=1 speed=10
> 
> I also try to fixed it and it works. Do you have any idea about it.
> 
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 0e762fc3a529..2986c41c42a8 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -258,7 +258,7 @@ static void phy_sanitize_settings(struct phy_device *phydev)
>         const struct link_capabilities *c;
> 
>         c = phy_caps_lookup(phydev->speed, phydev->duplex, phydev->supported,
> -                           false);
> +                           true);

This isn't the correct fix, as:

+ * When @exact is not set, we return either an exact match, or matching capabilities
+ * at lower speed, or the lowest matching speed, or NULL.

So it isn't returning the exact match but apparently ignoring the
duplex.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

