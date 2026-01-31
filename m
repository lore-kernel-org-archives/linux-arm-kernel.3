Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C328E7C6E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INXU9gyGmGPfJKPdYYIXTfbqsq3k+OMEPKOzUIGSy5A=; b=Bp6l4j6G/YBYxTzbW7ubT3EGEd
	uP4b9mBgHdcUMylQZRzt79KRa9YUOtco+d5mT9gFvQplLCY0xdC925TYLDXNem/6ixem9LuR2UYm/
	QUTPfmzZA+LdIcgfaCFKwRMB2QazZQddBj7krxT88QVuk4iVasEzlzSB1pBeooMduT/ZWG9txZUqk
	+L9Z5myhuWRySP2cUzdtT7OQgHWU1b9NqyoqI4YT74May3c/v1CGMe05sX8URdzvaCJxAs9sMBbCl
	DhaXqiucDmCqzspk1J1f2NV6tNIKjV2S601HCJEn7wPxnwMINkm2w51jI3Wb6ARAtPDS6tZYGE94Q
	4s/NL9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHb6-00000002ywa-12Xg;
	Sat, 31 Jan 2026 20:29:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHb3-00000002ywC-4ANC;
	Sat, 31 Jan 2026 20:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73F5043E7A;
	Sat, 31 Jan 2026 20:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D57BC4CEF1;
	Sat, 31 Jan 2026 20:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769891370;
	bh=f0sVImFUlGUkuDHHeMXMU0xTHVTKaPTYa/g/4OG2kC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCr2PLQuZGhohXSyckec2GNgJYpCxAMZiX5ZXuttI4h2ISOBME3Lc1ktaD27gKua/
	 5+FLzHuFW7MKFcTp70y58xoL3pLB7mryAgS+x2fG4zCfZeS3kt5StmJE7pEhtVISeD
	 pTEEtQiS+iRscKtjZSxxyBtCI6IP51EdLe9G6ITZ03sQhb7tzhtGLVcs2VxLTp0jJL
	 R9K2xs7xENKEjOtw4t0gLJe2gpLmOjjwXWpPk/AKVSLZ4gFK2kjADtNRT/T0eBGJmf
	 mPcerwginCUTFbFMsvhw99lizzkwRYRZV6+hls8T+nT0YeWF0+nCe3VhzXVd7J9Un6
	 cHKI/5Lv8BRCA==
Date: Sat, 31 Jan 2026 20:29:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	alchark@gmail.com, dsimic@manjaro.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube
 series
Message-ID: <20260131-acclaim-exciting-dff4e7af23a5@spud>
References: <20260131153106.31723-1-jerrysteve1101@gmail.com>
 <20260131153106.31723-3-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ET2lCNzRh7KZ/8Gf"
Content-Disposition: inline
In-Reply-To: <20260131153106.31723-3-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_122934_054285_78BB00CE 
X-CRM114-Status: GOOD (  15.88  )
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


--ET2lCNzRh7KZ/8Gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:31:02PM +0800, Jun Yan wrote:
> Add devicetree binding for the OneThing OEC and OEC-turbo
>=20
> The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> port, and one USB 3.0 port.
> Among the lineup, the standard OEC model comes with 2GB of RAM, while
> the OEC-turbo features 4GB of RAM; The rest of the specifications are
> identical.
>=20
> The OneThing Edge Cube series (shipping with the vendor firmware) is
> originally designed as a PCDN (P2P Content Delivery Network) device.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index ae77ded9fe47..eeafe40e0f23 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -813,6 +813,12 @@ properties:
>            - const: openailab,eaidk-610
>            - const: rockchip,rk3399
> =20
> +      - description: OneThing Edge Cube series
> +        items:
> +          - const: onething,oec
> +          - const: onething,oec-turbo

This doesn't match your dts, so clearly you have not tested this
sufficiently. oec and oec-turbo should be in an enum.
pw-bot: changes-requested

> +          - const: rockchip,rk3566
> +
>        - description: Xunlong Orange Pi RK3399 board
>          items:
>            - const: xunlong,rk3399-orangepi
> --=20
> 2.52.0
>=20

--ET2lCNzRh7KZ/8Gf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaX5mJQAKCRB4tDGHoIJi
0tO6AQDhX97T4RNwOwgjbzRA7ge2VItVSqWgQ83aVjNB+0ir2AD/dIsJhTWuZqv9
vLvGoiVQqQLkyzt8Hnt2GgFV/WGwJgc=
=0DbR
-----END PGP SIGNATURE-----

--ET2lCNzRh7KZ/8Gf--

