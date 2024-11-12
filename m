Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A58ED42BBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7RGLbCiuCv+WBFbVLK5aqTok+QDxUjhhWRHE2pMuos=; b=1yYi+iVaEaOidZ8yReixud8DDg
	4Q8TQkpvwKACTnx/jxJXudPYBQ9O7kF+5BKe3w8s8NculYkPWBPt9e2g27BIz2OFvUkdoBEcn2MGB
	BlAqjqtMY5TApiHUP5Kl9U1kx/W3/az1sogxjvZc1+lp4ntkzJXs2zqysq9RIHN5aFAUu10iiTi1G
	srt5S3fF8+Bg5clfFtqk0TR+q3ZOSGWINQS1AUNd63c8/EqBwirEluS5wt6nDfs8ZXarwC2OkC/Is
	f1GvuaUSqoH2XN5dgbHW2P4/0xe/uQQDrJSn6fU4oJOkXgAPEPbZVs2KYUkvoPmDhQEaVTKsSoFj/
	da2rganA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvIg-00000004Uwu-2Udg;
	Tue, 12 Nov 2024 18:07:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvAV-00000004Suz-17XS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BB34A41FE6;
	Tue, 12 Nov 2024 17:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D73DC4CECD;
	Tue, 12 Nov 2024 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434350;
	bh=nBqJQ+9Rz7LqvO8HNtJko2uMGpeDf0A8fllkrbNh13U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xv3yOpqbU5jc8KCbzcJqp2C9IdPY824gNn7Xn1fLE3gMMO3O6Ku7iYI1DEATDxkXd
	 /WnJ6ytFAnJ4mkcnKYmlWJT0mBOUk1aweXSDKptnpUY4bL8kFA4AQIcjSeKZUfNhg1
	 zvM1eX4lJQhfBLJPbuH2ffxaq//pE7JWSUS0aY0yv1n8D5gsKWjhFKR0j/q8gHu2Hu
	 SlrvrLYHM1sGlUAXVB/d/5c1sIgwPCw4wpsF5Bm+knPeiANlml0PxjQYIiiKCcicZU
	 fYfhz5UKKQb/TZ1cbF7nAgLmVhfBXpAR3oo2HGlON4aqGWWwP4sGpDqMMLeDx6bw0/
	 YfnsCKbpv96IA==
Date: Tue, 12 Nov 2024 17:59:05 +0000
From: Conor Dooley <conor@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sudeep.holla@arm.com, peng.fan@nxp.com,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mjchen@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <20241112-fender-mug-8eb81a6727e0@spud>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k0rDWj3vLf/SiQCG"
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_095911_473402_7A780707 
X-CRM114-Status: GOOD (  21.52  )
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


--k0rDWj3vLf/SiQCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
>=20
> Signed-off-by: mjchen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d=
1-keypad.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypa=
d.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..71debafc3890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-period:

Not a common property, so it needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
> +    description: |
> +      Key debounce period select, specified in terms of keypad IP clock =
cycles.
> +      Valid values include 0 (no debounce) and specific clock cycle valu=
es:
> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
> +

> +  nuvoton,key-scan-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set the time it takes to scan each key in the keypad, in clock cyc=
les of the IP.
> +      This parameter controls how frequently the keypad is scanned, adju=
sting the response time.
> +      The valid range is from 1 to 256 clock cycles.
> +    minimum: 1
> +    maximum: 256
> +
> +  nuvoton,key-scan-time-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set a divider that adjusts the scan time for each key.
> +      This value scales the time it takes to scan each key
> +      by multiplying the key-scan-time by the specified factor.
> +      For example, if you set key-scan-time to 64 cycles and configure k=
ey-scan-time-div to 2,
> +      the scan time for each key will be increased to 128 cycles (64 cyc=
les * 2). time.
> +    minimum: 1
> +    maximum: 256

Why are both of these properties required? Why not just provide a single
value and let the driver figure it out (and why not use the standard
input property poll-interval)?

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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - debounce-period
> +  - nuvoton,key-scan-time
> +  - nuvoton,key-scan-time-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible =3D "nuvoton,ma35d1-kpi";
> +      reg =3D <0x404A0000 0x10000>;
> +      interrupts =3D <79>;
> +      clocks =3D <&clk>;
> +      keypad,num-rows =3D <2>;
> +      keypad,num-columns =3D <2>;
> +
> +      linux,keymap =3D <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-period =3D <8>;
> +      nuvoton,key-scan-time =3D <1>;
> +      nuvoton,key-scan-time-div =3D <24>;
> +    };
> --=20
> 2.25.1
>=20

--k0rDWj3vLf/SiQCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOXaQAKCRB4tDGHoIJi
0pYPAQDDf02Gop88JjPTAhEapsw6Y2RsUuUw+y3t6GLs5WaYTQD6A9rBf5mY07HN
IdLXIMBrLZwIVIq8TP0uaaLeB9wcgQI=
=p5T+
-----END PGP SIGNATURE-----

--k0rDWj3vLf/SiQCG--

