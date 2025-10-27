Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF8BCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIRS+LFSEl2pP7BA1HaGu6uS2VfHoQaGzQTmnGo7rVk=; b=FADPH3yFhv1cspoRBIeSXLPwLk
	RbCy/Ixf6K3Z3yW+XgN8R2LlW7emFWc71TVFPnULsLUuh7aX5jpp7ZQzFvOYG+7qHan+V84kYlgC4
	csQ9yBruKmNaYdbaa/RlvG1Zog/rRsr4+9LV77N1q9s2FkwLJb7Rp/M4WHMST+Uh/ujLksaViwHLQ
	3Dmjt1doX3Lw0pdGvnaMNdI2H1mPUSuzDKZT53u9wJmFfx7OIaIn9MVT8Z4jLz20P13OH7yxWJbdb
	LXpE6BVOXj9FzkBIgWcA2cb7MRnfYF3GwtawqkgIo0gGOFvuXlhdgHHImlBb90wjjYs02YUr4sajT
	/z0nP5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOZ0-0000000EA5B-352N;
	Mon, 27 Oct 2025 14:51:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOYv-0000000EA4M-1U0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:51:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYg-0003Tf-0O; Mon, 27 Oct 2025 15:50:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYf-005j1D-1r;
	Mon, 27 Oct 2025 15:50:53 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYf-003DTB-1K;
	Mon, 27 Oct 2025 15:50:53 +0100
Date: Mon, 27 Oct 2025 15:50:53 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP-GzR_pVvXvCIn-@pengutronix.de>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
 <aP9NJHtbAEmsd89r@pengutronix.de>
 <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>
 <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075109_392157_3D2AD096 
X-CRM114-Status: GOOD (  25.90  )
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

On Mon, Oct 27, 2025 at 01:50:21PM +0100, Andrew Lunn wrote:
> > > Ack. With comment in the code, why we prefer this way, in case some one
> > > wont to spend time on making it work. Probably SmartEEE or some other
> > > word should be used.
> > 
> > So we have options.
> > 
> > However, we need to get to the bottom of what caused the change of
> > behaviour before we start throwing solutions at this.
> 
> It also seems like the PHY is FUBAR. If the standard 802.3 EEE
> registers are being used, a management plane is using them to
> negotiate EEE with the link partner, the PHY firmware should disable
> SmartEEE and only provide 802.3 EEE.
> 
> It sounds like this PHY is not 802.3 compatible.

I do not know better place to post it, so I add it here for archive.
At least, it explains a reason why EEE fails. Something like this is not
possible to handle on the MAC side. At same time it is hard to
diagnose:

In 100BASE-TX EEE mode, the link partner may drop link or loss packet
when the local MAC/PHY (device) starts to transmit the “Wake” signal
immediately following the “Sleep”/“Refresh” signal to exit Low-Power
Idle mode and return to Active mode.

Many EEE PHY link partners require a short “Quiet” (Tq) duration after
receiving the “Sleep”/“Refresh” signal. Without this short Tq wait time,
that is not specified in the IEEE 802.3az Standard, link drop or packet
loss can occur.

https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/Errata/80000708B.pdf

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

