Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF2CED260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZHtYuYxvWqbVVfivkjXN2yF2dYFsIpwehTqtsa5taOc=; b=ug/D/9oBQZ2iieepEkzjVgyBCQ
	o/yH8EVA7gZxtm04OakKKa7qo4goz7L+13uOQOMwiR0kAyw2pc1EW+Fr1D60ovEPY1U6aP5SyCURP
	4hbxecpe2aAec3Dr+kPVohV7eqwdP33mC3eh7RpN7wcRgyku4sXh7xKuCM01AWPpaQ73k4c9JWk/e
	o0jK1QguRbc4e49dkDSf1YpXb2Upk5X4SFXFzm5FzZmBWNFD1hGA/goIXrcTqAA2SgIdJqw4Dwv0O
	AEOd/r8eMjvgwW+cHtCtWYiJDbxQe9bWXWSKRIOdnNw0x7SPdcLTb+DdwI9TbuE2C7tQM8qVmcNet
	bGpXqIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIVe-00000000CR2-3U4W;
	Tue, 18 Nov 2025 10:00:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIVb-00000000CQL-0lb4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZHtYuYxvWqbVVfivkjXN2yF2dYFsIpwehTqtsa5taOc=; b=wXCPvy19LVshAa4rOzm6Eu7c1v
	qKbcCfAZparxO4aSBWG29gShzC+P/5T4Q5+lretIYqoY/yxPCvZkOJHEsYSLlK222UF32OuBywoGh
	5Vn7vci+LECxTe2mBJUez4eJCCGeWO2kUQncKX3r5B4af0Nq/PZ6mEuJPZxJv/h1gyJH/dvocVZ2g
	rc6saTB8D36f9EGU6z6pMRXoUd+xDdPoEw7LIleLcq7elOknljK/NanH3DNY8kwLP08jUNq24vbyP
	rL1qTRuY6F5LpDaT50ZqDiXgciGGtVI+HWzx6qrrClJrBLlAl6pMFXbc7miGBgEbClkYAAHlrapjQ
	nQiKBsVQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39436)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLIVQ-0000000031R-44Py;
	Tue, 18 Nov 2025 10:00:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLIVN-000000002Mv-0OUs;
	Tue, 18 Nov 2025 10:00:09 +0000
Date: Tue, 18 Nov 2025 10:00:08 +0000
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
Subject: [PATCH net-next 0/2] net: stmmac: sanitise stmmac_is_jumbo_frm()
Message-ID: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_020023_227948_A373DB9A 
X-CRM114-Status: UNSURE (   8.08  )
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

stmmac_is_jumbo_frm() takes skb->len, which is unsigned int, but the
parameter is passed as an "int" and then tested using signed
comparisons. This can cause bugs. Change the parameter to be unsigned.

Also arrange for it to return a bool.

 drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 4 files changed, 10 insertions(+), 16 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

