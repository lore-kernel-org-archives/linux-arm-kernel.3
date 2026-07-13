Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4909DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N30vr1xrRftm2nMobVAtxbwff06D+Jf4XX9jZoAnGTU=; b=YfMFthgF16WOPlh8FmbttxBZpr
	fa1kVA4jMMWnZh930WIwaJiHcX4CvpTgkkDqHBoXInTE2GFUiDdotp16WAwFucXflvF5c3KWFciyo
	bENLhz0r4lE8d4Tekg722ihXv/3uV7a2OcYs83jZ3fYtwzKXAxOXYGJTzx3CgFlWeQDANCThIYwWP
	g88GPW6NX4t5TLBNMPkvWLNaGayOaoKylisAmF35IW0MSpBNaRu+iGreKjJiNgEtGJi/WtKauH55g
	2lyYVoRIb6TYJyGcF1TdNDwB9WdtNd8m0XGi7v+gtrhQVwFyOX8OYsAe1/x3monwXAZDQUbd2yBxy
	Bh6oiDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCln-00000008hEi-0GAa;
	Mon, 13 Jul 2026 09:16:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCll-00000008hEV-3Pdf;
	Mon, 13 Jul 2026 09:16:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 792D540396;
	Mon, 13 Jul 2026 09:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A02E1F000E9;
	Mon, 13 Jul 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783934169;
	bh=N30vr1xrRftm2nMobVAtxbwff06D+Jf4XX9jZoAnGTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E7FwN/Jv6m1e69kx632GqJLog3RwP12tN0ucav26FktzwqnDd4kBGbNenuLYwevaG
	 1BGaAYWSOPpXQRSOjYHhBVIcbF6c6745HuTPWIJSEk8DBaXcYiJiRhiQHM0PuxFF6P
	 BwYbJSu9iMhhF+DNNLmVWpQSpv2YXboLZUCWFoTXiDPKBMPB5Kbs7XTiLQtafM8HCh
	 PNnPj9dcL0ZH08/cBg+D0N2/m6AGaFNxwZfAKu9PvpgM4thZA2L6/kvTerKA11bcS4
	 O4pi77LeTOqxqk29h93wNbDV6E+GB/6u5CSeTYHY3YOHUOPR191DfJ6oc4ZrkSO5RK
	 M/S7j7bXcZacQ==
Date: Mon, 13 Jul 2026 11:16:05 +0200
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
Subject: Re: [PATCH 3/6] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
Message-ID: <20260713-corgi-of-striking-science-4afbdc@quoll>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-3-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-3-80e10cdde2ea@reactivated.net>
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

On Sun, Jul 12, 2026 at 10:18:53PM +0100, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMU and its shared TLB cache.
> 
> Include compatibility with the cache phandle used in existing firmware
> shipped on Raspberry Pi 5, and also allow the iova-window to be omitted,
> which similarly will maintain compatibility with existing RPi5 firmware.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 65 ++++++++++++++++++++++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 35 ++++++++++++
>  2 files changed, 100 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> index 000000000000..0d91c513afc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> @@ -0,0 +1,65 @@
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
> +description: |

Do not need '|' unless you need to preserve formatting.

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
> +    description: Phandle to the shared IOMMU cache (IOMMUC).

You need to explain what for, the purpose in hardware.

> +
> +  cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Deprecated. Use brcm,iommu-cache instead.
> +    deprecated: true

Drop property, we do not take new bindings with deprecated properties.
Existing FW is not an excuse, Raspberry 5 developers could reach out and
ask if this is okay. They did not.

> +
> +  brcm,iova-window:
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    description: |
> +      An array of two 64-bit integers specifying the IOVA aperture start
> +      address and the aperture size. IOMMU mappings will be created inside
> +      this aperture. All preceding address space is in identity/bypass mode.
> +      The aperture start address must be 4GB-aligned.
> +      Should be considered a required property, but it is technically optional
> +      in order to maintain compatibility with historical firmware versions.
> +      If absent, defaults to a 4GB window at 40GiB (0xa00000000).
> +    items:
> +      - description: IOVA window start address
> +      - description: IOVA window size

This looks a lot like reserved region, so why do you need a new
property? If this is not a reserved memory, then why compatible does not
imply the value?


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
> +        brcm,iova-window = /bits/ 64 <0xa00000000 0x100000000>;

Best regards,
Krzysztof


