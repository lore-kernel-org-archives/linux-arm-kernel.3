Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31050C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fRcZWlxD0oE1gfBZKarcALkmG9bip35YO45KWPYWSE=; b=AzJ/1iQinlzdYL6IsXXFUoysTb
	3uITR7P8XilmbIZJDNRCdVHOP6+FPEOL9owaANyAc+bLPbnrsBCs/6ppQrai+vC7vBoYwKZryfizB
	puqFAxl3Ocp1femlda0Ad5sPNTVU5D9BE29M7ZnWHo+z4NpxMCwoix3/SkjaMEUdm5raZcEkkRPx0
	WFEcNDQEFc7ChxClmDbA8TzfklDTxDA7E02O+PX7PaEIecgc2CHfA2XmUCQvHF7tT3f7c5DUAV0Yt
	RCKJcMBZURe/9pH4XCdSSchO4nl60eOnQBEQW/zt5+DHdGdbRQpTulBp/QApI3SEhtTORtNx81iIa
	Bqfq1Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFOm-0000000FivV-1vbr;
	Fri, 27 Jun 2025 20:10:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFMI-0000000FifD-0JEV;
	Fri, 27 Jun 2025 20:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC57B5C6DB1;
	Fri, 27 Jun 2025 20:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63393C4CEE3;
	Fri, 27 Jun 2025 20:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054856;
	bh=evi9mrGpfq42RtZCClIuGM2tsnpjZlb3N0ftCknmAJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAh8YiI5mCaW34lHKtdKCXr+8HAOMMwPUhydtdeIAAgVDnAoccZXq4QlSbq7wLnaY
	 +icmkC7dh4qVpD9rK8gZvSWPbaGaF28iMDGKLJZqNLHG/B9dbxu+AB/fvhh8HNzFgP
	 CgDKVjQBbSbkRLh2FAHx49ytuLJyhaGj8MWsJGCvKKqZu0mSFAgN+FRsLLWUDs26hU
	 wXA5lF98WraRg/8x50dLx17BkCukQwOxCYEbG3DgAfs6mUDr/vQU5EUO+p/RIc9syg
	 gBqpgrn0GTrONoP32XqBYsKai7UEnYPqIEW7E2IW7op7lQl4DsCRelgw3tUPLQGD79
	 kkq4b/ZgbLoUA==
Date: Fri, 27 Jun 2025 15:07:35 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/5] dt-bindings: spmi: Add MediaTek MT8196 SPMI 2
 Arbiter/Controllers
Message-ID: <20250627200735.GA4094329-robh@kernel.org>
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
 <20250623120047.108961-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120047.108961-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_130738_200554_E6B85DAB 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, Jun 23, 2025 at 02:00:43PM +0200, AngeloGioacchino Del Regno wrote:
> Document the MT8196 SPMI 2.0 Controller with a new schema.
> This is a MIPI SPMI 2.0 compliant IP, composed of a main arbiter
> and two SPMI master controllers with Request Capable Slave (RCS)
> support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> new file mode 100644
> index 000000000000..d7eb63e81a5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/mediatek,mt8196-spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 SPMI 2.0 Controller
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT8196 SoC features a SPMI version 2.0 compliant controller,
> +  with internal wrapping arbitration logic to allow for multiple on-chip
> +  devices to control up to two SPMI buses.
> +  The main arbiter also acts as an interrupt controller, arbitering also
> +  the interrupts coming from SPMI-connected devices into each of the nested
> +  interrupt controllers from any of the present SPMI buses.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8196-spmi
> +      - items:
> +          - enum:
> +              - mediatek,mt6991-spmi
> +          - const: mediatek,mt8196-spmi
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^spmi@[a-f0-9]+$":
> +    type: object
> +    $ref: /schemas/spmi/spmi.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        items:
> +          - description: controller interface registers
> +          - description: spmi master controller registers
> +
> +      reg-names:
> +        items:
> +          - const: pmif
> +          - const: spmimst
> +
> +      clocks:
> +        items:
> +          - description: controller interface system clock
> +          - description: controller interface timer clock
> +          - description: spmi controller master clock
> +
> +      clock-names:
> +        items:
> +          - const: pmif_sys_ck
> +          - const: pmif_tmr_ck
> +          - const: spmimst_clk_mux
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-names:
> +        const: rcs
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 3
> +        description: |
> +          cell 1: slave ID for the requested interrupt (0-15)
> +          cell 2: the requested peripheral interrupt (0-7)
> +          cell 3: interrupt flags indicating level-sense information,
> +                  as defined in dt-bindings/interrupt-controller/irq.h
> +    required:
> +      - reg
> +      - reg-names
> +      - clocks
> +      - clock-names
> +      - interrupts
> +      - interrupt-names
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +required:
> +  - compatible
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      spmi-arbiter@1c018000 {
> +        compatible = "mediatek,mt8196-spmi";
> +        ranges = <0 0 0x1c018000 0x4900>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        spmi@0 {
> +          reg = <0 0x900>, <0x4800 0x100>;
> +          reg-names = "pmif", "spmimst";
> +          interrupts-extended = <&pio 292 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-names = "rcs";
> +         interrupt-controller;

Indentation error.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +          #interrupt-cells = <3>;
> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
> +        };
> +
> +        spmi@2000 {
> +          reg = <0x2000 0x900>, <0x4000 0x100>;
> +          reg-names = "pmif", "spmimst";
> +          interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-names = "rcs";
> +          interrupt-controller;
> +          #interrupt-cells = <3>;
> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
> +        };
> +      };
> +    };
> +...
> -- 
> 2.49.0
> 

