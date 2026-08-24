Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EB6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsN6r+XHq2tUXaU1o8naYTcnZwkNiVXqQQcfnGVlCVQ=; b=XoFLdsJqKuTVDWkT81MwmCR34V
	uyinRRVsR4icnb7zxIdScJ1w2eI1PJoADL4bEOr7TfKFQ4XPbBT6V+vqvsICaIws6D3qYRksN8m1k
	Tn7VrBoGBdNgwEAzuSU/XCre4ndNVupaILWT101Mdhot41p/TRf0sbyInUe/InQqN0GW9FxXYljRY
	NBlFQTFxesfxZYbBV0NFNixteoOkawMl9U8e9HQioHeNykdw0piXDgSn8w7sEd5vW4eArLJIlhZS8
	0OUzgl27CNBbcv4Qez+weOoWh7uKcKpRHMo5ff+Qf8eaeuU74tXSjx36vwOS4q1zNq+SyHxVd5Pof
	ZQTLBSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXdn-0000000H3a8-0fPh;
	Mon, 24 Aug 2026 16:35:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXdm-0000000H3Zs-07mL;
	Mon, 24 Aug 2026 16:35:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F71E42E36;
	Mon, 24 Aug 2026 16:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EC01F000E9;
	Mon, 24 Aug 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589317;
	bh=LsN6r+XHq2tUXaU1o8naYTcnZwkNiVXqQQcfnGVlCVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SlMAvK86ekfFp2PUkUJvGGka6XM+LeLqKrYR0Ky19TleUoL98Ny58NtZo3q7LzX7S
	 +PvftoN9NZjQDgQypOBDVWbdkQGKZ+H43eckcFpYxQQ7djPZWG9CBYV6J730QoXfSw
	 UNHIloP6z1sWbkBdJ2wLuLv27QeN+ghyOcbKfTMcFpSY0a06NzArDi6koU4ElmN2qb
	 I62Jr70zgLuN/O+TJfadqgCwV2iim12I+xudMOxebalyzfDzjc2UTTDFnmIUonGNaR
	 z7vxOx2tL20TcXvAy0K91Y4sBcOfz2Gd/la73FXncfMyURr8eCM8ScXcPHOYCh2IFL
	 vrzUT1n8TAvlA==
Date: Mon, 24 Aug 2026 17:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Message-ID: <20260824-catlike-human-502f2aa3150b@spud>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
 <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v039y6vQKSu44Jxg"
Content-Disposition: inline
In-Reply-To: <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
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

--v039y6vQKSu44Jxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 09:01:09AM +0200, Sascha Hauer wrote:
> Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> integrates into a number of its SoCs.  Documents the single register
> window (task registers plus the LLP link-table block at offset 0x300),
> the decode interrupt, the aclk/hclk clocks, the AXI/AHB resets, the IOMMU
> and the power domain.
>=20
> The core is not tied to one SoC.  Downstream it is known as the VDPU720
> and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
> RV1126B, with only the clocks, the resets and the power domain differing,
> none of which this schema constrains.  A compatible per SoC is all it
> takes to cover them; the RK3568 and the RK3588 are the two that have been
> tested and are enabled here.
>=20
> The resets and the power domain are required.  The block cannot be
> reached with its domain off, and the driver falls back to pulsing the
> reset lines when a frame times out and the in-block soft reset does not
> complete, which a node without them would leave with no way to recover.
>=20
> The IOMMU stays optional.  The driver never refers to it, it is a platform
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on these SoCs either.
>=20
> Assisted-by: Claude:claude-opus-5

Missing signoff.

> ---
>  .../bindings/media/rockchip,jpeg-decoder.yaml      | 92 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 100 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml
> new file mode 100644
> index 0000000000000..e20c1bf43ef3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml

Filename matching compatible please.

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,jpeg-decoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip JPEG Decoder
> +
> +maintainers:
> +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description:
> +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as t=
he
> +  VDPU720.  The same core is integrated into a number of Rockchip SoCs, =
which
> +  differ only in the clocks, resets and power domain they are wired to. =
 A
> +  dedicated Link List Processor (LLP) register block, located at offset =
0x300
> +  within the same register window, allows the hardware to decode a chain=
 of
> +  frames autonomously ("link mode").
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-jpegd
> +      - rockchip,rk3588-jpegd
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The decoder register window.  It covers both the task (function)
> +      registers at offset 0x000 and the LLP (link table) registers at
> +      offset 0x300.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk

IMO, match resets and drop the obvious "clk" from here.

Fine otherwise.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +  resets:
> +    items:
> +      - description: AXI reset line
> +      - description: AHB reset line
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    video-codec@fdb90000 {
> +        compatible =3D "rockchip,rk3588-jpegd";
> +        reg =3D <0xfdb90000 0x400>;
> +        interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
> +        clock-names =3D "aclk", "hclk";
> +        resets =3D <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER=
>;
> +        reset-names =3D "axi", "ahb";
> +        iommus =3D <&jpegd_mmu>;
> +        power-domains =3D <&power RK3588_PD_VDPU>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253ed..baea7e42663a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23424,6 +23424,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt=
-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
> =20
> +ROCKCHIP JPEG DECODER DRIVER
> +M:	Lucas Sinn <lucas.sinn@wolfvision.net>
> +M:	Sascha Hauer <s.hauer@pengutronix.de>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>
>=20
> --=20
> 2.47.3
>=20

--v039y6vQKSu44Jxg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxywAAKCRB4tDGHoIJi
0uI+AP9QJvwoXyh861YEwC7CW0JzDZYhu7BuaOpeqFXqgxGk3AD/fgA+IylNAek4
QTBa/u9fTgTQqCkl77phwbNHimCCJQg=
=UcLW
-----END PGP SIGNATURE-----

--v039y6vQKSu44Jxg--

