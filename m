Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1C2CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YfBK4n0wWB/Jm9ZCnUsE9rT7T1v2cn5hTq2qLk9fVo=; b=tt8wKQPOFrYMboDEaU5aBEQujA
	IdZLYRAm7nWD/7GUv6+8kQBem7LMSWhZRfYuC3G7IS9dCzoKomiXFc0KW1H7yFbt6UsAbyC3fPuS3
	m76695A5TFjA2xmJG/JxZ97ykgYH2ons8d9HO5A14o/hzW7rBbhhtZo53adU5heJYy/NZ1iloDvOX
	hZ+a2ru8x9kQYcWAmsksbbkhurHMC4OhsTLhM9/9GnQJY8EV3DP7HqkvtIy7kc5sxtmENuItXqYpV
	vx+xZjIEfmXJ74SJPb8FBZHwOVs2b8ayDlkmW84nMyH82YlLEzIS6f0n5Gf5pveOTHeAP/TGSyhz3
	5lv8HJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHeC-0000000DH4l-3Dg8;
	Mon, 27 Oct 2025 07:28:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHeA-0000000DH4H-0fko
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 07:28:07 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 962CE1122;
	Mon, 27 Oct 2025 08:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761549975;
	bh=nV6mjljtSiqp1HDPBtXcTVzwk2D3tvRV9nQU+7XBJ2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/ZdOlT5pqjrSSr8mGMqlLVyFDVB8mvVJmQNs0n4GGcTLtszoJp1/WUvmltIeLksE
	 BZg1RRavIm2Q4tFIonaQil3eJqc7ui+MiSAry9TAM1N2RevWiGsNWNxioBhcMHqnJX
	 LP5ln83vjsBB3j31BV2BB5IRbp4lKG2jc6oZAL7Q=
Date: Mon, 27 Oct 2025 09:27:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, devicetree@vger.kernel.org,
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
Message-ID: <20251027072749.GA7811@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_002806_339326_8AE47DA6 
X-CRM114-Status: GOOD (  37.45  )
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

Hi Andrew,

Thank you for your quick reply.

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

That's where I hit my first wall :-)

I've tried to diagnose the issue by adding interrupt counters to
dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
(0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
interrupts storm, increasing at around 10k per second. However, the
corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.

The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
four interrupt sources:

- ENET QOS TSN LPI RX exit Interrupt
- ENET QOS TSN Host System Interrupt
- ENET QOS TSN Host System RX Channel Interrupts
- ENET QOS TSN Host System TX Channel Interrupts

The last two interrupt sources are themselves local OR of channels[4:0].

I ould suspect that the LPI RX exit interrupt is the one that fires
constantly given its name, but I'm not sure how to test that.

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

Thanks for the explanation, I read documents to try and figure out how
it worked and didn't find such a clear and concise high-level summary.

I'm not very experienced with ethernet, but I can easily test patches or
even rough ideas on hardware.

-- 
Regards,

Laurent Pinchart

