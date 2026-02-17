Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07FE9A029
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExVLVY3uAx8muOtNeRXgmvlJhDhkfRClcl3VLbtoE6o=; b=yNN9YmIa2He87SpQuz11GGL2fU
	K3lA2dIxvroODz624X3wWQcEMijGDMhRS20zl+NJJlnR4Y3HQNzuooiJJKiVgLp8Or8PY5zUq5zya
	jscWOlMovm5bdj16Xt1eNPQ7+lef3cUPDZeVmAiLUKa5ih7HK1jFIxbmxVwPhug13kG6eA2+MTHi4
	OzQu/verPmifpRcBWCxxmU5Q3gGzT0yx3KSNf1aBexJbN4nIwyI14qsWALI9Ia3vh+XROVnAwwJnD
	NXfrK6s+EZNFxr0OjRJcPTAouLuQRfP48sL7iIuU53gqb/IDGbc9yGo/Lq2cEjMHp2BJ75dcymuZV
	3Ub4lgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPGv-00000008gY5-2ITW;
	Tue, 17 Feb 2026 17:54:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPGt-00000008gXa-1SRx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BB4C40905;
	Tue, 17 Feb 2026 17:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05ABC19425;
	Tue, 17 Feb 2026 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350842;
	bh=w2FJAsoQAGKXXqIH/ZeQVPy+EAquuJJzIcWDe5OYWb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qs2jZeVSHoAT5xtEbpDxiDhRvdUj5g/Wcn9vCUIXaOG0L2C8ezhLi+HOmRuREhDZJ
	 xRfnFvYdHEeIq8CnnA9RVGE5IM7P9bSNLniHk/edLs1v2f1Aa980r4xF+2gzhaMmOQ
	 yfyxUlxkzRDsCexPvRDt7LFdg0fCj4gE/8kX3Iit92CwWzMrpHEEo78VsnZg6DdgtA
	 2YTkZptFWor88zvx/qswFecZtKfQwfXZgQxh9UPZaFDYOak2K0lw07g9dXyCZWeu2m
	 C/35NrycDxrgpFZ7bvVtX9zcNNxukGzY7yaParmeOVGZEFpyXiNnAjLbFwPCdgYj1W
	 tcYjRYaTpD+/Q==
Date: Tue, 17 Feb 2026 17:53:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: arm: microchip,sam9x60-pit64b : convert
 to DT schema
Message-ID: <20260217-surgical-gently-7f58e6fb5e5e@spud>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-arm-microchip-v1-3-ae5d907e10e3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b27VbrnZhyUo1vZR"
Content-Disposition: inline
In-Reply-To: <20260217-arm-microchip-v1-3-ae5d907e10e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_095403_423602_472A4BDA 
X-CRM114-Status: GOOD (  19.89  )
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


--b27VbrnZhyUo1vZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 05:24:21PM +0000, Akhila YS wrote:
> Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
> format.
> Changes during conversion:
> - Add missing compatible "microchip,sama7g5-pit64b" along with a fallback
> compatible "microchip,sam9x60-pit64b".
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++=
++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit6=
4b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.ya=
ml
> new file mode 100644
> index 000000000000..6bf8e81d4c72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PIT64B 64-bit Periodic Interval Timer
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
> +
> +description:
> +  The Microchip PIT64B is a 64-bit periodic interval timer used in
> +  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
> +  SAMA7D65 families. It provides extended timing range, flexible
> +  clock selection and supports both periodic and one-shot interrupt
> +  generation modes.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: microchip,sam9x60-pit64b

> +      - items:
> +          - const: microchip,sama7d65-pit64b
> +          - const: microchip,sam9x60-pit64b
> +      - items:
> +          - const: microchip,sama7g5-pit64b
> +          - const: microchip,sam9x60-pit64b
> +      - items:
> +          - const: microchip,sam9x7-pit64b
> +          - const: microchip,sam9x60-pit64b

These three can be merged into one enum + const items list.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    oneOf:
> +      - const: pclk
> +      - items:
> +          - const: pclk
> +          - const: gclk

This can be an items list with minItems: 1, but there should be some
conditional logic used to permit gclk only where it is valid. The text
binding removal is missing so I cannot say exactly what that logic
should be.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    timer@f0028000 {
> +        compatible =3D "microchip,sama7g5-pit64b", "microchip,sam9x60-pi=
t64b";
> +        reg =3D <0xf0028000 0x100>;
> +        interrupts =3D <37 IRQ_TYPE_LEVEL_HIGH 7>;
> +        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 37>, <&pmc PMC_TYPE_GCK 37>;
> +        clock-names =3D "pclk", "gclk";
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--b27VbrnZhyUo1vZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZSrNQAKCRB4tDGHoIJi
0snqAP9WAtNwebWwwNMLqSegPZVNJSYGdpVGU3DpvMr5Px3t3gEAsSrCuNO6/02a
HgrWRrt6Y4/hZY70/ZP3onU0LEW+rgM=
=3Tpv
-----END PGP SIGNATURE-----

--b27VbrnZhyUo1vZR--

