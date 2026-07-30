Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FD9C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6vq+XN5CM9+uuf8vbRHpfXJQHZkjlex7kNCOdzok0M=; b=B+WA9HvOq+3F1jZahL8DTpX28J
	yRGs3KtN0aG71YY8K0qf4qtuODpBX7htaU4C/fo0ycKL14aOCGwjh0xafyWu40dVGEhRsIIenN5IO
	rdw4IU20DrEYnmdKEGKC/ZpHd1QyCSmcsglzcVaPYs576D5HqBeJyq1Ador5trb0bOP8zkUogKheC
	/eiqBhFis4z2g23f9ikApJBy/F3CT2FwCFkmZeX6XX7E3ZYmIQS03hZIWoLN4YU6k8mMoOvSNbdz3
	L3JszSoE3U/MFE3m+/RgxjkipOiHmGjO4n7XcPirDUrsiXACFgBb8VDaJQHAMXclmQ1YzS/erJc6G
	3A22IdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKk6-00000009fIu-2O01;
	Thu, 30 Jul 2026 06:59:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKk6-00000009fIf-0WRP;
	Thu, 30 Jul 2026 06:59:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F6C6600B1;
	Thu, 30 Jul 2026 06:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E39C1F000E9;
	Thu, 30 Jul 2026 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785394785;
	bh=a6vq+XN5CM9+uuf8vbRHpfXJQHZkjlex7kNCOdzok0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y281iKTIXaUEJSTFniYUGiW68Fc0k96KRGQ28IdWDxIIb5EDyHNLzMC/BWzs8md/3
	 MxTHO8tY+CfjWNRuFTIVC5XYHB2AAAG4uZQyoPFdPZAu/nEEQb6lyY5GIV6giqSgqo
	 NenFWLhKdXVekH7CVW1j+7Y3evihd4ExGeWRS6oc1TDwnmd0KcVwvQBrxXLT50z21v
	 mOBHHkGBpuTDKVDnhxe5liw1glOMja/HFRRAP4bhaY0AFBActs+IQ+wKncvMdAOcl2
	 g7obNxTjpXx/VWCE7qyCQHYxI1QlAbVh+MRgyIQTMmqVV9h0RY8locX5t67XdxMQuF
	 cTnrfvUyPJaJQ==
Date: Thu, 30 Jul 2026 08:59:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
Message-ID: <20260730-free-monkey-of-defiance-38b976@quoll>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-2-0247b5c03de8@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-bcm2712-iommu-submit-v2-2-0247b5c03de8@reactivated.net>
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

On Mon, Jul 27, 2026 at 09:43:57PM +0100, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 48 ++++++++++++++++++++++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 35 ++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> index 000000000000..af4d8bac10e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 IOMMU
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +
> +description:
> +  The BCM2712 IOMMU provides address translation for various hardware blocks
> +  on the BCM2712 SoC, such as the VC6 display pipeline.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#iommu-cells':
> +    const: 0
> +
> +  brcm,iommu-cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the shared IOMMU cache. The IOMMUC is a shared hardware block
> +      that provides centralized Translation Lookaside Buffer (TLB) caching and
> +      invalidation.

Again, same comment: what for? What is the purpose of IOMMUC in IOMMU
(not in the system, you are not describing the system). You just pasted
here description of other binding, but I did not ask for that.

Do you need to manually invalidate cache lines from IOMMU?

Why do you think that both are separate devices in the first place? It
would be like describing in DTS separate MMU and TLB.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +  - brcm,iommu-cache
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommu@5200 {
> +        compatible = "brcm,bcm2712-iommu";
> +        reg = <0x5200 0x80>;
> +        brcm,iommu-cache = <&iommuc>;
> +        #iommu-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> new file mode 100644
> index 000000000000..f22e9be2c473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +
> +description: |

Same comments as before.

> +  The BCM2712 IOMMU Cache (IOMMUC) provides a shared Translation Lookaside
> +  Buffer (TLB) cache used by the primary BCM2712 IOMMUs to speed up address
> +  translations.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommuc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommuc: iommu-cache@1001000 {

Drop unused label.

> +        compatible = "brcm,bcm2712-iommuc";
> +        reg = <0x1001000 0x100>;
> +    };
> 
> -- 
> 2.55.0
> 

