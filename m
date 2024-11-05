Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECDD31778
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYnilOxaT8pDzsCEAqxmYbGzLr9kYweSMyGBo4Zh8Hk=; b=p3wSbnwnCwjdZ3jIWO479D9Obs
	JaP25wY8SAEE25Fg44BIThy0hddM2W+ELF6+HicauoTVE7tOp68MTL2H8SlNkyWoiz4W3PnnW66y2
	8blHjEMJgx8X3/uT4Ai4nGlSRiGu8FvoS6ZtDfqe5puH2LmgeVybEFCmNW1dk/l5dzXYarIO0Dl8W
	qjB6270pz2DWK9KunbCHNKD//6EySb8TyAQ83Gt5DbK6k0rTCi9xCSXowjWfryThmEPhHpvyWUfAR
	9WiKwJysZlelwi5aaluHk0rjAr1wwpvdcr4821/WvR8WRoQriIwm3SONL9cwTprYIGjpbBuaxVXLj
	/dtVqsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ny4-00000000KCw-2GaQ;
	Tue, 05 Nov 2024 18:07:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NwH-00000000Jjz-1FAE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB816A437D5;
	Tue,  5 Nov 2024 18:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C10C4CED1;
	Tue,  5 Nov 2024 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730829959;
	bh=FA8YasXCkWty96pqWC0zbLicpOpd5y8Au/gsIejDV2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXPa2yZbl/YzFD6fN4IXrDTqd8EwkmHkksEM8AHSCKJIe5fBIMXKc59E24o2vevU7
	 F2Ky3cwcsfqyKhbJRbeLpmreL3FYIzP/Cnrs4yI1gZbOXE/WJHbsF8l1nToXJ16qi5
	 ax6x+yTZg+dbK7mXDVBLqVgy582W8oySuJApcK9ugfntggedBUYWjYAnwv9g3yRB6r
	 pOsFUKhR+L7C1qeJdHFtJitcQu3U/Jrvy71zMhrEWSU+t6AmJoPsLuPFWz3OQiOZ2a
	 2KSA5SPrmgJiJCoLNrQbyg4TvEzEJqUaF/HLw9xgNi2IhIsBCPDDFADHvp0kuIhkSd
	 FXPH0XThYaJgg==
Date: Tue, 5 Nov 2024 18:05:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <20241105-disarm-baggie-e2563299a24f@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RoFUdNR+eVTM1NxM"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100601_507323_E98CB80F 
X-CRM114-Status: GOOD (  19.12  )
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


--RoFUdNR+eVTM1NxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> The single existing GPU (AXE-1-16M) only requires a single power domain.
> Subsequent patches will add support for BXS-4-64 MC1, which has two power
> domains. Add infrastructure now to allow for this.
>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++++++=
+++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e81f24=
c4b93857f3e12fe 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -49,7 +49,16 @@ properties:
>      maxItems: 1
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:
> +    oneOf:
> +      - items:
> +          - const: a
> +      - items:
> +          - const: a
> +          - const: b
> =20
>  required:
>    - compatible
> @@ -57,10 +66,27 @@ required:
>    - clocks
>    - clock-names
>    - interrupts
> +  - power-domains
> +  - power-domain-names

A new required property is an ABI break. Please explain why this is
acceptable in your commit message.

> =20
>  additionalProperties: false
> =20
>  allOf:
> +  # Cores with a single power domain
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: img,img-axe-1-16m
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 1
> +          maxItems: 1
> +        power-domain-names:
> +          items:
> +            - const: a
>    # Vendor integrations using a single clock domain
>    - if:
>        properties:
> @@ -90,4 +116,5 @@ examples:
>          clock-names =3D "core";
>          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +        power-domain-names =3D "a";
>      };
>=20
> --=20
> 2.47.0
>=20

--RoFUdNR+eVTM1NxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypegQAKCRB4tDGHoIJi
0hvYAP41d81+vVbGwurEhXKOPcmyx+xk6+iazN0Bol8EGVlghgEAg8Np/YUjcJ45
HQFB+cbVr2jjAxIggFlx2U/eGOrdAA0=
=CO6v
-----END PGP SIGNATURE-----

--RoFUdNR+eVTM1NxM--

