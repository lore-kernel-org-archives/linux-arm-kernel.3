Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C50FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GTfMsl5VdszDHeLyngBRKiaPiX+MAqFEJJUPqI8k2GI=; b=RWed/WKhtu17QfbwNzFFYwL/ae
	uboBOX94IZoCqY4F5Zp9LtHk5Jzx5uJRcgnBh3yBqm9L+5f05ttpaHIgGgbTKe5CJErAQIJ72/uj3
	8nedvzwfgP0PAXrpmOYfYz5PRC6j+cQTItrkSLkuBT0khcyU+cgmLuA2rymYaOLha+XwVXbabjCVC
	McwGJubEa4MF8QXKVnSL5f/tG5hDXVI3sl5t3G+WWZmawm8mD83cB4lQiypPBL8KOM8A2U8LBRhEE
	nyejOZmasXdiRljkS2wlN1V6zfj15rhQqey0agoxMLId4WdHKEbokOkC3W+yflONb30P9wD703MIl
	RBoMycxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4G-00000009lv5-2bJm;
	Mon, 03 Nov 2025 11:49:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4D-00000009lug-2lVZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GTfMsl5VdszDHeLyngBRKiaPiX+MAqFEJJUPqI8k2GI=; b=gNKzdyIAH2mme3mWN8ZqzZZWor
	vNnDr4RJdn7vga8saNkBBGnBLW5U2X78/HI2+HCcVG0VTWh0SIIHJQfU3qWFyWzeGhBCR8MaQGPVj
	rKBALG4yYpxykQEFWOtBtSuE23KFadOONtu5PDwNTLlfc9mGp98uXHRT8Z5+Qkh77ZOSQ45F/HiiI
	Cd8pEeclcM6R8ItQhkSojdVgfuoLLzJd53hFABseSHuns+iLoZT/wPvIyzn7yv5XD591V77ksOSKf
	XvrUjJ4ph1dKJH5Uh64MpOOLpGPAbVTIwnbczewIdaV2RxdxpA7P77vQiaOJS4Xuj6hoqGEbG1FrX
	XIJxknVw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55964)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vFt46-000000000ep-0SZE;
	Mon, 03 Nov 2025 11:49:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vFt43-000000003mC-1llA;
	Mon, 03 Nov 2025 11:49:35 +0000
Date: Mon, 3 Nov 2025 11:49:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 00/11] net: stmmac: multi-interface stmmac
Message-ID: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_034945_718003_1D696AEF 
X-CRM114-Status: GOOD (  12.32  )
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

This series adds a callback for platform glue to configure the stmmac
core interface mode depending on the PHY interface mode that is being
used. This is currently only called justbefore the dwmac core is reset
since these signals are latched on reset.

Included in this series are changes to s32 to move its PHY_INTF_SEL_x
definitions out of the way of the dwmac core's signals which has more
entitlement to use this name. We convert dwmac-imx as an example.

Including other platform glue would make this series excessively large,
but once this core code is merged, the individual platform glue updates
can be posted one after another as they will be independent of each
other.

It is hoped that this callback can be used in future to reconfigure the
dwmac core when the interface mode changes to support PHYs that change
their interface mode, but we're nowhere near being able to do that yet.

 drivers/net/ethernet/stmicro/stmmac/common.h      |  10 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 134 +++++++---------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c   |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  54 +++++++++
 include/linux/stmmac.h                            |   1 +
 6 files changed, 115 insertions(+), 95 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

