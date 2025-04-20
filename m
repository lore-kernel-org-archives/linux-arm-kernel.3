Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B1EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 03:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpRePgu6lYjX/4PgRTAapCk41X97l+0jmBU+FXItmSg=; b=A8OwFwD7y6pBG52KVXrOuNp7xS
	p3UfpLPuygHx8i4cCcdvQuL4dxEHCm4rtB/0lMUl7vNGWHER0uPAcEb+Ii3VQlieeTYDjOyG/BoLx
	ThtH5blDfk7KNtvYwghBO1A5vVzaZ2dJpJ04TVftGdNcrfsS9A1IvW4SA2huNz+wQrZvfPkAFylId
	+1FATENcZHwrJxrNwg5KSw0KIUGWhAziXEQ/Pfg9zdDrcdvIjMHy0Rif2fw8zDFWXVLFBsIgf3uD6
	qdJ/94DDJ8z0YO1Js6FmJCV5/dUQoH3Lj4UbImdKhivWU5LdS4pdBU4TpHLuMzeRA8KtwbRlAbqA0
	ROzhC2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6L0F-000000027RT-11lj;
	Sun, 20 Apr 2025 03:05:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6KyL-000000027JV-0ui5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 03:03:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K33rRw601982
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 22:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745118233;
	bh=RpRePgu6lYjX/4PgRTAapCk41X97l+0jmBU+FXItmSg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pVZ7H1Q4mB0F3t9im3eSSle7kTqvAk7Tu2y1tPvwq7ejuVc4NiwyDlt5QSLl+QklY
	 L2lzTC0yOStK0Ftoig2nUemh0iGhUgjpqtzeojEfB2GrifOHaklol7z4iTD1+WU8Lw
	 S1rzsSgP0p0qm9+Vc298NfJ2xi4B5svx8lN0cBGI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K33rxa011196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 22:03:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 22:03:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 22:03:53 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K33pKN059505;
	Sat, 19 Apr 2025 22:03:52 -0500
Date: Sun, 20 Apr 2025 08:33:51 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j7200-main: switch to 64-bit
 address space for PCIe1
Message-ID: <231e009e-0dc2-4876-b052-d11b64ee5a0a@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-3-s-vadapalli@ti.com>
 <8b707fbc-9d82-48d0-a227-366d4e83e8a7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b707fbc-9d82-48d0-a227-366d4e83e8a7@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_200357_345836_D8ED305E 
X-CRM114-Status: GOOD (  24.29  )
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

On Sat, Apr 19, 2025 at 11:35:50PM +0530, Kumar, Udit wrote:

Hello Udit,

> 
> On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> > The PCIe0 instance of PCIe in J7200 SoC supports:
> > 1. 128 MB address region in the 32-bit address space
> > 2. 4 GB address region in the 64-bit address space
> > 
> > The default configuration is that of a 128 MB address region in the
> > 32-bit address space. While this might be sufficient for most use-cases,
> > it is insufficient for supporting use-cases which require larger address
> > spaces. Therefore, switch to using the 64-bit address space with a 4 GB
> > address region.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > index 5ab510a0605f..e898dffdebbe 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > @@ -759,7 +759,7 @@ pcie1_rc: pcie@2910000 {
> >   		reg = <0x00 0x02910000 0x00 0x1000>,
> >   		      <0x00 0x02917000 0x00 0x400>,
> >   		      <0x00 0x0d800000 0x00 0x00800000>,
> > -		      <0x00 0x18000000 0x00 0x00001000>;
> > +		      <0x41 0x00000000 0x00 0x00001000>;
> >   		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
> >   		interrupt-names = "link_state";
> >   		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
> > @@ -778,8 +778,9 @@ pcie1_rc: pcie@2910000 {
> >   		device-id = <0xb00f>;
> >   		msi-map = <0x0 &gic_its 0x0 0x10000>;
> >   		dma-coherent;
> > -		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
> > -			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
> > +		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
> > +			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
> > +			 <0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
> 
> Sorry for novice question,
> 
> with this change,  How do you see  old EP working which supports 32 bit
> addressing,
> 
> or some translation is possible ?
> 
> 0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>
> 
> to
> 
> 0x63000000 0x00 0x08101000 0x41 0x08101000 0x00 0xf7eff000>

I didn't understand the question completely, but I shall try to explain
the changes being made which might possibly answer your question.

The ranges property for PCIe is different from the one for other
peripherals and is defined as described at:
https://elinux.org/Device_Tree_Usage#PCI_Address_Translation

With this patch series, the PCIe downstream devices - Switches, Endpoints -
will be assigned IO/Mem regions within the 64-bit CPU address space.

IO and 32-bit Non-Prefetchable MEM regions have the same PCIe Bus
Addresses as before which fall in the 32-bit PCIe Bus Address space.
It is only the newly added 64-bit Prefetchable MEM region that falls in
the 64-bit PCIe Bus Address space.

Please let me know if you require further clarification.

Regards,
Siddharth.

