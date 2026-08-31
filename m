Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l45S1FIaD59xQAqPUTAkPZR5Cbk0GE3PNFGvxtQ232o=; b=mDJp7FpCH6Mp6irkG0QXUb6wmT
	11kwmyzxOkJn1/Emqy7YXxL9fO1iZuOtKtAuAh7mhCRBcMvjMXXLyhzm9GR2tAXHpkfhAySv4rG8k
	zVL/9OSA9d2DHAC0BOY0HpMi3MhqaoaWdyz/qMJ7fLqc66+givclw7Kok+xdhYhDA9qzfjIx38z+v
	ZrDd4jnQWuV+HwoOy2D/niQzEdWsg2eTCAR/3KNxH2sqIUTND9xT/EirImPMlMwSkbQ49i3cONqjz
	CAK5AVIYYeRRxGyjkAcNNPw7mavQCDX68vnmUrCH3sB2tqzCd61dVcc3KKQKuKRNE2zkzdUMr9obh
	wB7cUH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Uc-00000009xXa-2Nuf;
	Mon, 31 Aug 2026 16:04:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Ua-00000009xXF-3wKE;
	Mon, 31 Aug 2026 16:04:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 217CA602D5;
	Mon, 31 Aug 2026 16:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7B1F000E9;
	Mon, 31 Aug 2026 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192255;
	bh=l45S1FIaD59xQAqPUTAkPZR5Cbk0GE3PNFGvxtQ232o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hGV61OLsRWpOhdP8vNKS35Q75/KPtDnrrucz2L/aO5/LlmPq6tN0JWYps2SOG9gB8
	 TxEzOqu2R3MvnyC5cptVR4wjlxS9kSBvGF5K6HqYE/4qxgP8cqoxacV0hZ2vzSikn7
	 ulxgrkuvnL6r3ilgbBVxt0Epd9BcsJcNzXYvQ9pECNqICpfY8oPJ6CGRB+6sId6pvL
	 EoHLlxTQELR4sjNzvHZaoEs7GZnJ3WZth9lfJbc8cJCXx3E0RPmBXMPU2Y1aduRsI1
	 k2yrmmhhJPVWpHPHKcqwS/WnKjryPbhyXQvnqALIn/N1w+K0ZsCjy0tk3dZyNA1Nm4
	 Z+hXLzV+PzT3g==
Date: Mon, 31 Aug 2026 17:04:11 +0100
From: Conor Dooley <conor@kernel.org>
To: zhentao.guo@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260831-matrimony-ability-e5fcf150d213@spud>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vDuQ2UyDODDws11u"
Content-Disposition: inline
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
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

--vDuQ2UyDODDws11u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 04:32:04PM +0800, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 106 +++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..a93a2140801b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +

> +  interrupts:
> +    maxItems: 2

What are these interrupts? All other properties convey the info via
mandatory -names, but interrupts don't.

I don't love the lack of items lists on !-names properties, but not a
big deal to not have them I don't think.

On account of the interrupts:
pw-bot: changes-requested

Cheers,
Conor.


> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: dos
> +      - const: core_vdec
> +      - const: core_hvdec
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: dos_vdec
> +      - const: dos_hvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,canvas:
> +    description: Canvas maintains an index-to-physical-address
> +     mapping table that allows the 16-bit AMRISC decoder core
> +     to access 32-bit or 64-bit physical address.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  amlogic,secure-monitor:
> +    description: Used to decrypt and load the signed decoder
> +     firmware through ARM SMC (Secure Monitor Call).
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - amlogic,canvas
> +  - amlogic,secure-monitor
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible =3D "amlogic,s4-vdec";
> +      reg =3D <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      reg-names =3D "dos",
> +                  "dmc";
> +      interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
> +      clocks =3D <&clkc_periphs CLKID_DOS>,
> +               <&clkc_periphs CLKID_VDEC_SEL>,
> +               <&clkc_periphs CLKID_HEVCF_SEL>;
> +      clock-names =3D "dos",
> +                    "core_vdec",
> +                    "core_hvdec";
> +      power-domains =3D <&pwrc PWRC_S4_DOS_VDEC_ID>,
> +                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
> +      power-domain-names =3D "dos_vdec",
> +                           "dos_hvdec";
> +      resets =3D <&reset RESET_DOS>;
> +      amlogic,canvas =3D <&canvas>;
> +      amlogic,secure-monitor =3D <&sm>;
> +    };
>=20
> --=20
> 2.42.0
>=20
>=20

--vDuQ2UyDODDws11u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWl+gAKCRB4tDGHoIJi
0p1SAQCBt5qF4cDd5+WUBSGCucSvgIOgV7UrxnC4keqbfJkbUQD+N2SKFXRP40rE
DfkfS3/XekyAhUKyQQMUpSC4VoAF8Aw=
=YCLQ
-----END PGP SIGNATURE-----

--vDuQ2UyDODDws11u--

