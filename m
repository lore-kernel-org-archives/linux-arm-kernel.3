Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67456F30934
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLqOtinWYSGM7LLpbdtcUGl5b2uewU4Gn9qu8F0GxHI=; b=P6vU6l1lVY9y+9Tu4GnltSpvWo
	z/fnOZT06i3zA1xWPJCnLnnoPvetHOSEwxbdjqJE0ygf9NOrR1Ce1Wh5C7hCO9UONLgZACsYVl+YV
	hQ/U6e7fGiL7PCF/hF6MHhLo3MCydFH8C2L4e0VsQYScrl7SALhH927uxN6bzu7+39PFlBt3hKc1p
	WIfWfIhzZmKkG222lw1MOZQNV50PlM1X+wZDdV8722eu+ltMM0r5gw20vGdWEkOLwP93x+NGIS+4u
	in8zKI+22XXrZSLYM3553W+H94NGZ7gcgrPkxTRlXTPIhuI0pNkG7Tp5nWK+TNEzV7J6nd9DYj2vN
	heZIasfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy69t-00000001bGp-0tJi;
	Thu, 05 Mar 2026 10:42:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy69q-00000001bG9-2i6C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pLqOtinWYSGM7LLpbdtcUGl5b2uewU4Gn9qu8F0GxHI=; b=iJJGGxyxGi6rE9avorUz8+G4zD
	XzfLuzfcOFUoZ7V2iTr8P0jqFxMiSvbkCktTXfwmz++G3Z+aV+KZ+zu3U7phwNDEvRGmx64tys+pD
	FtxIJNCx1ysqD4Pic4jxabzp+XHauo5PVr+V/vVxuCYs7XNI8u/KfjC8ffG2Dy+xR6PfQ+Q5jFnZa
	vJk8zEp3FxyxryPIV4ufenc75fFNfotiDG3GYd1fqU1LnMjatdWYZiazbJPTvSpz4QhaZ7X24sozL
	qItEBfP25MlKSfTDs3XHUrU5cB4iIejxFnW8qPweupDITAgcvPXOeCmrj4zVnMq7zdbPCRultQEXb
	nTUNIRFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49742)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vy69f-000000007mO-3CbM;
	Thu, 05 Mar 2026 10:42:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vy69c-000000000OV-0L7q;
	Thu, 05 Mar 2026 10:42:04 +0000
Date: Thu, 5 Mar 2026 10:42:03 +0000
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
Subject: [PATCH net-next v2 0/8] net: stmmac: mdio related cleanups
Message-ID: <aald--qJquWGIvmO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024218_987728_438009C3 
X-CRM114-Status: GOOD (  10.72  )
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

v2:
- add comments about 300MHz to commit message in patch 1
- fix incorrect usage of stmmac_sun8i_csr_to_mdc in patch 3
- fix BIT_u32()->BIT_U32() in patch 8

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

