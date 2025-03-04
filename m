Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D628DC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HcV5lQ7x+LEiGJklba2pLXleYozVURaZeAXXeJEOQ4=; b=UdBkah5aDcXzmc6RlqJJVrjSyE
	EJAor34rsHeunULy7Ywk2VvaQxL0ZPpFx5kmoTwiSE6B5WJomTHDjkQYN8LyRoTBKEhbQcTVcBv5Q
	sPIKd13lV5VVaSiAlKgTM1bwIWbgsNOT3XuGv3qAX5SED7AcGjVLQ7zOnrdSejf5x8SUJCMhqV12P
	qWu2bf51G6jzuzWoeQC8ugSWWzN3WiAg5bz8o6GrPnGKdiyI0mixsft6+IAwWEfi5tSyxr8gsX64V
	XtyJuZ352UXmPDEjeIbaAA2PpJa9bWvN21NEXulRumiw3F9RAVKAzKQ7HOlUs1f4zHn2pxK1H1hUh
	iB/WPnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4s-00000004Whc-2m66;
	Tue, 04 Mar 2025 12:08:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPvx-00000004Hdw-0KAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2HcV5lQ7x+LEiGJklba2pLXleYozVURaZeAXXeJEOQ4=; b=qCIG+mvdWJAgyvByTMC/wU6eAn
	utt46qOaRF/vgmX9D7Z9COGpU4nZrZB8H5rQCXo331GBzKtBu8IwAvT+EqLbkTxpg1J0SSw7J2JSp
	J4TNrIshIYA7sMUG+E8EQ/fK86xSkEHLP/2cgr4HBBi1p+7ZHrbg98Rae7arroAI12mwZmzNnKWmL
	vNwxq/Dpy1WIdPG5ASL6uavEvgDtjGzk5pXECfS6w8rzjtwimKCWj1eif8QtesFBxBKjLSSEkvE8p
	pQYDbGyuyaysH3Wj25s3OoRywiDCLgJiL4M3rTR/ITKg6y3nS2qHEedvCPs2NeppKGwIj8VovVVD7
	pmc75hUg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43106)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tpPto-0002UN-29;
	Tue, 04 Mar 2025 10:53:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tpPtl-0004jJ-1G;
	Tue, 04 Mar 2025 10:53:17 +0000
Date: Tue, 4 Mar 2025 10:53:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 0/3] net: stmmac: approach 2 to solve EEE LPI
 reset issues
Message-ID: <Z8bbnSG67rqTj0pH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025533_115831_2292ECF1 
X-CRM114-Status: GOOD (  12.55  )
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

This is a second approach to solving the STMMAC reset issues caused by
the lack of receive clock from the PHY where the media is in low power
mode with a PHY that supports receive clock-stop.

The first approach centred around only addressing the issue in the
resume path, but it seems to also happen when the platform glue module
is removed and re-inserted (Jon - can you check whether that's also
the case for you please?)

As this is more targetted, I've dropped the patches from this series
which move the call to phylink_resume(), so the link may still come
up too early on resume - but that's something I also intend to fix.

This is experimental - so I value test reports for this change.

As mentioned recently, the reset timeout will only occur if the PHY
receive clock is actually stopped at the moment that stmmac_reset()
is called and remains stopped for the duration of the timeout.
Network activity can wake up the link, causing the PHY to restart
its receive clock and allow reset to complete. So, careful testing
with and without these patches is necessary.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ++
 drivers/net/phy/phylink.c                         | 54 ++++++++++++++++++++++-
 include/linux/phylink.h                           |  3 ++
 3 files changed, 59 insertions(+), 1 deletion(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

