Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC22D49C92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XN4B7N6jTthrzUlh3IQWK+1+cvph40kSm2rN+Qhn608=; b=Q7AK/mhf7SssO09w7iPSY2c6/5
	9hLx/Vnp0tGUsSwxY9w5GjCmSkm7i+ku+xQQs9P3g5E2J83/A/NnS+mQ7of2TR3g2xK8dtm0wydpD
	v6XL7ivLoT3hpALc2GscRDLjPPykHQvablu9xoopZVgf1xKUwOt4fAjCf50cFh9eDXJp3pC3rPp+Q
	dD6RaOIv34Ft5NziYb6gV749lVhffEkHNpKcV6MdxR7YVtMtLH4zH+N/mr9hzaL2/6u9JYrmS4Hhe
	7fTOQO4KThr5sk/PP6UG3tLmK2GGE4PTRtnF1M+XyA5hAeBqWsf8dz0fQ/Lujau78CcMZGErPGIcA
	M8wS/gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmEZ-00000001LXt-0t8h;
	Fri, 30 Jan 2026 11:00:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmEV-00000001LWo-35ge;
	Fri, 30 Jan 2026 11:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XN4B7N6jTthrzUlh3IQWK+1+cvph40kSm2rN+Qhn608=; b=m9IBieYrNIGvGUs0CO/p6v01i5
	nXGNQ5Y8M3uq2veCfShMMo8HinSSiQq7zftoz3xbBVbuwCxUHKVxLdy6jy9RIcK4iYaoWV4zvLFmu
	S61uqtd1ch05FemkjtCyPG26264YRw2nHtMFG74xr2d0dPJTuDKQeY03cUv6gI2o0RCam3G5bHqDP
	1oq1IrxRtLss3Hxrkv46GxIzuFWLAJg3Aai6AMSFZeZ0U4f4fTmRo5N7+t2+/d9RMPJpg9Kl2TXh7
	sG5T+10UGUk9b+c6oPAt+DA1inpA7Sk0/cTlWnPiOvQlI0jUOxQeANaKDjo3evtt79r4ShVFMjuDq
	gMx92bUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42890)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlmEJ-000000000wn-0lQE;
	Fri, 30 Jan 2026 10:59:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlmEF-000000000Ri-0zl0;
	Fri, 30 Jan 2026 10:59:55 +0000
Date: Fri, 30 Jan 2026 10:59:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/10] net: stmmac: rk: cleanups v3: mode and speed
 for most
Message-ID: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_030012_049552_E39911A9 
X-CRM114-Status: UNSURE (   6.21  )
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

Third installment in the rk cleanups, this converts the interface mode
and speed configuration for most RK SoCs.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 846 ++++++++++---------------
 1 file changed, 345 insertions(+), 501 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

