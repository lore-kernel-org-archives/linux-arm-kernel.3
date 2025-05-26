Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B88C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsI7p+fF52PYCImxD0SbLWNleOyvT7ycxlSTDj+5yB8=; b=1hJe0E8HeHcF4qwK5xGfNg2HG8
	27gxU3UprHYXrXktLXMs3xb99wyuXphVuRWew/H44vroNjshYt/VkxEbyh4y0CogzvajG60Gd4h9y
	69/9zKMwxMIIGpPU0jA3rZm2ngxkBUO8d0nRlNp4spKlIWM56yedAk3w5yalztUlSH8Eoj33M5M4s
	yCS8Zl2IYGD6/YKrz7YnTNZQKcOlo7NdqAVZV4Pv2rdUCIqmiFiG2h1cNRV+pB16XqI0ROyNkCPrC
	fMjXRNI23PiAirYDp4lNoDzzm9CVZzmADM6eokDSGv+b2xd8genndEkkfVz3S3cT/YXrpgPpmDjl0
	NOy3CJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaC2-00000009BUw-1pVR;
	Mon, 26 May 2025 15:56:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa9t-00000009B7k-1L3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 119E64A5F7;
	Mon, 26 May 2025 15:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8225C4CEE7;
	Mon, 26 May 2025 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748274874;
	bh=Sb8w3t/dNkEK/ZuTtthI1LdL+b5SAvMEWX+Ac00LuF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=At0jz7WwcMqnFvgZakL8A0pxWGIMlW2bydUYyahUxtpUkBFuVNgmKj1lm1XmX0J0D
	 PTZSrM6RfIMzuVoKpU0quaykIk4NoiXqrxLUjocGL+NEY1kacHh/a1wBQrXiGgMUYh
	 Motfld2ZVJoLi5r8R0PwVxq9af/4WrOVYFjIcADjb8BkT7nfheXoGRybGw31IvpESA
	 jVHcKwpVXzPMIITfMRoOLTBwhlQzJxQdO2TcaoiFUvNYN+d5bkyq9z8GaMuBTHOThd
	 S9+cok0e+v8vyFzz7TQ3/NT5L7V5Ti02tInZZG+kxzEWmDSeNV8eC+AMnsVKzOptNW
	 jAf7br8ko+YyQ==
Date: Mon, 26 May 2025 16:54:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250526-unpaid-mushy-d47196d04ad1@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JFc4LU9IsIE1KMjo"
Content-Disposition: inline
In-Reply-To: <20250522213951.506019-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_085437_400248_0E961DA9 
X-CRM114-Status: GOOD (  17.86  )
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


--JFc4LU9IsIE1KMjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> Add vf610 reset controller, which used to reboot system to fix below
> CHECK_DTB warnings:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon=
']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-s=
rc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml=
 b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..4c92a5e4892bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#

It's a reset controller then, shouldn't it be in /reset, not //soc?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The System Reset Controller (SRC) generates the resets for the device.=
 The
> +  functional reset sources are programmable as either reset or interrupt=
=2E The
> +  block also generates interrupts for various device events.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    reset@4006e000 {

The generic node name here is reset-controller

> +        compatible =3D "fsl,vf610-src", "syscon";
> +        reg =3D <0x4006e000 0x1000>;
> +        interrupts =3D <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> --=20
> 2.34.1
>=20

--JFc4LU9IsIE1KMjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSOtgAKCRB4tDGHoIJi
0jUOAQDQoc27GSHxRP7tOOEB3eThzeGn0UPkwWG1x+2578wSVQD7BI2VzjCyhPki
GriXRs9WSYTq7+FHXwaz+D9bmZa05ws=
=WC08
-----END PGP SIGNATURE-----

--JFc4LU9IsIE1KMjo--

