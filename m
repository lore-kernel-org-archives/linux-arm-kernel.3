Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F433C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IClg3koNX1rpXgeqgGWAy2P2TrvFqSBm3yrz7DXFiYc=; b=WFW67Qa1+HCYXq72QR82Xym5I1
	l6wuLUBGXhkWJCOyWnf8cX9NxPlxDoTGHYaPiH8DDdKIHITOrsqNsHGzL06TDD06m1pvytfPlHLGm
	O24wiMSWVAEQQ/NNd4Tp6QzxtpdUUIVS+dZ7GLQrJOdCyiwspcvQSGu/Ae1c1znErL44yS9O5rbYh
	AE/pN8l7Vf2xbyDB5hlmhU2Gal8cszcfg9y5Qmr9lyLuomzW4Wsr64pFSPpg6fDlbiQYlMLx9W3jg
	sYjHyJIQJrcsvMK6dss+d1qUevXPkUeqQEZDVI2i7bBISGj7seIln81BNV1ylPju6zd7UYojeIGEP
	hhvqTX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFXs-0000000Fjpj-0tsT;
	Fri, 27 Jun 2025 20:19:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFQQ-0000000Fj62-0xxd;
	Fri, 27 Jun 2025 20:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6689A61435;
	Fri, 27 Jun 2025 20:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E32C4CEE3;
	Fri, 27 Jun 2025 20:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055113;
	bh=j480d8kCKmPEv/s1I085hF2TgeZLCw2SbopKfGFaiCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oS8WYC9x/7XhB5hLSlEiIiX+fhE4IFlUON6lQtVaHwQKQqTI/neox5yvPgnmoHIDU
	 BPZjNf6mASLzwlTkMLu6Q+3K0TNkeeUQyp1/CbH5aJ1IVNGg1QbgXvOZRRHua9FewX
	 p5vzDP4GoiK6VczT2MuY8ldfpKNb1ZuS5zDqLmHM0wkJn0NkM9tNyapWTy7L9b7DRF
	 DgnPmwybwvVD39nIvbfjS3sh/80OkM0A9fOx9v2rJnP41n0h3ScdbwNvV8NM3W0BKn
	 FqaLVTTGyNm4FQVl9a1R4Ndt8w8qG+91ijqc2TYb9wsuXkpRrOUmDJIalXECE+d4QP
	 bTJoZ7iqO6ykA==
Date: Fri, 27 Jun 2025 15:11:52 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jianjun.wang@mediatek.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT6991/MT8196
Message-ID: <20250627201152.GA4114099-robh@kernel.org>
References: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
 <20250623120058.109036-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120058.109036-3-angelogioacchino.delregno@collabora.com>
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

On Mon, Jun 23, 2025 at 02:00:57PM +0200, AngeloGioacchino Del Regno wrote:
> Add compatible strings for MT8196 and MT6991 (which are fully
> compatible between each other) and clock definitions.
> 
> These new SoCs don't have tl_96m and tl_32k clocks, but need
> an AHB to APB bus clock and a low power clock.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 162406e0691a..02cddf0246ce 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -52,7 +52,12 @@ properties:
>                - mediatek,mt8188-pcie
>                - mediatek,mt8195-pcie
>            - const: mediatek,mt8192-pcie
> +      - items:
> +          - enum:
> +              - mediatek,mt6991-pcie
> +          - const: mediatek,mt8196-pcie
>        - const: mediatek,mt8192-pcie
> +      - const: mediatek,mt8196-pcie
>        - const: airoha,en7581-pcie
>  
>    reg:
> @@ -212,6 +217,36 @@ allOf:
>  
>          mediatek,pbus-csr: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-pcie
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: bus
> +            - const: low_power
> +            - const: peri_26m
> +            - const: peri_mem
> +
> +        resets:
> +          minItems: 1

The min is already 1.

> +          maxItems: 2
> +
> +        reset-names:
> +          minItems: 1
> +          maxItems: 2

It would be good to define what the names are. I assume they are fixed 
and not just any of the allowed ones.

> +
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.49.0
> 

