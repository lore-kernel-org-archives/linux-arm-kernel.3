Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1D5CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lcJF+guX3/RRpcKc4nkeyl1bIluwD5F4G3TuMV8WB8=; b=lLPSwFsTVcLo8EvNe2ey2VTKk2
	niAIbQlEmhuS0lW0WaNqbW+Y5i3vq0KnpyeNvw1ARbvXXPTMAiVxva6DiAz3o74Te+qB+vv/TUj6N
	lWqCVZa4T5QY4iV+93MCJbgJJCLeIaRzhXMGqWu/LS4mygaTJRCjKmd98zRS1QRETGkFhXMzrkKI3
	mF8UNKvrW06x0ViKFJazi1qPCaWg3/Z49aCpvWxHQWPze2dkzjYUNsWsqfhWeUKzo751aEg0RZxOA
	7LrfVKd3wFU+CRx2bpjJhVUvUOQVluFrfuoY+c0myZukXI2ISXIUtImQ8F1+yMyrfgCBHrCZW4XM5
	Q6OOBPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCghQ-0000000C6m4-2Vmj;
	Fri, 02 Oct 2026 17:05:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCghO-0000000C6ly-2U6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:05:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF0D360230;
	Fri,  2 Oct 2026 17:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6690C1F00898;
	Fri,  2 Oct 2026 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790960729;
	bh=2lcJF+guX3/RRpcKc4nkeyl1bIluwD5F4G3TuMV8WB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8lkBLFn4jyIAaFjUD6e4CZbXMjQyE5mqT4sarCGlWYfDIosI49AjV0Y4eCc/CQWp
	 +0ws1Bb7lHvK/ldo+Eee9mRIAxVkhyNVfRUjbg8eJoqieHsmVDsKRZ5s7WWu28/GDe
	 468jpA4Ng8+LCp4dFZUQP4Xy73IQEQzLxk3W8tN2fMOPDCO8/F8QiQeg+uI4j/8WDS
	 mCQDApIAvZu5EIEX8/LFHom+9IX+3vjwk4y7qwbzs+s6M3rT6WfhqKFCk2N23ahWla
	 DKvuviPKYG2tR6qLmN1G7wMTG2JXE5y2t/F5y0OWzfQvrCeG7Pmk9ft9tfBFBkepD/
	 TbMDoatxNWq0Q==
Date: Fri, 2 Oct 2026 18:05:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261002-prepaid-retired-3d2c9cbc035e@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cciuDq3elMOy+sRp"
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
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

--cciuDq3elMOy+sRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>=20
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>=20
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++=
++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-c=
onnector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-=
connector.yaml
> new file mode 100644
> index 000000000000..27fee3defde7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connecto=
r.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Toradex camera connector GPIO nexus
> +
> +maintainers:
> +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> +
> +description: |
> +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC cam=
era
> +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO si=
gnals.
> +  This binding describes the sideband signals as a GPIO nexus. The other
> +  connector resources remain described by the surrounding board device t=
ree.
> +
> +  The nexus exposes connector-local GPIO function numbers to camera over=
lays
> +  and maps the functions wired by a carrier board to their GPIO controll=
ers.
> +  GPIO specifiers contain a function number followed by standard GPIO fl=
ags.
> +  A board may omit functions which it does not wire.
> +
> +  The function numbers are:
> +    - 0: Camera reset, connector pin 11
> +    - 1: Camera power-down, connector pin 22
> +    - 2: Camera identification, connector pin 23
> +    - 3: Camera power control, connector pin 24
> +
> +properties:
> +  compatible:
> +    const: toradex,camera-connector

This seems overly generic, but I assume that's what it's actually called
and if you make a new camera connector the name will be
"camera connector 2" or something.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 4
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffffffff
> +      - const: 0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0
> +      - const: 0xffffffff

These seem incredibly wide for something with only 4 gpios?

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    camera-connector {
> +        compatible =3D "toradex,camera-connector";
> +        #gpio-cells =3D <2>;
> +        /*
> +         * 0: Camera reset, connector pin 11
> +         * 1: Camera power-down, connector pin 22
> +         * 2: Camera identification, connector pin 23
> +         * 3: Camera power control, connector pin 24
> +         */
> +        gpio-map =3D <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> +        gpio-map-mask =3D <0xffffffff 0x0>;
> +        gpio-map-pass-thru =3D <0x0 0xffffffff>;
> +    };
> +
> +...
>=20
> --=20
> 2.43.0
>=20

--cciuDq3elMOy+sRp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/kVAAKCRB4tDGHoIJi
0l1DAP9bDUA3Nv7it5RkeD4+LYzY1vUJBthcKaf0+Er4zJ5sTwD/aDRO34o3W2Wc
18ldXYC69SYV2KiUW0VdsZwoaVQIAQw=
=tx7U
-----END PGP SIGNATURE-----

--cciuDq3elMOy+sRp--

