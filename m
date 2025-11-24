Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136ACFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsszvakFMADLxt1ailSrb4YFGJxrr+DQEL8j+TCc3fo=; b=hj7jhArXUqV7RrINcRPqychd+K
	AQf0+Ji9NJ64fN7j2h3QxKuyyPG3NCFqbp0o8gm3947dkd3U2tWNoFHhNxBUdV6fRw2spfz4kXqtz
	OITBGVZ0vJxEniGpcaZ/pATbHF+kGzq2luJ5KAqjt+HCgrpfrQlBZOeCRjFev04mmaUhkheJOiOl/
	0M0qIPKxXo8/hgnqZvfB/s5tkyNBgValmj9OyRgK6M5eKHa7Wxe6BZKJv7I081Gh90NSAJGj4MY0f
	XXkBW+6kHJ7lgFQg7PgtoeKXPSF2ThNeIGDkBlVxzR3M7nEFwBeLyJgoDkimUoooIif0DNF+U+JUQ
	4FWfI0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSAu-0000000BID7-2IfV;
	Mon, 24 Nov 2025 08:43:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSAq-0000000BICd-48uS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 08:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lsszvakFMADLxt1ailSrb4YFGJxrr+DQEL8j+TCc3fo=; b=WoPfX9Uk8qnphiu8EMJ3Wlfh16
	fPLyXjYCpwt/dCPT6kNlprnhYXeKIRcWI5lhGA5SPVpmDY4zIb+SQNvHNwTY7q1amDotdwNRZhwxN
	XRWp2OiV7dOsu6nawrJm5uDsuE/Qg+77SskyUXygzsRmKeFn1MIdaJ3clWI9SMhZovhqHL7kUzk9p
	WfNK2S01Df+Xmvd4kwQQSpM6azjYTOP6sFMdetNhUpmSTj7HUF2mnA+LyLSNsvIUdWY1bxfsjEcRB
	ZFdOIpcz85N32G0iv8F/sSNWBrTGJI99SHb2i9oKctm/ypWRfLEP5uKWETLRfla8Tr1hJn6MGpEQh
	IgHOebmA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vNSAl-000000001TY-3flY;
	Mon, 24 Nov 2025 08:43:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vNSAj-0000000088I-3hgz;
	Mon, 24 Nov 2025 08:43:45 +0000
Date: Mon, 24 Nov 2025 08:43:45 +0000
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
Message-ID: <aSQawUazSYykHeT4@shell.armlinux.org.uk>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124001214.GI15447@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_004353_049997_8A8CA0E3 
X-CRM114-Status: GOOD (  15.57  )
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

Sadly not, sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

