Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE867CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wDM7ea8WG0qsfgvvugn/KuHahIyav7ggrd+qRRZvlA=; b=DzjeCm9ZenMpffAxZBgYT71wEx
	KVF/owATzEDLGIjfrF1SZlNM0oLsZf22VwLIrUU5eyI2KXf+bukwLn+Z6n+PWRmBRa0Beyc6hkiXh
	YngiwDBobgd3HtxvBkmxm1yNBwcH6mbCbN6IrUYltW+hznJIsC/+WnLULadcY913S3eZgAJTC36uT
	86mFLT4bpuHrvQ6XfTzMlYuISbFSA1GM5kT4qzEBFpfGIe9ClEAYDoz4zqX0jn7+Mh6r53+oNkwuL
	wjmiF6rY5btm1czRHXaSV/L60yXB7lVBw7gCAO4yxiYd65IqvK+E9FqC0RlZcSVzzfEt+sFUwmXsV
	PAFIXIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99jt-000000030Bh-3mMM;
	Wed, 15 Oct 2025 22:12:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99jr-000000030BA-2yDv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 22:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4wDM7ea8WG0qsfgvvugn/KuHahIyav7ggrd+qRRZvlA=; b=nCY1sWW7An16x4rxXvqnUl+x5I
	ASEGspy2pshjRY27ot+WelX1sdCT93Ru/31qG21JGNHm3IX/VDc0T7EZjjsbWBGKf8cDAoeBFIr4G
	df98PLQtMI52u+kz/qQK/ZopYCjHVgn3Owizi0rSwURl8JZRsAlNEzZOTilLqdr4kd93JpRw5317R
	X1z9CrnKnVl0YVEaQ5DB+UDV3bZHtoRxnTBPWeRxW2T0r+AzJRb0SBM/Fgwl3+2H0wgDhgXVKU2hJ
	PkGNeKSGvo3v4BcbU7C8Cph6wGmHy5WQ7sqLOlEHub3BDyhUQo9++/c8Pj+gv6Pqv1ou05ulxEtX2
	c0Vp6ubQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36642)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v99jS-000000005X8-1PdH;
	Wed, 15 Oct 2025 23:12:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v99jJ-000000002ei-0dcB;
	Wed, 15 Oct 2025 23:12:21 +0100
Date: Wed, 15 Oct 2025 23:12:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 03/14] net: stmmac: remove SGMII/RGMII/SMII
 interrupt handling
Message-ID: <aPAcRNeFa5heydq7@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
 <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_151255_746122_3FE2E3D4 
X-CRM114-Status: GOOD (  17.36  )
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

On Wed, Oct 15, 2025 at 11:35:40PM +0200, Andrew Lunn wrote:
> On Wed, Oct 15, 2025 at 03:20:12PM +0100, Russell King (Oracle) wrote:
> > Now that the only use for the interrupt is to clear it and increment a
> > statistic counter (which is not that relevant anymore) remove all this
> > code and ensure that the interrupt remains disabled to avoid a stuck
> > interrupt.
> 
> Will this interrupt come back later, as part of the PCS? Or will the
> PCS be polled?

It depends whether it has any users - given the scrappy nature of all
this, and the fact it's never been properly implemented, I need to
hear from the platform glue people to really know what's going on.

Right now, all I'm doing is removing loads of code that has been proven
to be broken, and re-implementing what is left in a way that will work
for people who are using the internal PCS (in other words, where the
STMMAC_FLAG_HAS_INTEGRATED_PCS was set which disabled much of the
broken code anyway.)

> This leaves this counter unused, as you said. It does not look trivial
> to remove it, it is part of the statistics ABI. But if the interrupt
> comes back in a later patch, this counter could also be brought back
> to life?

Sadly, it's not quite unused - see dwmac-sun8i.c:

        if (v & EMAC_RGMII_STA_INT)
                x->irq_rgmii_n++;

This is more than glue, but is almost an entire core implementation as
well - the original commit introducing it says:

    The dwmac-sun8i is a heavy hacked version of stmmac hardware by
    allwinner.
    In fact the only common part is the descriptor management and the first
    register function.

So, rather than remove the statistic entirely, as I'm not touching this
hacked version, I decided to keep the statistic counter as there is
still something using it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

