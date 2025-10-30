Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E04ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3qmFOx+BKCxhga7ItLhUi1DfdQ0kJ00xuY/IQl5MKY=; b=cA6UhT1AOD2kq/PQl1BbaWPpY4
	Bpfz9LYJduTNfj6Ou0blxnU+8e6Rb7I8/WHxNGyHx2BZbLaqo853udzbB1pXy9J3u41yCV3UO8rBH
	wOc+o/QsgcGoXYEIFdKmlWRoeFrV4e5wIR7rhq7hMfroPWO5JgyzNaKeAHuHlxBBW98I+NRoryGDS
	S/L7XvNHiR6neiaH15UgCZdSgQwBYack9Gij1DrjDGuSPBo9vQB3qdgIx5xMVSmdm7nbH0NPkTBFi
	OrZKXxirjH3MQoF5Acu2TG4vNwu8B+YVcd/RWkobzSeTDct4bUVEhMraVZ+a7e9sCWb1anu7bCT9B
	yXhqTqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXUA-00000004cYA-13CU;
	Thu, 30 Oct 2025 18:34:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXU7-00000004cXl-0tCU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 18:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9183740118;
	Thu, 30 Oct 2025 18:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E40C4CEF8;
	Thu, 30 Oct 2025 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849294;
	bh=19dZGN/2hByWH5OvB7rCwr9tGLgsitN6UUruD1+2W6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVJes9xZb67Y/8dNTIGJXu0HMKXdhgIVp91UY55fqScatzuvHuRVHU2rd5SOqqCso
	 KOiZQIADVLXJA7xmAGib3APWenetswqPARw+ZXduYiDdU0oMABqkRMsmdPKqiBWg7N
	 t9eRSZpu03Pm+u/fpkJiQ1A1nNqH6uFOdIc8P08zu5YNsUZeSH3xqe9ywXVHI5CtPK
	 gXx6JWTZg1SEN9Aevqu+ZjpovE3fm0ve0kQd5Hq5fWvvL+o8F9Zd+4SM6WcG2QTgk3
	 2bBZ0vjtLs19JJeQ0Yf97l5Mppsn6F7I1yE/wbwevsYoF6Nu20vZy9XN+EPe2yi1Bp
	 HN5B+vJ7HpPqw==
Date: Thu, 30 Oct 2025 18:34:49 +0000
From: Conor Dooley <conor@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Message-ID: <20251030-unfailing-venue-e27a74ebab2d@spud>
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
 <20251030-mini_iv-v3-1-ef56c4d9f219@gocontroll.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M5nFIgRaiFYSCzu6"
Content-Disposition: inline
In-Reply-To: <20251030-mini_iv-v3-1-ef56c4d9f219@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_113455_996886_2DE710AA 
X-CRM114-Status: GOOD (  16.24  )
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


--M5nFIgRaiFYSCzu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 07:35:37AM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>=20
> Document the compatible strings for the Moduline IV and Mini.

> Also add a compatible for the Ka-Ro Electronics TX8M-1610

This is not very helpful to say, makes what you've done seem accidental.
I assumed this was wrong, until I looked up this device and found out it
was a SoM. Please put that in the commit message.
With that info,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 00cdf490b0620..15000923b648a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -996,6 +996,14 @@ properties:
>            - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.C=
ore MX8M Mini SoM
>            - const: fsl,imx8mm
> =20
> +      - description: Ka-Ro Electronics TX8M-1610 based boards
> +        items:
> +          - enum:
> +              - gocontroll,moduline-iv-306-d
> +              - gocontroll,moduline-mini-111
> +          - const: karo,imx8mm-tx8m-1610
> +          - const: fsl,imx8mm
> +
>        - description: Kontron BL i.MX8MM (N801X S) Board
>          items:
>            - const: kontron,imx8mm-bl
>=20
> --=20
> 2.51.2
>=20
>=20
>=20

--M5nFIgRaiFYSCzu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOvyQAKCRB4tDGHoIJi
0pftAP4qv3RuQCQkYDQWrTB8t2YEBbGDaVO1XJqQOOzX/ElfLwD+O39KNZYTtmns
P40SiHPh/Xz+FOwiwDya6Zu/qAtzKQo=
=leRe
-----END PGP SIGNATURE-----

--M5nFIgRaiFYSCzu6--

