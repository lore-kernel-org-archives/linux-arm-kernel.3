Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D45FC71155
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ovLz1bXOwuyb8LOC7DzxQcjGmyjM0gF1HJUD1277E/E=; b=NyVN69HmIy0U0KSKqSIEIT9QpK
	XfYwMbvIJYWltjw5CxBu4c/SCsIEsqacAlOYZ2tpcwlI1dyJyDaqcLf/ymt9l9QCNwU0abBek/dfZ
	wpgu+s6o5MvXfeVHDAozJnujY1w9aNlKPGJqn51ss5vmIi3vt4xHNc4kYg6OTMSRoadtsw6OrHOl/
	zYPPebqYwg9s1rOFa8TCPGXA40adxnDrRa7wcx+4X/iDl3CfBE+sGiU8zKnnkYnC2rTHnWsIlA7HU
	Ar9PuiHbwlKtIlcUQ1Sl+JtoiO6f1dczikrd4PMIcrVi3yjppTgte6nBi+DFUd5XTKZVW57G8+C0i
	zP1C8DvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7B-0000000EjUS-0d81;
	Thu, 12 Jun 2025 22:09:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk3A-0000000Dp44-0qUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ovLz1bXOwuyb8LOC7DzxQcjGmyjM0gF1HJUD1277E/E=; b=0pgm9N7kHgk7OBk8ajf/hV/MYm
	81fRtd8g0erMhPmAyoRZ47m9U30VPZRp8hqFxlGArohluP0+CO1LPc9Z4q96EYTrl0mLDe3MDfd0s
	DFXFCzS3G7AQforiMBlF+hf0Xlz/tSvVz5FhvcmMGUQHhN98GoCNp80biRzuMOSYUwWaR1Lpi4vBt
	hPUdhaP880Rz+Ny0Z2MT7+1cOtU0Jabkf6xS9up3vYdtADVHdHxa2eXdGrJ/FA+wWAjX7MEjfyJAq
	1M9c4np7ZJwpZZcArG7uUWDRxAtX0jgLanBpa5s80EW2Sdq88Hz6kV6qwTMNQp0Jx0okFUTCBpAAw
	O9pr/ypg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58594)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uPk31-000837-1j;
	Thu, 12 Jun 2025 16:40:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uPk2w-0000uM-0f;
	Thu, 12 Jun 2025 16:40:54 +0100
Date: Thu, 12 Jun 2025 16:40:54 +0100
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
Subject: [PATCH net-next 0/9] net: stmmac: rk: much needed cleanups
Message-ID: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084108_237009_E6469FCF 
X-CRM114-Status: GOOD (  16.80  )
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

This series starts attacking the reams of fairly identical duplicated
code in dwmac-rk. Every new SoC that comes along seems to need more
code added to this file because e.g. the way the clock is controlled
is different in every SoC.

The first thing to realise is that the driver only supports RMII and
RGMII interface modes. So, the first patch adds a .get_interfaces()
implementation which reports this for phylink's usage, thus ensuring
that we error out during initialisation should something that isn't
supported be specified. Note that there is one case where there are
a pair of interfaces, one supports only RMII the other supports RMII
and RGMII, but we report both anyway - something that the existing
driver allows. A future patch may attempt to fix this.

Rather than writing code, let's realise that there are two major
implementations here:

1. a struct clk that needs to be set.
2. writing a register with settings for RGMII and RMII speeds.

Provide implementations for these, Also realise that as a result
of doing this, we can kill off the .set_rgmii_speed() and
.set_rmii_speed() methods by combining them together - indeed,
this is what later SoCs already do by pointing both these methods
at the same function.

Overall, this patch series shrinks the file LOC by almost 8.7%
by removing 175 lines from over 2000 lines.

Apart from the error reporting changing and restricting interface
modes to those that the driver supports, no functional change is
anticipated with this patch. However, I have no hardware to test
this.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 689 +++++++++----------------
 1 file changed, 257 insertions(+), 432 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

