Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C8EFED3F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZORKO2PbR+FindMSvM9e7Vr1yuvL6wDOH/eKP98C0l8=; b=wxPG+FfFmS47q5Yl5kal7a5nkP
	5e4tkJoEGhazkKfRv7VTyRmAO1WNMUYAgPckEIGTu2CjxhgKbg/+Hs7gXFmntfmpDMfKuyN40AzgS
	8AZ9kdeMirSLAtYo5NUPTX5Gb1zWiEU5P+eeI1cr559GAu+HOzPFKxbHAoCNPfvmIzJUUVuZMo0bC
	bljbbVqmrGoWONlLmUZAAsHa0x7nZKZM/4fcbrixKWeMh4zdDLnl1HcbpQy2SfHqREy6JPnvJ+mWf
	XpR+lI1tdw0UQ1/AvmzOHGgm6MEDMdrLVxUJ5mMvmCRYsOubMacEjCM6fMPh30LUOhwiju0Us5q1x
	7cdk8b9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKug-0000000Dd3r-1Sgw;
	Fri, 24 Apr 2026 18:06:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKud-0000000Dd3P-3KXp;
	Fri, 24 Apr 2026 18:06:01 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6CFA8227;
	Fri, 24 Apr 2026 20:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053856;
	bh=ejKEisanWsd8xl2Mc9rPlQCU5cbmJtb0L3OmLefF4Tg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aPnK2f769Kq3yuTbeUBhlkIisCCCFu9ujppk9b0g2hlaHNf3gRgA7S5YWfS3CLOTk
	 SEzb0ySjNcd7aHs6u+vG67DRL1i8VLSiDqqIDPhwS8DpzhprmbOwteuCIEk6aUgjhW
	 rg/UGH6FP7Qk9D07JXD6JK6q9ZPWdHCkRCC1gOqU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424175853.638202-2-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com> <20260424175853.638202-2-paul.elder@ideasonboard.com>
Subject: Re: [RFC PATCH 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
To: laurent.pinchart@ideasonboard.com
Date: Sat, 25 Apr 2026 03:05:50 +0900
Message-ID: <177705395057.43355.18439675795236129023@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_110600_000151_45E7CC09 
X-CRM114-Status: GOOD (  17.09  )
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

Hi me,

Quoting Paul Elder (2026-04-25 02:58:46)
> Add documentation for the Rockchip rkisp2 bindings. This is meant to
> support multiple versions of Rockchip ISPs going forward, including the
> 2.x series and 3.x series. The current version only adds the compatible
> for the RK3588, which is a 3.0.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../bindings/media/rockchip-isp2.yaml         | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2=
.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b=
/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> new file mode 100644
> index 000000000000..f4ef089adf6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip-isp2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoC Image Signal Processing unit v2
> +
> +maintainers:
> +  - Paul Elder <paul.elder@ideasonboard.com>
> +
> +description: |
> +  Rockchip ISP2 is the Camera interface for the Rockchip series of SoCs =
which
> +  contains image processing, scaling, and compression functions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-isp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3

These should be 2.

> +
> +  interrupt-names:
> +    items:
> +      - const: isp_irq
> +      - const: mi_irq
> +
> +  clocks:
> +    minItems: 3
> +    items:
> +      - description: ISP AXI clock (aclk)
> +      - description: ISP AHB clock (hclk)
> +      - description: ISP core clock (isp)
> +      # for rk3588
> +      - description: ISP core clock (marvin)
> +      - description: ISP core clock (vicap)
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: clk_core
> +      # for rk3588
> +      - const: clk_core_marvin
> +      - const: clk_core_vicap
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 1

This can be removed.

> +    items:
> +      - description: ISP power domain
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: connection point for VICAP in inline mode
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-isp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +
> +    parent0: parent {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        isp0: isp@fdcb0000 {
> +            compatible =3D "rockchip,rk3588-isp";
> +            reg =3D <0x0 0xfdcb0000 0x0 0x7f00>;
> +            interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +            interrupt-names =3D "isp_irq", "mi_irq";

I removed the interrupt name and forgot to remove the interrupt.

I think the same problem is present in the dt node in the next patch.


Paul

> +            clocks =3D <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
> +                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
> +                     <&cru CLK_ISP0_CORE_VICAP>;
> +            clock-names =3D "aclk", "hclk", "clk_core",
> +                        "clk_core_marvin", "clk_core_vicap";
> +            power-domains =3D <&power RK3588_PD_VI>;
> +            iommus =3D <&isp0_mmu>;
> +        };
> +    };
> --=20
> 2.47.2
>

