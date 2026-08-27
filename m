Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5661DC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPuUIEgAWUbRknirj129WjN+BRWrRvbLZyxXhh94ONk=; b=uaaJiWKqQ5Coj++yE+niBzQBZT
	a3FzU1mBfqRR8Giuk8Kpx5Fq00LZNu6PitS8EGt1nypZgt2QRoi1PeWrSq3K9WsRVCin5ArqcZOFg
	c92S12/FLCU2kRKazeXWQDHRHLhaiMjibKp7xUA24Gxx5JwOPViHub5BaFAG0T2l6LEYSHhuhmq+X
	Ol6rtOwHHq/VVhic18WOgrUY/q/I/ZpwQbYONeEAEgX5/kG7mDOjVGWQeee3t0i5fyHCRKz+Qlbri
	NTuCsDvWxwcYY5Kusrbmy2UEsjeKWK9TGm2tzSnvYutDeDQjnwgVuj/TA10j4x9qZS4LGyre2Uzrb
	sRgW+6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdCC-00000004OAG-3RNC;
	Thu, 27 Aug 2026 16:43:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdCA-00000004O9f-0o2r;
	Thu, 27 Aug 2026 16:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43C08600D2;
	Thu, 27 Aug 2026 16:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E453C1F000E9;
	Thu, 27 Aug 2026 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787848997;
	bh=YPuUIEgAWUbRknirj129WjN+BRWrRvbLZyxXhh94ONk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g34NWurmaut3phSu8fNpe3tBGQHYabwvtF74bY9erqzFXu3Oz+nNQ8Nho8detgNac
	 sQl/AGvoF5/E7YM6ocivvIHNUuqbbOvR/703O7+7QuFPVXWKssWmHOCbJFqLxtQmWO
	 3o6cNbxxo/Kxhf/Yq2wgRDylRm7tbA4+O8T15G4Kf2vZFoDEykyWy5rX3Wb2SB8mrn
	 GdV+qbo7MVsamARlSRQjBCrqiUZ8BHS0wdTjWW0yEpvyDDFy7giPCd8DRU5RJ1qnRC
	 7/skQkL5itdtnrn8UwYPeKnY+48rSG5DWwwRIgya5wR8T96/R7IHSWx9+FMtnK93d+
	 V+uey5VK5wmxg==
Date: Thu, 27 Aug 2026 17:43:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: media: Add rockchip rkisp2
Message-ID: <20260827-uncloak-protract-d1ceb60f1c6a@spud>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hYIEQ4m2e7KxrXOL"
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
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

--hYIEQ4m2e7KxrXOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 07:48:33PM +0900, Paul Elder wrote:
> Add documentation for the Rockchip rkisp2 bindings. This is meant to
> support multiple versions of Rockchip ISPs going forward, including the
> 2.x series and 3.x series. The current version only adds the compatible
> for the RK3588, which is a 3.0.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>=20
> ---
> Changes in v3:
> - reorder patches
>=20
> No change in v2
> ---
>  .../devicetree/bindings/media/rockchip-isp2.yaml   | 125 +++++++++++++++=
++++++
>  1 file changed, 125 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b=
/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b85c28e4d7aa8ceb5db55b49b=
4de10ef8ed704ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml

Filename matching compatible please.

> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
> +    minItems: 2
> +    maxItems: 2

When they match, you only need one.
An items list however might be nice here to explain what the interrupts
actually are.

> +
> +  interrupt-names:
> +    items:
> +      - const: isp_irq
> +      - const: mi_irq

They're interrupts by definition, having _irq is redundant.

> +
> +  clocks:
> +    minItems: 3

You support one device, which has all 5. Drop this.

> +    items:
> +      - description: ISP AXI clock (aclk)
> +      - description: ISP AHB clock (hclk)
> +      - description: ISP core clock (isp)
> +      # for rk3588

Commentary like this is redundant, you have the explicit conditional
below, and this will become a mess with many devices.

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

isp, marvin, vicap.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
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

If you want to ever be able to actually use interrupt-names, make it
required too.

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

Drop the unused label ehre please.

pw-bot: changes-requested

Thanks,
Conor.

> +            compatible =3D "rockchip,rk3588-isp";
> +            reg =3D <0x0 0xfdcb0000 0x0 0x7f00>;
> +            interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
> +            interrupt-names =3D "isp_irq", "mi_irq";
> +            clocks =3D <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
> +                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
> +                     <&cru CLK_ISP0_CORE_VICAP>;
> +            clock-names =3D "aclk", "hclk", "clk_core",
> +                        "clk_core_marvin", "clk_core_vicap";
> +            power-domains =3D <&power RK3588_PD_VI>;
> +            iommus =3D <&isp0_mmu>;
> +        };
> +    };
>=20
> --=20
> 2.47.2
>=20

--hYIEQ4m2e7KxrXOL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapBpHgAKCRB4tDGHoIJi
0tuFAQDobr6oxwDruhhhS+WDp9YR8SU2H/aPxZ2cocJWi3H5tgEA5QSYlBdMiBNB
pli/mB9FCtFZV24ScQc6oVHoQBfStg0=
=LVlI
-----END PGP SIGNATURE-----

--hYIEQ4m2e7KxrXOL--

