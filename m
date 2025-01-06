Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F5FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBH/QFCeH4D6o2k/hD1pL5oWMJrkgFobVsKuLiou4vY=; b=4cuwKG5xzrSpTTe26mlPVwi92O
	Cse7JofdtxgsQkJu28MIE0ViubROSvFo97qyZ5hWZM/ZUFcAA4/Qa/JvdneS1kIdfqoRfMKBtqo02
	WGErDfHw/Msk+yqQpWGBuJ8xr6/ZQvUJV/8tOYN+N9KzNHjoE3ci4rIBvDbrPG936Lw9t5pvw5Cfo
	nX/NNmZD3aGdVlQnQAb9AOf8vKzDg4166dbDyfEA6igUSOJvRqF4k9oB+cfTTxnmJ+TOZLjy4jaMq
	O2zKhIIPonoygTlEV203HrdW1WuU3G7dLbzVm1BaWHP2dbwSzTgtCG9KjoxgQtFFsmj99hEceSMEZ
	sn62VfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmEW-00000001E6j-1eIE;
	Mon, 06 Jan 2025 12:29:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm9f-00000001Cue-2ApJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tBH/QFCeH4D6o2k/hD1pL5oWMJrkgFobVsKuLiou4vY=; b=HPV34stHDD6m82qt9IEiA0lgvE
	SjcJhy1JZN847DfPP/nlZLN85ryKVQ5P/HqgnVi/7V6gzM0gblU9WqOgz67GkmAf3lC+j2ALTZIVQ
	iLdY/0U74D8+NYB2SDZeRAXS37ATqyHd2ds2T+ttr/+51rTtECdgmq3UMzbCFqwxKd5ATB6AtEbk3
	QZ2dUWShEjnM86yXVTsRLHVM+Kr/dB0sW0OOx9+pAlRyXhneYrH+Qoc+BYGWqp3j45AlDgX8wuEd0
	fIuO1K9j2mR0QJ4P2EalNIkszEbBMP9o8AOWxz2KHguSTMUKiRpEfF0HjtJ/3SGjKTuKAW0fcym4E
	nM83rCkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48276)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tUm9Y-0005q0-2Y;
	Mon, 06 Jan 2025 12:24:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tUm9V-0004Gx-2L;
	Mon, 06 Jan 2025 12:24:13 +0000
Date: Mon, 6 Jan 2025 12:24:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/17] net: stmmac: clean up and fix EEE
 implementation
Message-ID: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042423_553763_B891A474 
X-CRM114-Status: GOOD (  21.01  )
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

This is a rework of stmmac's EEE support in light of the addition of EEE
management to phylib. It's slightly more than 15 patches, but I think it
makes sense to be so.

Patch 1 adds configuration of the receive clock phy_eee_rx_clock_stop()
(which was part of another series, but is necessary for this patch set.)

Patch 2 converts stmmac to use phylib's tracking of tx_lpi_timer.

Patch 3 (new) corrects the data type used for things involving the LPI
timer. The user API uses u32, so stmmac should do too, rather than
blindly converting it to "int".

Patch 4 makes stmmac EEE state depend on phylib's enable_tx_lpi flag,
thus using phylib's resolution of EEE state.

Patch 5 removes redundant code from the ethtool EEE operations.

Patch 6 (new) removes some redundant code in stmmac_disable_eee_mode()
and renames it to stmmac_disable_sw_eee_mode() to better reflect its
purpose.

Patch 7 removes the driver private tx_lpi_enabled, which is managed by
phylib since patch 4.

Patch 8 removes the dependence of EEE error statistics on the EEE
enable state, instead depending on whether EEE is supported by the
hardware.

Patch 9 removes phy_init_eee(), instead using phy_eee_rx_clock_stop()
to configure whether the PHY may stop the receive clock.

Patch 10 removes priv->eee_tw_timer, which is only ever set to one
value at probe time, effectively it is a constant. Hence this is
unnecessary complexity.

Patch 11 moves priv->eee_enabled into stmmac_eee_init(), and placing
it under the protection of priv->lock, except when EEE is not
supported (where it becomes constant-false.)

Patch 12 moves priv->eee_active also into stmmac_eee_init(), so
the indication whether EEE should be enabled or not is passed in
to this function.

Since both priv->eee_enabled and priv->eee_active are assigned
true/false values, they should be typed "bool". Make it sew in
patch 13. No Singer machine required.

Patch 14 moves the initialisation of priv->eee_ctrl_timer to the
probe function - it makes no sense to re-initialise the timer each
time we want to start using it.

Patch 15 removes the unnecessary EEE handling in the driver tear-down
method. The core net code will have brought the interface down
already, meaning EEE has already been disabled.

Patch 16 reorganises the code to split the hardware LPI timer
control paths from the software LPI timer paths.

Patch 17 works on this further by eliminating
stmmac_lpi_entry_timer_config() and making direct calls to the new
functions. This reveals a potential bug where priv->eee_sw_timer_en
is set true when EEE is disabled. This is not addressed in this
series, but will be in a future separate patch - so that if fixing
that causes a regression, it can be handled separately.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  10 +--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  25 +-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 100 +++++++++++----------
 drivers/net/phy/phy.c                              |  27 ++++--
 include/linux/phy.h                                |   1 +
 7 files changed, 84 insertions(+), 85 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

