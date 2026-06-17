Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB42CCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZv1HGAlytWaa6Up/o9NHIGKHSQi3/6sVCX/gXxAz7Q=; b=Pc2fGCq5uqUr9D/FfwkdZqpwJh
	9mLClEZ6YYmTimRy6vitVBX1Nw/BQpey+ok8qnXbHMJ/IrtCnQw3GcLnTPExef0fiduWjcW1MGyXH
	pqcEBrU6IHmxUGXWOKxQGKK+5W8JF5SpkHWdk8I3wHeSR3YRToMmAsWO0DfQEQmRkIHS6ci2BuCOn
	io74Fkluy0JbTaTMDwH3YFsv9ZpY5mcYxEDSgZ5Ms5I9YzYk2/4FCpzsg0mQQtfXfSHJQ1PBnb7yZ
	AjTa+SF4REUAJl4Ra0L2jHWR5D4LXZp4qVZiI1VrOYSDQ/6oEU2t4U/mIAXGIK0if+sqhS0SqhKgs
	Pwt36BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsoC-000000001NL-0bIB;
	Wed, 17 Jun 2026 16:08:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsoA-000000001N4-3Tpx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:08:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7177D40AAE;
	Wed, 17 Jun 2026 16:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F531F000E9;
	Wed, 17 Jun 2026 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712486;
	bh=DZv1HGAlytWaa6Up/o9NHIGKHSQi3/6sVCX/gXxAz7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hz2kqya5xQdNuv8Fo2m1y00ruQyJ4TI3MbFSiTTQegFy+TfVg9vjat3Y5IDCr4FXx
	 PaYQMenFndngCb1DHklaiwN2ycPoYQ+hc8BbHe+cT/3LRlTNcHl4Oh7A8gNqElNfCo
	 aUv2ILGlBKUY8VHL2zTqIXxO+/SkdnprQkXipG/3qO1V+s3u3paBJWr6Fw57s9Y8Q6
	 dbyst4qtrotFI6bEaREY9N25Si3jFJtpOsb86YlexsQK7GIrUkQWN1yj2CEZJHDmCx
	 3W9TT6PLwQu3r1rwos1v58riGRO7LJe9YP0Etogjzjy1lN3ZxvhFqnTXPryO8afAEA
	 VjacwR+HboYRQ==
Date: Wed, 17 Jun 2026 17:08:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
Message-ID: <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHoM7zafRhtkAPrt"
Content-Disposition: inline
In-Reply-To: <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
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


--ZHoM7zafRhtkAPrt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=F6singer wrote:
> These SoCs have 3 clock and reset controllers: Top, Matrix and LSP. The
> separation of concerns between Top and Matrix and the interface between
> them is poorly defined in the hardware, so the bindings list all
> potential PLL clocks that might be passed between them.
>=20
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted). PCLK and WCLK are
> controlled by individual gates. Some devices have a mux and/or a
> divider for their work clock. Some devices, like the GPIO controller,
> only have reset bits and no clocks.
>=20
> The top clock controller is fed by a 26mhz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel mostly relies on the
> boot ROM to set up PLLs, but one LTE-Related PLL is not configured
> on some boards. Therefore my driver contains code to program PLLs. It
> produces identical settings as the boot ROM for the pre-programmed
> frequencies.
>=20
> Not all clocks will have an explicit user in the end. I am defining a
> lot of them simply to shut them off. The boot loader sets up a few of
> the proprietary timers, which will send regular IRQs (although the
> kernel of course doesn't need to listen to them). I don't plan to add a
> driver for the proprietary timer as I see no use for them - the ARM arch
> timer works just fine. I will add a driver for the very similar
> proprietary watchdog though.
>=20
> The clock list in this patch is pretty complete but not exhaustive.
> There are other bits that are enabled, but I couldn't deduce what they
> are controlling by trial and error. Some of them seem to do nothing.
> Others cause an instant hang of the board when disabled. It is quite
> likely that a handful more clocks will be added in the future, but not a
> large number.
>=20
> Signed-off-by: Stefan D=F6singer <stefandoesinger@gmail.com>
> ---
>  .../bindings/clock/zte,zx297520v3-topclk.yaml      |  70 ++++++++++++
>  MAINTAINERS                                        |   2 +
>  include/dt-bindings/clock/zte,zx297520v3-clk.h     | 118 +++++++++++++++=
++++++
>  3 files changed, 190 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcl=
k.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
> new file mode 100644
> index 000000000000..374f63891288
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topclk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx297520v3 SoC top clock and reset controller
> +
> +maintainers:
> +  - Stefan D=F6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  The zx297520v3's top clock controller generates clocks for core device=
s on the
> +  board like the main bus, USB and timers. In addition to clocks it has =
reset
> +  controls for peripherals, a global board reset and watchdog reset cont=
rols.
> +
> +  The controller has two clock inputs: a 26 MHz and a 32 KHz external
> +  oscillator. They need to be provided as input clocks. The controller p=
rovides
> +  clocks to the downstream Matrix clock controller.
> +
> +  All available clocks are defined as preprocessor macros in the
> +  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topclk
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26 MHz external oscillator
> +      - description: 32 KHz external oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc26m
> +      - const: osc32k
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topclk", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8629ed2aa82f..0cc1ede3c80c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3867,8 +3867,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated=
 for non-subscribers)
>  S:	Odd fixes
>  F:	Documentation/arch/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/zte,zx297520v3-*

Sashiko complaint here looks valid.

FWIW
/scripts/get_maintainer.pl --self-test=3Dpatterns
will catch these kinds of things.

pw-bot: changes-requested

Cheers,
Conor.

>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h

--ZHoM7zafRhtkAPrt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajLGYQAKCRB4tDGHoIJi
0mvQAP4ikcMBAm7HrOzIGqoOuKA/tjGl81mN0GnIu+pLpLVZdAEAsgXEDf2C1QIp
BAbVtHSV7qt+fPS14JPbe7tY/fVzsAQ=
=O0ZX
-----END PGP SIGNATURE-----

--ZHoM7zafRhtkAPrt--

