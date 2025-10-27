Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC951CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pv8A1uaol1pXhXlEzwlZylOOOHmbfINSrfrlQpNBrE=; b=mGIGzyG3GVRc6H3jxFz35eqj3w
	1bJhwENfdvKB8RLian8cyonIf8m0MpSJ6d1pg/MLVVwr7Y+CbsBMWdUHjoGIs27plnxdebh/OKJ3P
	FhhRfIKzQJWtQkN/13VhnoPv8318xvOUTnzkSX6+v4eV7I+2iTMoiiCLc3Vz+OQ3FTAjbZHpMjWgr
	Y2Jp6TKQ2SrxKbDYI2y01AgzCh+b/GH1aQn1IEqLang2sdrdy2h9CpyE5vbcXk3gy9afAcp72CzeS
	RIigTdFfv0s7rAuSTfbMCjqjUj17X/I25sfJ+DZVBNWMgEzTWL742okaQv789f8rGmF0DsOhqAln2
	XIfX3Ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKYm-0000000DfcS-3GlA;
	Mon, 27 Oct 2025 10:34:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKYj-0000000Dfc1-1vSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2pv8A1uaol1pXhXlEzwlZylOOOHmbfINSrfrlQpNBrE=; b=VkGJT2xMm4mV63P3Z5APqJBmUK
	5SmgKPNHcNUllwMtYaHt+EjjEgMiqbw4GlAYrlxrqCfzxEGd0NMdiPukDzUimg2i7aILfivL0PlaR
	h/XkraUjkU6K/IclhcD2TJ65YP9ap7KH2sSAcle4R7TTaX6iIg04PkrdjQBBcmdp/hrmYPGeuTxvD
	C737tp8IOQq961DZCwJlja9FaDlg7KRyIGEgrD5np6mE8svwmAwGo+wmDlU/GFBQ00YBsKJWseHKT
	2dktN116tmP5OSHvidk4IIZ5yLv/5Rie1scHImvxijZpAa+mg7DGvgYYxeCOJa7hAcYwwNFbcHYbM
	sQgZDm/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54936)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDKYf-000000001fT-20pN;
	Mon, 27 Oct 2025 10:34:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDKYd-000000005VL-3cpb;
	Mon, 27 Oct 2025 10:34:35 +0000
Date: Mon, 27 Oct 2025 10:34:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
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
Message-ID: <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027103107.GF1544@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_033441_520395_B837320B 
X-CRM114-Status: GOOD (  18.97  )
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

On Mon, Oct 27, 2025 at 12:31:07PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> > On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > > Hi Oleksij,
> > > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > > tx-timer configurations. I also confirmed this information from other
> > > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > > is needed.
> > > 
> > > That's useful information, thank you. Would you by any chance to know if
> > > such NDA would allow contributing the feature upstream ?
> > 
> > Good question, but the NDA process was actually aborted. We didn't move
> > forward due to a lack of time and ultimately, a lack of commercial
> > interest from any projects or customers for this PHY.
> 
> Fair enough. I've tried :-)
> 
> If we can't disable SmartEEE in the PHY, does it mean we need to somehow
> disable EEE in the MAC, but still program the PHY to advertise EEE to
> the link partner ?

Or maybe the PHY needs to have EEE capability disabled?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

