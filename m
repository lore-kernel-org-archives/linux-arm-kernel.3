Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F5E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgxGeROhbjObWg7IAZzJgp1I3pE73spYexZUzz3i04M=; b=ksys4ig/LXaZOYdb3vxAvoXLmJ
	De8Nqqw2m3ZvPevOVGHozIvG8a7E+nHshJ/A+1ovNccbJwpmtHCdSWisrkMxEtT0nrDZfhhLlUjg0
	f5iF05H+41/ZY6F0xqkSgHu31EAnYWFqG5NJWjavMfICGRfR2/tzEYrE8+LQZCufbZVwH3hdKksn8
	aIPQDdp1aZVutR8yfhfMmVPSv9OIjXfO1jA/YEmGnaUq5XQ+p3kZbCs7/wXcIUdsGUSWfK+fsP4vZ
	3Ofw/edmpjNRmwHHmu+DmQG8vq284jzTuftCOMsBuUtERWiLNPTKM62pvI32N7KnIh9oEKt7M6xjM
	JbMEc1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDh-00000006Qvj-1SxA;
	Tue, 03 Feb 2026 10:01:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDe-00000006QuF-1zbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NgxGeROhbjObWg7IAZzJgp1I3pE73spYexZUzz3i04M=; b=VGc5SFjR2IMH+2UMj7VwRkHW/1
	QTPJlF2n8OgXBK6+TGUFuIvs2yWsqZvvvTz9cIPFPDPi1qh8ZBiUzyaoQxjEW7KMD3FbgBoeuuFoU
	gdNUyQmnI+uZnhaomMK34dUc3AXBjyhvxbAz+A5Gr9MDqBjJs1FozRkBSXOGSA2vf5QeqAvCn1Pnr
	m6bZbvfNGcugUjntXI8aAk9Id4uhu1+4I7Ed6BSV/naN1W/3yv04OvZXyjgSvp6DY1HBB4bxcvP5r
	vVkpode7InS+EnlubRm6qaGAxWAtfKX6Sb7Ph3gmbncu9ku0qW7CAmrDYD/Mil1qGGTeyvvcIm7wk
	/3Ainz4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36726)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnDDV-000000004wU-0IUy;
	Tue, 03 Feb 2026 10:01:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnDDO-000000004HS-3vmU;
	Tue, 03 Feb 2026 10:00:58 +0000
Date: Tue, 3 Feb 2026 10:00:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/4] net: stmmac: fix serdes power methods
Message-ID: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020114_536745_87A253ED 
X-CRM114-Status: UNSURE (   8.13  )
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

The stmmac serdes powerup/powerdown methods are not guaranteed to be
called in a balancing fashion, but these are used to call the generic
PHY subsystem's phy_power_up() and phy_power_down() methods which do
require balanced calls.

This series addresses this by making the stmmac serdes methods balanced.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 65 ++++++++++++++---------
 2 files changed, 41 insertions(+), 25 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

