Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE6ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JTi6m8c71S5T93QgsVYDnnHaK5veNh8luB+E8eyeWY=; b=OhamgJp5/B1tSvrwEl1h1Tp9Jc
	G8+hg13Ks8aFIZger8pm5RTI9aFvOI8vrjk3miNTns5gOLv5Y/3wm7iu4AiexV2OACo/9IySVVWJq
	cvU9EhhF5HCLGTPPMXiZGXnkWsi95RwjAuC3bX+52MzPyLYh3C7HqYqXLVate9uptk3pQWoU9cWhJ
	5xjoJ2KMq46/HPzxkQDo/fIqheyyKVaXT0elpdKw2adwwJgMOW2Y3tBmC+wGYdKRqChYualWSCa7G
	oTsMVU2N2BgwnVCgtXtgS/aCbScfZpigxMJ1DKJPUWpKPpojC+gQ5XLzt6W87SmDt39e+dc/T5Y20
	I7PEXjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m5B-00000009RLp-31tL;
	Thu, 25 Sep 2025 13:32:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m58-00000009RIT-3jCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+JTi6m8c71S5T93QgsVYDnnHaK5veNh8luB+E8eyeWY=; b=WnYSM/C8fOejMG1d2bpodYRk8t
	wALItpSq7FYCgA2YHczQb+FMz3p21BaGlbQPutk7M0D9OFcnHngOCO3asmhRv0g/UFZ3dybOMeMfg
	qt3k/h8GG/lESNkqP1H7274pfR/Y6jSsb+gYiyVMLZ6fas4mm3MT1zXXlsg7WfQU4nEie7q3gsjxv
	IUqrrriRvLN3PZUJY5yont0AdpYn1BSgwgfjLrqgWREvPTDfpUBXDJJYOVQpmt5DVVhesFpXXVCru
	DOfb8y3/RJfxu/kbYmUvi49AXkWyTHROJuSWKe/0TWNcaJ5BV+Bm1UTiCQVTx0vwCEAVEUas9cHpf
	pyeEt3ug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35828)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v1m4c-000000002En-1dmh;
	Thu, 25 Sep 2025 14:31:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v1m4N-000000008A2-3RWp;
	Thu, 25 Sep 2025 14:31:35 +0100
Date: Thu, 25 Sep 2025 14:31:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: experimental PCS conversion
Message-ID: <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_063223_080143_25AE2F77 
X-CRM114-Status: GOOD (  40.98  )
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

On Thu, Sep 25, 2025 at 05:26:01PM +0530, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 24/09/2025 23:47, Russell King (Oracle) wrote:
> > This series is radical - it takes the brave step of ripping out much of
> > the existing PCS support code and throwing it all away.
> > 
> > I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> > flag with Bartosz Golaszewski, and the conclusion I came to is that
> > this is to workaround the breakage that I've been going on about
> > concerning the phylink conversion for the last five or six years.
> > 
> > The problem is that the stmmac PCS code manipulates the netif carrier
> > state, which confuses phylink.
> > 
> > There is a way of testing this out on the Jetson Xavier NX platform as
> > the "PCS" code paths can be exercised while in RGMII mode - because
> > RGMII also has in-band status and the status register is shared with
> > SGMII. Testing this out confirms my long held theory: the interrupt
> > handler manipulates the netif carrier state before phylink gets a
> > look-in, which means that the mac_link_up() and mac_link_down() methods
> > are never called, resulting in the device being non-functional.
> > 
> > Moreover, on dwmac4 cores, ethtool reports incorrect information -
> > despite having a full-duplex link, ethtool reports that it is
> > half-dupex.
> > 
> > Thus, this code is completely broken - anyone using it will not have
> > a functional platform, and thus it doesn't deserve to live any longer,
> > especially as it's a thorn in phylink.
> > 
> > Rip all this out, leaving just the bare bones initialisation in place.
> > 
> > However, this is not the last of what's broken. We have this hw->ps
> > integer which is really not descriptive, and the DT property from
> > which it comes from does little to help understand what's going on.
> > Putting all the clues together:
> > 
> > - early configuration of the GMAC configuration register for the
> >    speed.
> > - setting the SGMII rate adapter layer to take its speed from the
> >    GMAC configuration register.
> > 
> > Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> > the nail in the coffin of this code. It should be the transmit
> > configuration (TC) bit. Given that when the link comes up, phylink
> > will call mac_link_up() which will overwrite the speed in the GMAC
> > configuration register, the only part of this that is functional is
> > changing where the SGMII rate adapter layer gets its speed from,
> > which is a boolean.
> > 
> >  From what I've found so far, everyone who sets the snps,ps-speed
> > property which configures this mode also configures a fixed link,
> > so the pre-configuration is unnecessary - the link will come up
> > anyway.
> > 
> > So, this series rips that out the preconfiguration as well, and
> > replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> > 
> > We then move the sole PCS configuration into a phylink_pcs instance,
> > which configures the PCS control register in the same way as is done
> > during the probe function.
> > 
> > Thus, we end up with much easier and simpler conversion to phylink PCS
> > than previous attempts.
> > 
> > Even so, this still results in inband mode always being enabled at the
> > moment in the new .pcs_config() method to reflect what the probe
> > function was doing. The next stage will be to change that to allow
> > phylink to correctly configure the PCS. This needs fixing to allow
> > platform glue maintainers who are currently blocked to progress.
> > 
> > Please note, however, that this has not been tested with any SGMII
> > platform.
> 
> Thanks for that.
> 
> I'll give this a test on socfpga next week, as I don't have access to the HW
> right now. It may not be the best platform to test this on, as it has a lynx
> PCS and no internal PCS :/

Thanks for the offer of testing.

Do you know how the stmmac core has been synthesized as far as the
MII interface from it?

If not, if it's using gmac1000, possibly later cores as well, then
DMA_HW_FEATURE (or FEATURE0) bits 30:28 should give that information.
I'd guess GMII, so probably contains 0. The driver doesn't actually
use these, or even look at them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

