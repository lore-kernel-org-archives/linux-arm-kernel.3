Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F074ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3FI2BzZTo4vUEUXcLwMr4eMU0IdZyThfCPaFBfBTdc=; b=cztMAY6I19bgm0uN6k+hp/k7ZY
	2UOfg9i8vRlDdSUG4/sY0clUC6Am0fY9FYtbg+lcbUN5g7VWH14KAYAVuw8yTq77ZHv28DNsTBCRu
	EON6jOhp/458uTU3Ur+WNj4qGu74r0SDarJIhmiGENtYCS0ycFa6mgFQOcAh8sWpwa5RR4tI/K0LY
	SURnLPXfc22ALePuKy2oiThyTuSQop+WGn/y9i4p/PA5MDrgum0Vs6pT6U2yAITMZfKeUMtMD1hRG
	M9I9ZbaztYORFXvZtdZQkZYuasP7kAWpN9H0S0HMq4+f0bf8f0ElORt1dSCJdfwX0JXhJ8U7SKe+a
	8fZw7rVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCui-00000005HGZ-1Ysv;
	Mon, 15 Sep 2025 17:22:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCug-00000005HFd-1XK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 17:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C643A601F3;
	Mon, 15 Sep 2025 17:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297C5C4CEF7;
	Mon, 15 Sep 2025 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956969;
	bh=nm4Sl6r+yzhJ34p1St5LokAobcG1hPH0o7AU2Hb2xkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEqbEYBwcw9ZvxDf5lw0qwk55kbrOXrm80DPU6vbJyy3cTj8jvzeeoEXbv86e0I1k
	 ndxJBf9Ivn+TtMj2w4pAXpFaXkrqlcUe2Yr+iY99GLBgyGd7oXzuhc6YYUrlEONSSO
	 EzGlSQbhWyequ2oLDT+NNpq2rwficwnzLZaoirR3liL3rydrKxEyUrkBbIpG4NprPq
	 /G8J7MU8ks2m4P4zE/jMb78j7ViIZy50uQbiIry9ja64+AJrKnzKBfJvCo4TBi8/S7
	 cG4okr2podH32Lo0Hrx3tVM8wupbvkEDFWh9mO6npcWAQqR+yN/Q/dTCSL91kAlvHW
	 Q6Nm4uKrAfE1w==
Date: Mon, 15 Sep 2025 18:22:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Axiado Reviewers <linux-maintainer@axiado.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: axiado,ax3000-spi: Add binding for
 Axiado SPI DB controller
Message-ID: <20250915-activate-camera-a07ee5ee36ca@spud>
References: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-0-814a1fa2a83e@axiado.com>
 <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-1-814a1fa2a83e@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PK1mfa0NSt68Ndnw"
Content-Disposition: inline
In-Reply-To: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-1-814a1fa2a83e@axiado.com>
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


--PK1mfa0NSt68Ndnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 06:11:55AM -0700, Vladimir Moravcevic wrote:
> Add documentation for Axiado Digital Block SPI controller.
>=20
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  .../devicetree/bindings/spi/axiado,ax3000-spi.yaml | 62 ++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml=
 b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..18e4b002ac99ecdd70d724680=
e24f2867c82dd42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
> @@ -0,0 +1,62 @@
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
> +      - const: ref_clk

Just call this clock "ref", the _clk is redundant.

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
> +         compatible =3D "axiado,ax3000-spi";
> +         reg =3D <0x00 0x80510000 0x00 0x1000>;
> +         clock-names =3D "ref_clk", "pclk";
> +         clocks =3D <&spi_clk &spi_clk>;

Why are these both the same? Additionally, please style this as "<&foo>, <&=
bar>"
with each clock in its own <>.

Cheers,
Conor.

> +         interrupt-parent =3D <&gic500>;
> +         interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +         num-cs =3D <1>;
> +      };
> +   };
> +...
>=20
> --=20
> 2.25.1
>=20

--PK1mfa0NSt68Ndnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhLZAAKCRB4tDGHoIJi
0hm9AP9ZegxgxYzYrxayotLJSwJcS4Dyr32uy5ADaTb5lj/gjgEAy1nWR1tV4v6p
aHmB9hPcVs20AlkkhnBRQkBKhbSrOQ0=
=//eG
-----END PGP SIGNATURE-----

--PK1mfa0NSt68Ndnw--

