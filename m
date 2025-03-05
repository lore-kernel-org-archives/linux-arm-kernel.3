Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0EDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHV5c9PetX/PscQuwtaEjIVtQ+ZX8V1zIEZxym30M+c=; b=sk/vxVRxoXW/bq55I/m6KQs9mT
	dBIv9Wg34MmVET+nl6kliNGJxVflKFbVwrYzAVJbnRXtTDQYALo5two+wwLsAuLWd6ofbNCe3d6W2
	1vrloHf7TeM3QJDVnjMm+onncLNX4m4sQVoQWVPJF6ZDmTljKgWYi/7DTx2sAaVGCBYwzLYjmp9v6
	6xA+kY/jDdnqNm/qqz4EJRprQXgbiPKeLjIa9BMQNxiMVqZ4p6aXcdei+TwAvehCAsBPCJLf0JaH9
	ypoCah7P4EaLggfcx3wVIAyL0VQ6rnqE90ROHFeJRiJUjMSy4mIDVQyhHtr1seRtQfyLHAqHLCaZC
	GoxNCKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprdn-00000008fgc-17R6;
	Wed, 05 Mar 2025 16:30:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprbb-00000008f9g-03xb;
	Wed, 05 Mar 2025 16:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A408D5C6913;
	Wed,  5 Mar 2025 16:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81834C4CED1;
	Wed,  5 Mar 2025 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192101;
	bh=k6csO67vDrMnXIexjx2So/2QNSl6gZamVG0l1qJBY1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxrtDGNC3NypBKUNs8Dbgy7duGDWhk7EV2KWkLlu67Su+A4Zd7xCnBB6t/DAFWyKJ
	 s9p10W6UQbieQuyLUUT3RKnOeLzZ0jVKT0NADLxLzQXyx66A0ytCkG8X2bG/Hfbi1u
	 vVcYpD+x28L+JM0GX6YsHw+40QaB52VuYl0ptky9bMR03CEI1bJLbNLbTcZVL42HFS
	 T2wCppU9rkXCEcQnG5MIrmNHG0Rg8NW318+iH7kx42+dWDHIvJijmQEltgLQRMfCMG
	 9Pmewl+OqduWV67YNEjWASglYwJOtXWFr0Ks8r4wPmr29LusnVmTlPsVoxxIUPZ6sk
	 RBgjGrumuAK6g==
Date: Wed, 5 Mar 2025 16:28:16 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add support
 for Amlogic A4 and A5 SoCsy
Message-ID: <20250305-corral-unfair-a7f25abbfd64@spud>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
 <20250305-irqchip-gpio-a4-a5-v3-1-1eec70352fea@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MMuZ/eZR8DrqmyMW"
Content-Disposition: inline
In-Reply-To: <20250305-irqchip-gpio-a4-a5-v3-1-1eec70352fea@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082823_164605_E9CAFB6E 
X-CRM114-Status: GOOD (  16.70  )
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


--MMuZ/eZR8DrqmyMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 06:02:56PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Update dt-binding document for GPIO interrupt controller
> of Amlogic A4 and A5 SoCs
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++=
++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlog=
ic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/amlogic,meson-gpio-intc.yaml
> index a93744763787..3c5853c71efa 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> @@ -35,6 +35,9 @@ properties:
>                - amlogic,meson-sm1-gpio-intc
>                - amlogic,meson-a1-gpio-intc
>                - amlogic,meson-s4-gpio-intc
> +              - amlogic,a4-gpio-intc
> +              - amlogic,a4-gpio-ao-intc
> +              - amlogic,a5-gpio-intc
>                - amlogic,c3-gpio-intc
>                - amlogic,t7-gpio-intc
>            - const: amlogic,meson-gpio-intc
> @@ -49,8 +52,6 @@ properties:
> =20
>    amlogic,channel-interrupts:
>      description: Array with the upstream hwirq numbers
> -    minItems: 8
> -    maxItems: 12

Please leave the widest constraints here, and let the more restricted
ones in your if/else below.

>      $ref: /schemas/types.yaml#/definitions/uint32-array
> =20
>  required:
> @@ -60,6 +61,22 @@ required:
>    - "#interrupt-cells"
>    - amlogic,channel-interrupts
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: amlogic,a4-gpio-ao-intc
> +then:
> +  properties:
> +    amlogic,channel-interrupts:
> +      minItems: 2
> +      maxItems: 12
> +else:
> +  properties:
> +    amlogic,channel-interrupts:
> +      minItems: 8
> +      maxItems: 12
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.37.1
>=20
>=20

--MMuZ/eZR8DrqmyMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h7oAAKCRB4tDGHoIJi
0h1GAP9khO8ylB5zlNKs4uW4bc5TRHhnmWk5xx6QOLvsYcAUWgEAiN0yW0agWWR/
qQUvLSvAvFW7/l6X9Sym1jqe28wIRwM=
=RNx5
-----END PGP SIGNATURE-----

--MMuZ/eZR8DrqmyMW--

