Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F950CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMAWlgRIezu/D3MlOXoqie3unDqyoNeSgvvkM+BQ4No=; b=oLWu5aCyQc4Czn6beNA8AYXEDw
	Y9e6tuNrTubQ0cWabnChpZ5BYJOF312eRYMP2HJQ11CAWf8u8pbRqQ9GYhDCfGdeA4jUMGEro2t1H
	iuSvgR78hKyZ6dkQnF9wS6K+URvbwt/Ybn6dJRB34zwPNpO1d4YwS0IbHLf9xywOjdb6+GoNw1PJj
	/LETlatIuFgeb7m+v0BWt9F+Fj+h5opwr9wsn8Wx97QN7lSrEIW3R90iboFS5ekyLnJLvucwv+J+k
	QJYLMz0yzA7mktmtvIaKf3rxMaAv9q5bepjE4pc/Ycc8nv18GJ+QP1zEpkjlwPAPDcny6rXVB9jw9
	XCWM9dtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlfl-00000004cpg-2GWO;
	Thu, 11 Sep 2025 18:05:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlfj-00000004coL-0Yy2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 675514070B;
	Thu, 11 Sep 2025 18:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2304CC4CEF0;
	Thu, 11 Sep 2025 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757613926;
	bh=2KNA9CUisSqGTNs+pjOvgziFv5NqIjtSrtlbLeja3pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpEybyKX/63+ZZb6qs2IoyyE4FvNCGP90GL62zJKk7I3msaMsZEF9Je3lm11LNcYl
	 3ilH5hwRhfIDQKRuUkuBJl6xw1xfSnqooP1IjChyM/T1GSdJCCbyJjRPHCdrQNcONe
	 sHVNKF6evlm9h5qWuTpxJzuU4gl7EkL++4SaavOhrhb2ruTMRu1P4AtSD448tGQ89n
	 ZLokA+XygCWCx9uGWyBQgLAPIztYDygimqgwZd8LtJCQg0Zfd+Pf8Jam9ZIOlbYaXO
	 kUVUXbfQ68Fpmk1J50JQrriEpRalPtv7ePIJhyA+zlPcTcEGzFIy5G1T1m35yYY7Vs
	 kpsxX79osoKpA==
Date: Thu, 11 Sep 2025 19:05:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Message-ID: <20250911-iron-stadium-ea225e18bc42@spud>
References: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
 <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TFmC7SfvXiIlch8N"
Content-Disposition: inline
In-Reply-To: <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_110527_213921_17B208D1 
X-CRM114-Status: GOOD (  19.95  )
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


--TFmC7SfvXiIlch8N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 05:26:25PM +0200, Cyrille Pitchen wrote:
> The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
> Describe how the GFX2D GPU is integrated in these SoCs, including
> register space, interrupt and clock.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>  .../devicetree/bindings/gpu/microchip,gfx2d.yaml   | 53 ++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml b=
/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e416e13bc6627a0fef3c70625=
a6a3e2d91636ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml

Filename matching a compatible please.

> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/microchip,gfx2d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip GFX2D GPU
> +
> +maintainers:
> +  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sam9x60-gfx2d
> +      - microchip,sam9x7-gfx2d
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
> +  clock-names:
> +    items:
> +      const: periph_clk
> +    maxItems: 1

Why do you need clock-names if you only have one clock?
If there's a reason to keep it, drop the _clk - it's redundant.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    gfx2d@f0018000 {

"gfx2d" is not a generic node name, I assume this should actually be
"gpu"?

Cheers,
Conor.

> +      compatible =3D "microchip,sam9x60-gfx2d";
> +      reg =3D <0xf0018000 0x4000>;
> +      interrupts =3D <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +      clocks =3D <&pmc PMC_TYPE_PERIPHERAL 36>;
> +      clock-names =3D "periph_clk";
> +    };
> +
> +...
>=20
> --=20
> 2.48.1
>=20
>=20

--TFmC7SfvXiIlch8N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMMPYAAKCRB4tDGHoIJi
0mCPAQC6UaFapuUKAGnIg8753752/OZNLNqKf7dFbaRi37RaxwEAhSubE7nu3aOl
m3nlEqNOdGn2aVpzZhbXTywzoJ2zugg=
=NuVS
-----END PGP SIGNATURE-----

--TFmC7SfvXiIlch8N--

