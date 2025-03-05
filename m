Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCCEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Px9Jz3Pd0I8Y7Fz858xKtuZ+TcOz0/7LpltAItOKKMQ=; b=bsZ87uBPWG+jC1Dv/M8XkO96UT
	aBlN6idrsyasbzPxn2g2j/LkY22UcstyZ7VHAN1lrRz8mwXApibH/ytGJo/6LVUK1SS6p7Cd4BuTM
	aBsWq9JK6l+/3B/ecmt+2B93gdU2utxeyOIICT+V/CjQDxZOprFSBIJOLZZwr8IZc0siC9WZu0RdF
	24r1TKlKDTwT22TAZj9vSBlFWy2UoC4wAsfy4iCqgNxCB+vyWNW5/L6JfY2vjHwCWDmFQpR4+2DfY
	5oIaZT26uooym2knhgF9vTPN9OExzBx7bzFBozzEo6l1yjm9TmnFwG45bsbFJlvALzbEcz8erKF7W
	15McJayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt6k-00000008sFt-3m7u;
	Wed, 05 Mar 2025 18:04:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt2o-00000008rc5-37ro
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Px9Jz3Pd0I8Y7Fz858xKtuZ+TcOz0/7LpltAItOKKMQ=; b=ziP+c6Rhe1jcgsh/J48ZLSgYEr
	yXbif+ag+SrRv/jbcc4Eu41tem7vBX+R6ll6sS7LJkP6eexbhTu5TyukH9boDuRgi9IQEvC24Tl6c
	lIGK5UTFBuj5v0EFhz976kQrP9dxqfmLD0cpZS772/HBPuTXyATCznn2/KEnu7CWMec8i7N7eo8qv
	wam7BJlJkjZ3Wip4Otsc41ywrGel8goj9rnqO35I3WTufuIgE9vgJE7jeyMfwWiUXwJe+oRihnZvK
	0N7znjSUBZmUw5GXUf7FhFsscEosuT+H5hnKhe5gkyCB84M4quabjNadkyegPTC1CWsrusGWndnE/
	R2FO08/Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39552)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tpt2d-0004gX-3D;
	Wed, 05 Mar 2025 18:00:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tpt2Z-0005xy-2E;
	Wed, 05 Mar 2025 18:00:19 +0000
Date: Wed, 5 Mar 2025 18:00:19 +0000
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
Subject: [PATCH net-next 0/2] net: stmmac: approach 2 to solve EEE LPI reset
 issues
Message-ID: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100034_780363_B89CAF84 
X-CRM114-Status: GOOD (  12.29  )
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

Change from RFC: drop unnecessary first patch.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ++
 drivers/net/phy/phylink.c                         | 50 +++++++++++++++++++++++
 include/linux/phylink.h                           |  3 ++
 3 files changed, 56 insertions(+)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

