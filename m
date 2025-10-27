Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4412CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m130Qo0Y8iigjjNkRA3S4eA9259yRdjbtxVqXk11giA=; b=coCmnSWSRkU8RN/qBWYHruiWFV
	yOdqqgIDsVGJI4UrGG2TuzKmrV4a93sXLeg/UvFlI1Gd+kKwWh84ZdEvalAn3rs8RLTWroV5DTFLW
	Gr2AajTHYuqvN0D/oO9017vHXVT2y2WZBugxO4z/Ab6fgLKviwrIIWyb9zTLqqFE78h7xKw84tT13
	/r3eBJBwxTSp/Arlf2IQ5fmCqgUUm8erNF+vhMPZju+cn1uuQ1LzZi9Gl9vsBD+c3MLx8oJy21NRj
	IIbCJAf90u2gYxht+F2N60HGGisKG1mRca0pOGYHend0QM4Mcz0Zu8DUsTESC6vIu7tvq8ezu6iZa
	6ap4FqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKip-0000000DgKf-0o2Y;
	Mon, 27 Oct 2025 10:45:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKin-0000000DgJb-16TJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:45:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-0006rM-Tt; Mon, 27 Oct 2025 11:44:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-005gp8-28;
	Mon, 27 Oct 2025 11:44:52 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-0039Jo-1h;
	Mon, 27 Oct 2025 11:44:52 +0100
Date: Mon, 27 Oct 2025 11:44:52 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP9NJHtbAEmsd89r@pengutronix.de>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_034505_301907_FFDD803C 
X-CRM114-Status: GOOD (  27.03  )
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

On Mon, Oct 27, 2025 at 10:34:35AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 12:31:07PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> > > On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > > > Hi Oleksij,
> > > > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > > > tx-timer configurations. I also confirmed this information from other
> > > > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > > > is needed.
> > > > 
> > > > That's useful information, thank you. Would you by any chance to know if
> > > > such NDA would allow contributing the feature upstream ?
> > > 
> > > Good question, but the NDA process was actually aborted. We didn't move
> > > forward due to a lack of time and ultimately, a lack of commercial
> > > interest from any projects or customers for this PHY.
> > 
> > Fair enough. I've tried :-)
> > 
> > If we can't disable SmartEEE in the PHY, does it mean we need to somehow
> > disable EEE in the MAC, but still program the PHY to advertise EEE to
> > the link partner ?
> 
> Or maybe the PHY needs to have EEE capability disabled?

Ack. With comment in the code, why we prefer this way, in case some one
wont to spend time on making it work. Probably SmartEEE or some other
word should be used.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

