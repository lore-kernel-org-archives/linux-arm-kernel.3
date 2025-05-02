Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C90BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6hIHQx+SVfzP6vh9iCcuOhRCEQHbpsMyOqCsnAJi7o=; b=tU/s7Xig1x0Zv7NV+sQNC+Zyv9
	hosH8ZFgeH4WP3GzhQeIkVxpkmjZ628YfCEZcM1T5sMAYkyfIIv1JbVbkb68CsZzyD8O9esvuOiwk
	yk1EvhccSD2slH/5Tg4QhA+xVoBRMur250b5Uk67NrMf9fejuMPYwa33iVWnTTS1WAK+G+Y/lkVVn
	Vltk6BWDNm9vx9nZzJUFkCP910071s/7WkYBSAg3dfDulTj+P+jB+wx61SXWEZ9CPItncGA8xZm4+
	Xyf08k/DobVnSTN6yUaVPvb5yAKQ2Jm8xeLItBziMNDLaXvNes+iDHz9ZBp/IUeo23FOCvHS4Wngj
	Ha+7KDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqai-000000024uJ-0JXP;
	Fri, 02 May 2025 13:38:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqYj-000000024au-3KZ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 13:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C6hIHQx+SVfzP6vh9iCcuOhRCEQHbpsMyOqCsnAJi7o=; b=xM9jZ/0tMjdgANqDrlrVVa0QfH
	jnSeYi/DQiIU0qiSoNkhhiBzzFGODNfXQUCGIIuHIRbf+2cdC/xsAcfK2Cw9NlSMNUP5r0eGaGlwE
	qK2hEHw4tiWsWeuwb74vOZzpekP5LPazAz+U0f4hvNc1D5mfPF9tJvCj/iSkzY67Yoh2EDVBJAWxn
	L4LmVnl/Wwy4q2errs8AYksmUTakP2MP/HBorCn7jDsC5S8yKyL8pltFSEYDVwuquU2+QDT2TCaZ7
	0aB4OOhRSDN15wU9rB9GDLYaTjzfxFrer+ZgJLQDlBha99vCh13hgYpuaXVJqljQyySh4vWnH3+C7
	bqEK4NMw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58874)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uAqYW-0001OF-2J;
	Fri, 02 May 2025 14:35:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uAqYS-0000iq-1x;
	Fri, 02 May 2025 14:35:52 +0100
Date: Fri, 2 May 2025 14:35:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 0/4] net: stmmac: fix setting RE and TE
 inappropriately
Message-ID: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_063610_110868_E52C07AE 
X-CRM114-Status: GOOD (  11.85  )
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

This series addresses inappropriate setting of the receive and transmit
enables in the GMAC control register identified back in
https://lore.kernel.org/r/Z8BboX9RxZBSXRr1@shell.armlinux.org.uk

The databook is clear for the receive enable, that this should not be
set until the initialisation of the MAC and DMA has been completed.
The previous RFC patch series ("net: stmmac: fix resume failures due to
RX clock") which moves phylink_resume() solves that, but we are left
with these enables being set when the link is down. This is not correct.

Sadly, when XDP support was added, new calls to netif_carrier_on() and
netif_carrier_off() were added, which are incorrect in drivers that
make use of phylink - by doing so, the driver has no guarantee that
the .mac_link_up() and .mac_link_down() methods will be called in
sequence anymore. This is fixed in patch 1.

We remove manipulation of the RE and TE bits from the start_tx(),
stop_tx(), start_rx() and stop_rx() methods for each core.

Finally, we remove the stmmac_mac_set() call from stmmac_hw_setup().

v2: add phylink_carrier_*() functions and use these instead to avoid
calling phy_stop()/phy_start(), which may bounce the physical link.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 ----
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 23 +++++-----
 drivers/net/phy/phylink.c                          | 50 ++++++++++++++++++++++
 include/linux/phylink.h                            |  3 ++
 5 files changed, 65 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

