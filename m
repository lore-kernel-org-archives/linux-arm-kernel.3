Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74B8CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBVoPsEPGnESxYkCDYVBHELrM3On52meUWeaUqx194A=; b=zUTlxk5Yu3O+jumJe/fz7A4Jz4
	ZW+pDaBAa2DuxtLKuB5W7k/TKoYL+2MkMFOtUp3KC6a5fxwsZzIICVbuF6zpSa2rxSEr9RFRa7O0P
	+7WPeAyNqmXM9m+eqKHhgJoq4GLvPkitZeoTJEZX2MiHqG+TkQSBxw/O1/J/BuopZuTGiGP+Y/OoA
	dEL6MlSVh+SIETd7Bz1cyhbBM02wvPiQ5bfVNEpBOV1JhIio32AjDsm/EkwlZukTMdOdAzj44qASe
	eMg7ZbK7U3+tIKPNwfpWe39nOb+NENjZXCpWCmi5oolH+2C8Lx8uSPCBYWii/QnBEUl8Gx0ynmpow
	AFHpUy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mu0-00000008MQz-1ilO;
	Fri, 17 Oct 2025 16:02:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mtz-00000008MQY-0EGv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F01464772;
	Fri, 17 Oct 2025 16:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE7DC4CEE7;
	Fri, 17 Oct 2025 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716918;
	bh=QKceSGaY38ubIJxFqjBFxdozyMDtA0Dx78G823wgoEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBoIBZkF/T4PGDBCdEkR8JNVNR7OaJA375S1C1ZwwtHU5ItFsMytfeZaDJmNs/TPK
	 obQTXDazN6Is5B0tIupFJOKMJGwTl4N1shOpiY3oYsfF6FM6gz0Q2SQKfiGXEYhQSv
	 t16L29q67/PxAOq+CYjnbAUa2SGZULzC0QVkalxsD1TMcDgS1cOkzQniMLqxODlA41
	 MQooD3vP2T8tpjZcRt0PGxQ3jOQpWTS3w/qsV9VjKPkeIuW7XRxL22s4uWcpSPTkEC
	 1OAKUrueyLFsOoU7xzsEV5EyikFrtomK4Yju7SCiqJbu25LYYtL0ZMrvSLmIjBs1hJ
	 eKGcM9fGWM8UQ==
Date: Fri, 17 Oct 2025 17:01:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251017-sporty-public-fca6e77b2368@spud>
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
 <20251017074646.3344924-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fta6H4olrjk+9Tyz"
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-2-gary.yang@cixtech.com>
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


--fta6H4olrjk+9Tyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 03:46:44PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S0 and S5 state.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pi=
nctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..4ad160734353
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

Please use a filename matching a compatible, probably the first one.

> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 Soc Pin Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  The pin-controller is used to control Soc pins. There are two pin-cont=
rollers
> +  on Cix Sky1 platform. one is used under S0 state, the other one is use=
d under
> +  S0 and S5 state.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-iomuxc
> +      - cix,sky1-iomuxc-s5
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +
> +# Client device subnode's properties

I'd drop these comments, they're just stating what's "obvious" for
bindings.

> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    patternProperties:
> +      'pins$':
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias pull,
> +          and drive strength.
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Values are constructed from pin number and mux setting

I think this should actually say how the values are constructed, one
shouldn't have to reverse engineer it from a macro in the example.

> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              typical current when output high level.
> +            enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
> +                    24 ]
> +
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node

Drop this comment too.

> +  - |
> +    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)

> +    #define DS_LEVEL4 (8)

Delete this define entirely, it actually just obfuscates the actually
amperage.

> +    iomuxc: pinctrl@4170000 {

Unused labels should be removed from binding examples.

pw-bot: changes-requested

Thanks,
Conor.

> +        compatible =3D "cix,sky1-iomuxc";
> +        reg =3D <0x4170000 0x1000>;
> +
> +        wifi_vbat_gpio: wifi-vbat-gpio-cfg {
> +            pins {
> +                pinmux =3D <CIX_PAD_GPIO012_FUNC_GPIO012>;
> +                bias-pull-up;
> +                drive-strength =3D <DS_LEVEL4>;
> +           };
> +        };
> +    };
> --=20
> 2.49.0
>=20

--fta6H4olrjk+9Tyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJocQAKCRB4tDGHoIJi
0iZyAQCXi00+BFpGerAO8331wYcnK7l8ya18y6X2WdMXteZ53gD8CjFUYulWSNl9
uaPjJOtH6eNa09G51u+sFzFYoBVQCQY=
=eShT
-----END PGP SIGNATURE-----

--fta6H4olrjk+9Tyz--

