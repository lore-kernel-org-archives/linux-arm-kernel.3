Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959BACFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08g22nr12SGt1AMC1UScMdDYRZ8GFxl1IyYsNJMcbEk=; b=MqEUt5Bt2/GpBQwVguRfZKBQaj
	xCqff7qBMESxgHa2Ufbbql7OpF58K7af+0rl4gLrqRmdYdC6FInIXcx/xbetgqMAcfA7v93sZ8w30
	Wrjgr4m/yLgKWsG0O8lh/l+uFrQudnxCdiuUShfK7x2ZsTqHFVIcoivXlXfPvoyJ7dVLAv/eRstTz
	d0rfFV93ubLQZ+zqCtBLHcsBo3IcKpteJCMeeIppf3gNZA45GfOAx4bLs+fHL927JAIBhrJZBbGmA
	8qyo7q3YExCAXiYjYnGSGlXfIYthYIy2iZtCacKWcxiDTJxFznHZjw8xqJHp9PEtS1Mpf8sxw9O2h
	c3ildkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5pI-0000000AHO9-3KPx;
	Sun, 23 Nov 2025 08:52:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5pG-0000000AHNa-3iXV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=08g22nr12SGt1AMC1UScMdDYRZ8GFxl1IyYsNJMcbEk=; b=pnoeNTFYDtS4uizYE1TPiZFfYv
	f/u0SWkdsnAHZna7A23UyrlfRXJRjv6Q2IK2g5/GARBjf4u1HCd0eiAXa7oe+snQ1Y6Q/mahtaWAe
	/StrZ1wKMjb14xjrDzbpE39PDymsGs16AfmM8iZa29roKUYUBvO069lcj/pYBlrSEHHqC90dbjOs3
	/FuULFhUVnRYTfSOAVDKkZgcScHJOhtsAsYEKcJeGByNUCUCeGfr0m8YmqR20WiXsGLD0E2Zsoajd
	MJIol+qkPpJsTFgFaABOQvVW65sSYowJHUUhayEBORwiIclZqu2SjT4yECkONn2Sp5FBsdalkGmbp
	M/tIOwhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51102)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vN5pC-000000000la-0TJi;
	Sun, 23 Nov 2025 08:52:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vN5pA-0000000079L-2FWx;
	Sun, 23 Nov 2025 08:52:00 +0000
Date: Sun, 23 Nov 2025 08:52:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
References: <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123053802.GA25329@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_005206_954276_E358B80F 
X-CRM114-Status: GOOD (  36.10  )
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

On Sun, Nov 23, 2025 at 02:38:02PM +0900, Laurent Pinchart wrote:
> Hi Russell,
> 
> On Sat, Nov 22, 2025 at 09:57:49AM +0000, Russell King (Oracle) wrote:
> > On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> > > Hello Wei,
> > > 
> > > On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > > > Sorry, I only have a little experience with DWMac, add Clark to help look
> > > > at this issue.
> > > 
> > > Thank you.
> > > 
> > > I think we're getting close to having a good understanding of the
> > > problem. I've debugged it as far as I could based on the information
> > > available publicly. Let's try to get to the bottom of this issue, it
> > > impacts quite a lot of people and it would be very nice to fix it
> > > properly in mainline.
> > > 
> > > The short summary is that I'm experiencing an interrupt storm on IRQ 135
> > > when EEE is enabled with the EQOS interface.
> > > 
> > > My current theory is that
> > > 
> > > - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> > > - The issue is triggerted by the PHY exiting LPI mode
> > > - When it exits LPI mode, the PHY restarts generating the RX clock
> > >   (clk_rx_i).
> > > - The MAC detects exit from LPI, and asserts lpi_intr_o.
> > > - Before the CPU has time to process the interrupt, the PHY enters LPI
> > >   mode again, and stops generating the RX clock.
> > > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> > >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > 
> > Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
> > see whether that changes the behaviour.
> 
> I have tested that and it worked like a charm ! I have submitted
> https://lore.kernel.org/r/20251123053518.8478-1-laurent.pinchart@ideasonboard.com
> 
> That was quite an adventure. Thank you so much for all your support, I'm
> not sure I would have managed without you (or at least I would have
> needed way more time). I really really appreciate it.
> 
> If the above patch gets accepted, we will probably be able to remove the
> eee-broken-* properties from the i.MX8MP device tree files (and possibly
> from i.MX8DXL and i.MX93 as well). I have mentioned that below the
> commit message of the patch, with a test procedure as it should be
> tested on each board.

As stated in reply to that patch, while this may reduce the severity of
the storm, I don't think it'll completely eliminate it.

I made the suggestion to set the flag as a test to confirm whether the
lpi_intr_o is indeed the problem by ensuring that the receive domain is
always clocked, and thus ensuring that the signal clears within four
clock cycles, rather than an indefinite period should the remote end
re-enter LPI mode quicky.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

