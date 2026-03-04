Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27080EFCE3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nVWI3q3EnMaF4bl/glXaEpiIfFJ6nwKBv9wpI1VYZU=; b=PVh+Pp6UEtdmGLtPM9TcFy+D6j
	EPvPWKBUIZr7ODfl8ins3HHNYgHU8h3PnBKZC5DHmzaIpjRc/FKcafz5PjxM+7r9bXZfnfr/pFbHW
	BT3VuQ17lvVo5hv8du1knt50ImLjzNdAYlW4lf/AYe2LFgcvc0aRTQboMKqudJEY1YnTzFrQBHzRm
	VcFxmFsf5gakFxvExUXWfmlRyMKlEl/QIDSndHbnfwoRCeAl7bl1S9AV3uc/J/rSmC/qksLSXHzp6
	FA6jzige3njIrL8DUJiKfIF3flAqqeWSP2q/alXwE+89nwgqAKyA1kKivG+2AAehsTcspnePqjM88
	1FmyjGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxral-00000000NaI-3UFL;
	Wed, 04 Mar 2026 19:09:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrak-00000000Na8-0EV4;
	Wed, 04 Mar 2026 19:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00388600C4;
	Wed,  4 Mar 2026 19:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D4BC4CEF7;
	Wed,  4 Mar 2026 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772651344;
	bh=+qb4Y2WkmElXR9Cy7wmVw2lZ111N906ZQK11dhQZq+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvO5DLuzqQwEZhr4I89jFVDl6g07LdFrOEAFT99e6LVcLGMXYzYfJVjkwgPawfWGA
	 GtvyhOM+HdbZBfDcqKVwTvIUVW5zoYkRy/dhsU8FZxVwV8ryqvZdUDQvT+6ag+F2vx
	 iMI5SBC7F25IcY852UxhxMShCS7tcw5YBnfhQkrTNMOUev+VOhsmjtkr5COq5/MSlh
	 hARMN1XOuslc/VKZNywt24+QOwcUNGAQA242LEuJBhemjA5RjvgaLiuRQQNhafSxfF
	 H4haXmbP7VTk93FvVhDsxXXgLblVzJtvckmE3DezOUAr4kYwc4ItwP4wHWetmQpQO2
	 x0gkV8g6tvqtA==
Date: Wed, 4 Mar 2026 19:08:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: eip93: add clock gate and reset
 line
Message-ID: <20260304-hardship-abreast-7a2d58cbe446@spud>
References: <20260303193923.85242-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XxcjsSvyQL4G5pyd"
Content-Disposition: inline
In-Reply-To: <20260303193923.85242-1-olek2@wp.pl>
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


--XxcjsSvyQL4G5pyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 08:39:17PM +0100, Aleksander Jan Bajkowski wrote:
> Add the clock gate and reset line, both of which are available
> on the Airoha AN7581. Both properties are optional.

Why are they optional?

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../crypto/inside-secure,safexcel-eip93.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safex=
cel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,saf=
excel-eip93.yaml
> index 997bf9717f9e..058454b679b4 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip=
93.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip=
93.yaml
> @@ -48,6 +48,12 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -57,11 +63,17 @@ additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/clock/en7523-clk.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/airoha,en7581-reset.h>
> =20
>      crypto@1e004000 {
>        compatible =3D "airoha,en7581-eip93", "inside-secure,safexcel-eip9=
3ies";
>        reg =3D <0x1fb70000 0x1000>;
> =20
> +      clocks =3D <&scuclk EN7523_CLK_CRYPTO>;
> +
>        interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      resets =3D <&scuclk EN7581_CRYPTO_RST>;
>      };
> --=20
> 2.47.3
>=20

--XxcjsSvyQL4G5pyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaiDSwAKCRB4tDGHoIJi
0kFdAQDa2xGAEXWTcsZnWZ+DqPQeS9mrnJ5G8gdZkyafZYSJmAD/Vur2DZEbjjta
PQB3sWJGJCz1S70yK3n9JmMjSmGN9gk=
=5r04
-----END PGP SIGNATURE-----

--XxcjsSvyQL4G5pyd--

