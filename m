Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B6CE98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jYLQAmS2V5vH5hD2lJBwU5t9ZdEBHgF8ZElCbh4Vl38=; b=1IiAdaMpGC9bYuDyWotDFzzyea
	zZODzZWnowW+rbqNLVsfTPFmG2o5453tWmGjxd8HbB+oVhdsJFPZLJa9RMmLV38fwAhCc2xP6XGgb
	djcCfRHQS5MondOvS9MUnETBhVzNhCI33xFre5bJCpL/fBMohyp+B2DcjIj9vabxgkLuA5NW9wH9Z
	0h6iPTTp+gJSCsj6iv5ypITNyOHB+Mp1Z/YIdSCaR5lNafdSk/zBhNrlI71CshxBNzgeoYQWLAg17
	Kfl3Hu08TlxikIi2y95PVngWzWNRroh0izqObRRpUWRtFAOiCyASlsE6eXIV+pallj2O/G0/LqdhI
	5J3SgDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSKU-0000000HXjG-2lfA;
	Mon, 23 Feb 2026 09:34:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSKR-0000000HXil-1wBT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jYLQAmS2V5vH5hD2lJBwU5t9ZdEBHgF8ZElCbh4Vl38=; b=KqTMupwg9pYja1LrDQB6IHXOgf
	nMKlIz/G73+crJNsBegu4iKfDndmFaAg8ZxegYlGob+Wmq14kOgydAtMmWReeV3lPjU0m/obpOCzv
	wk5Pt4ig1LUxoIeqnyZ1Fgprt0Os7TAeYYJ484oRSDlbombqK53ahPv+tzhe79izF8HuyW5MvoCPu
	bg+UwVKp682N6FBHyDHPzOYBieoyGr/eceMPZIivAQLoMDs5G/TcPAdeyTwU9UuUwSWisKozf2N76
	vvlPGbTBdADqCY53pQ37qQ/1Ntja6rm0Pi8GSl1+uohnold+g0j7V9WGoEU+SxC7IYrYN1ra7pswA
	dU20lQgg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47704)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuSKD-000000003lh-2rgk;
	Mon, 23 Feb 2026 09:33:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuSK9-000000007Fx-0IGw;
	Mon, 23 Feb 2026 09:33:53 +0000
Date: Mon, 23 Feb 2026 09:33:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 00/10] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013411_503213_5EF2C5D3 
X-CRM114-Status: GOOD (  10.52  )
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

As the last series had issues with stability, I've changed the approach
in this series to concentrate on keeping much of the SerDes related
code within the qcom-ethqos driver rather than trying to move it out at
this stage. This means it should be possible to bisect these patches and
pinpoint exactly the code movement that causes any instability.

This series starts with various cleanups to qcom-ethqos (the first four
patches) before beginning to move code, passing phylink's phy interface
(which will change) to the fix_mac_speed() method, and then using that
to configure the serdes and inband setting before moving the SerDes
code.

This patch set has been tested.

Thanks.

Changes since RFC:
- add set_clk_tx_rate() conversion as that was also tested.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 135 ++++++++++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 include/linux/stmmac.h                             |   3 +-
 8 files changed, 101 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

