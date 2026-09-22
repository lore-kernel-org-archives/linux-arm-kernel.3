Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240BFC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTAnb6Oq272HngWK1zOxdvaL3eZ6qI/PfUaNGme30Jc=; b=ImwQRqRmTg3gSlh0fFQMvsEPGu
	iOFO1/NnPeX1h40zlH82T5Lxn9CwY1aZXd9kiANFts5QnCPy9zKkiGJ/OM/7s0R7Z9MkDM48V07KG
	t/crcjhPHxDrex+PXVnuVwdRxa7SA3F5tdp1azXO+VSpWxwzF8kNygJHS1W78zKEfTQY9TGlMpeq6
	RPaz3DsLU3xA52NERdEUbhSJfoxtqnYEeo/XwlSEoY4z7gucsQ6DksVezqpBgvHgcZMlZ9VKTwZ9F
	dKXADWnxhIsrLkt8tYJog3I4KRTFnMNDceAPk9dfdXnIFSM+z0TBohGYR2qefiMsR6o/eXogElfTY
	kH8vc52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94sa-00000006GH0-1TPQ;
	Tue, 22 Sep 2026 18:06:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94sZ-00000006GGi-0Xkp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2915E60232;
	Tue, 22 Sep 2026 18:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5E71F000FF;
	Tue, 22 Sep 2026 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100365;
	bh=OTAnb6Oq272HngWK1zOxdvaL3eZ6qI/PfUaNGme30Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=npJDBT4wWkW2y8a1n1T/o3bcwHAdPw8oZ3marPpQHY9BkRPrdN/Y1Rf6zZVjKkn7T
	 otgcVGuutqCTfZtChmaxyuTlNMRoLDbgYCG4xR/Ced4PtVjHVUiCO1WFgHdfjvxtNs
	 CSbpAamDUES09D8m9Vk1T0a6kVhnuZiJE0wC5I4rQq1IjM9WZsEX8G2IVpqKy7QgEw
	 K/cOmg/HLObeNiC4k0ini/42I0D+PZrexs0AXSpH2a9HtIqOL7lKD6NRZdQdSDTTb3
	 wWrM4uHe/MPPkvY8sVwD5DyUtT133teqRInbjSSvIxs36XA8z2X5F7A9l1a+KImSbt
	 foLsCnS6JCslQ==
Date: Tue, 22 Sep 2026 19:06:02 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260922-cheer-reference-c31fc6fb946d@spud>
References: <20260921232540.3128596-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoDyum+tpwGqygp3"
Content-Disposition: inline
In-Reply-To: <20260921232540.3128596-1-robh@kernel.org>
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

--xoDyum+tpwGqygp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
> node only contains the compatible string and one register window on the
> local bus.
>=20
> Assisted-by: LLM

Guidance to the LLM should probably include including the reason that
this is being added to the commit message.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisil=
icon,hip05-cpld.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hi=
p05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,h=
ip05-cpld.yaml
> new file mode 100644
> index 000000000000..f9d48b871a4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpl=
d.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon HIP05 CPLD registers
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hip05-cpld
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    local-bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        cpld@100000000 {
> +            compatible =3D "hisilicon,hip05-cpld";
> +            reg =3D <1 0x0 0x100>;

Also what's with this example? 1 0x0 0x100 should be 0x1 0x0 0x100?

> +        };
> +    };
> --=20
> 2.53.0
>=20

--xoDyum+tpwGqygp3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLDigAKCRB4tDGHoIJi
0p2IAP9yPdaLLZo9WKjprTpW7sb6ElXBhBJPZ5GD7K6+q1E94QD+LYi5JSelMhBi
L0I/pBM9fXFBHCeHUv4kgJhw1QYUNAQ=
=Virt
-----END PGP SIGNATURE-----

--xoDyum+tpwGqygp3--

