Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34C2CF64B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zvehfl65MP5JLPqg2Zeleos6p4Xa/AzMzTqiQPPMq/g=; b=KuAH2+NbxR9KiDNertcM2n/Bti
	GH4TJS5HIm0otJNN+2O9ohGxzyjtBD+vyJkJhTAa0hbf/bkdq0TnwKWsfPHuRku/q7eHD6O5oDJZS
	F/V+piTmym07+EwT+EhRkn2xhDmvlUm000aglDDPUfyvUhj6f0MJ9+3e9PfBNZUtDQKXHCevhhdJE
	pfRdqKkyhDx1HG1SwNvIrnFc81Ev1Sp/KLhCSUfA1Kusib4fnozIdgv03o1UefaxmYD+0uNNI60YV
	ST3KpoDeyDtgWRQG08aP1ur+S95zm2RINCdp5NC1EJP+L7Bde+3pRzFh1cekc7ZRTohHreX3Wjl9f
	DnMSTyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkNV-00000009RTX-0kGP;
	Sat, 22 Nov 2025 09:58:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkNS-00000009RSz-32Qd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zvehfl65MP5JLPqg2Zeleos6p4Xa/AzMzTqiQPPMq/g=; b=KrbzvBi2JbmmW81oFDDegm1Qro
	/SHhZ7VyrTxtzbx6hq9qqaOOiRbC9HTyNp0za8yoqnTnunVWUW/2Hh1gB1sAhrBjrgJRWuHMCrzjQ
	bVoqA1Wzec0SC8GGyNeUou7NxNsTFzrLs4W3p1OfCgUvHdco0WKiNguGK+stk++ANbEORqUUlZXcK
	WvJfX6YdtfjQ1oatvSnTC8TJFbN4g/RWvELBrjk4HAnYAiMqNjsfeEywQUuYreimMKikXkQa1pWNt
	KtekbFMAfIing2ZR3lIM5PA7nI6kjPzJ4zGbIl+nn1mxFqViCdlsASagGjETEXTe6o8su532ZtaTu
	ytghGrjA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50242)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMkNL-000000008VD-3hPV;
	Sat, 22 Nov 2025 09:57:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMkNJ-000000006EY-2EJT;
	Sat, 22 Nov 2025 09:57:49 +0000
Date: Sat, 22 Nov 2025 09:57:49 +0000
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
Message-ID: <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
References: <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122072246.GA16239@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_015758_788144_6B377CB0 
X-CRM114-Status: GOOD (  21.94  )
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

On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> Hello Wei,
> 
> On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > Sorry, I only have a little experience with DWMac, add Clark to help look
> > at this issue.
> 
> Thank you.
> 
> I think we're getting close to having a good understanding of the
> problem. I've debugged it as far as I could based on the information
> available publicly. Let's try to get to the bottom of this issue, it
> impacts quite a lot of people and it would be very nice to fix it
> properly in mainline.
> 
> The short summary is that I'm experiencing an interrupt storm on IRQ 135
> when EEE is enabled with the EQOS interface.
> 
> My current theory is that
> 
> - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> - The issue is triggerted by the PHY exiting LPI mode
> - When it exits LPI mode, the PHY restarts generating the RX clock
>   (clk_rx_i).
> - The MAC detects exit from LPI, and asserts lpi_intr_o.
> - Before the CPU has time to process the interrupt, the PHY enters LPI
>   mode again, and stops generating the RX clock.
> - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
>   registers. This does not clear lpi_intr_o as there's no clk_rx_i.

Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
see whether that changes the behaviour.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

