Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D4CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ayxxfxIY5fsLtWo41Y9SbHVbcp1WanXcGUkI0uNNLcQ=; b=2fmT95sv86v1qHnjaJVAtO26At
	kO+oe3kpkS6LH9HFHl6Cm5j5dlkK6znzNT6llBklWy63JdXF2Px9wABvgdXvP0rdrhYA14haHfMHZ
	P5uXab7U8Ge2M4v6RV8phfyZWjre6UZ+AdfemoEolJOxLUScY2SvXJT7Anzh84LfXZQir6yvJshZ8
	3550gqZo5EiCWb0GspWbDPMUFYazUMt0DPajfitVTz6pkpDn2KQEHUgJroznKWuaX/1nVfH1jto0g
	ZS83/xIwv2pwDW91g4GwOvoHB2+eXjS6Q82X/syAZeR/C3UfND9dfQ2hg/gWulsFrw8opnDNgmvt7
	VIs3zLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClB4-0000000Bjki-49tM;
	Sat, 25 Oct 2025 20:47:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClB2-0000000BjkH-17QB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ayxxfxIY5fsLtWo41Y9SbHVbcp1WanXcGUkI0uNNLcQ=; b=0apOYUXWT+GcUfjPhxLn23kONS
	tYzlIo+tgSeVtWo7DzYXnkiwsx8hDfZh0nusT3aysO3Bu0EOMb2U6x3UTh6zWWqmIa1wuvzxkxcnM
	1pEdFosUEW8iTzFxAuUgD0aatIYQ/IeihGd/32MKps42vq2ChgFC3H8XZmUVXaL+o4RN2ug2kOJmr
	OKY9NEltosxKWy32affrOOxpR3z9i65orpwhsn6fH7NsQ9Dour2N3V5lwiRjzMl3oLF8nIlJ7JWs9
	IYMI6tUDjzTohb1KFUGP1bNNTVhtjEtxKi9rgHhBoKKWuiAVlDAEfukgZZHAULkuOfTjUd8mZSCya
	OWDYZjZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41266)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vClAq-000000000PG-2Hyf;
	Sat, 25 Oct 2025 21:47:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vClAn-0000000040y-1mZl;
	Sat, 25 Oct 2025 21:47:37 +0100
Date: Sat, 25 Oct 2025 21:47:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_134752_326024_B8396208 
X-CRM114-Status: GOOD (  10.21  )
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

This series is currently the last of the phylink PCS conversion for
stmmac. This series contains changes that will cause potential breakage,
so I suggest to netdev maintainers that it is only applied if there is
a significant response from testers using the PCS.

Paritcularly, dwmac-qcom-ethqos.c users need to test this, since this
platform glue driver manipulates the PCS state. Patch 2 is designed to
print a warning to the kernel log if this glue driver calls
stmmac_pcs_ctrl_ane() to set the AN state differently to how phylink
has set it. If this happens, we need to do some pre-work to prevent
these prints.

 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  7 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  7 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 29 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  8 +++++-
 4 files changed, 44 insertions(+), 7 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

