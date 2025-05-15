Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HtjO48AE/shbuCncI+ImCTKXDoG8F8rOjSEW+O5Dzk=; b=qjyq6ERH/8ju+2k+3tIGfeTqpb
	cUw84/uo9zqM+dgz+0T5iX7awKLMVFAcMkOMuickxSbcPUA852A/Wj0hZQE31cPZIIqdnnz+mfE6V
	MyWRMiKrvinHu9KqpDLxN8k9lpzyKnQ2SI95qGj4VXWUZS+OLULMI7MIODygktAZa1cnJwIJsfXZN
	ONwwNuDj58Xu400qa1E2DXZzcsoGX3qkA8m7xNR+C5xzgIXFD8UeMO5O/JpPoxvnaCkMCI7Y1x5iX
	kjGLUAjUScja1DpTSBjxgfXKz38s80A7oNhXM8wkXJROZZAaGunJ9gUyZb8DpIN+Rb3320QWLwG0O
	yalJXhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaHx-000000011Kj-0q23;
	Thu, 15 May 2025 15:14:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaBG-000000010Pa-3soD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 355E2A4DF38;
	Thu, 15 May 2025 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC609C4CEE7;
	Thu, 15 May 2025 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321649;
	bh=NVnU3EXlKhcA1buxaPfe5O18xcLQiBuKx4mM07IagEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxiXMnlsIBdlJpTna4XVl4yd+LIHBATurggzh1gAwCvCiEltU8DzI/Npq3OdlKRKZ
	 GKZiKlUI18UwxeyRKxIAdkxLSPr8krEUTkXzgMEItGQKXCRWjw6qFGqImPKtWJhA9a
	 iNQ/USp2IYiv9tYezwSsca83juoSQqrZZeuEWYJOQ1YFUULVHZEButC68OLzVG0sxv
	 hJOmtcI0HPAh3G9VLQm4Wkprc3hlcPByga66I/CQ33bgULosMJ9XbDtZsaY6ekkSH4
	 IFrtvwA4hik9gsdQtkpLtTJ7cKOxppxpc7kbsQOPDqWKYBJFLHQ+0ooqT4Wceqfh9v
	 qMiPRpi/rqpKw==
Date: Thu, 15 May 2025 16:07:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: rename spi-cs-setup-ns property to
 spi-cs-setup-delay-ns
Message-ID: <20250515-laptop-unfixable-85dca20d1b57@spud>
References: <20250515103251.210468-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YNVVBp6SZFwNB2lg"
Content-Disposition: inline
In-Reply-To: <20250515103251.210468-1-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080731_092437_01375BC6 
X-CRM114-Status: GOOD (  17.15  )
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


--YNVVBp6SZFwNB2lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 04:02:51PM +0530, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns to keep
> that consistent.

"to keep that consistent" sounds like some nice cleanup, but these
properties appear nowhere in kernel code and therefore just do not work?
I think the wording should reflect that and there should be a Fixes tag
to the broken commit.

>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts        | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi   | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/bo=
ot/dts/microchip/at91-sam9x60ek.dts
> index cdc56b53299d..c1ff3248bd8f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> @@ -609,7 +609,7 @@ flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-tx-bus-width =3D <4>;
>  		spi-rx-bus-width =3D <4>;
>  		m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/a=
rm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 8ac85dac5a96..13c28e92b17e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -44,7 +44,7 @@ flash@0 {
>  					compatible =3D "jedec,spi-nor";
>  					reg =3D <0>;
>  					spi-max-frequency =3D <104000000>;
> -					spi-cs-setup-ns =3D <7>;
> +					spi-cs-setup-delay-ns =3D <7>;
>  					spi-tx-bus-width =3D <4>;
>  					spi-rx-bus-width =3D <4>;
>  					m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch=
/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index ef11606a82b3..9543214adc9f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-rx-bus-width =3D <4>;
>  		spi-tx-bus-width =3D <4>;
>  		m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/=
boot/dts/microchip/at91-sama5d2_icp.dts
> index 9fa6f1395aa6..fbae6a9af6c3 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -714,7 +714,7 @@ flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-tx-bus-width =3D <4>;
>  		spi-rx-bus-width =3D <4>;
>  		m25p,fast-read;
> --=20
> 2.25.1
>=20

--YNVVBp6SZFwNB2lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYDLQAKCRB4tDGHoIJi
0uu/AQCsh2Rrf0aLS5+M+Dn41EcWua9fjg/EU6tZYdeV5+YuvwD/cSVJLXH4dMCp
Yo8NyZ3cszL9S8dlEsdTv2vQ6t1V3AU=
=AvJj
-----END PGP SIGNATURE-----

--YNVVBp6SZFwNB2lg--

