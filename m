Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16030CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwueKYYnqEl7LG4fNQO5+4eNYdvSJJGxPkai4w/56Bs=; b=W6Z82UXgXNPoQ02Cu2RgyvtTKn
	ShWg7lrutbOr2oVEJiOMxmrEOQ6vkeFZB6V2JhZXwSUjVBH4fBew6wkXSHDuXlLLSn+U2Iz14XKvY
	iLWLUtcC65W9UsSg/k3/Qz8gTeGIhgzuyAAM4u74cTiGqFo7z51gm0gViPps1YdYeTiJ3l3tOmhoV
	8pyuMf/jr0//oIu0wkZjRrPEfFL0ZBQp1bA3itjsVQ2vbDQEJjGxL28pnOMYQBB3BXQnDLCHVHW5J
	QZCpPu5hl8VJk3FOQPWtbGiNQ7xRVUBvOxyBrCdZAwbFeJ+Aw6kNS+fY7WOVa9AmIL7NYfgHv0lYZ
	1tyWi25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Izy-00000003Hqn-0ezk;
	Mon, 29 Sep 2025 18:53:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Izx-00000003Hqb-0XC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33063626E6;
	Mon, 29 Sep 2025 18:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F8C4CEF4;
	Mon, 29 Sep 2025 18:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759171999;
	bh=cNk2Xp9aKC1/fZzbSc81/LUDAhZMCewvH/hYBAA+o1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckgdZBaEIwOILj4u0uIaJ76wpSm6QAYXTvfxzG71UvaGM118Gzsz1OzSIR4VKBijB
	 o/ZiAUVwGkgTJZrQunJJaR8eWJOc/O8qO6Cv0+SAZ9PzzPXRVz6GpFiL7CBs+i7cJ/
	 F1LZR7vPl9+1lArEBYr2E1vBLp/BETX7/OYcm7j/EZQl808xN2LuUugY4PmfTXAPN3
	 fXdTaMHog3i4RlNGU0OOqs3esvC5cyfYjM2kpTdnWpvBVlKJxf2KXoJgtQI09+9EEc
	 hnaPhcKTZ/+5qPhpj8o0OJvYoygAipHD+ZSVXhMFEkp/WcNQ354rrB0DrIKym6tvv7
	 iNxhkTM5NqOag==
Date: Mon, 29 Sep 2025 19:53:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Axiado Reviewers <linux-maintainer@axiado.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Prasad Bolisetty <pbolisetty@axiado.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: axiado,ax3000-spi: Add binding
 for Axiado SPI DB controller
Message-ID: <20250929-flammable-immunity-6bc48621dba3@spud>
References: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-0-b0c089c3ba81@axiado.com>
 <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-1-b0c089c3ba81@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTzfIpOXBJv0hnVG"
Content-Disposition: inline
In-Reply-To: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-1-b0c089c3ba81@axiado.com>
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


--TTzfIpOXBJv0hnVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 01:58:01AM -0700, Vladimir Moravcevic wrote:
> Add documentation for Axiado Digital Block SPI controller.
>=20
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>

What did Prasad do here? Are you missing a Co-developed-by tag?

> ---
>  .../devicetree/bindings/spi/axiado,ax3000-spi.yaml | 63 ++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml=
 b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..34fa96778dfdec89bc1478226=
5ec23c0bc455a20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/axiado,ax3000-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000 SoC SPI controller
> +
> +maintainers:
> +  - Vladimir Moravcevic <vmoravcevic@axiado.com>
> +  - Tzu-Hao Wei <twei@axiado.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - axiado,ax3000-spi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: pclk
> +
> +  clocks:
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/interrupt-controller/irq.h>
> +   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +   soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      spi0: spi@80510000 {

The "spi0" label here is unused and should be removed.

> +         compatible =3D "axiado,ax3000-spi";
> +         reg =3D <0x00 0x80510000 0x00 0x1000>;
> +         clock-names =3D "ref", "pclk";
> +         clocks =3D <&spi_clk>, <&apb_pclk>;
> +         interrupt-parent =3D <&gic500>;
> +         interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +         num-cs =3D <1>;

num-cs isn't required by your binding and you have not specified a
default. Your driver assumes a default of 4. You should include that,
along with any maximum value, in the binding. See spi-cadence.yaml for
an example.

> +      };
> +   };
> +...
>=20
> --=20
> 2.25.1
>=20

--TTzfIpOXBJv0hnVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrVmgAKCRB4tDGHoIJi
0vqIAQDaoK3ID+wCoVxoZ2C0zZHMOI7RwcFAW3vjlsoV+4pezQD+OLkSm7QI3424
6TS2iP1Yc76+IilZ0IUf25FCuYukdA8=
=sQhy
-----END PGP SIGNATURE-----

--TTzfIpOXBJv0hnVG--

