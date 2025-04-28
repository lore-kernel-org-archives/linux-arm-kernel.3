Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF179C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lb5QCTtSoPKm4745maCbNsInx/mNdP1Q94xTxafkRA=; b=VRolPG+a4r/jC9izCSPtsBWsJ2
	KWNpRRgADe9TqaiYVw9J+BrX+ewNxNCFsxROhRtfWpWZtUztHkjVblVF3IkI50G1Sz9tI9qHTI/6o
	RSCH7l+/Bf1wAvnDq9RnKEcmGERTwCyVcMaVyrFZpILnb9IfFm6V1J53J6Dv8XgBRON8LuAZJwUWw
	oorjCHMsFyeq1Oxz77ASOoO+5JMw8O99ohPr6fT9KI0SqPEGY9gB1WtV8sJTElbhFcvRs5tA40jOp
	hADoZ2pZhrf0FCarrenkeK2wkt7YXt6r1PFrbgfRfMxZOwLO28Mus7plCLclT5QSXL3LQePhIP+OO
	8YaeESIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rjs-00000006zdi-1Rrf;
	Mon, 28 Apr 2025 16:53:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rh2-00000006zBc-17Qu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46DD7A41B7C;
	Mon, 28 Apr 2025 16:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D10C4CEE4;
	Mon, 28 Apr 2025 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859054;
	bh=w8GeZnfKH54B+v/IYdcqkdWVdQCakOpqtic13lGX4Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl1YQ7seWqYm7DELGZwOo1oAwoe1+S11syjyi5Ia9aq4xVSUQhxNm6VSwt05ST0Hb
	 Xu1Qr2lGagi56zAKiit6UXOL1+VoEQ8Md5ExCthQ7PEbMqCpb4+i9KsLEIqE/LjlKr
	 CYEbuwa72PAOsdXw0LbeRvQHfD9tAAkJTtJVsl9nQOfdNpoAJ7dS75FBEhW82ZcZ8E
	 MBWjpGfg1obcuiL4/UHesWK/cCREy9znXg9jY2bXKgLDXT3Iqugyo8I7yKpauAXuxF
	 ACcXKVDEV4KbSJzxapAUF8uQdvGPWWz0IbVXa5GWVTn3roiYIMNCIyGP4PJ/7EM4pC
	 pjJQmgLqz06AA==
Date: Mon, 28 Apr 2025 17:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <20250428-scalding-coffee-70507d952247@spud>
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nhw6v3yNy4dTm1za"
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_095056_431453_AE99677B 
X-CRM114-Status: GOOD (  16.78  )
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


--Nhw6v3yNy4dTm1za
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 03:59:08PM +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
>=20
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqm=
a95xxsa/
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> Changes in v2:
> * None
>=20
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 447054b52ea39..a6cf65e10d43f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1419,6 +1419,16 @@ properties:
>            - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
>            - const: fsl,imx93
> =20
> +      - description:
> +          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variant=
s.
> +          It has the SMARC form factor and is designed to be placed on
> +          different carrier boards. MB-SMARC-2 is a carrier reference de=
sign.
> +        items:
> +          - enum:
> +              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 =
TQMa95xxSA SOM on MB-SMARC-2
> +          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 =
TQMa95xxSA SOM
> +          - const: fsl,imx95
> +
>        - description:
>            Freescale Vybrid Platform Device Tree Bindings
> =20
> --=20
> 2.43.0
>=20

--Nhw6v3yNy4dTm1za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaA+x6QAKCRB4tDGHoIJi
0gVvAP0YmLaFnU0LzkqbM1C1p2Iq6QSPxnYt3l/wmcpd2kus0wEAiAs1v+vcr16G
FoAD7cwjXSKih7VMnauIiYZDgL4bigw=
=RYkS
-----END PGP SIGNATURE-----

--Nhw6v3yNy4dTm1za--

