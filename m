Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B764FCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUvPhF8dn8eZsRhd0iTOo6E9FPmDo2wLUbUDWD7fv4Q=; b=ycmiakZ85w+Egry5HQAeqD0+32
	gJQnLLMKa7i2U9cOOxmh6n2hP48GN58e3q8coO0YoziRvl+pTKJ7eBqjlDDaqIHWu2whEP8IY2eqO
	PpGhOhNdVUxXKLbL/if61oCRQC20FHCiT8hr24hLTtOGirOc3VN1N5596d0lbT3zmnOAEYzUtGppU
	3JxOVnrUH2W3NSlcF+b9H/xSLJjRSTkGEwD3ia/mZRVtXobuLFK8AC7aaZk73+FZmNJqNV9n1SYau
	+sKQ39NZKPhNGK1YIhMbLVpC8IMHNhl4Q2wmQT+uDaP/3KFqAo3JYYUmi8/21XOVNfk6MtjNuXehd
	zkZ3d7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkHG-00000005cSf-23Kn;
	Fri, 31 Oct 2025 08:14:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkHE-00000005cS4-42Jt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D5FA60604;
	Fri, 31 Oct 2025 08:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754F3C4CEFB;
	Fri, 31 Oct 2025 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898468;
	bh=T7nI7xvtFl7krfWTdP/qjx1BlQ3XmAzSZCU1Kz/Md9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJbKnESFg6XyUjYSq7gFteRw1AzLeEOwhq/R1FQ9acELAGb+1lo+BK3K6HG4G/O9k
	 xCbFSxVcLC6lxIA0RrBry1xU4Ny6c2H9iQpJGAXLuYmETlnLIP8hBxSbvlZPayn7P3
	 pcdWLf2PtvqhAnCGPD2p3hRJ9Lk1gYYEF4knXXJYhNNNRjes5DC7lcoG0kLdNdtV/1
	 nCEB4VgBWNM6NXS1awmf6VveSzpRC4x8tIriIrbbOk8w5xV8RlXWbSdrKrJV1DsLdn
	 UnSBH3oBfQXE59g/0J4wbD5O4tEdAtNlrTE0qdoi8niaUfHbef0uVckyS7o8sjZq5k
	 qYs5Od5VGpOrQ==
Date: Fri, 31 Oct 2025 09:14:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, jgg@ziepe.ca, nicolinc@nvidia.com, 
	linux-tegra@nvidia.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
Message-ID: <20251031-witty-sociable-chachalaca-b73dbc@kuoka>
References: <20251031062959.1521704-1-amhetre@nvidia.com>
 <20251031062959.1521704-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031062959.1521704-3-amhetre@nvidia.com>
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

On Fri, Oct 31, 2025 at 06:29:58AM +0000, Ashish Mhetre wrote:
> The Command Queue Virtualization (CMDQV) hardware is part of the
> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> virtualizing the command queue for the SMMU.

If this is specific to Nvidia, then I think you need specific front
compatible and disallow it for other vendors.

> 
> Add a new device tree binding document for nvidia,tegra264-cmdqv.
> 
> Also update the arm,smmu-v3 binding to include an optional nvidia,cmdqv
> property. This property is a phandle to the CMDQV device node, allowing
> the SMMU driver to associate with its corresponding CMDQV instance.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../bindings/iommu/arm,smmu-v3.yaml           | 10 ++++
>  .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 46 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 75fcf4cb52d9..edc0c20a0c80 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -58,6 +58,15 @@ properties:
>  
>    msi-parent: true
>  
> +  nvidia,cmdqv:
> +    description: |
> +      A phandle to its pairing CMDQV extension for an implementation on NVIDIA
> +      Tegra SoC.
> +
> +      If this property is absent, CMDQ-Virtualization won't be used and SMMU
> +      will only use its own CMDQ.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>    hisilicon,broken-prefetch-cmd:
>      type: boolean
>      description: Avoid sending CMD_PREFETCH_* commands to the SMMU.
> @@ -92,4 +101,5 @@ examples:
>              dma-coherent;
>              #iommu-cells = <1>;
>              msi-parent = <&its 0xff0000>;
> +            nvidia,cmdqv = <&cmdqv>;
>      };
> diff --git a/Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml b/Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
> new file mode 100644
> index 000000000000..f22c370278a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra264 CMDQV

Missing blank line

> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The CMDQ-Virtualization hardware block is part of the SMMUv3 implementation
> +  on Tegra264 SoCs. It assists in virtualizing the command queue for the SMMU.
> +
> +maintainers:
> +  - NVIDIA Corporation <linux-tegra@nvidia.com>

No. It should be a person. If entire Nvidia cannot find a person, I
don't think we are interested in having this in the kernel.

> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra264-cmdqv
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: cmdqv

Drop interript names, obvious.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cmdqv: cmdqv@8105200000 {

Drop unused label

Best regards,
Krzysztof


