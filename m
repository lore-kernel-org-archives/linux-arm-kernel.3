Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238EAD3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFmqu+FdotDQbCADRE5xzUlzXukTJfUW3R2MmBY3I84=; b=K7CWjh0C11MvCaPvQkDExRavME
	ZgaNnssa8Ma+Ef4vwtMC1VJ8rLKdSIh+9IbefRdQLueDUtFvwJO3EpG+N2iUorJwNAAwdqRP+5CaR
	+TYyEx2vBcDRLA46v3QCINYOTeRu2HAwccHDnZ5h4EjTISLsNxv88n1eOWvepe4VoL/+28uzC7SGl
	kbU0RsGwGPwFyZMuq2LRR+NLHB/CcEi5ZEcKkXJS0AO2kf1Eavry/t62oyDo1Hox3Pk5L3iJbPtbw
	0oKS1pyLUEa1RFlDGSyfuDOv6UuxnWKd52+FSKWzl0VoV3xXns9YQZNVvwjxcfm8SY0G6mNCohCPb
	duG0BS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwU4-0000000Ar9Q-3zZG;
	Tue, 26 Nov 2024 14:24:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwRg-0000000Aqib-48HW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 14:21:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tFwRV-0001t6-Mp; Tue, 26 Nov 2024 15:21:29 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tFwRR-000GRf-2M;
	Tue, 26 Nov 2024 15:21:26 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tFwRS-00GeR7-1E;
	Tue, 26 Nov 2024 15:21:26 +0100
Date: Tue, 26 Nov 2024 15:21:26 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 00/23] net: phylink managed EEE support
Message-ID: <Z0XZZszZFVbVl_kN@pengutronix.de>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_062141_023123_7634D8FC 
X-CRM114-Status: GOOD (  33.65  )
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

Hi Russell,

On Tue, Nov 26, 2024 at 01:01:11PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> > Patch 11 adds phylink managed EEE support. Two new MAC APIs are added,
> > to enable and disable LPI. The enable method is passed the LPI timer
> > setting which it is expected to program into the hardware, and also a
> > flag ehther the transmit clock should be stopped.
> > 
> >  *** There are open questions here. Eagle eyed reviewers will notice
> >    pl->config->lpi_interfaces. There are MACs out there which only
> >    support LPI signalling on a subset of their interface types. Phylib
> >    doesn't understand this. I'm handling this at the moment by simply
> >    not activating LPI at the MAC, but that leads to ethtool --show-eee
> >    suggesting that EEE is active when it isn't.
> >  *** Should we pass the phy_interface_t to these functions?
> >  *** Should mac_enable_tx_lpi() be allowed to fail if the MAC doesn't
> >    support the interface mode?
> 
> There is another point to raise here - should we have a "validate_eee"
> method in struct phylink_mac_ops so that MAC drivers can validate
> settings such as the tx_lpi_timer value can be programmed into the
> hardware?
> 
> We do have the situation on Marvell platforms where the programmed
> value depends on the MAC speed, and is only 8 bit, which makes
> validating its value rather difficult - at 1G speeds, it's a
> resolution of 1us so we can support up to 255us. At 100M speeds,
> it's 10us, supporting up to 2.55ms. This makes it awkward to be able
> to validate the set_eee() settings are sane for the hardware. Should
> Marvell platforms instead implement a hrtimer above this? That sounds
> a bit problematical to manage sanely.

I agree that tx_lpi_timer can be a problem, and this is not just a
Marvell issue.  For example, I think the FEC MAC on i.MX8MP might also
be affected.  But I can't confirm this because I don't have an i.MX8MP
board with a PHY that supports MAC-controlled EEE mode. The Realtek PHY
I have uses PHY-controlled EEE (SmartEEE).

Except for this, I think there should be sane default values for
tx_lpi_timer.  The IEEE 802.3-2022 standard (Section 78.2) describes EEE
timing, but it doesn’t give a clear recommendation for tx_lpi_timer.
IMO, the best value for tx_lpi_timer should be the sum of the time
needed to put the full chain (MAC -> PHY -> remote PHY) into sleep mode
and the time needed to wake the chain. These times are link-speed
specific, so defaults should consider PHY timings for each link speed.

Except for tx_lpi_timer, some MACs also allow configuration of the Twake
timer.  For example, the FEC driver uses the lpi_timer value to
configure the Twake timer, and the LAN78xx driver also provides a
configurable Twake timer register.

If the Twake timer is not configured properly, or if the system has
quirks causing the actual Twake time to be longer than expected, it can
result in frame corruption. 

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

