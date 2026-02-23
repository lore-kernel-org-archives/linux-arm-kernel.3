Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4329BEC1118
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiud5CIg1Gq1ozSQKgPnHi3W17cUG3esBQJY/GT0Luk=; b=poKLIIryjtD20Y/hNFF9NQb2X2
	Wnb3g8YLZms+WdDFsubnpO8lJ+Lus2hhGWNlEmmtOXKKN+CojBf7L2SII02dQslN8eeFSkGvOkVsV
	ULgqpxYlDEUViXocH4M6PajzdAbx8BXjymREeSvZyy8xikGSpQP1m2R0nBMQ9IcOQQjqzcis7JV4+
	QcjQHg5mvmUz+XQYuh55mSPgO2gS1IgIG2ASVyVABRJakKpjLfmoFlrciVwQVC5daZPzhJ3jRgqtc
	VLZxG9IsqJk8gAa6AJLTcwxYAbXSlWo0feVZoDS2xEzjHw39rgLKL8XXXcoLkMQBoIpdRhM97/2UU
	oStBI+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaYI-00000000rLB-0kU4;
	Mon, 23 Feb 2026 18:21:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaYF-00000000rL4-3jRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F08CE6013A;
	Mon, 23 Feb 2026 18:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC46C116C6;
	Mon, 23 Feb 2026 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771870858;
	bh=Km5TB4a+OiHGQXNkXPphl5LAvR+/kNXwduKtPTQar9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNesqarXkUAoHz/fCehnWxM+JUI/pBhHUHpA87p8TBEMgubFbu6Be/nCzi/DTwO74
	 rfHjMDEpuuYZoGE1WnvKmGKn9iIy8W8ouDXjuRFhGb9hedZfQwBbVmCbhZsi1gsDC2
	 YHUHTyN2CGqkSdIwNAYyrCpMaCc9qKK+NPNWJQSKIHy2KLK+Sr0Ltw2YT+DaPB2RWR
	 7K5YG1m/qMjCTWJ26MlSGWmEyEAh4ZSUbmmwO+QGeiw1GXvE+lDjB4ThYA02Dr++lb
	 pEkxO9ZqLV5NvVhg7Kg9PiSa//Bv3n7keQxOm18o+uvpyxczWgeIxqIbRj9kH3y4GG
	 ++aidvAEwI/Tg==
Date: Mon, 23 Feb 2026 12:20:57 -0600
From: Rob Herring <robh@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nm@ti.com, ssantosh@kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
	Frank.li@nxp.com, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v5 12/18] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260223182057.GA4190282-robh@kernel.org>
References: <20260218095243.2832115-1-s-adivi@ti.com>
 <20260218095243.2832115-13-s-adivi@ti.com>
 <20260219-hopeful-intrepid-cuckoo-32967d@quoll>
 <bab85365-063a-4d46-a1bf-48a25228d109@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bab85365-063a-4d46-a1bf-48a25228d109@ti.com>
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

On Thu, Feb 19, 2026 at 05:45:46PM +0530, Sai Sree Kartheek Adivi wrote:
> 
> On 19/02/26 13:13, Krzysztof Kozlowski wrote:
> 
> Hi Krzysztof,
> 
> Thanks for the review.
> > On Wed, Feb 18, 2026 at 03:22:37PM +0530, Sai Sree Kartheek Adivi wrote:
> > > New binding document for
> > Fix wrapping - it's wrapped too early.
> Ack. will fix it in v6.
> > 
> > > Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> > > 
> > > BCDMA V2 is introduced as part of AM62L.
> > > 
> > > Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> > > ---
> > >   .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 120 ++++++++++++++++++
> > >   1 file changed, 120 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> > > new file mode 100644
> > > index 0000000000000..6fa08f22df375
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> > > @@ -0,0 +1,120 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2024-25 Texas Instruments Incorporated
> > > +# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Texas Instruments K3 DMSS BCDMA V2
> > > +
> > > +maintainers:
> > > +  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
> > > +
> > > +description:
> > > +  The BCDMA V2 is intended to perform similar functions as the TR
> > > +  mode channels of K3 UDMA-P.
> > > +  BCDMA V2 includes block copy channels and Split channels.
> > > +
> > > +  Block copy channels mainly used for memory to memory transfers, but with
> > > +  optional triggers a block copy channel can service peripherals by accessing
> > > +  directly to memory mapped registers or area.
> > > +
> > > +  Split channels can be used to service PSI-L based peripherals.
> > > +  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
> > > +  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
> > > +  legacy peripheral.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/dma/dma-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,am62l-dmss-bcdma
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: BCDMA Control & Status Registers region
> > > +      - description: Block Copy Channel Realtime Registers region
> > > +      - description: Channel Realtime Registers region
> > > +      - description: Ring Realtime Registers region
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: gcfg
> > > +      - const: bchanrt
> > > +      - const: chanrt
> > > +      - const: ringrt
> > > +
> > > +  "#address-cells":
> > > +    const: 0
> > > +
> > > +  "#interrupt-cells":
> > > +    const: 1
> > I don't get why this is nexus but not a interrupt-controller.
> > 
> > Can you point me to DTS with complete picture using this?
> 
> Please refer https://github.com/sskartheekadivi/linux/commit/4a7078a6892bfbc4c620b9668e3421b4c7405ca4
> 
> for the dt nodes of AM62L BCDMA and PKTDMA.
> 
> Refer to the below tree for full set of driver, dt-binding and dts changes
> 
> https://github.com/sskartheekadivi/linux/commits/dma-upstream-v5/

Whether this is an interrupt-map or a chained interrupt controller 
entirely depends on whether the interrupts are transparent to the 
DMA controller (i.e. do they have to be acked?). interrupt-map is 
generally for transparent cases.

If not transparent, then just 'interrupts' and 'interrupt-controller' 
should work for you. You can map 'interrupts' entries to channels like 
many other DMA controllers do that have per channel interrupts.

Rob

