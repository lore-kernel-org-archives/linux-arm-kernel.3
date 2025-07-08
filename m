Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A240DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjpUGumsyFT3wsCtF9Dlg1G6YfAqzI8ZghV7o/ro8w4=; b=auiYnJFKa9CUOFEdGz5nGTEvEP
	2i6fsQL39jEkej5IIYHAj42GfevM/92ncvaIWjqEoq47LI6DdW/PXBXgChMIrB2qUBlfKvTU1tlZe
	OSdPryDhfyXSatitmWsXUgHjHokzhDxcE1iC8F6ODyb9o3BFaiwnkO4P4d1ZdvjM3HTKlehvaxXZt
	WXbON1vvMm7MN3GaL42OXK8jlxp/IZgw0ACDhibGwKNTnrCNC19IQEFt3Rze8g7P99EU4VC2uICvD
	J0MxIdT7YWlupOQoHIAPq+wwlh1nk81UlIXGtFgJtYfuIgZoqEbVe6wVqv91yolQKs2t7DP/2PXyy
	JQkb8BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEc3-00000006Skn-1YbZ;
	Tue, 08 Jul 2025 20:08:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE2C-00000006LpL-0b8x;
	Tue, 08 Jul 2025 19:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86FB95C516B;
	Tue,  8 Jul 2025 19:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF178C4CEED;
	Tue,  8 Jul 2025 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752003079;
	bh=4HIbXqO4X/zdFKMfYlEoWG4p7UkHS98SkaZFdbZdFKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAqQP9MY6hAOf2CQAO7iVpo9cciRLieNSlVrPS7uTOEYeRSsdmr2ElnpEehToll8Q
	 vHz9zzIQzp7ztQ8iQCbotghbpSBzrt4eHy9vraBL/Qmq1L51AXuMJY2Z9ReebWLQbE
	 4SDvAIGoYAC0YEJ7zQaACrXyZI4KlKv3ZafZCfpS3oV6wMpGGqgowg1fy8pZh9cxlf
	 2igN2LSWnHhUNBkOjqTvGxdsEOKJt6Fb6muVPKm/0tiQRveaLj/IBXksTKfqYC4tbf
	 aZHBYSCTsqApeAMwjhtueGFVuA/r8VUxHmrhJ4Z/BsixGKQ/aNRynj6qBHhFfhxqRm
	 DEBrYMxHLLBDg==
Date: Tue, 8 Jul 2025 14:31:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
Message-ID: <20250708193118.GB797072-robh@kernel.org>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
 <20250707134451.154346-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707134451.154346-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123120_261051_624C04B3 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, Jul 07, 2025 at 03:44:50PM +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Link: https://lore.kernel.org/r/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> new file mode 100644
> index 000000000000..0d1078e92232
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 series SPMI PMICs multi-function device
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  Some MediaTek Power Management ICs (PMICs) found in board designs with
> +  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
> +  the chip via the System Power Management Interface (SPMI) bus.
> +
> +  These PMICs are multi-function devices with various sub modules.
> +  For example, those may include one, or more of the following:
> +  - Auxiliary ADC Controller
> +  - Clock Controller
> +  - eFuses
> +  - GPIO Controller
> +  - Interrupt Controller
> +  - Keys
> +  - LEDs Controller
> +  - Regulators
> +  - RTC
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6363
> +      - mediatek,mt6373
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 0

The only place 0 is valid is interrupt controllers for some ancient OF 
reasons.

> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +    unevaluatedProperties: false
> +
> +  regulators:
> +    type: object
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6363-regulator

This is never true because the schema is only applied if the top-level 
compatibles matched.

Just do this and drop the if/then schemas:

regulators:
  properties:
    contains:
      enum:
        - mediatek,mt6363-regulator
        - mediatek,mt6373-regulator

Then the appropriate child schema will be applied. This doesn't enforce 
you didn't use mediatek,mt6363-regulator on mt6373 PMIC or vice-versa,
but I don't that really matters.

> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6373-regulator
> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#


