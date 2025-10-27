Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C6CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NScEPCv2D/W9CpG1hBsXHwMu7iAESr+WlOwWBMmMSw=; b=xcaOZd4OsBmWs+vraiMEjpNpKJ
	KctUDJ6XyABLrl1Mbet/3MIsqWiiB/F8aI8N77IRAcU8CfzHfSJBnRiJfSqZreYhPigktpphgQByx
	y8cw1L9hVLfoW5BurVKpQLr6FpRhuvnyPby210urQO2BjfOlFpVDRAWsQgh2gRmTBtZOWjPDZ/nx7
	sdq6Z+RItjpn0MOZBI5ibtqemmoGgPh4NTZIbvcCcUlDR+jwi+Ca5xOEXWTidHyiQva0qyOhZbBMn
	Ak01/2m6hiENvSBoHQ8jDMxg+yjkENdNYlUXgm0DmLorqSZyzK8kM7dYyeivOz/TFbsyhPqsGxDmS
	ktMr+Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWKP-0000000EuX4-0Ve1;
	Mon, 27 Oct 2025 23:08:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWKM-0000000EuWj-3oiL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:08:40 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EF60C735;
	Tue, 28 Oct 2025 00:06:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761606407;
	bh=ELYpA/QT7AVDHwBCO8Rf3+oLxXv3ePZYdYKb8rWchmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTKw6iE4ZpIJ68K2EMtJD4eOa0FMqjsAyfW3kDqU4MENQEZLXtIc4cAZD+Tb9KyH6
	 lbtGVjA6Xfupo32TB0uADmRVMbavdO5MmiiBBNzj+3D9Ex5w4VI6om/u+YUTz5hNaV
	 B5ooezfihbuElzN8wzvPgTEy5XsFGbai2Y28OopU=
Date: Tue, 28 Oct 2025 01:08:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
Message-ID: <20251027230821.GA24987@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <aP88KO8uVrEQlmMm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP88KO8uVrEQlmMm@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_160839_090398_0B650F2C 
X-CRM114-Status: GOOD (  25.82  )
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

On Mon, Oct 27, 2025 at 09:32:24AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> > I've tried to diagnose the issue by adding interrupt counters to
> > dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> > (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> > interrupts storm, increasing at around 10k per second. However, the
> > corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> This is a change in the PCS series rather than the EEE series. It would
> be good to narrow down whehn this problem appeared for you.
> 
> The RGSMIIIS bit set without RGSMIIIM (0x00b4 bit 0) shouldn't result
> in an interrupt storm since the status will be masked. That doens't
> mean that RGSMIIIS won't be set. So, at this point I'm not worried
> about that.
> 
> Can you print the intr_status and intr_values in dwmac4_irq_status(),
> maybe something like this:
> 
> 	static int ctr = 0;
> 
> 	if (ctr++ >= 9996) {
> 		printk("stmmac: INTS=%08x INTE=%08x\n", intr_status,
> 			intr_enable);
> 
> 		if (ctr >= 10000)
> 			ctr = 0;
> 	}
> 
>         /* Discard disabled bits */
>         intr_status &= intr_enable;
> 
> which should avoid too much noise during "normal" operation. It'll
> print six consecutive interrupts every 10000.

I'm always getting the same values:

[   62.638187] stmmac: INTS=00000001 INTE=00001030

Now the funny part. I get about 20 of those messages printed to the
serial console every time I press enter, and rarely otherwise. Typing
other characters in the console do not trigger the messages.

> > I ould suspect that the LPI RX exit interrupt is the one that fires
> > constantly given its name, but I'm not sure how to test that.
> 
> You can check this because the LPI interrupts have statistic counter
> associated with them. ethtool -S should give these, look for
> lpi_mode_n.

# ethtool -S eth0 | grep lpi
     irq_tx_path_in_lpi_mode_n: 32
     irq_tx_path_exit_lpi_mode_n: 32
     irq_rx_path_in_lpi_mode_n: 2512
     irq_rx_path_exit_lpi_mode_n: 2508

That seems reasonable.

-- 
Regards,

Laurent Pinchart

