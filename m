Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DC7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPmeBmTLZcI2NvycNSs9TbGw6xQZrmlj5hEViCW2F5s=; b=OkULGyjb/9+UJe4QrD0UVSBKeU
	gtzdc2rIQm2P4HhTdH0fp5HvrNcv3sk1KStspIO9vxVkDvPbyyeIDaeY7FWKZRIgy8P02hW9bgJMs
	MR+kwZ1sQi03q+12ID2yTGfGX+/yJkOy/Z5KcACy4hil+tBhY7461hGUX0BhZrRsinp5muRVCQ3Gv
	zT6m8zl4gWWABiSy4FdBnSw0bUYpk1D2Hx565p7w/sJypkjH1hxPISbttMCNHWjxx0/nzgoDkB0Nm
	wzp4ehUoT6rhs2aJ6Pg3MRStyuCKgAdAawap+iBm4P8EwZIJJJMhz7sRhpeLuhgqBF507rQWBx2ei
	aRsT3NWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web5e-0000000HRzD-3pzJ;
	Tue, 30 Jun 2026 16:13:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1web5d-0000000HRyc-1DDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:13:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F31143F9C;
	Tue, 30 Jun 2026 16:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE161F000E9;
	Tue, 30 Jun 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836016;
	bh=EPmeBmTLZcI2NvycNSs9TbGw6xQZrmlj5hEViCW2F5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjqwqJB4CDv38X4H7iaSRjQLFXTXvps8g/F/WWvP/LwYS+uJSu1Nq06L8vY829jjW
	 Ose4jlI6JMagqyn5LpCnkBx9NRfq6spcTZ/YGpWCGGWw+fW1LMCmVXli54WmEsRmmj
	 /61f6nCtgRXVJb630dqrq5W9msVqCcMNwuQmeVYJ6nJWK9h/xZMFuzmO2XLAxpGW61
	 FCLXDDwJ7w6pAUn9cv0xsuEMGXM0z/BzCaKP0t9kD/GyNzbn6bpJtpvjjMKbmsEeat
	 UTiWbA0n4XtMrwx6gfZT8oTFrenIglBWMsQFqOUrwOdt0vp4GrAaBz6kqKAsBgJZ26
	 rDBc6JEInOYiQ==
Date: Tue, 30 Jun 2026 11:13:35 -0500
From: Rob Herring <robh@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Subject: Re: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260630161335.GA3699737-robh@kernel.org>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624072043.238-3-nas.chung@chipsnmedia.com>
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

On Wed, Jun 24, 2026 at 04:20:36PM +0900, Nas Chung wrote:
> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.
> 
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The control region
> manages shared resources such as firmware memory, while each interface
> region has its own MMIO range and interrupt.
> 
> The control region and each interface region are distinct DMA requesters
> and can be associated with separate IOMMU stream IDs. Represent the
> control region as the parent node and the interface register regions as
> child nodes to describe these resources.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/nxp,imx95-vpu.yaml         | 163 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> new file mode 100644
> index 000000000000..9a5ca53e15a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
> +  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register region and
> +  four interface register regions for a shared video processing engine.
> +  The parent node describes the control region, which has its own MMIO range and
> +  manages shared resources such as firmware memory. The child nodes describe the
> +  interface register regions. Each interface region has its own MMIO range and
> +  interrupt.
> +  The control region and the interface regions are distinct DMA requesters.
> +  The control region and each interface region can be associated with separate
> +  IOMMU stream IDs, allowing DMA isolation between them.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-vpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VPU core clock
> +      - description: VPU associated block clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: vpublk
> +
> +  power-domains:
> +    items:
> +      - description: Main VPU power domain
> +      - description: Performance power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: vpu
> +      - const: perf
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Already has a type. You just need to define how many phandles (maxItems: 1).

> +    description:
> +      phandle to the SRAM node used to store reference data, reducing DMA
> +      memory bandwidth.

Drop 'phandle to the SRAM node'

Rob

