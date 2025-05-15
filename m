Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E044C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl464xzQ6SnPEymqCZh+Pqa/NUvsS04IRWVlhpc9XbA=; b=IuklJgRx5OkFoyiRZ7TWF4Pfj3
	83TKdgnEXfcunn1PJaOdhaPxP/d4aFEUEmIX2qQITnQtKkdq59PXmG38Uh4NkdEgFCyc/G6KVFsJJ
	t8LX5LgBISMiUyyopgwYF45QwxRet/rtv7ZIT8gOz74VyD3pDN25OmTzbqTqrh2vXowXHTeZ9B8HO
	crFizZdZWaTeBez9MXFpu1OUfUL9WqzvfAYO3/TwBZ4L2Uzipc36NWHmu7TwGlOT1tkYdzC3cdJI6
	JUVKu4BHP1ziIhHjQc3Dw8U3L7gbJn51lABPC3PlMN1bSDwbwO8i1JaeT6aEDJvXHMGxwwzIxBUhB
	R86k8KEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaDy-000000010r4-0oDO;
	Thu, 15 May 2025 15:10:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa7I-00000000zOb-3oXi;
	Thu, 15 May 2025 15:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E71D65C5A2C;
	Thu, 15 May 2025 15:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA68C4CEE7;
	Thu, 15 May 2025 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321403;
	bh=f33gqLjldDDdRW4vOxXs11kVH65ekxxGAWcPGMLu7f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcbrkI0xhqMduqtOMGllH5ntAsObN/OLbfB/G31UnYU10u7LJNFjfauJHLemsvZTd
	 HAr7RFeurbh6Q/9X6pYDIIYkZ9cXeoZOD2sihlH75AD7hoUz0sPiPEMVog5b2FwhKi
	 Ll+TWmdpR3fx4gqhweYGnEWY9ZHB16vzxnhiL3FO77CXwGSIFYTMlON6jqEzFYvse5
	 NCr3YOvHsy6juqvPfGC5VFgmbOIOxAIb1iUYnZpVyDuMKQf8/VvaYIRfPrz5qNGvSq
	 wdmAlZz5EHdsF3w7DBqd9xiwmj5nIMZ1GTwQKy7Wb0ROrKHQmFxo2dCXyqS2u8a3SW
	 vvpYrpXkby+2Q==
Date: Thu, 15 May 2025 16:03:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250515-playpen-dislodge-80245fb8b7a9@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMx8Qhq8OmFBcl/n"
Content-Disposition: inline
In-Reply-To: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080324_992262_66C674A4 
X-CRM114-Status: GOOD (  16.02  )
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


--oMx8Qhq8OmFBcl/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> The '#reset-cells' property is required for some of the MT8188
> clock controllers, but not listed as a valid property.

"required for some" but not marked required on those platforms.
Why not?

>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +=
++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fba=
c26008aa955c724 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -52,6 +52,9 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  '#reset-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.49.0
>=20

--oMx8Qhq8OmFBcl/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYCNgAKCRB4tDGHoIJi
0qykAP4jwOwRNbjISghj42hTicuByhnQbNDJe/Q2kvlQkNMG9gEAhJbm+LJ5HFzy
6WQO5VV1fAzocZfklpykpuhviJASSgo=
=5N6U
-----END PGP SIGNATURE-----

--oMx8Qhq8OmFBcl/n--

