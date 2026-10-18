Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E33CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6EGb2ugrbt7//+Eojbe2jEyLxPgQ0l7cnMhVIpHK1A=; b=cdqfkGg3oASHq1pdnKVzyngOxs
	9WWUuYDMch4jn+8ceXBuwGDbcXx3Nlh8w3Exa2FC3nHP6rc0BaXyOiF3i1eFZJjcJ/x0TKBYNhLKa
	/BKE03Q6dVYSOiQmfhEkI4dwg319e5vTK9FMtIK7EUY0STwCLr3yRnjoIktVnmie8uSp81jqUAOM+
	J85IpVetFa9c03u+xs4inpO/IUyf01+RBsvpJWnDZVND3VTaIYNAG/4DYs0ZQgPVX/qzzMW5Xd9DS
	FNuBWkb/oez6XrLt7k7xHpq5blCnOki4I9rtiWNCmMif1dunvJYnUCXiorthphsWgXT0UMhQTdhpC
	apZxZ52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWCA-00000006ATr-0R1h;
	Sun, 18 Oct 2026 19:05:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWC8-00000006ATi-3VEz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 19:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F5443245;
	Sun, 18 Oct 2026 19:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D851F000C4;
	Sun, 18 Oct 2026 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792350320;
	bh=d6EGb2ugrbt7//+Eojbe2jEyLxPgQ0l7cnMhVIpHK1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qp2z8ENqhXHUJx4/KuHRL8eb5l6cKZdJPn9YFJB7400ICo4nwiRcdR5hV5OKrUIKo
	 QUg8xoma1OKOjpRUp9jNBx3ZkoMvGk7YGr+KD0Ujml/MWDC0WhXBn9c06gLZx1Nivy
	 lxg40xVVbrZH7PWnj62PTUCSCOuGDA74vGDcatHUsF2EPM0F1yW7DBWuauxc9dW2tE
	 gTS0jMDB/MYQ73O7FcTJmjQIek6Ubc2t9f1raUm4IW8Hzsb+1zAQCEg0ei2MYyyv87
	 2H5B3jDG2F+wC0NSez8fpKdE8c/E8IQbmcj62dEoG1oyxSATcddyTj7+BOJU9nV9E9
	 Qdj/inDcBWTYA==
Date: Sun, 18 Oct 2026 20:05:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: imx-iim: Allow syscon fallback
 on i.MX5
Message-ID: <20261018-suspend-uphill-7fab7a4dd8b2@spud>
References: <20261016232800.536654-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sFPwHorryreAelGg"
Content-Disposition: inline
In-Reply-To: <20261016232800.536654-1-festevam@gmail.com>
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

--sFPwHorryreAelGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 08:27:59PM -0300, Fabio Estevam wrote:
> The i.MX51 and i.MX53 SoC device code reads the unique ID through
> syscon_regmap_lookup_by_compatible(). Their IIM nodes therefore need the
> syscon fallback so the syscon core can instantiate a regmap.
>=20
> Allow the two-item compatible sequence for these SoCs. This prepares for
> restoring the fallback removed while making the IIM nodes conform to the
> binding.

Making it a syscon is only the right thing to do if it genuinely is a
syscon. If it's not, then don't. The nvmem driver doesn't treat this as
a syscon, so the inbuilt regmap locking doesn't actually do anything
here.
Surely the right thing to do is for the soc driver to access the efuse
through the nvmem subsystem somehow?

>=20
> Cc: stable@vger.kernel.org
> Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")

A binding should not have a fixes tag pointing to a devicetree.

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/imx-iim.yaml    | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Docum=
entation/devicetree/bindings/nvmem/imx-iim.yaml
> index bb37d72c9eaa..ebfd947e6800 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
> @@ -20,13 +20,17 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx25-iim
> -      - fsl,imx27-iim
> -      - fsl,imx31-iim
> -      - fsl,imx35-iim
> -      - fsl,imx51-iim
> -      - fsl,imx53-iim
> +    oneOf:
> +      - enum:
> +          - fsl,imx25-iim
> +          - fsl,imx27-iim
> +          - fsl,imx31-iim
> +          - fsl,imx35-iim
> +      - items:
> +          - enum:
> +              - fsl,imx51-iim
> +              - fsl,imx53-iim
> +          - const: syscon
> =20
>    reg:
>      maxItems: 1
> @@ -50,7 +54,7 @@ examples:
>      #include <dt-bindings/clock/imx5-clock.h>
> =20
>      iim: efuse@63f98000 {
> -        compatible =3D "fsl,imx53-iim";
> +        compatible =3D "fsl,imx53-iim", "syscon";
>          reg =3D <0x63f98000 0x4000>;
>          interrupts =3D <69>;
>          clocks =3D <&clks IMX5_CLK_IIM_GATE>;
> --=20
> 2.43.0
>=20

--sFPwHorryreAelGg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatUYbAAKCRB4tDGHoIJi
0hGqAP9cN5ysdapdPoSFATbC17Mn3qlNsgq8HEDLk97mv8+bsgEAg9wSDBftuEge
7S0vKI81Zp2CRYt1yIBEbxvF8zAs4gM=
=gzqd
-----END PGP SIGNATURE-----

--sFPwHorryreAelGg--

