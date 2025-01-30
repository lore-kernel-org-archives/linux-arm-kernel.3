Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC4DC02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/vl4xxYte0D6m/Ht6w2IhK+zWc6P85w3vCNrpDGRmY=; b=cxV2uPfMc0ReZ2fjRjMB1f9eIE
	ZdKBDltoXi+XslIzovKPAkQwQAq/x9iUMiHmHThyln+Q3bI3z5Sc8eUNKNss/zCnozqLJUxzBqkom
	TBoFNzJKtU4RM+R3F1aucazK6zjLwqCqIbS2wSlAFhykgNF45p++cxkwLtc0etzFohxk8us5ttMmV
	PId8a5xWbgvm5R0Dk1rf1W9sQu1HpbWxP7kAL5bfikVpkjgyZk1KHQmd2tJqkicw2KME2oqZAwTed
	k5yLXCcKF1ItcK4PYrE6qnllCw3fBpWW/o09BUNYgiIwJpiqiIwxxY+5bo5TWAYdZO34/dhbRJsPj
	4jkbo7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZVp-00000009PYg-3tnB;
	Thu, 30 Jan 2025 18:43:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZUW-00000009PPP-2wzb;
	Thu, 30 Jan 2025 18:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A8EC5C5908;
	Thu, 30 Jan 2025 18:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3C8C4CED2;
	Thu, 30 Jan 2025 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738262535;
	bh=7SyZ5zCEJ4aNJvlmHMl8pZTMFw6jNB5EeCSDItXKy7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MP/S47nA8FE9AkuHWURw/yUclraFw1sFDgbUmalMDZV0/vbCb5U0HkRgrIxFDVQbR
	 jmTquZPkUs7UbzmAwoMc4DmXmNprefYqz2iiZfqflLMIIWSCHcE2hRIARNd4lneK7m
	 PawsARXf+YXzjgMryCAxyE6UcQQaUJPyr3VIxDkf6Exjpgxl2P8B8nW/c2fmUc4rE6
	 /hY1qrBH7jbokFST3GNofAdKQ4JRX3Wbzzv8OCwS0oL2+b7aIeFq7xLEcugnTFGnfk
	 tdXvdFKA/8jTj+TM0Pv/TsAQlqkSBJOKjpuiHhN/iZAiLO+epc56JaVm1vKuGGMtJ+
	 yFV9Ay6+9RgQg==
Date: Thu, 30 Jan 2025 18:42:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: rng: add binding for Rockchip RK3588 RNG
Message-ID: <20250130-anything-scholar-01f4c9145893@spud>
References: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
 <20250130-rk3588-trng-submission-v1-2-97ff76568e49@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hYobnhEFDnkdMhyO"
Content-Disposition: inline
In-Reply-To: <20250130-rk3588-trng-submission-v1-2-97ff76568e49@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_104216_842706_198EDE94 
X-CRM114-Status: GOOD (  26.58  )
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


--hYobnhEFDnkdMhyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 05:31:16PM +0100, Nicolas Frattaroli wrote:
> The Rockchip RK3588 SoC has two hardware RNGs accessible to the
> non-secure world: an RNG in the Crypto IP, and a standalone RNG that is
> new to this SoC.
>=20
> Add a binding for this new standalone RNG.
>=20
> The RNG is capable of firing an interrupt when entropy is ready, but
> all known driver implementations choose to poll instead for performance
> reasons. Hence, make the interrupt optional, as it may disappear in
> future hardware revisions entirely and certainly isn't needed for the
> hardware to function.
>=20
> The reset is optional as well, as the RNG functions without an explicit
> reset. Rockchip's downstream driver does not use the reset at all,
> indicating that their engineers have deemed it unnecessary.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/rng/rockchip,rk3588-rng.yaml          | 61 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  2 +
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.ya=
ml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dff843fa4bf9d5704bbcd1063=
98328588d80b02d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rng/rockchip,rk3588-rng.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3588 TRNG
> +
> +description: True Random Number Generator on Rockchip RK3588 SoC
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-rng
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: TRNG AHB clock
> +
> +  # Optional, not used by some driver implementations
> +  interrupts:
> +    maxItems: 1
> +
> +  # Optional, hardware works without explicit reset

These sorts of comments are not needed, "required" conveys this
information.

> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      rng@fe378000 {
> +        compatible =3D "rockchip,rk3588-rng";
> +        reg =3D <0x0 0xfe378000 0x0 0x200>;
> +        interrupts =3D <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&scmi_clk SCMI_HCLK_SECURE_NS>;
> +        resets =3D <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> +        status =3D "disabled";
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc8ce7af3303f747e0ef028e5a7b29b0bbba99f4..7daf9bfeb0cb4e9e594b80901=
2c7aa243b0558ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20420,8 +20420,10 @@ F:	include/uapi/linux/rkisp1-config.h
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>

> +M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
^^
tbh, not really sure this part of the change should be in this patch

>  S:	Maintained
>  F:	Documentation/devicetree/bindings/rng/rockchip,rk3568-rng.yaml
> +F:	Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
>  F:	drivers/char/hw_random/rockchip-rng.c
> =20
>  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>=20
> --=20
> 2.48.1
>=20

--hYobnhEFDnkdMhyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5vIAQAKCRB4tDGHoIJi
0qgrAQCzakFSQyHjHTH6QESUz0gqsobwUVK1Lds0RZkRNrR/OAD/dXxihZAQuiUY
9ILx114VGQkUr92cCeWnQD49v7U/hwQ=
=wfH8
-----END PGP SIGNATURE-----

--hYobnhEFDnkdMhyO--

