Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9504ACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 03:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAeOHfgUT6r3fiFo8cNAJVc1VqoNbWb3MuAwo4bKF7o=; b=IK3chy0TaUnvg8lhEETqMsdhDT
	dkx1jFcVEFMopaUHVrqDIA9CdEb/hhZSzZ3yPlZr15YtHevvyEIgnAxMmNlT+/qy/GMBUQMNPQFuP
	e6ViPL1pXjldieCT4ScNwHphHkPV4UV5gqoYtOTMXc5ekzqoXVGKpMNBlQJIUD2vZ2tt/9ScdcO6l
	g7Gh2H1mh2mThm8GhcUZHXm8YG91yZp+Stp1s6lerBkqYT0eGpxrQVr0G0s6k1HfsYkOp71qm86Xz
	TcJmn7S+L7Ekp+9qIz4ig5T30xhBycZ8Hq1o0S8b2gx+cGsGWV8/iPz3TXVrVC1+ZxBn82o/auCO6
	S+zIBczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDbG-0000000D2je-3DJG;
	Mon, 27 Oct 2025 03:08:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDbE-0000000D2jE-0OFc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 03:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GAeOHfgUT6r3fiFo8cNAJVc1VqoNbWb3MuAwo4bKF7o=; b=vwHQJ2Sow6ozOIG3NRmCoT3bQe
	kL1rU1HzVMODq/Poeh6tfjRENi4Cu1dLqft2bED6DT8SCsksDMUGMHE+PrC3pd6tjDuHyz1yxNIcj
	7nm1nbn2oAIusdRxdt3JNol5btUtk49BffMeeScg6S/hr8+Ws6jLZtZh7SdZ+c6qkvDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDDb8-00C9V7-Qu; Mon, 27 Oct 2025 04:08:42 +0100
Date: Mon, 27 Oct 2025 04:08:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
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
Message-ID: <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_200848_134264_C9FC963E 
X-CRM114-Status: GOOD (  21.50  )
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

Adding Russell King

On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet.

I believe for DWMAC it is a synthesis option. However, there is a bit
indicating if the hardware supports it.

The PHY should not be able to trigger an interrupt storm in the
MAC. So this is likely to be an DWMAC issue.

Which interrupt bit is causing the storm?

> What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense)

It does not make sense. EEE is split into two major parts. The two
PHYs communicate with each other to negotiate the feature, if both
ends support it and both ends want to use it. The result of this
negotiation is then passed to the MACs.

It is then the MAC who decides when to send a Low Power Indication to
the PHY to tell the PHY to enter low power mode. The MAC also wakes
the PHY when it has packets to send.

A quick look at the data sheet for the RTL8211E suggests this is what
is supports.

There are a few PHYs which implement SmartEEE, or some other similar
name. They operate differently, the PHY does it all, and the MAC is
not even aware EEE is happening. Such PHYs should really only be
paired with MACs which do not support EEE. An EEE capable MAC paired
with a SmartEEE PHY could have problems, but hopefully the EEE
abilities and negotiation registers in the PHY would be sufficient to
dissuade the MAC from doing EEE. But i would not expect a setup like
this to trigger an interrupt storm.

	Andrew

