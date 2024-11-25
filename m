Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE6D58065
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9GHpg2FMCfcg+9Fy52A9M5ISeOJ+/Qgh8fihHG0vC8=; b=cA8UZrbjAka+oJ8cxgAvNnmeHr
	8nTdnX/Rf5ZyjnOPCA+Pf7EgutmT8AKI9ET3SXjJOG0MOT67CTlRL2JAazI0CrvXV3TeLe9giJvv9
	n/4hwgtrwv26cAU/RW8y1vnrFD1e1aBLt0IKXYPGBsrKmff7DFdef20igVnmYWsbeF2oBnSrA5sUo
	8XRfUrCtfoCEmkwWlaqrtE5zG1IMTsSX15/GZN0JsAk2lhrh/t+OQ7GOsPErdP9zhgYiurOToQjSJ
	tF/aKw8ASoo2L0VpEda9NIMCNHWA3w5NRJ8abNJ8aqQeG6V+w/efAekiYN28bfYUIE7jCGV/MF3Cv
	ZaKHqnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXDM-00000007shT-13sD;
	Mon, 25 Nov 2024 11:25:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXCM-00000007sVt-31OW;
	Mon, 25 Nov 2024 11:24:12 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A206B5;
	Mon, 25 Nov 2024 12:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732533827;
	bh=9XSrtMyvUrSDpVncOK3Cu4eq7Kbx4R6lVGbVFgG8+ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNUv0XCSX8ExKTvjC7nk7Ekdpied3X/jF7Sv5GUef6pfX26pFLYWQNkKixsEbYaCc
	 lZlC5tKn+Ke+8XtcFpuiXX3yOAKUYjQpj1XP/sD5FzDhWDWoFwV3g+dt5CQDOu2v3/
	 7Edm0c1XkhgXFe9E+ewgTLFZDRjFFnyYB0AcFb3w=
Date: Mon, 25 Nov 2024 13:24:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20241125112400.GQ19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-2-b04dc9610619@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-2-b04dc9610619@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_032410_897005_6186DA50 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Julien,

Thank you for the patch.

On Thu, Nov 21, 2024 at 09:53:16AM +0100, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fdd07675645917fbcd692606c836efd07e50ac0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek CAMSV 3.0
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The CAMSV is a video capture device that includes a DMA engine connected to
> +  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-camsv
> +
> +  reg:
> +    items:
> +      - description: camsv base
> +      - description: img0 base
> +      - description: tg base
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: cam clock
> +      - description: camtg clock
> +      - description: camsv clock
> +
> +  clock-names:
> +    items:
> +      - const: cam
> +      - const: camtg
> +      - const: camsv
> +
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Connection to the SENINF output
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - iommus
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>

I would sort the headers alphabetically.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camsv@15050000 {
> +            compatible = "mediatek,mt8365-camsv";
> +            reg = <0 0x15050000 0 0x0040>,
> +                  <0 0x15050208 0 0x0020>,
> +                  <0 0x15050400 0 0x0100>;
> +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&camsys CLK_CAM>,
> +                     <&camsys CLK_CAMTG>,
> +                     <&camsys CLK_CAMSV0>;
> +            clock-names = "cam", "camtg", "camsv";
> +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    camsv1_endpoint: endpoint {
> +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 242c54c88a4a22fc0cbe5c4fc5d7b0d0f84b329e..6147629405c8d40b00c4755a4ee27a746b26f782 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14570,6 +14570,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Julien Stephan <jstephan@baylibre.com>
>  M:	Andy Hsieh <andy.hsieh@mediatek.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>  
>  MEDIATEK SMI DRIVER

-- 
Regards,

Laurent Pinchart

