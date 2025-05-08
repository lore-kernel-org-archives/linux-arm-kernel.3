Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8048C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDTh6xkMM8HQxsVT5/rBVpuKgI4QSLUTTTY/Sbbvo5Q=; b=eeTaYs+nMvvRV54zla7aaETp8i
	kx37Z96IMfCwJITs8qtIpg7Es2iszmWsAzMEBcZK/deFwJzMdZoI0lJKDgwbArm9wsYO3/TZikLVT
	JVbSf44kMiKdwfKb7B94ALCgXLPA8zPfaiCanheOm/T4GkfLK2/sSt36uNGv7NPYrIDLXhJosw/FH
	CZ002tCHuV2wGjAPdpjf9w27EEARaz5/kIEC3Wpa9tZmhOnNqBWjGLiWTkKplBGJ88te56qACwhS6
	6ZnAfug9As7aIIIYS80bghEhNbrHIgrXo5++80rc6PsAYksh6yOWUbPbxm8+dF46P0K4dNm1FMJXS
	/UhqqXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2N9-00000000x63-3bDD;
	Thu, 08 May 2025 14:37:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1ej-00000000p28-0cfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=JDTh6xkMM8HQxsVT5/rBVpuKgI4QSLUTTTY/Sbbvo5Q=; b=2C
	VR4VQ2M62NZxPSLLzrUzNUTFYv9AQDDuYnZtykMx5Wkgz7KgENeQqbaOZ3Tkvf3vIsYyee7AkfSPH
	qknald7sN5FwxwrNmN2hgWFZFR8SdW8BJGMAHQxrXO4rY6OD6gW9q0yEOtGgAGyo5cx2TJnPuERO7
	0q30G1rVlRaaAsA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uD1eZ-00C0VV-Ov; Thu, 08 May 2025 15:51:11 +0200
Date: Thu, 8 May 2025 15:51:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran Radenovic <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
Message-ID: <1281b9c4-ff94-4dfc-a531-45e3dbee3dfe@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_065121_184399_0FDC67B3 
X-CRM114-Status: GOOD (  19.16  )
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

On Thu, May 08, 2025 at 03:10:09PM +0200, Goran Radenovic wrote:
> Hi Andrew,
> 
> thank You once again for helpful hint.
> 
> Andrew Lunn wrote:
> > > > > +	phy-handle = <&phy1>;
> > > > > +
> > > > > +	mdio {
> > > > > +		#address-cells = <1>;
> > > > > +		#size-cells = <0>;
> > > > > +		compatible = "snps,dwmac-mdio";
> > > > > +		phy1: ethernet-phy@1 {
> > > > > +			reg = <1>;
> > > > > +			interrupt-parent = <&gpiod>;
> > > > > +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> > > > PHY interrupts are 99% time level, not edge.
> > > That is correct, but I am facing strange behavior, when I set
> > > IRQ_TYPE_LEVEL_LOW.
> > > My board stops booting at:
> > > 
> > > [    2.343233] Waiting for root device /dev/mmcblk0p4...
> > > [   12.638818] platform 5a006000.usbphyc: deferred probe pending
> > > [   12.643192] platform 49000000.usb-otg: deferred probe pending
> > > [   12.649029] platform 48003000.adc: deferred probe pending
> > > [   12.654277] platform 5800d000.usb: deferred probe pending
> > > [   12.659744] platform 5800c000.usb: deferred probe pending
> > > [   12.665089] amba 58005000.mmc: deferred probe pending
> > > [   12.670239] amba 58007000.mmc: deferred probe pending
> > > [   12.675185] platform 50025000.vrefbuf: deferred probe pending
> > > 
> > > I must investigate this. If You have any idea, You are welcome to share it.
> > Could be an interrupt storm. The interrupt is not getting cleared
> > because of something missing in the PHY driver, so it just fires again
> > and again.
> 
> After a brief investigation, I tend to agree with your assessment that the
> issue lies in the driver—likely the stmmac driver — which is outside the
> scope of my changes.
> 
> Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or
> alternatively not using a hardware IRQ at all and falling back to polling,
> as done in stm32mp15xx-dkx.dtsi.

Since edge is wrong, please use polling.

	Andrew

