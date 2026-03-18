Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB7B10775FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IgmHv1W2xff5lyiQbHV+n4Yse37UxYTbZx0k4RwQlNE=; b=YwS17kWzICtlPSxCTzsfvfWPep
	mugEN0iyJVeQ0FYthMosQeJptQOTjMdahvnMj9ySmfRZfDsJfBEB52i956TuK8c/bK1uEJamKw8rq
	YpqxZxQ5tTEh4lReP1+caawuworinO5QoLO1PVpxwN0GqnsGq0rA0291Z/cDwBoK0ClIvxCmx66rl
	1IUl8qvMF3BiZpua4yqg7TISDqciCZALmQS9MvqWVOHaINwMTh6rhl7gzsbsBpFuArbMYzrYw2nuc
	YmOn5xBZFWpyWXNJXq9XSbaowFedHr2QnPw2W6DwQ1qD2TwlTVwrvcweslOs+XTBrAMhRvZeBN+9F
	/BgMQYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vb8-00000009ACH-11y6;
	Wed, 18 Mar 2026 18:26:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vb7-00000009ACB-2ZY6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=IgmHv1W2xff5lyiQbHV+n4Yse37UxYTbZx0k4RwQlNE=; b=Y3okm1H6tmnWVl088oxDNPxY/p
	Lj24/n8to1TeZAb02btPx00Uss0YsEe0t1OpZZxi6M6U/Fs7beleQyJOzzqvr99i7/ZXog2Ctio6A
	zpvRV15dnyfHp9olI4RJzRATKGYvMUUgSrCy1WvEcCVzCNz3n56RgHs5y6L9A5MfTTYe7PEuOPutz
	aLmOebcPhT0B5qd/GP/HOcP7tXH3TJVLZORJR+YB6YlB3WrLQVzm1ST1rsm7IrxRP+DbMuJxPVr7h
	6PK535MyRwkM7Kx5rEHM/sSMKDL456DcCXv6BJmDZQdOMgVQWG4VRFlbjp/zxKafZV8rJXbDNbYfb
	X6RbGyqQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vb4-0000000C1TN-1k7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IgmHv1W2xff5lyiQbHV+n4Yse37UxYTbZx0k4RwQlNE=; b=MGDf90YMO1+FhI2NwjaX+6K3ZR
	dkMnyqDAtrgXGwTUPHlT//njb7PtlDfEYStx9317lfMMNTVZuKZpX1sGGHZLGkgTobqaHkb9fPN1o
	qWzohUrv4aQ90HKcRIEf+bslEXfB0ideBcEjHCtJP3ck3ltgc37JMmUPnyXGTxZ/oLaVCnHk8/cqD
	jX90SF5hlXu16fywJhkzJ33QDmr5OVLEfePHcowM5iLI+B40UeHyfPwP1K1riKdrwLDzsrLJnx5Ja
	dbDiMptugqEQ5Ht8E9uzu8NlVqDHuO809nuYbYEDNfCnQFQlJDHJ6Axupw8QqKid67dXF/6bXCJ/5
	9qiZeMiw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44118)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2vax-000000003ok-2skG;
	Wed, 18 Mar 2026 18:26:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2vav-000000007IU-1OAe;
	Wed, 18 Mar 2026 18:26:13 +0000
Date: Wed, 18 Mar 2026 18:26:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/5] net: stmmac: descriptor cleanups part 2
Message-ID: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182622_543312_51FB50BB 
X-CRM114-Status: UNSURE (   8.62  )
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

Part 2 of the stmmac descriptor cleanups.

- rename "priv->mode" to be more descriptive, and do the same in
  function arguments.
- simplify descriptor allocation/initialisation/freeing
- use more descriptive local variable names in stmmac_xmit()
- STMMAC_GET_ENTRY() doesn't get an entry, it moves to the next one.
  Describe this in the macro name.

 drivers/net/ethernet/stmicro/stmmac/chain_mode.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  12 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  12 +-
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     |  20 +--
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  12 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c    |  21 +--
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   5 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 152 ++++++++++-----------
 11 files changed, 127 insertions(+), 117 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

