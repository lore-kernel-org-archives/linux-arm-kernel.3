Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EF0CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPoTQhxanAhm9Gm2AUInHKfMoTxSR1RmkShaozP3V4A=; b=rHsv/PgyH4FrpKwrfHiJ3yYMLd
	U+quABRsBDlVkAwGFKTIzpmFW1lbTRnRbfmTyCmeD78npeOuVzUNTcLrKTUO7zSeGhPBEsOnVTMwk
	s6nnuwVpHVe1/6A8Clw/R8LVRrmgRPgaToq5KG04IK5qieQB5tjmMfSkQlY/DHK03jQFlhGYCS8vH
	Ax+8qouUx76IpJw3st/gTEC+7vaqqgH8lvBtLmRtAs3y/GCndGcKCBNnxEUPB8pGVQrDvBemp2fil
	lE42dYc7iTGROnyn1yhSWbfRY/w9szaiyfKGt96aB1b52cLtY0tUrk3Y3MnpkY8xWj7p0zrVcOxJ6
	JE6FJ+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWytP-00000005zTh-043Z;
	Tue, 09 Jun 2026 16:01:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWytJ-00000005zTQ-3rMF;
	Tue, 09 Jun 2026 16:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D1E960200;
	Tue,  9 Jun 2026 16:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9879B1F00899;
	Tue,  9 Jun 2026 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781020884;
	bh=cPoTQhxanAhm9Gm2AUInHKfMoTxSR1RmkShaozP3V4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sa2WZLV3Z/gRbC9cLbpzc2ifg6LubkZcfCSWQG7FV2d8JsCb+mdBu4dmJHD541Z3V
	 /kD8uv+/6aO/kp2rayhW6MoaQsL5I7bSR+xiLxCg51/2GHaKdl/PlPrO3k30H/tBXd
	 p/hPiFsDPpWsWgAH+xtIeCdJ9PP8WYBIHehKOeXs4tBrDo7/zz/yBtMnYkO1HGUblu
	 2sFmDy1ZEHmSzk+ZSAvo7JCO6bzWqxVGazO7CZM9a+n1yphej6KBMj83H8t2z2lwkO
	 ZgcwFZlxpbS/qtFDmR4CWh4l263ZIeXv4aZhjO+ZqqDAaDn8T2oU7HRzknkz+OSu9N
	 aD41EyS+HxtZQ==
Date: Tue, 9 Jun 2026 17:01:19 +0100
From: Conor Dooley <conor@kernel.org>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6323 PMIC AUXADC
Message-ID: <20260609-gangway-frayed-366f6d3cc867@spud>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
 <20260609-mt6323-adc-v2-1-aa93a22309f9@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lzw7ey4J+6nnG0oo"
Content-Disposition: inline
In-Reply-To: <20260609-mt6323-adc-v2-1-aa93a22309f9@protonmail.com>
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


--Lzw7ey4J+6nnG0oo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 04:31:58PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
>=20
> The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
> temperature, and other internal measurements.
>=20
> Add the devicetree binding documentation and the associated header file
> defining the ADC channel constants.
>=20
> Also change the description to 'MT6350 series and similar' because
> the binding already includes more than mt635x series PMICs.
>=20
> Finally, add the MAINTAINERS entry for the header with ADC constants.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |  3 ++-
>  MAINTAINERS                                        |  6 ++++++
>  .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   | 24 ++++++++++++++++=
++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-au=
xadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxad=
c.yaml
> index 5d4ab701f51a..852eb7336a5a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.ya=
ml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.ya=
ml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: MediaTek MT6350 series PMIC AUXADC
> +title: MediaTek MT6350 series and similar PMIC AUXADC
> =20
>  maintainers:
>    - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> @@ -19,6 +19,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt6323-auxadc

Commit message needs to explain why a fallback is not suitable.
pw-bot: changes-requested

>        - mediatek,mt6357-auxadc
>        - mediatek,mt6358-auxadc
>        - mediatek,mt6359-auxadc
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..2551c8cd9e9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16256,6 +16256,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>  F:	drivers/mmc/host/mtk-sd.c
> =20
> +MEDIATEK MT6323 PMIC AUXADC DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h

Why is the binding not being included here?

Cheers,
Conor.

> +
>  MEDIATEK MT6735 CLOCK & RESET DRIVERS
>  M:	Yassine Oudjana <y.oudjana@protonmail.com>
>  L:	linux-clk@vger.kernel.org
> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h b/inclu=
de/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
> new file mode 100644
> index 000000000000..6ee9a9ecffc1
> --- /dev/null
> +++ b/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
> +#define _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
> +
> +#define MT6323_AUXADC_BATON2		0
> +#define MT6323_AUXADC_CH6		1
> +#define MT6323_AUXADC_BAT_TEMP		2
> +#define MT6323_AUXADC_CHIP_TEMP		3
> +#define MT6323_AUXADC_VCDT		4
> +#define MT6323_AUXADC_BATON1		5
> +#define MT6323_AUXADC_ISENSE		6
> +#define MT6323_AUXADC_BATSNS		7
> +#define MT6323_AUXADC_ACCDET		8
> +#define MT6323_AUXADC_AUDIO0		9
> +#define MT6323_AUXADC_AUDIO1		10
> +#define MT6323_AUXADC_AUDIO2		11
> +#define MT6323_AUXADC_AUDIO3		12
> +#define MT6323_AUXADC_AUDIO4		13
> +#define MT6323_AUXADC_AUDIO5		14
> +#define MT6323_AUXADC_AUDIO6		15
> +#define MT6323_AUXADC_AUDIO7		16
> +
> +#endif
>=20
> --=20
> 2.54.0
>=20
>=20

--Lzw7ey4J+6nnG0oo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig4zwAKCRB4tDGHoIJi
0n6MAQCnDXNVMnWZGe4f1faCEvn5pbBT50qSq8LSnOk1vjV8+AEAlL1snbNccP0J
r3m520zkbDUiyuIurTwNMF1q1kkMLwg=
=adwT
-----END PGP SIGNATURE-----

--Lzw7ey4J+6nnG0oo--

