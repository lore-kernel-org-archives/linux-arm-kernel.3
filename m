Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9277FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i99JrEwvVL6vZ28JyF12/j0Oq/JzEnb/KviOot0d0XM=; b=ZZNueOQq1u5QMAeFXewIz/NMRL
	CV5+A3AUVhA8P7ZnMKzC93oeL0Ghn9Ivrll/AwJAWxpCkbZYwtEIHlQljidMYV8FI4A/I+Vpo1k/c
	Mo0LdML/4DKJfWSPFO1JmmDMyA15Y4K/NRgtrMh5IXZQ5LCcRkcx6mWLnfmazGMYv3/p8454BhSZa
	S6eCFh8dtCr6ZMHFuhGdWVcQblqnilVhjiObduS2tHrlAgZzGxQHmmUB0GEOWAIwxIt+jn8HEKeon
	nlFpaGUW+Ze8LHUEHOzifZA/RVb76eJvrG640UUajFZKzAskeFzdKP8Y8MSkYCqPwQUdYwY4Bp3wq
	GIPmp+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAIU-0000000D2Pi-3pzz;
	Wed, 15 Jan 2025 20:47:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYADn-0000000D1hW-0Vwf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i99JrEwvVL6vZ28JyF12/j0Oq/JzEnb/KviOot0d0XM=; b=Yf/i3LX0LboP0eiOYuh54qyiIB
	0zqiJ5iJEDXjO+ofCI0Axrb+gMWGHL59zLCdnWGKAcqXADAue7Frf1odUnuIcLDzwhusuSOdWoV8X
	LKKXXwPHr26c14wi8jfrgM9zkdNY+pftU2Hy0G5rDqlHOPNQInyDzgHWFHiNkWVNz6NNzAmoO7uvK
	2aDIo3a4Ztx6HX/G5ru1ZsldrYRJAEl++0pYhKoVBxqteiOTcmmDwMqoZZI7DLoTDkN7+9WR2+q9s
	HRHO7LxDY1HdMdXINBLyejEUvawFaPT/c9ae5kI6uPD4tFPz7wAN0TKAd3FqBeNBmd2pPswJ2llnV
	IfSsD1EQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tYADe-0001hw-3D;
	Wed, 15 Jan 2025 20:42:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tYADc-0006UU-1C;
	Wed, 15 Jan 2025 20:42:28 +0000
Date: Wed, 15 Jan 2025 20:42:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com
Subject: [PATCH net-next 0/9] net: add phylink managed EEE support
Message-ID: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_124239_164586_9C841539 
X-CRM114-Status: GOOD (  16.23  )
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

Hi,

Adding managed EEE support to phylink has been on the cards ever since
the idea in phylib was mooted. This overly large series attempts to do
so. I've included all the patches as it's important to get the driver
patches out there.

Patch 1 adds a definition for the clock stop capable bit in the PCS
MMD status register.

Patch 2 adds a phylib API to query whether the PHY allows the transmit
xMII clock to be stopped while in LPI mode. This capability is for MAC
drivers to save power when LPI is active, to allow them to stop their
transmit clock.

Patch 3 extracts a phylink internal helper for determining whether the
link is up.

Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
added, to enable and disable LPI. The enable method is passed the LPI
timer setting which it is expected to program into the hardware, and
also a flag ehther the transmit clock should be stopped.

I have taken the decision to make enable_tx_lpi() to return an error
code, but not do much with it other than report it - the intention
being that we can later use it to extend functionality if needed
without reworking loads of drivers.

I have also dropped the validation/limitation of the LPI timer, and
left that in the driver code prior to calling phylink_ethtool_set_eee().

The remainder of the patches convert mvneta, lan743x and stmmac, and
add support for mvneta.

Since yesterday's RFC:
- fixed the mvpp2 GENMASK()
- dropped the DSA patch
- changed how phylink restricts EEE advertisement, and the EEE support
  reported to userspace which fixes a bug.

 drivers/net/ethernet/marvell/mvneta.c             | 107 ++++++++++------
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h        |   5 +
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   |  86 +++++++++++++
 drivers/net/ethernet/microchip/lan743x_ethtool.c  |  21 ---
 drivers/net/ethernet/microchip/lan743x_main.c     |  46 ++++++-
 drivers/net/ethernet/microchip/lan743x_main.h     |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  57 +++++++--
 drivers/net/phy/phy.c                             |  20 +++
 drivers/net/phy/phylink.c                         | 149 ++++++++++++++++++++--
 include/linux/phy.h                               |   1 +
 include/linux/phylink.h                           |  45 +++++++
 include/uapi/linux/mdio.h                         |   1 +
 12 files changed, 446 insertions(+), 93 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

