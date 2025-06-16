Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895BBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EJDBLjh9k/qTBxVDOPHanym/KSNIq8AGLX1oOv6gAI=; b=TMmWNxkuy1oYwgFw9g0/Ken0Ta
	7mOPH1VinlS30Ni7butuE64NCqdvv3E2ucOyTlOm1KsNI7rXwjxn6nh/4nNU03i4VejzVzftKcf0A
	da9h/DyYFSF52byIBR0vg465SkYq0DKhaPmzMMhFf6+Mr7gJvfZdgDdl4xdBBLZo/+o89ngC3OUH8
	3eyoE5jM44f6rV3+ebIG7sV304wxPpPVSd5W2cnQO3N5eMwc2qTisz6b1CY3hkzhZBsoBihL36zR6
	0W9O2sm0okNgfYrZEDN+D/jMVzs4lo8W6f2qOJo+TEuNCvCZyuNDue8lp5i/+1KoYJyuFkuHWhON/
	AuKQf7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLL-000000054sC-3n2N;
	Mon, 16 Jun 2025 17:09:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBXK-00000004o20-08zN;
	Mon, 16 Jun 2025 15:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7565A6115E;
	Mon, 16 Jun 2025 15:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D51C4CEED;
	Mon, 16 Jun 2025 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086853;
	bh=oVNq1HKgH5AsdLLp2/oc3d/YzPzDQJprNg0ypJQvF5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PX/3X52xu3kaMjy4O0uJXkY0H6d569uWQLxiivcPb8otZdkmozLr37/eGCZohQ17T
	 oFoOccSPG+bsR4FgnAe+PubjvwayN/Ks4Bxez77C+J1E9sArCYo02bUlZY1f3Ak2lI
	 MZZQctzQzyq9iMWROBGPEXG6ffe2ekqloegWqLh6gd2ThRxY40gocWRFxoBwo0eIPA
	 CAubRuQxNHcH2O1rCBpaj2oZ62ToeHGbFpmKzN66ez/+r1KVb1HvKKdA+GZbtjte3b
	 JiDdx7JsZI6Ly49Sr/bsk1R9Dujl1wNEAHvF+wMs9s4uEV5apub+euT2LSRC8SW//l
	 O9mX5WdLzDAsg==
Date: Mon, 16 Jun 2025 16:14:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
Message-ID: <20250616-winter-strict-db98f85db22d@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9fJcQZWqMIbTgGsZ"
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-3-benjamin.gaignard@collabora.com>
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


--9fJcQZWqMIbTgGsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
> Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
> in front of hardware encoder and decoder blocks on SoCs using Verisilicon=
 IP,
> such as the Rockchip RK3588.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,i=
ommu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.ya=
ml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> new file mode 100644
> index 000000000000..acef855fc61d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon IOMMU
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> +
> +description: |+
> +  A Versilicon iommu translates io virtual addresses to physical address=
es for
> +  its associated video decoder.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: verisilicon,iommu

You're missing a soc-specific compatible at the very least here, but is
there really no versioning on the IP at all? I'd be surprised if
verisilicon only produced exactly one version of an iommu IP.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Interface clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: iface

Why "aclk" rather than core, to match the description?

> +
> +  "#iommu-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#iommu-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      vsi_mmu: iommu@fdca0000 {

The "vsi_mmu" label can be dropped here, it has no users.

Cheers,
Conor.

> +        compatible =3D "verisilicon,iommu";
> +        reg =3D <0x0 0xfdca0000 0x0 0x600>;
> +        interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_AV1>, <&cru PCLK_AV1>;
> +        clock-names =3D "aclk", "iface";
> +        #iommu-cells =3D <0>;
> +      };
> +    };
> --=20
> 2.43.0
>=20

--9fJcQZWqMIbTgGsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA0vwAKCRB4tDGHoIJi
0vT6AQC6scfk381tN82ARmoQ+PHZMrSLuYi9ck4P/3vTospnlgEA8JzI7GkSRolM
exwAAerU1ffK1uHS3p3k6fwqqJumHgY=
=9xSJ
-----END PGP SIGNATURE-----

--9fJcQZWqMIbTgGsZ--

