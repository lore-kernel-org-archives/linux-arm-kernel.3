Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D43F4BB63
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEIMGpzpyK6EF0Og81+0OZZstvGy8tW9zyYLMbS33BI=; b=uSn+qzQl3kJibzVJP3lI5/THaw
	m0mdnbPM5ytH8uh+6rHcNGkZWFQa3LlD6Fj4A/Hv/fwZ3CWkN/nPAeZ4BBHxpkMXn0XmLQm3Jcgql
	B3riG+ujPcLGkYZ4R4JlBzUVSEbpELhlGp/KDrqI7LzTMO9F9NUBaxa0p1UGlUFjghlsSwfTcaDTP
	LTOtNvA1LF9gZ4L6mX4UzZRnslSBUm/+1X3UyCOEVYuE5uKeSkQKI9eiDboAo0c9FdRgO6G0BhAFs
	v+YJH9QZxBPvzOexptC3mPcZmaDd5VHg5HB1vvYx8Zst3sbqQ7KTEWGPCJr8MaN2lf9WA3GA/s9tN
	1GCImbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwW5-00000002VbI-1pQP;
	Tue, 24 Feb 2026 17:48:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwW4-00000002VbA-3pAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49C9860097;
	Tue, 24 Feb 2026 17:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA6FC116D0;
	Tue, 24 Feb 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955292;
	bh=0UX790U79He2CA/O8Pgt3kt0yvCMfFPH+Roj2u+UMIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHwUdkdINDseoYmpudh+QQZSereSkKJNvNTd0G4EcRLrjZNkj5lJIdM9eiXG0fBBd
	 nuPdn5YP0/brTVya/EBzyJ4959Ri0fgyk59cguPAncd3V+PPKQlTGnxgWknPvdJsEv
	 2uFY+1OhTH7jGLY/YZoq99K/l70+YikDia3NOzGpmkxUIszB6PLIrT/z1i58GgIpch
	 LndvpPS4rqW4kQ3dChhTbu+21WnF64m/Us5DDj8NN0OnIL1Tf0HBUfkgK1LyB7JCVn
	 fthrohws8VBeqGaUjuak6cBNL/6OLlQlTkEigRZbJ/ImWpwF7NuPiLH0avxKtTrKTr
	 /nlypmTaxNr5A==
Date: Tue, 24 Feb 2026 17:48:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu@tuxon.dev>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
Message-ID: <20260224-gout-exquisite-1ee0b67c58cd@spud>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
 <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Pg2x2GyqsqOrWxi"
Content-Disposition: inline
In-Reply-To: <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
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


--/Pg2x2GyqsqOrWxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 02:46:49PM +0000, Akhila YS wrote:
> Convert System Timer binding to YAML format.
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.ya=
ml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
> new file mode 100644
> index 000000000000..ff485b37cba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel System Timer
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Claudiu Beznea <claudiu@tuxon.dev>
> +
> +description:
> +  The System Timer (ST) module in AT91RM9200 provides periodic tick and
> +  alarm capabilities. It is exposed as a simple multi-function device
> +  (simple-mfd + syscon) because it shares its register space and interru=
pt
> +  with other System Controller blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: atmel,at91rm9200-st
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  watchdog:
> +    type: object
> +    description: Watchdog timer subnode.
> +    properties:
> +      compatible:
> +        const: atmel,at91rm9200-wdt
> +    required:
> +      - compatible

This should just be a ref to the binding providing the watchdog.

I am guessing you didn't test this against all bindings, only against
/this/ binding and therefore missed the fact that it doesn't comply with
the binding for the watchdog itself.

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
> +    timer@fffffd00 {
> +        compatible =3D "atmel,at91rm9200-st", "syscon", "simple-mfd";
> +        reg =3D <0xfffffd00 0x100>;
> +        interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +        clocks =3D <&slow_xtal>;
> +
> +        watchdog {
> +                compatible =3D "atmel,at91rm9200-wdt";
> +        };
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--/Pg2x2GyqsqOrWxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3kVwAKCRB4tDGHoIJi
0gXZAP49Up33liGlbEUsjKxmAU71c0fojkmD3O3Lv8taQFFbjgD+PW/4ysDU1+V9
7XU9ZxqFXmnCw7Qp1BddpexXQWXSzQE=
=eSoA
-----END PGP SIGNATURE-----

--/Pg2x2GyqsqOrWxi--

