Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F85C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z34HUMIhzyaBlycKqhDV99x6wJM5d6YY7KL/669ZsG8=; b=Dokatgx96+iGHemGQ+dGwXt7mB
	zrJnV/iy7HKjWnqhiDm4Sc9vV183R8jYdF9Esc4Zvj9UBYye2M+1ErhdfySAUUUJJbZDQupgHVUQT
	mKglgxVX8D6v2x7xCmPXzXBe6BRJbbnjfdEWq4NCoZsiy3mPvLEhDymWb8ELdIYa72ervGn6ljRZQ
	z9xy71SSOrQIDV8TMapbkF7Yo5c5OcHqP91w5J76hsDbePU4JF5bjfaIBKWdzoDALtYbPctTD59uZ
	J33h0Eo+yRNA+z7LPs+gKqT5Thf0PUTPPxG4rvALtjaeaQS86FW0FW2iy8zOwPkAmCQdgxI7fR6Sv
	+gmosM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRdV-0000000H9Mz-2rjr;
	Mon, 10 Feb 2025 11:07:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRPV-0000000H5q6-3YL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z34HUMIhzyaBlycKqhDV99x6wJM5d6YY7KL/669ZsG8=; b=NN0+SOSYZV+oT+iWN1rq4IgRz5
	fazaCYica3uF+0pW/+dZNAaU2scIF0g4lJlxOKB8vIwH71MOlPDZo7/Y8zJ8qqgfGSvLJxgaxAcBJ
	0p0aGb7qhP8Bdfek/dMbk3NlJOjgE723jH5klp7J+SdPOIVLfZupQNuQ6lwk5MVDxCyL4cKJIN3GP
	FNlsN4Nrpl9Ryr0ti93eJyBkZoERA7kmpG3roqprXUOLY6cmnrt4QkH0NNqz46hAVXyteN+uTFEpA
	LheIa35smPdvZKrTi6w6us5L/dhfYV2NSFRPnW5n9QmiebzcgeInN/E9PQbEDKnfc3j/B2VZZzedT
	O+PmBN6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33268)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thRPP-0006Uy-24;
	Mon, 10 Feb 2025 10:52:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thRPM-0007R3-1h;
	Mon, 10 Feb 2025 10:52:56 +0000
Date: Mon, 10 Feb 2025 10:52:56 +0000
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
Subject: [PATCH net-next 0/8] net: phylink,xpcs,stmmac: support PCS EEE
 configuration
Message-ID: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025305_890386_BB179260 
X-CRM114-Status: UNSURE (   9.09  )
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

This series adds support for phylink managed EEE at the PCS level,
allowing xpcs_config_eee() to be removed. Sadly, we still end up with
a XPCS specific function to configure the clock multiplier.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 --
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  2 +
 drivers/net/pcs/pcs-xpcs.c                        | 89 +++++++++++++++--------
 drivers/net/pcs/pcs-xpcs.h                        |  1 +
 drivers/net/phy/phylink.c                         | 25 ++++++-
 include/linux/pcs/pcs-xpcs.h                      |  3 +-
 include/linux/phylink.h                           | 22 ++++++
 7 files changed, 107 insertions(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

