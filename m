Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60009CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/AkSn3PmATQkY4KTnXMm8OAmVPwhJx7EQAh2aTkiy+Y=; b=pTSY1tSxIg1/IhHVv4zh8sLc/w
	Yfni1RAzxc/T1Cu2jdi68A3+9eRgHmSlV4O6mUYvD2isHJ+I5SabY3R51zV5YXacROge421Y/XvL2
	l8b4Go3nryC2mnvoGNjG/d4IXOsndheTlZRSB2CNjDpkvNeLMpOz72xG7fancYjX8kt2xzebisMMu
	9nOHLmJh37n3sMXkb7MCY6s4tII2XWTJJrrfC6uFrac3i5XyW3rhg+jKD7SJI9B65B7WHev5dn4vg
	Y0zOnwlmr6xUcYL1rruOC9ADf0tHR1p+Ta4slw21fDT4eOK0yPuoxHBkCtkqCWirN2wiJrR+zZKN7
	bm8++qGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119T-0000000DA2G-3QOm;
	Tue, 23 Sep 2025 11:25:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119Q-0000000DA0b-47Tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/AkSn3PmATQkY4KTnXMm8OAmVPwhJx7EQAh2aTkiy+Y=; b=the/cmm+WTt9OfglCw1TUdzqQm
	lzgqjns1FNeYd+zGmfZnP2zNcV0Hxoipq+Id1EgfjModWgbUufeY+I7SwNOQCDJSCk093Ah2ur5QG
	NHADZAVfOk/l7/zCRf9uz8MO4834nemcWv3XzKkDzVPgSyHXvsGYAaLp2PgdsYnZX6QCfskCUKJD8
	vMjq8mclAQ6mMrw9STPft1j9k/rHBAt2YeelBeLeVLNN+zrEH6XVjAKVj4eQJ+ns/JZA6r30yvuc3
	EFpe7Ph/RSyp8+nXq8kJH/xiNNyMjWvasnWpMM+pxwsdPFDepXOXcDMmfccJK3Dv4PIraJ33AwlWu
	BnV7/rLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v119K-0000000077n-16Sl;
	Tue, 23 Sep 2025 12:25:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v119G-00000000662-1TA0;
	Tue, 23 Sep 2025 12:25:30 +0100
Date: Tue, 23 Sep 2025 12:25:30 +0100
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
Subject: [PATCH net-next 0/6] net: stmmac: yet more cleanups
Message-ID: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042541_019701_7818826F 
X-CRM114-Status: UNSURE (   7.92  )
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

Building on the previous cleanup series, this cleans up yet more stmmac
code.

- Move stmmac_bus_clks_config() into stmmac_platform() which is where
  its onlny user is.

- Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
  simpler code in __stmmac_open().

- Move "can't attach PHY" error message into stmmac_init_phy().

We then start moving stuff out of __stmac_open() into stmmac_open()
(and correspondingly __stmmac_release() into stmmac_release()) which
is not necessary when re-initialising the interface on e.g. MTU change.

- Move initialisation of tx_lpi_timer
- Move PHY attachment/detachment
- Move PHY error message into stmmac_init_phy()

Finally, simplfy the paths in stmmac_init_phy().

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 111 ++++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  32 ++++++
 3 files changed, 73 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

