Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70041CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 05:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkJjX8j4pXVkjhKwHSwvIvauoywJ7SvhOt9UzwQ767Y=; b=diYmf1udc/59x5WbFZiWSSWpxN
	/qn3Yxf8yPO/KVWjlt8Apd5lfkNDya++AgeNk3DInRsrft64XeHtGRnW9/QKKA0mCtVcYvAsUX7du
	mAP4rFQdqvVZ6F9S4N8mLzkUnD217Du53bS9OYgUFcIHNC2B6Bvs1d40nAKnrh/3ZSWshN+EOC+Dx
	MKZLARHrr/EQ7gOiXk24xCxau1h0Lyr3AI3V8BibjsI72X1LJd+ItGZH0jGmMEv2lsfRS4iQJKKds
	z47cuhDG4J8EgJzgd0mMlpmPWYIU7mzo8+TSu/Iz4g7qMz08/daDKhxOSYola/Em05apxtd0KKv1m
	BtatgHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPNB-0000000B7Wu-0Wvi;
	Mon, 24 Nov 2025 05:44:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPN7-0000000B7WQ-0pbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 05:44:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vNPMn-000393-DJ; Mon, 24 Nov 2025 06:44:01 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vNPMm-0026fo-1L;
	Mon, 24 Nov 2025 06:44:00 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vNPMm-003s7i-0p;
	Mon, 24 Nov 2025 06:44:00 +0100
Date: Mon, 24 Nov 2025 06:44:00 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
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
Message-ID: <aSPwoBC3NftJYtEh@pengutronix.de>
References: <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
 <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
 <20251123152356.GF15447@pendragon.ideasonboard.com>
 <aSNAP9G4cwRKvxng@shell.armlinux.org.uk>
 <20251124001214.GI15447@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124001214.GI15447@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_214421_266374_B1EA8CB2 
X-CRM114-Status: GOOD (  53.33  )
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

On Mon, Nov 24, 2025 at 09:12:14AM +0900, Laurent Pinchart wrote:
> On Sun, Nov 23, 2025 at 05:11:27PM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 24, 2025 at 12:23:56AM +0900, Laurent Pinchart wrote:
> > > On Sun, Nov 23, 2025 at 08:52:00AM +0000, Russell King (Oracle) wrote:
> > > > On Sun, Nov 23, 2025 at 02:38:02PM +0900, Laurent Pinchart wrote:
> > > > > On Sat, Nov 22, 2025 at 09:57:49AM +0000, Russell King (Oracle) wrote:
> > > > > > On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> > > > > > > Hello Wei,
> > > > > > > 
> > > > > > > On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > > > > > > > Sorry, I only have a little experience with DWMac, add Clark to help look
> > > > > > > > at this issue.
> > > > > > > 
> > > > > > > Thank you.
> > > > > > > 
> > > > > > > I think we're getting close to having a good understanding of the
> > > > > > > problem. I've debugged it as far as I could based on the information
> > > > > > > available publicly. Let's try to get to the bottom of this issue, it
> > > > > > > impacts quite a lot of people and it would be very nice to fix it
> > > > > > > properly in mainline.
> > > > > > > 
> > > > > > > The short summary is that I'm experiencing an interrupt storm on IRQ 135
> > > > > > > when EEE is enabled with the EQOS interface.
> > > > > > > 
> > > > > > > My current theory is that
> > > > > > > 
> > > > > > > - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> > > > > > > - The issue is triggerted by the PHY exiting LPI mode
> > > > > > > - When it exits LPI mode, the PHY restarts generating the RX clock
> > > > > > >   (clk_rx_i).
> > > > > > > - The MAC detects exit from LPI, and asserts lpi_intr_o.
> > > > > > > - Before the CPU has time to process the interrupt, the PHY enters LPI
> > > > > > >   mode again, and stops generating the RX clock.
> > > > > > > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> > > > > > >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > > > > > 
> > > > > > Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
> > > > > > see whether that changes the behaviour.
> > > > > 
> > > > > I have tested that and it worked like a charm ! I have submitted
> > > > > https://lore.kernel.org/r/20251123053518.8478-1-laurent.pinchart@ideasonboard.com
> > > > > 
> > > > > That was quite an adventure. Thank you so much for all your support, I'm
> > > > > not sure I would have managed without you (or at least I would have
> > > > > needed way more time). I really really appreciate it.
> > > > > 
> > > > > If the above patch gets accepted, we will probably be able to remove the
> > > > > eee-broken-* properties from the i.MX8MP device tree files (and possibly
> > > > > from i.MX8DXL and i.MX93 as well). I have mentioned that below the
> > > > > commit message of the patch, with a test procedure as it should be
> > > > > tested on each board.
> > > > 
> > > > As stated in reply to that patch, while this may reduce the severity of
> > > > the storm, I don't think it'll completely eliminate it.
> > > > 
> > > > I made the suggestion to set the flag as a test to confirm whether the
> > > > lpi_intr_o is indeed the problem by ensuring that the receive domain is
> > > > always clocked, and thus ensuring that the signal clears within four
> > > > clock cycles, rather than an indefinite period should the remote end
> > > > re-enter LPI mode quicky.
> > > 
> > > You're right. I've checked replied to the patch with the following
> > > numbers.
> > > 
> > > 100TX link, eee-broken-* set: 7000 interrupts
> > > 1000T link, eee-broken-* set: 2711 interrupts
> > > 100TX link, eee-broken-* unset: 9450 interrupts
> > > 1000T link, eee-broken-* unset: 6066 interrupts
> > 
> > Sadly, I think this means for iMX8MP, the correct answer is to disable
> > EEE completely. What I was thinking when I brought this up is as follows
> > and dwmac-imx.c can set STMMAC_FLAG_EEE_DISABLE for iMX8MP to prevent
> > the use of EEE.
> 
> I suppose there's no way to disable EEE in the RX path while keeping it
> enabled in the TX path ?

In case of 100BaseTX it may work, but not for 1000BaseT - I guess, it is
not worth it.

The other question is: will it work if SmartEEE is active?  If I recall
it correctly, your board is using RTL PHY with SmartEEE support. Will it
work if we disable LPI on the MAC side, but keep announcing EEE on the
PHY side? It will be good to test it as long as you have the reproducer.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

