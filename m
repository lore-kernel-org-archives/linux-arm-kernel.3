Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F3CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJVtEAuk3/CNwNFQ4HMHaFZFkvXI0+CNhZAJobLEJus=; b=UHxGA4uOx3qcYbyP4kjkZqMs/I
	igkXO0s6uES4GzeMB0nJ+q6CM7Qe2DC2QhAfaF/SqB15phkamw2cTLIWTd+oeNgrfYJM5zhB3tP/a
	w5eRC2LaZV/XixiaO2dcJYK9635er72Cs6avM+HAKeVBdVGgiyTOded3/SDyEnwDUKlpneBVc7UkX
	McwL4kq2ZIwZu3m1FoVPPKfeIK7eJTEZdfZxqXhAniLzgAdpaF/t5l2572DWp65fghErkhNzoOqv3
	N+YJg9BP4p5r6/cC72x8tQFU+g/FTnUm3q1M5VxPkZJ2EpGIahpMgUMnmcUsVwaJZx8ddD5fH8Dxl
	uJsgWW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHCH-00000004hc3-1IIt;
	Sat, 16 Aug 2025 13:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unH9g-00000004hOV-3gXr;
	Sat, 16 Aug 2025 13:41:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0CC1691;
	Sat, 16 Aug 2025 06:40:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31C473F5A1;
	Sat, 16 Aug 2025 06:41:05 -0700 (PDT)
Date: Sat, 16 Aug 2025 14:38:13 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] arm64: dts: allwinner: a523: add third usb2 phy
Message-ID: <20250816143813.77551ff2@minigeek.lan>
In-Reply-To: <c7468189-deee-449f-b7d0-fa1830ca88fc@kernel.org>
References: <20250816084700.569524-1-iuncuim@gmail.com>
	<20250816084700.569524-3-iuncuim@gmail.com>
	<c7468189-deee-449f-b7d0-fa1830ca88fc@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_064108_963009_9A7881E3 
X-CRM114-Status: GOOD (  23.66  )
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

On Sat, 16 Aug 2025 11:31:12 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/08/2025 10:46, iuncuim wrote:
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> > 
> > It seems that there are actually three usb2 phys in the processor, which
> > makes it incompatible with D1.
> > The third phy is used together with USB3/PCIe combophy with DWC3
> > controller. In the BSP code, the third PHY requires a separate glue
> > driver, but it seems that it is not needed.
> > According to the BSP code, the third phy does not have a reset line; the
> > only reset is declared in the DWC3 node, but none of this is documented.
> > Since sun4i-usb-phy driver requires a reset, I added RST_BUS_3 here.
> > 
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 ++++++++++++-------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > index 6b6f2296b..e4ed4fa82 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -503,22 +503,27 @@ usb_otg: usb@4100000 {
> >  		};
> >  
> >  		usbphy: phy@4100400 {
> > -			compatible = "allwinner,sun55i-a523-usb-phy",
> > -				     "allwinner,sun20i-d1-usb-phy";
> > +			compatible = "allwinner,sun55i-a523-usb-phy";  
> 
> 
> That's potential break of all users. Also, having third phy (so
> additional piece) is not making things incompatible.

Yes, we would want to keep the fallback, to allow newer DTs working on
older kernel. As the Linux driver is implemented right now, it's not
fully compatible, since it ties the number of PHYs to the compatible
string - but that's a Linux implementation choice, not something really
related to the binding. And as I replied on the driver patch, that
breaks anyway, and I think we can change it there to preserve
compatibility, and make everyone happy: newer DTs on older kernels,
older DTs on newer kernels, and all working within the kernel's
capability.

Oh, and it looks like there are whitespace issues in the patch ...

Cheers,
Andre

