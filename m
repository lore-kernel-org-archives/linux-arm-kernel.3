Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7++QsH5bawr7XCDAbjJoXgzd3HDYqk6XSr6YwDduhrQ=; b=rueMEwh+YfgZP84j8d+TN7nl2w
	LEIb5I8bv0wG91jDAqxOs4qezTgfNV8eJwRvK0T64ycH7kggZ/KtSDz8Z9VRlt1eSUOvQ69syALRL
	+9vqy2Rys4JeKrT1cTmLcy6UXNiRLvVeMWi/SClSjEXPtQ5riNLd3Zp9QIyxWGNqakN9S3/YABzHe
	BfF0njWZJL5kzTP9KiBsb7im6qbfGk3oqKqS1EctcfhbmVF8k3a9lAaCCuUKZnkkI15EPIq0fKBrq
	ocjh8hFg8Q1LSlAfRZh2jpM//wk7mBusCEuIt7Jh0vo0s3otKtMaTCsy3CkWHk3jdjVFTypAZdEsO
	X2orQSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJHE-0000000DUyJ-2H5W;
	Mon, 27 Oct 2025 09:12:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJHB-0000000DUxU-0XLn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:12:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-0002bL-Sy; Mon, 27 Oct 2025 10:12:12 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-005gDs-1z;
	Mon, 27 Oct 2025 10:12:12 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-00000003Szh-2FNl;
	Mon, 27 Oct 2025 10:12:12 +0100
Date: Mon, 27 Oct 2025 10:12:12 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <aP83bMDWCre7-Sjw@pengutronix.de>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_021229_188725_4E976FA2 
X-CRM114-Status: GOOD (  32.55  )
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

On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
> Adding Russell King
>
> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > devices produces an interrupts storm. Disable EEE support to fix it.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > The exact reason for the interrupt storm is unknown, and my attempts to
> > diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> > understand, the DWMAC implements EEE support, and so does the RTL8211E
> > PHY according to its datasheet.
>
> I believe for DWMAC it is a synthesis option. However, there is a bit
> indicating if the hardware supports it.
>
> The PHY should not be able to trigger an interrupt storm in the
> MAC. So this is likely to be an DWMAC issue.
>
> Which interrupt bit is causing the storm?
>
> > What each side does exactly is unknown
> > to me. One theory I've heard to explain the issue is that the two
> > implementations conflict. There is no register in the RTL8211E PHY to
> > disable EEE on the PHY side while still advertising its support to the
> > peer and relying on the implementation in the DWMAC (if this even makes
> > sense)
>
> It does not make sense. EEE is split into two major parts. The two
> PHYs communicate with each other to negotiate the feature, if both
> ends support it and both ends want to use it. The result of this
> negotiation is then passed to the MACs.
>
> It is then the MAC who decides when to send a Low Power Indication to
> the PHY to tell the PHY to enter low power mode. The MAC also wakes
> the PHY when it has packets to send.
>
> A quick look at the data sheet for the RTL8211E suggests this is what
> is supports.
>
> There are a few PHYs which implement SmartEEE, or some other similar
> name. They operate differently, the PHY does it all, and the MAC is
> not even aware EEE is happening. Such PHYs should really only be
> paired with MACs which do not support EEE. An EEE capable MAC paired
> with a SmartEEE PHY could have problems, but hopefully the EEE
> abilities and negotiation registers in the PHY would be sufficient to
> dissuade the MAC from doing EEE. But i would not expect a setup like
> this to trigger an interrupt storm.

Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
monitoring RGMII TX and MDI lines with oscilloscope and changing
tx-timer configurations. I also confirmed this information from other
source. To disable SmartEEE and use plain MAC based mode, NDA documentation
is needed.

Best Regards,
Oleksij

