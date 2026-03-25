Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9C0109C05B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L649BGHfzjPeUOm873tBDJOzKxxjacvMmrNB1ND0NY=; b=SIMObqJaCDGQA/Fe/I940LVWn4
	km+jkqF9yxReYHjbo4ilQUB7XZBN+9vllEcEr4CUcRmVTZtA1t1Q5Z784ztoNvPYcIxa2fS1yhia8
	woD82O0uboAh+DfAO6VC11T+ku2wA/w74IEn5EYTdRB/loQfUCsPlFxh6nvtrwUFGdVOSiJYdOAoW
	fM+RGQlfnZJxWa+armAbXWWGJIsWC8pwFFZevmoXTGsZzCp1SeUiSc1YFE8oOttMdwgA2fm3LUe5L
	OWvUDKI962qyHX/BXuiZaz1wk5Te9bgdAtiqmMkymbySC/VSZq3qCxKhIkzWqXXlV1NWWdD0Lsdyo
	tVQ4z3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5V1c-00000004E1L-1AF8;
	Wed, 25 Mar 2026 20:40:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5V1Z-00000004E0q-36xJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 20:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/L649BGHfzjPeUOm873tBDJOzKxxjacvMmrNB1ND0NY=; b=mceejZKQu1r5osaBGGu8D5bmS6
	LlEGU+Kj4Gojb9WRVpB20EU9bwop0rMed2nI16rOt/8R/YDM0mFc+tazI99PdrL+KjH3ypxVY/16a
	8NCVmvUtAcSYtTsC6D6H6ftl2pxWHEom1saTEQNov3hl7aAhxwZf/a5nwLt/BsDvGCOU1SXXVngSb
	AA2je89k6Lecuk0X0Qc8XD7TROev9I9ilXzezAxsBhz2vjciDh1JY2vSClMzk6iJ4qIsxX/Rhpozj
	s+Y6bOijsUrxL2U/SF+NqpfWXJcBYz2srxbaceuWm9TbtLhYpl7YPy67P7QNnlG0Ao5kzefy2AGmm
	wKy7OD2A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33832)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5V1L-000000003s4-3MDN;
	Wed, 25 Mar 2026 20:40:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5V1I-000000006Lq-1xqC;
	Wed, 25 Mar 2026 20:40:04 +0000
Date: Wed, 25 Mar 2026 20:40:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] net: stmmac: provide flag to disable EEE
Message-ID: <acRIJMQSTt-N52C0@shell.armlinux.org.uk>
References: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
 <20260323093933.1785583-2-laurent.pinchart@ideasonboard.com>
 <acEOGMHfYsxv3GOk@shell.armlinux.org.uk>
 <20260323100801.GA1514659@killaraus.ideasonboard.com>
 <20260325201332.GA2670326@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325201332.GA2670326@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_134021_783989_A235D384 
X-CRM114-Status: GOOD (  31.81  )
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

On Wed, Mar 25, 2026 at 10:13:32PM +0200, Laurent Pinchart wrote:
> On Mon, Mar 23, 2026 at 12:08:02PM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 23, 2026 at 09:55:36AM +0000, Russell King (Oracle) wrote:
> > > On Mon, Mar 23, 2026 at 11:39:32AM +0200, Laurent Pinchart wrote:
> > > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > > 
> > > > Some platforms have problems when EEE is enabled, and thus need a way
> > > > to disable stmmac EEE support. Add a flag before the other LPI related
> > > > flags which tells stmmac to avoid populating the phylink LPI
> > > > capabilities, which causes phylink to call phy_disable_eee() for any
> > > > PHY that is attached to the affected phylink instance.
> > > > 
> > > > iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> > > > along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> > > > to the receive clock domain, and takes four clock cycles to clear, this
> > > > leads to interrupt storms as the interrupt remains asserted for some
> > > > time after the LPI control and status register is read.
> > > > 
> > > > This problem becomes worse when the receive clock from the PHY stops
> > > > when the receive path enters LPI state - which means that lpi_intr_o
> > > > can not deassert until the clock restarts. Since the LPI state of the
> > > > receive path depends on the link partner, this is out of our control.
> > > > We could disable RX clock stop at the PHY, but that doesn't get around
> > > > the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> > > > 
> > > > Previously, iMX8MP worked around this by disabling gigabit EEE, but
> > > > this is insufficient - the problem is also visible at 100M speeds,
> > > > where the receive clock is slower.
> > > > 
> > > > There is extensive discussion and investigation in the thread linked
> > > > below, the result of which is summarised in this commit message.
> > > > 
> > > > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Closes: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > 
> > > As you are sending this on my behalf, you need to add your s-o-b after
> > > mine:
> > 
> > Oops, I'm not sure how I missed that. Sorry.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Should I submit a v4, or can this series be picked for v7.1 with my SoB
> added ?

I don't see it in patchwork's pending queue, so yes please. Don't forget
to specify the tree in the subject line:

[PATCH net-next v4 0/2] net: stmmac: ...

which may be a factor in it not showing up.

It's worth keeping an eye on:

https://patchwork.kernel.org/project/netdevbpf/list/?delegate=123371

about 24h after submission in case of any issues.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

