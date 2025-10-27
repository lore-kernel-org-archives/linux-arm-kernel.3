Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0E0CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9skiBEiGQB15Xf8ewaDaqFoR7GHDDojO7GWn8dVpnWE=; b=UhvJHEe0obPMtcAZ8htB6TL9lM
	1SZQdvb0J5KT4N+8rXdXa0CB3p5c0/fMhmbPagSCcMFMe/rex30pqhwvj4d1Rc2P8mY6TSdGXmDLj
	ts5mzZMTI1QMawtn3bqe333RRC8/tEGC3QX4SSEx9MDO08kLz9yy9bP8QLi5TGV2lkg0jXWjRCyf2
	rZgCrrwllcrp2d94UsHBEgVUmZI14t0KNiCdMXK5qxhfsuEBORCksdaYZ4IlMMeiq80PXCA1D3cP6
	Qzq12GnH5LdQooooon3q4lQjq+v/9uTwmOfCSUR3ch2BLVs3+/PxBV5x15EFv2E6chNzNdLmi6Oig
	g//7Smhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWR3-0000000Euw8-3yit;
	Mon, 27 Oct 2025 23:15:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWR0-0000000Euvo-2qNI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:15:32 +0000
Received: from pendragon.ideasonboard.com (85-76-17-108-nat.elisa-mobile.fi [85.76.17.108])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B3E17AB4;
	Tue, 28 Oct 2025 00:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761606821;
	bh=nt74lwe+3Mv9bENcEg2mAYvzZjiiGcAI05M14szMS90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMAQtSzhJqi1GityQRMFbCuLdSPNOIqwnMahLMnM+q2zx4fDiQMCBGCm3WRtIP6qy
	 Qx5Wx0gJ7YaOfR6yMiwePVwCBLdX19lg9MQ172RcfDF97QsC1IV8R062Nbsl0PgsFi
	 kJ0mMfmusAmdQlbL4YRk6jmdaHdimuZP7E/NhuI4=
Date: Tue, 28 Oct 2025 01:15:14 +0200
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
Message-ID: <20251027231514.GB24987@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_161530_956119_2C32A580 
X-CRM114-Status: GOOD (  15.67  )
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

On Mon, Oct 27, 2025 at 11:22:35AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> > I've tried to diagnose the issue by adding interrupt counters to
> > dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> > (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> > interrupts storm, increasing at around 10k per second. However, the
> > corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> I'll add to my comments earlier, because it may help you work out
> what's going on.
> 
> RGSMIIS will be set when the LNKSTS bit (bit 19) of 0xf8 changes
> state. RGSMIIS is only cleared by reading this register. So, something
> else to test would be to do a dummy read of this register and see
> whether the interrupt storm still has the RGSMIIS bit set.

It does. I then get

[   22.880935] stmmac: INTS=00000000 INTE=00001030

with the same interrupt storm. This is getting weirder and weirder.

-- 
Regards,

Laurent Pinchart

