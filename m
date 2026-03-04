Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFAEEB7EA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OdBLbIazG3raep4NErWJj7VGaWKFPMS2dq5YWlt/Owk=; b=R8MyFCYb5+U8rVc9ZFtSRKLS+z
	YMgfbgYs9EdVCExXex+aeHGi4/xMyIZ+eCxYK9vlicr7a5VFlCaqbcz3LfxRBpk3ILHKJTTVYUGAB
	E8iAOxkB7IKxJyLyAx49lUQFFAadpizeTUeGUd0lIZ9BEb6NXjdr0iG3msU0oOC3O0RCgyP4N+7s3
	b+4pw43nvfd3reZzW0YprM1EqGJABFrFChxdBvyEFWyfKqE+pLUcTonwHA7ltJA9/xWYPJl9thmdY
	0iO8zyAjRVLOVyAtsl8RoougbzzPM/cUzSFNttRDTZ13AFY8a7LVt3TJI6Gy2eEmqpzob6u9yDs8E
	/A51m45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjN3-0000000GyPR-15HE;
	Wed, 04 Mar 2026 10:22:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjN0-0000000GyOe-0XnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OdBLbIazG3raep4NErWJj7VGaWKFPMS2dq5YWlt/Owk=; b=Q0VUkaojD3xrUsrBMjWYhuqY7d
	093LhNGi/g1dKkIVWKAOXA9I2Qbq2douAsI3aWuGupisVhhXN9p8YcBi8hC1iZ3wzOGKrYMSRnU7Z
	ix0uS4ZDAp7UNywT1KiwUfG5ARCxJKFnccA+HK0dYRz2O7/2f6qmLpShxYVPayNTmxpOFtcVx7tPZ
	gp6iYPUu7YytsRqFqdV5HYo2kTL7tUszkPd+Oa8Jo1s4DfV8OV//3USIuaxGqJpg9upns0UrR7yuQ
	v9ywa57ctMaVGYliRydb6g86e+UYWCXCuasxXj+PLRTE0PIuUxVY4KHtWujSH5dYrYWZG+32QBQH2
	eY6c5AKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38100)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vxjMs-000000006KZ-2lNg;
	Wed, 04 Mar 2026 10:22:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vxjMp-000000007pY-1WGz;
	Wed, 04 Mar 2026 10:22:11 +0000
Date: Wed, 4 Mar 2026 10:22:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 0/8] net: stmmac: mdio related cleanups
Message-ID: <aagH023pvswd0tlT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_022222_170172_733B9F15 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

The first four patches clean up the MDC clock divisor selection code,
turning the three different ways we choose a divisor into tabular form,
rather than doing the selection purely in code.

Convert MDIO to use field_prep() which allows a non-constant mask to be
used when preparing fields.

Then use u32 and the associated typed GENMASK for MDIO register field
definitions.

Finally, an extra couple of patches that use appropriate types in
struct mdio_bus_data.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  11 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   9 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   9 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   9 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   9 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  18 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 106 ++++++++++++---------
 include/linux/stmmac.h                             |   6 +-
 10 files changed, 92 insertions(+), 97 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

