Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E399C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulp8a8DtV9v/QZgEovMYLZ19IdqN55Jlcj+vlPw2eL0=; b=P5JeqwPZt22u/PXCK9zZ6/RBHh
	zGtxf+iemLfw2ReTUJFoJ7Ds/JdWy2vENngcrTciperqxIZS+hrWtGwkpWzXh32n51XaB6wlH58qr
	rmvgKhg2dqRUOyy3cGNWlNtqjPyCGanJA7PFt9UaEXikA7SmranhK5q9urZdDqabjoQ0vKYmfnp63
	NmjLj8oxwQD7lIqZ7Xw8WuPPANdtDeHv7zxBDK1nSjqsFpVsqKxiAQjjPrimChwToOo6/hC6cMFPF
	kpSukRwhLdTe8hv384rlr2nTBAzbL04qERR3lYAv9zru0ZjVL7QGmvw5LJwyWtgrOSOA0Pk6XWViM
	al9bZ30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpuR-00000003sG9-0ToR;
	Tue, 11 Feb 2025 13:02:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpHs-00000003kxP-3xlU;
	Tue, 11 Feb 2025 12:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39729A402B0;
	Tue, 11 Feb 2025 12:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE2CC4CEDD;
	Tue, 11 Feb 2025 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739276567;
	bh=4K8z8+aPyeTQjXPiAwW/jC9wdrJjdLUvKNE1gq5BkA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQPvXg1KkJtQWn8OkwbQBFy4BC94aSKTUgHnrO12Ryg/0uJHHEzFeSZJq0ZIyYojX
	 vXmjhyNYsTC18XK+FTrxKfsCwD6k9nkDihstrcUbVec8YMM1PPyBQNI/fGTuDDq22m
	 554LY6+UBma+SrHeljagbISwqvOCy1xb3ZMSN4BmN2+y+tHiDiLdyXo66qFIBMzt3A
	 B+vlvUfGHlWfCtT8TGJ3VKLlvnDmRS4trFQRKv0pcNYZjoWR9Q1vXcnc2kbfwoiWhT
	 WERq9sapIx+PRz57TA7CMRRE7pk/jcijNb2SfikO8OtfqK+tIgsItctxlFzGcJq2JS
	 3efbYz6E7b5cQ==
Date: Tue, 11 Feb 2025 13:22:42 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Patrick Wildt <patrick@blueri.se>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, robin.murphy@arm.com
Subject: Re: [PATCH] arm64: dts: rockchip: adjust SMMU interrupt type
Message-ID: <Z6tBElUDaPNgkaIf@ryzen>
References: <Z6pxme2Chmf3d3uK@windev.fritz.box>
 <25203566.ouqheUzb2q@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25203566.ouqheUzb2q@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_042249_108795_6B9C2C2A 
X-CRM114-Status: GOOD (  21.68  )
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

On Tue, Feb 11, 2025 at 08:40:25AM +0100, Heiko Stübner wrote:
> Am Montag, 10. Februar 2025, 22:37:29 MEZ schrieb Patrick Wildt:
> > The SMMU architecture requires wired interrupts to be edge triggered,
> > which does not align with the DT description for the RK3588.  This leads
> > to interrupt storms, as the SMMU continues to hold the pin high and only
> > pulls it down for a short amount when issuing an IRQ.  Update the DT
> > description to be in line with the spec and perceived reality.
> > 
> 
> Cc'ed Niklas
> 
> This should probably also get a
> 
> Fixes: cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php IOMMUs")

Agreed.


> 
> > Signed-off-by: Patrick Wildt <patrick@blueri.se>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > index 8cfa30837ce7..520d0814a4de 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -549,10 +549,10 @@ usb_host2_xhci: usb@fcd00000 {
> >  	mmu600_pcie: iommu@fc900000 {
> >  		compatible = "arm,smmu-v3";
> >  		reg = <0x0 0xfc900000 0x0 0x200000>;
> > -		interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		interrupts = <GIC_SPI 369 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 374 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
> >  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> >  		#iommu-cells = <1>;
> >  	};
> > @@ -560,10 +560,10 @@ mmu600_pcie: iommu@fc900000 {
> >  	mmu600_php: iommu@fcb00000 {
> >  		compatible = "arm,smmu-v3";
> >  		reg = <0x0 0xfcb00000 0x0 0x200000>;
> > -		interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
> > -			     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		interrupts = <GIC_SPI 381 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 383 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
> > +			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
> >  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> >  		#iommu-cells = <1>;
> >  		status = "disabled";
> > 

Patrick, thank you for the patch!

FWIW, they have the same bug in downstream:
https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr4.1/arch/arm64/boot/dts/rockchip/rk3588s.dtsi#L2761-L2783

However, the Rockchip PCIe Virtualization Developer Guide correctly define
the IRQs as edge triggered:
https://dl.radxa.com/users/dev/Rockchip_PCIe_Virtualization_Developer_Guide_CN.pdf

Looking at the ARM SMMUv3 architecture specification:
"An implementation must support one of, or optionally both of, wired
interrupts and MSIs. Whether an implementation supports MSIs is discoverable
from SMMU_IDR0.MSI and SMMU_S_IDR0.MSI. An implementation might support wired
interrupt outputs that are edge-triggered. The discovery of support for wired
interrupts is IMPLEMENTATION DEFINED."

Thus:
Reviewed-by: Niklas Cassel <cassel@kernel.org>


Heiko, this patch should go to 6.14.

Side note: We also have another SMMU patch that should go to 6.14:
https://lore.kernel.org/linux-rockchip/20250207143900.2047949-2-cassel@kernel.org/


Kind regards,
Niklas

