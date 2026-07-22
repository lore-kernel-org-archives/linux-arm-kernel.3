Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D9C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/oakq8FinWWW7FI0sjYwpvVfiXdLrAlJXpu1Bx/UCg=; b=0QGQkyPwQ1L77+QXMOPRE/g2+7
	574pHVMt7EuObjijeqv2sBxqUWbbBKq9Br3wTMxXq0HywooB58vfataRMi1kHR3rNjo4PdgADhbZn
	m4lMrgyWTCKBZxrpr7SP+oEHafRIhveleqARHcD+0HolseEQrzT1b0Q3vJT7a+VfAjniw86Mg7Jmt
	nVzZnWT03aVFRr/n5K6Fy4IT7AKcDXBpFdbA0mKFXECR7gW+U54sIZ0apGPrVlsj9tflrp63IUCup
	YEjrczYgXQHf7IKQhJPkvLyiAiPhuex4W2mihJarGxLgtCjZG7virXIH1FylvE/cMZ3ruIsg1vZTo
	lGDgc6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZzk-0000000CN9m-1jJZ;
	Wed, 22 Jul 2026 16:40:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZzj-0000000CN9T-0zVV;
	Wed, 22 Jul 2026 16:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61BBC600E1;
	Wed, 22 Jul 2026 16:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFDE1F00A3A;
	Wed, 22 Jul 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738429;
	bh=3/oakq8FinWWW7FI0sjYwpvVfiXdLrAlJXpu1Bx/UCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZfCSOQx1jJQvGJdAMkP07t7jrNWimsZCGnxVu7IjMj2v1VsbvmwIzmeUVmNfmcc60
	 g4RSOGpzOFOxYWrVByPzzhECh237EIzHo06RHcQZz67PiQhCnkm8N0fLuOrdgyISlZ
	 yYSebEQ86j+Qme8IVRKjkyiFn7wDbRvvsSNTgVCj9jQOEG7KfKipL6N2KpCOYxtqmc
	 AaMmN8NCvjHc/oITZIipztLZdEIQjGCw8zsURCIUY/oc+8s0rCq/p0olirz3f/uhlE
	 UJbBikvjy+hQ8vw7ujVILnvg90Ht/zFHgioX4KKEejl/v38AYY6TiZWfXKwh3wefO1
	 CL1H4kHuSDRMw==
Date: Wed, 22 Jul 2026 11:40:26 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 27/46] dt-bindings: display: mediatek: Introduce
 Digital Video Output HW
Message-ID: <20260722164026.GA1072380-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-28-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-28-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 14, 2026 at 01:43:55PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Digital Video Output (DVO) IP found in
> the newer generation SoCs MT8196, MT8189 and their variants.
> 
> This is effectively a more capable block replacing the DisplayPort
> Interface (DPI/DP_INTF) one found in older SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mt8196-dvo.yaml | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
> new file mode 100644
> index 000000000000..b38960327ca1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-dvo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Digital Video Output (DVO) Controller
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Digital Video Output (DVO) hardware provides 120-bits (4P) data,
> +  video timing and info data for the Embedded DisplayPort, hardware-abstracting
> +  the previous generation Display Port Interface (DPI/DP_INTF) blocks, other
> +  than providing new capabilities.

If you want paragraphs, you need '>' annotation and a blank line here.

> +  This hardware block supports 1/2/4 pixels per iteration in both its input and
> +  output and provides 8/10-bit RGB, YUV422 and YUV444 data formats in output,
> +  other than supporting input/output video window cropping and padding.
> +  Digital Video Output also provides Panel Self Refresh (PSR) and Multi-SST
> +  Operation (MSO) features for eDP 1.3/1.4.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8189-dp-dvo
> +      - mediatek,mt8189-edp-dvo
> +      - mediatek,mt8196-edp-dvo

How are these incompatible with each other?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Pixel Clock
> +      - description: Engine Clock
> +      - description: DVO PLL
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: engine
> +      - const: pll
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Digital Video Output's input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DVO output to an HDMI, LVDS or DisplayPort encoder input
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: dvo
> +
> +  trigger-sources:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +    #include <dt-bindings/power/mediatek,mt8196-power.h>
> +
> +    dvo@324c0000 {
> +        compatible = "mediatek,mt8196-edp-dvo";
> +        reg = <0x324c0000 0x1000>;
> +        interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&dispsys1 CLK_MM1_DISP_DVO0>,
> +                 <&dispsys1 CLK_MM1_MOD6>,
> +                 <&apmixedsys_gp2 CLK_APMIXED2_TVDPLL3>;
> +        clock-names = "pixel", "engine", "pll";
> +        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_DIS0_DORMANT>;
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&dvo_pins_default>;
> +        pinctrl-1 = <&dvo_pin_sleep>;
> +        trigger-sources = <&disp1_mutex 29>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&directlink_output>;
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&displayport_input>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.54.0
> 

