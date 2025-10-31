Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6168CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrx+Xu4ifmjBDu2f6OLlagBnOXYf1BPDKUGGZWvGuZQ=; b=WEYVBCQf9UeA+O+g6RmUrdkX9n
	MrvwYtE1TYpYj60GFW9Ad52ZTc3LuLhrcCs3DOYXpw/+HD0A4qjtTL3+J3ed5XTZ08YYyXtV86/+y
	CoU7Fu8tZjS30/zLiGIh5n+W4Q4JCpyVKWKlRmXSxw+Z5PC1k2o7aSNlTPSE8yAUiMHMGCkXtv7v5
	axXefq7f460gCrkBmRHl5AobtHphr8LOWlFStXeYYCPvI2doxQJxNVrgge+6zIoo7uXvG9jkucmIJ
	en6bINJXVYjk5mqjuHsk59NsGpRfwIkqQwIK1X8HieAXpHcL0yDoh4H3r0jwQLiKCGunjQ4q9wOdX
	HYlLtKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqdl-00000006I5z-2o0q;
	Fri, 31 Oct 2025 15:02:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqdk-00000006I5m-1ekN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65D5C60216;
	Fri, 31 Oct 2025 15:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2191BC4CEE7;
	Fri, 31 Oct 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761922927;
	bh=A6j+79ZaDyl14b4czHD2Hz3q07hKaC3/PBYZxWZEW7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TX0Ut3TQ6crDZ0ZG/j7ordqRhLzS6QiXiKwdM5uYEBLnnXofofePNUeKEQFyaUG+Z
	 wKJTnF4KNl+HDA7LQjO2y4SNWDYBFrt2GEFNTmf69bECZFtZLryn62jfhqiXNGnATu
	 EQ2spNcNXRC4+3pSdUQhbYZtGypQKGI39vnMMLfND/yIX3M4LvGAoB0guqcXw/AO/l
	 rUMXZBC7JVTrwlJ/Qcr0pIS10UsS/7gGascLkyC0MUz9t3wU6bVBmiO/OLfCplhuZn
	 5cHSA7HV9zzc6j0ETSvLv4DvPZ1DiZjIPAJx97pHDvJhfFOZGqjYnYOuqa+t+btqhF
	 H2J4KqgXgacaA==
Date: Fri, 31 Oct 2025 15:02:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	semen.protsenko@linaro.org, willmcvicker@google.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: nvmem: add google,gs101-otp
Message-ID: <20251031-seltzer-briskness-6f223654c993@spud>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usvtYDXm1VC9pvha"
Content-Disposition: inline
In-Reply-To: <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
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


--usvtYDXm1VC9pvha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:45:09PM +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/nvmem/google,gs101-otp.yaml           | 68 ++++++++++++++++=
++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yam=
l b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2144911297beb89337b0389b3=
0fe6609db4156ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 OTP Controller
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +  OTP controller drives a NVMEM memory where system or user specific data
> +  can be stored. The OTP controller register space if of interest as well
> +  because it contains dedicated registers where it stores the Product ID
> +  and the Chip ID (apart other things like TMU or ASV info).
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml

Why are the deprecated cells needed here?
|  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
|  as direct device subnodes. That syntax was replaced by "fixed-layout"
|  and is deprecated now. No new bindings should use it.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: google,gs101-otp
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pclk

Why bother with clock-names when you only have one clock? Are you
anticipating a variant with more?

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clock-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    otp: efuse@10000000 {
> +        compatible =3D "google,gs101-otp";
> +        reg =3D <0x10000000 0xf084>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        clocks =3D <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
> +        clock-names =3D "pclk";
> +
> +        product_id: product_id@0 {

Why does this node name have an underscore?

Additionally, all nodes here should lose their labels.

pw-bot: changes-requested

> +            reg =3D <0x0 0x4>;
> +        };
> +
> +        chip_id: chip-id@4 {
> +            reg =3D <0x4 0x10>;
> +        };
> +    };
>=20
> --=20
> 2.51.1.930.gacf6e81ea2-goog
>=20

--usvtYDXm1VC9pvha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTPaQAKCRB4tDGHoIJi
0o2cAP9I0IfVYwrgz4yBIgFzfJebObNu1sDfp54Jot15zJ20yQEAy6bLbD/bixRO
unoT5rHftBNPQEVc7PZ4SzaJ+kmQoQE=
=2JhO
-----END PGP SIGNATURE-----

--usvtYDXm1VC9pvha--

