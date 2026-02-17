Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20BEE9A026
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AImxmxgvZ+XMASLITaGRzDO1GuJ5MxWuq8w6+FDiYM=; b=2sSl0JHdRUejQ1wu1HOoO2CKN3
	vmPjciFLJnNWyv/Zl4UE0G5OL+8xfvwgKMfrVcODUsocKL8Wo6ELZ/gV7Gcp1fpLgN0UJusaB/k7E
	MndNocz9KaNyJdBxSkpJJd6VQ1JE7J3g4hqONfk/fCtSdFxH2T2ooSWXCpOV/+Fuz35SeWdq1gl8D
	ExsmxKkcn48/XBn0UYmmn/54cTi5xbc5Nmr4bNH1kVLgjfnAT11UDa7gRq1INsbnRckODIUbhAV5Q
	LNkfiMPZDx2VgrmbGdKirGwytIU6vM90sNYQau2xnbc18aSRPHHRxyh+c+axbKhTV09Zyv1GGn0hL
	sU00IsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPEr-00000008g5b-3Zor;
	Tue, 17 Feb 2026 17:51:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPEr-00000008g5K-0FNy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 265EF61858;
	Tue, 17 Feb 2026 17:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7442C4CEF7;
	Tue, 17 Feb 2026 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350715;
	bh=nSlQybRCDf1ukcaNYL889KannvV086DVPELCuG/f9BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSqFCk9GF22E5iyln5OmUpGDTaQAzo/QLkCgApZTk6Jc/W2jps8X4ubPlnRkMDHmw
	 9DzIrMO6LTojMGEFNVsk7Rkyrq/nTffXKdPV4mgZ/8926kYH6vMftel+Ali9Z7iueJ
	 z9lAMosMzDTY9BAwdXvwHibRDE1yYItYhw4lNcYcXUB9CNq1EUvM5n0LThVwF8YxGo
	 7NYfJfdBUuRCZS0B9CHDTxDp1OEmowwCz/XcjCZSLDJEmliAMCxxjvjAS/SNOpftKh
	 OdlF7eLViuXWUUmI049XNvLm4uKRpEGidDS10rcY6jStXKxKDCA4q5KU4M7d5zNx+3
	 rBzavAKhrBsMA==
Date: Tue, 17 Feb 2026 17:51:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: microchip,sama7g5-chipid : convert
 to DT schema
Message-ID: <20260217-fleshy-giddily-80987f509638@spud>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-arm-microchip-v1-1-ae5d907e10e3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ycow4LfqyTcPTdK4"
Content-Disposition: inline
In-Reply-To: <20260217-arm-microchip-v1-1-ae5d907e10e3@gmail.com>
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


--Ycow4LfqyTcPTdK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 05:24:19PM +0000, Akhila YS wrote:
> Convert Atmel system registers binding to YAML format.
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chip=
id.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.ya=
ml
> new file mode 100644
> index 000000000000..4227f308d43a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel/Microchip RAMC SDRAM/DDR Controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>

> +  - Claudiu Beznea <claudiu.beznea@microchip.com>

This email no longer exists, think the new one is claudiu@tuxon.dev.
Look it up in MAINTAINERS.

> +
> +description:
> +  This binding describes the Atmel/Microchip Chip ID register block used
> +  for SoC identification and revision information. It requires compatible
> +  strings matching specific SoC families and a reg property defining the
> +  register address and size.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,sama5d2-chipid
> +      - microchip,sama7g5-chipid
> +      - microchip,sama7d65-chipid
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    chipid@fc069000 {
> +        compatible =3D "atmel,sama5d2-chipid";
> +        reg =3D <0xfc069000 0x8>;
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--Ycow4LfqyTcPTdK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZSqtwAKCRB4tDGHoIJi
0iE6AQCbn0DVPLFR3ihEmzGdFRLqcLHrtfP8u+++3NdkjCmugAEAyW4JRnhN6Tr3
rbcEKL3BsnvquINtkJwbola9wBp31A0=
=67/P
-----END PGP SIGNATURE-----

--Ycow4LfqyTcPTdK4--

