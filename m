Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56068CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaIJQ+1THBMFGo5pDH4KXJgFvv8P1MnGNFwzP1hAer8=; b=sXujRltzZC7xDNm7y/2t7APdLm
	wwkCoAxpePfehZfoMCk5daOVOhmXWhpazaQtfK/tVnQLc/8N/dd5ofEf7SEer40f2aYobeCtH4azb
	nqoYFYOYVecPjfGSTzDpkzJP28Ts+Aq7Y+FiCnyncn0bxb1vhlUQNj8JkB0YXTDu+4SG6xt8y/LDQ
	pBcdn8zJhMYv9ct8E7BzGNjJNzir5xxo3x52ckkp4gGNzAkqJkoOXeRzy3SM4helTP8HHspseiV6O
	HuahQQC0WH5KVrDUo7hL7Gfbnz3BO2Ln379kJRgQFU0WuyoxRoQo0Zon4GQc8nAIq9tJwCNn3rIiz
	ecUrs2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKfc-00000009yYN-1F4q;
	Fri, 24 Oct 2025 16:29:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKfZ-00000009yXg-0TYQ;
	Fri, 24 Oct 2025 16:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 785A8488C2;
	Fri, 24 Oct 2025 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84656C4CEF1;
	Fri, 24 Oct 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761323376;
	bh=J7OMjg4+GfzNY1ARYj6hyRpVfLZJNzOfQdY9BTlvpsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1jDcVgDap9U54WInJ8YbqD6QpOMUXvRpL4//FMU+fvnu5dZvjaDevwUNEHbvkrkC
	 kVoCzRaL9Xz1c1Sxams385EMs/ud14kQNl51l7j8A8ok6KQpmeZv4l48SlhIwSvtdu
	 rqHMATQeut3nWjloZC82kayoS/DPzX8GWHKSLkN2KYK3ZCA38UD1IoAkdzxEFra/nk
	 0mIyFuPFHly+dcbqHMYhYXDBUqBYZubxKyEyeHIcBkY0N63Fngt9vDZ3LmMOMXeq06
	 T5eWeG4s0jtN27Kuegh89IyiwUio38ugIt100xXao4R/Ed/BqgV6ATZTaE/u7Br06V
	 2kRBbsnsKr22g==
Date: Fri, 24 Oct 2025 17:29:31 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251024-think-handwoven-504634ca620d@spud>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
 <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adpN37SuSkUm8sD7"
Content-Disposition: inline
In-Reply-To: <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_092937_193044_A14ED2F1 
X-CRM114-Status: GOOD (  23.57  )
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


--adpN37SuSkUm8sD7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:32:13AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
>=20
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
>  .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
>  .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
>  3 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6316b-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6316c-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6316d-regulator.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b=
-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt63=
16b-regulator.yaml
> new file mode 100644
> index 000000000000..65b70dd90728
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regula=
tor.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface,=
 both
> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phase=
s,
> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phas=
e.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316b-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^vbuck(12|34)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          Allowed Buck regulator operating modes allowed. Valid values b=
elow.
> +            0 - Normal mode with automatic power saving, reducing the sw=
itching
> +                frequency when light load conditions are detected
> +            1 - Forced Continuous Conduction mode (FCCM) for improved vo=
ltage
> +                regulation accuracy with constant switching frequency bu=
t lower
> +                regulator efficiency
> +            2 - Forced Low Power mode for improved regulator efficiency,=
 used
> +                when no heavy load is expected, will shut down unnecessa=
ry IP
> +                blocks and secondary phases to reduce quiescent current.
> +                This mode does not limit the maximum output current but =
unless
> +                only a light load is applied, there will be regulation a=
ccuracy
> +                and efficiency losses.
> +        minItems: 1
> +        maxItems: 3
> +        items:
> +          enum: [ 0, 1, 2 ]

This property has no default, and the property is not required. Is one
of these modes the default, or is there another mode beyond what's here
that is used if the property is absent? Or are all modes allowed with no
property?

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'

Why is address-cells required here? Your bucks don't have addresses.
If it is actually required, Rob's bot has pointed out that the property
isn't defined for the device anyway.

pw-bot: changes-requested

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <0>;
> +
> +      pmic@8 {
> +        compatible =3D "mediatek,mt6316b-regulator";
> +        reg =3D <0x8 SPMI_USID>;
> +        #address-cells =3D <0>;
> +
> +        vbuck12 {
> +          regulator-name =3D "dvdd_core";
> +          regulator-min-microvolt =3D <450000>;
> +          regulator-max-microvolt =3D <965000>;
> +          regulator-allowed-modes =3D <0 1 2>;
> +          regulator-enable-ramp-delay =3D <256>;
> +        };
> +      };
> +    };
> +...

--adpN37SuSkUm8sD7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPupawAKCRB4tDGHoIJi
0tP5AQDTEDGCok9YeXiwjucuPp5QDUW1WDyirZEYNOB8nLm3NQD/XZWXvV8E/94V
LqudmxMVSSFy3pt6GNMlPr0im8tgWgU=
=xSW1
-----END PGP SIGNATURE-----

--adpN37SuSkUm8sD7--

