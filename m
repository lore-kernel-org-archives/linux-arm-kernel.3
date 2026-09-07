Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E21CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6WNjLUgGSlgZ9oyOR9b9/1tR3h0n4d4XABzYhhKEbc=; b=pSo6T7LqVcrLo8L/zdxvwUZjGH
	fmL7uhHLhLpkEeyWqlkxdwRvNUZLWsnx1sQeGT2a1M1PLl63YYGtzsvesQUoslSRcFXXQzIAJKfk4
	6iz63F6AUivKuQfXF7rH/GhvJoyLDyQlWtBvMiofIqF3e2Y2/sD4ejQyY2fe2+2EUVto3g441SQXZ
	4LAYiN4xzP6VE4R8oIwT9keRhMJ9XljBIcilc8wh50d6P1w7RI1O+cklT9liMXWExcd6a9wp2hCIq
	AlhJRbjTJxrdn8hVzCqdHleFL75KvMiJW2bcfIS7tKgT9x7UJsGXMAvWRNj83EAjqNgkqgvGj9PZq
	8i0g68iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cwl-00000007SUQ-3Shz;
	Mon, 07 Sep 2026 17:15:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cwk-00000007SU8-2ICL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:15:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F1EF408B1;
	Mon,  7 Sep 2026 17:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D101F00A3A;
	Mon,  7 Sep 2026 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801354;
	bh=/6WNjLUgGSlgZ9oyOR9b9/1tR3h0n4d4XABzYhhKEbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYUjqUgxsZNduYEdJK6kEyRDkUmSH0CzGCWxloPrQNGJcldXo86jD4NX8W1RPsL+y
	 rpDVTeOdq8NYigSjfRmBSV8dqV3dnVlf4QPIAtWDjVzu+lWOtl2cb4JO3K/2OeM1T8
	 6MF1ngnqHCjxySS3BhD228/dRAjqw99brCpYOPuRLJD/FyXaxs/yB+i+m9RaIcH7jM
	 Ctn5kO3n5gC5GgU/vvhGGEVlsP7EO5CbchhDYYq8bQvMQPdbr6tuzwutnllujKXAVG
	 sv26HORiUm4FWMZmBNuHUYstNErf97ckz6PIC2rXalarg3OB0lIY3yHYM36OEAzovb
	 5Cm9gcRziiEFQ==
Date: Mon, 7 Sep 2026 18:15:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Message-ID: <20260907-retorted-unfasten-e985a6d4f26f@spud>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20260907033404.596839-4-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pAQ/rgvGyemObrmX"
Content-Disposition: inline
In-Reply-To: <20260907033404.596839-4-Jelly.Jia@cixtech.com>
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

--pAQ/rgvGyemObrmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 11:34:02AM +0800, Jelly Jia wrote:
> Document the CIX Sky1 integration wrapper around an Arm DMA-350 controlle=
r.
>=20
> The wrapper owns SoC integration resources. The child node describes the
> generic Arm DMA-350 IP.
>=20
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../bindings/dma/cix,sky1-dma350.yaml         | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/cix,sky1-dma350=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml b=
/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
> new file mode 100644
> index 000000000000..e533f355d135
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/cix,sky1-dma350.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 DMA-350 Integration
> +
> +maintainers:
> +  - CIX Kernel Team <cix-kernel-upstream@cixtech.com>
> +
> +description:
> +  The CIX Sky1 DMA-350 integration driver owns SoC resources around an
> +  Arm DMA-350 controller, such as clocks, resets, interrupt routing, and
> +  optional reserved memory. Reserved memory is described on this parent =
node
> +  and assigned by the integration driver to the child DMA-350 device. Th=
e child
> +  node describes the generic DMA-350 IP.

I cannot really speak to whether this is a correct thing to do with a
dma-350, but it seems to me like something that should be resolved with
a device specific comaptible in the dma-350 node. Someone more familar
with the IP will have to comment on that.

However I would like to know how this impacts the existing dma-350 in he
sky1 devicetree.

> +
> +properties:
> +  $nodename:
> +    pattern: "^dma@[0-9a-f]+$"
> +
> +  compatible:
> +    const: cix,sky1-dma350
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  dma-ranges: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  cix,irq-router:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Syscon phandle for the Sky1 subsystem register block that routes
> +      DMA-350 channel interrupts to the AP interrupt controller.
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory pool assigned by the CIX Sky1 DMA-350 integration =
driver
> +      to the child Arm DMA-350 device.
> +
> +patternProperties:
> +  '^dma-controller@[0-9a-f]+$':
> +    $ref: arm,dma-350.yaml#
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - dma-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        interrupt-parent =3D <&gic>;
> +
> +        gic: interrupt-controller {
> +            #address-cells =3D <0>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <4>;
> +        };
> +
> +        dma@7010000 {
> +            compatible =3D "cix,sky1-dma350";
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges =3D <0x0 0x0 0x0 0x07010000 0x0 0x10000>;
> +            dma-ranges =3D <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000=
>;
> +            clocks =3D <&clk 9>;
> +            resets =3D <&rst 15>;
> +            cix,irq-router =3D <&audss_cru>;
> +
> +            dma-controller@0 {
> +                compatible =3D "arm,dma-350";
> +                reg =3D <0x0 0x0 0x0 0x10000>;
> +                interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
> +                #dma-cells =3D <1>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..feff8f9ecb2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2825,6 +2825,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated =
for non-subscribers)
>  S:	Maintained
>  T:	git https://github.com/cixtech/linux-mainline.git
>  F:	Documentation/devicetree/bindings/arm/cix.yaml
> +F:	Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
>  F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
>  F:	arch/arm64/boot/dts/cix/
>  F:	drivers/mailbox/cix-mailbox.c
> --=20
> 2.54.0
>=20

--pAQ/rgvGyemObrmX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7xRQAKCRB4tDGHoIJi
0s8sAP0ShvS8XTkv9z2od3D9RTwQHw2GOsnTrHr2a6a4pSVQvAEAgfpEvw5+gWL+
5eyH2n1reCdSt9+M661Y/Dq7KvGk3AI=
=Mrbc
-----END PGP SIGNATURE-----

--pAQ/rgvGyemObrmX--

