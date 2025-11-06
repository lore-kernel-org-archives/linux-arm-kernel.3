Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F43CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ITqPQA8fRrbxRLD4xqri1t/q83422DhMqqq3jEbapI=; b=DJcDBedh+I0b1g74P2LNCT8ztG
	ZkydziafBs6FULv76y0x+ce40G1d6j7pBC0dcmCyCJ2df1f3UOuiUZWYHKbUCJmMQFjmvj7zCxIXc
	7h7QCBY5FM/wxLTUnB7Mn3IWeDEP1P5TgtyKcMsIR1s3m9xqVD2OvZUaCDHWDwbDlEDofe1wM0tsx
	jIOF2xGBRf/i0UZUehjciKmCM/VX02JQ3WA3GK9bHpN/yLsq68u08uU66rcpWnI2pI8Lk7PVuOLHW
	du33I16USZT9N6t9Tfq9pxFaSRvhSQwkNj9Yr2C4oxSdsYvUvtDA1ZKpgdvpTisuCHe81SaYeCbLJ
	bclVWCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpE0-0000000EiUh-0F0g;
	Thu, 06 Nov 2025 01:55:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpDx-0000000EiUJ-1e2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4ITqPQA8fRrbxRLD4xqri1t/q83422DhMqqq3jEbapI=; b=JmIY1pv7Y602Ue9TRGVE3iKkZr
	DKbXWpfFusF2yAM32fugEYoHzHzcxqyC+23jOYx24+5PYnR197hQEHICzt3WQGW7S0WTuctCbXefr
	2RvsZtddE+47OH/HpaMwbQLva9BqWsHiTz4zqgS8sNIQaYN78oNqvhGTp3R88WOSLIufjCtmtTjm6
	ob+etum/3S4QYnsXf3Hx4h8NBTtUpnl6xU3iZd1V9JwHxVyP1SZMbRdUU8dlHz91NFQCxvNvQfV3g
	NTpSwbRgkE4QJVhb5lEYenP0gQzClSIkI3R802GYHb90y8UX/AQomKuxlxi8q8Jj0rxISdK/MYwNc
	efmGaPyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49948)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGpDq-000000004A9-1LiQ;
	Thu, 06 Nov 2025 01:55:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGpDn-000000006Ch-1KZs;
	Thu, 06 Nov 2025 01:55:31 +0000
Date: Thu, 6 Nov 2025 01:55:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 09/11] net: stmmac: ingenic: simplify x2000
 mac_set_mode()
Message-ID: <aQwAExA7bAgwNkdI@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
 <20251105171848.550f625a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105171848.550f625a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_175541_455933_75161699 
X-CRM114-Status: GOOD (  12.97  )
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

On Wed, Nov 05, 2025 at 05:18:48PM -0800, Jakub Kicinski wrote:
> On Wed, 05 Nov 2025 13:26:53 +0000 Russell King (Oracle) wrote:
> > As per the previous commit, we have validated that the phy_intf_sel
> > value is one that is permissible for this SoC, so there is no need to
> > handle invalid PHY interface modes. We can also apply the other
> > configuration based upon the phy_intf_sel value rather than the
> > PHY interface mode.
> 
> clang sayeth:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>   128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clang can't know that phy_intf_sel will only ever be one of
PHY_INTF_SEL_RMII or PHY_INTF_SEL_RGMII here (its already been
validated as such by the only caller of this function.)

I guess the way around this warning is to move:

        val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);

up and make it a simple assignment, and make the others |=.

That's the code I originally had before I attempted to minimise the
noise in the patches. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

