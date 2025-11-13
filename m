Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A04FCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYtiuKaBwelsO351mfbV3Me/wfDnJfjqadKQTKmivyM=; b=eFMjSAs62HFHCDSq0m5V/oa+C/
	YB6aOzSFKH4lUzu2ZLUm25S8ydPgVR8o2sLO6Vue0hcWF5/PvdLzhAzthct3sbU909pWLc4dJf2/U
	M2EYVQNf8Xrfo39yKmOkNCro+CiaSKMO0iSVto1BFRd4LsS22lRX8gk29xt47f8S9I1xblwKJApHf
	LDcqTl2cBQl4b9WPxAj1gzvY53FoRL7m/eValFulv5uW3GUzAr3H33Yd60MklEnA+fD/IC7TNEojK
	QfnIoo2WGLIsU4pIOloYe70xIUNAcYo9CNJzdyHP63VeS2t8W6oo6bot/wDSKpEep5u3JuNnYLRi6
	7TT+fEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd07-0000000B08l-00o5;
	Thu, 13 Nov 2025 19:28:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd05-0000000B08Z-2QWX;
	Thu, 13 Nov 2025 19:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE75960122;
	Thu, 13 Nov 2025 19:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4666C113D0;
	Thu, 13 Nov 2025 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062136;
	bh=qGKHCq3IkG1f2krj8XlGruglJb9NvGo4NAueK5tlbj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSWPRh256IUJOk89hPwbvQx6XfBiLWyif7ZaKrL9AGBSocThtuX8c/E7wUXKzp454
	 XdoyseBi1YQEsa1ATaZ6XGYw539zBPD+zDwTa4t80vVp+EEqTQuXksETqWQodi4KWv
	 KTcfx3ptxVruJtgz+VBVSJWxNsKU39akmnCJNli5tn/oeAmFMG5o/dGVAvs6+UyEq1
	 IrnADkEmKSArZNcfnfAXXxu5NzsoLBFwDxMiEHhXLlmZk2m+nkE6kWKNauoOOm79Da
	 PIpYxjqPxRYc34nOMYFdq5w7rNUxVGJaXXaFI362rOSglQhT+2vPAhThhQLtjMRC1a
	 Gai5N8Zx90zcg==
Date: Thu, 13 Nov 2025 19:28:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: afaerber@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, james.tai@realtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cy.huang@realtek.com,
	stanley_chang@realtek.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: realtek: Add Kent Soc family
 compatibles
Message-ID: <20251113-preorder-task-4e5ba09580d8@spud>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
 <20251113123009.26568-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptaQ1TJ62zXffYwA"
Content-Disposition: inline
In-Reply-To: <20251113123009.26568-2-eleanor.lin@realtek.com>
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


--ptaQ1TJ62zXffYwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 08:30:07PM +0800, Yu-Chun Lin wrote:
> Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.
>=20

> Additionally, convert legacy DTS-style comments to YAML description
> properties, following the pattern from the ARM bindings conversion series
> [1].

"Additionally" is often a sign that it should be in a different patch.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> [1] https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/
>=20
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documen=
tation/devicetree/bindings/arm/realtek.yaml
> index ddd9a85099e9..be529490640c 100644
> --- a/Documentation/devicetree/bindings/arm/realtek.yaml
> +++ b/Documentation/devicetree/bindings/arm/realtek.yaml
> @@ -14,21 +14,21 @@ properties:
>      const: '/'
>    compatible:
>      oneOf:
> -      # RTD1195 SoC based boards
> -      - items:
> +      - description: RTD1195 SoC based boards
> +        items:
>            - enum:
>                - mele,x1000 # MeLE X1000
>                - realtek,horseradish # Realtek Horseradish EVB
>            - const: realtek,rtd1195
> =20
> -      # RTD1293 SoC based boards
> -      - items:
> +      - description: RTD1293 SoC based boards
> +        items:
>            - enum:
>                - synology,ds418j # Synology DiskStation DS418j
>            - const: realtek,rtd1293
> =20
> -      # RTD1295 SoC based boards
> -      - items:
> +      - description: RTD1295 SoC based boards
> +        items:
>            - enum:
>                - mele,v9 # MeLE V9
>                - probox2,ava # ProBox2 AVA
> @@ -36,25 +36,43 @@ properties:
>                - zidoo,x9s # Zidoo X9S
>            - const: realtek,rtd1295
> =20
> -      # RTD1296 SoC based boards
> -      - items:
> +      - description: RTD1296 SoC based boards
> +        items:
>            - enum:
>                - synology,ds418 # Synology DiskStation DS418
>            - const: realtek,rtd1296
> =20
> -      # RTD1395 SoC based boards
> -      - items:
> +      - description: RTD1395 SoC based boards
> +        items:
>            - enum:
>                - bananapi,bpi-m4 # Banana Pi BPI-M4
>                - realtek,lion-skin # Realtek Lion Skin EVB
>            - const: realtek,rtd1395
> =20
> -      # RTD1619 SoC based boards
> -      - items:
> +      - description: RTD1501s SoC based boards
> +        items:
> +          - enum:
> +              - realtek,phantom # Realtek Phantom EVB (8GB)
> +          - const: realtek,rtd1501s
> +
> +      - description: RTD1619 SoC based boards
> +        items:
>            - enum:
>                - realtek,mjolnir # Realtek Mjolnir EVB
>            - const: realtek,rtd1619
> =20
> +      - description: RTD1861b SoC based boards
> +        items:
> +          - enum:
> +              - realtek,krypton # Realtek Krypton EVB (8GB)
> +          - const: realtek,rtd1861b
> +
> +      - description: RTD1920s SoC based boards
> +        items:
> +          - enum:
> +              - realtek,smallville # Realtek Smallville EVB (4GB)
> +          - const: realtek,rtd1920s
> +
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.34.1
>=20

--ptaQ1TJ62zXffYwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYxcwAKCRB4tDGHoIJi
0kD3AP499BiiUVsgMMA2wKPbp7/L+tqW7fMI0z0FMaEJj5vA0QEA6jt6JeIqW6fR
GNQx1tBoteLH60oiHQw+4ElAEkAtugU=
=GZa9
-----END PGP SIGNATURE-----

--ptaQ1TJ62zXffYwA--

