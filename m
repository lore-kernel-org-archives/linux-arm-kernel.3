Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D44C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7Dd/VCgHGXa1ZZy0kScT3IdI9bOz/Ax0ajFta3++S4=; b=sBCyLo9qVTSW8TcJesba0c/xqy
	hWOb5Puxn6D4rt/xlpx97lJdzMGTJz26Y9ayDS0Pnkgv+JDJPdf1rxzvjJeT2f2PVpj4jHiWCogvH
	XToSMcrx2E+rxKcCwvYowlPE+AUwyqpAbRtcjCQdtlbw+Q6gErJUW6MyZACL9r50MZZh4QIWCLQrY
	I3CXesRpyz4e9hBQRTDuKoontudcjuK+WIL6xYciQHUasTtysjxcrSdaLxdWdcHOMjPg4GKk2TY3g
	EeiZXXsu2pyzU91rXESvJpyq/0npgloWFNjI7ckgVPebRKVoZrqo1KQvUjpkIJZ6gtVUbWpLiyzWw
	51LeWzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQut-0000000F0YR-0IjU;
	Mon, 28 Jul 2025 16:41:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ3D-0000000EsBi-01hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g7Dd/VCgHGXa1ZZy0kScT3IdI9bOz/Ax0ajFta3++S4=; b=XQyJE2LKFjRGg5l5bnJgrSVqLX
	Bo99l4IkvV3otCd4Jl/PKZPafnFD8qX9Kd4M2Yr3TMQP8BLeRQSoTzCn5joFr61IUQWs4Tl4SIS9c
	3NC+aWzHM3wRa1WNCeiP1t2QnQTUbhw7VdiizO1ULQJP83lx5kBABvzHWVrdNUyLrYtTimHzp1ZyS
	02MbuvCyzVa2r554wFRjFr5EZ3pj7lKAUvbfejxSqC1xve3jB7r2Dsi4lMfwR5U6cns7plcLLW7NK
	8q+MPgdTiCHmQOAQHR1M94RYki4cLzaNqu6wwz7E9hen1xgxITNHr883aiIvpwlZQGp+LnepJr3AU
	p6wT1ZUg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ugQ32-0000TU-0S;
	Mon, 28 Jul 2025 16:45:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ugQ2y-0004sJ-1s;
	Mon, 28 Jul 2025 16:45:52 +0100
Date: Mon, 28 Jul 2025 16:45:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 0/7] net: stmmac: EEE and WoL cleanups
Message-ID: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084607_333051_E3A90C85 
X-CRM114-Status: UNSURE (   7.95  )
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

This series contains a series of cleanup patches for the EEE and WoL
code in stmmac, prompted by issues raised during the last three weeks.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 11 +++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 31 +---------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 21 ++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +--
 5 files changed, 25 insertions(+), 43 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

