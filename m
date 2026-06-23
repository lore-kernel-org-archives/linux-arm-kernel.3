Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51991CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y17qniJxNNgKnaPXUfFps2+zoxLFn1xLNpne1RKDvqM=; b=GoztFy1GXytK2ZWkUM/f/+n3FW
	tWA4nL/8pXDcy+5J+1PqgDISxZUK9FLq5k3IuPD2gdPSHoNxcmrR0mQWLf6kBBFB/rwmdKzZD/IpN
	vN/I/P74DT77ecSN6iF6jXMrfHjclANV28Q7UzNrn68mm7bmyzqtlxize5yWP0Hw43FbFQuUltp3q
	GcZYdvhvZmItAo+mv1WuqY+28SlBgFVF1c66S+ecHATmjncr8Os8LhN6A1gWdxaMdhu7C50MzdTVN
	3QvblJFmxL3K0V6qysv5MZa2A6JGPeWZBeGZuBm1q44ZyMi0crF2TVGq9YoCT4vG3R3W/HCvFkcJU
	Yq9/g7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4v3-00000006had-0ZHM;
	Tue, 23 Jun 2026 17:28:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4v2-00000006haX-1PpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:28:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EBDB60210;
	Tue, 23 Jun 2026 17:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E661F000E9;
	Tue, 23 Jun 2026 17:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782235695;
	bh=y17qniJxNNgKnaPXUfFps2+zoxLFn1xLNpne1RKDvqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRkqcBor+AahiKUsM/BTHq2kLO+CzRWW5qGI+Op6SxDpPFuBOy1fefA7BLPrFAh9E
	 VhRZ7tPjSZR/590akyAx9uu772aw9ilWdJC5y6nLiDhOfOMp3v446/AbVlMtFoB+eY
	 YAW1924NnJkMFT3dm3eiLX43AGoR9A5/u3iG0vLkAEqrNBUIGl7v4L8dWwUkykgV9S
	 rwUkpdkcXxHB2HZgPRlMJQEoBkVEtweyeLgXmDzWHIxXaPLsvIKkYalzsdVXZsERsI
	 E3nKG74IFJrUub/e1f2MyZMaE7QbIISnmpN2s9pWnzBeEF40S7YLHIkRBpzU6Gymvz
	 PQGCbqoT94q0Q==
Date: Tue, 23 Jun 2026 18:28:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/12] dt-bindings: nvmem: microchip,sama7g5-otpc: add
 sama7d65 and dt node example
Message-ID: <20260623-profanity-devotion-b501a11e1539@spud>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-5-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AlyPrU4+HCxj3Al1"
Content-Disposition: inline
In-Reply-To: <20260623105944.128840-5-varshini.rajendran@microchip.com>
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


--AlyPrU4+HCxj3Al1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 04:29:36PM +0530, Varshini Rajendran wrote:
> Add support for sama7d65 and a dt node example that shows tag can be used
> to reference a packet stored in the OTP memory.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-ot=
pc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.ya=
ml
> index cc25f2927682..3cc16b0044a6 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -20,9 +20,15 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: microchip,sama7g5-otpc
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - const: microchip,sama7g5-otpc
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - microchip,sama7d65-otpc
> +          - const: microchip,sama7g5-otpc
> +          - const: syscon
> =20
>    reg:
>      maxItems: 1
> @@ -48,4 +54,20 @@ examples:
>          };
>      };
> =20
> +  - |
> +    otp_controller: efuse@e8c00000 {

Drop the unused label since you have to respin the series.
With it gone
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> +        compatible =3D "microchip,sama7d65-otpc", "microchip,sama7g5-otp=
c", "syscon";
> +        reg =3D <0xe8c00000 0x100>;
> +
> +        nvmem-layout {
> +            compatible =3D "fixed-layout";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            temp_calib: calib@41435354 {
> +                reg =3D <0x41435354 0x2c>;    /* Temp calib data packet =
TAG */
> +            };
> +        };
> +    };
> +
>  ...
> --=20
> 2.34.1
>=20

--AlyPrU4+HCxj3Al1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajrCKgAKCRB4tDGHoIJi
0jBvAQDNKMDgUwrE0sGqDYdHwfUjnzJV5jbM+1YipRyP5t495wEAsGlK4mgvg9QD
+u0hTlC+4W8hAMDoW8PXtHnc2j9cNwQ=
=WG7b
-----END PGP SIGNATURE-----

--AlyPrU4+HCxj3Al1--

