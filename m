Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59478CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0OabhRPaKb8ZtVjW0dZ5Ep+A9j/jCXntRyyMO7DeCg=; b=jwCUx4x6N3rFyZZ+igYwLWQkQ5
	pMVT8oY2mxwYLnEpe6E2cpk6HcKns9PfTZng2L4J5gWnOIeM0Ow6Jc2zrcZ5BMYWiPV3q6PT31yui
	oeH67CA5qoWLZEQSvNN6XDQ69NlFegnGcZ55Iu/IoWuzO8xyI2fRLunoQO/J3Y0uRgbybO3WGSGlJ
	UwACLJWIludtV0mqw4IBKgbwgatk7QBZtFlrxVaEdFWGfATXF8gL7FazobIPjRMM18RI86BMh8+Dw
	u24LL+vlIR1jwJCMBZbbiQEf2vrl3311+G+AGoxJ6PbVypPWlLLF3V+MCT5UMa24s7GUVV1+rbtct
	nN2HRzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4ta-00000006hUI-42aW;
	Tue, 23 Jun 2026 17:26:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4tZ-00000006hUC-37jH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:26:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38300429EC;
	Tue, 23 Jun 2026 17:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E441F000E9;
	Tue, 23 Jun 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782235605;
	bh=n0OabhRPaKb8ZtVjW0dZ5Ep+A9j/jCXntRyyMO7DeCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RotgOa4Nm+9+wWbya9PzPZu80TPtMmKQw3Ui0AbTe1Plw2UPSJtnyTGmyxBx8aznh
	 4t3ZDIexYyM/VGwZEzX7d8VLmp17AImurWuIb0LGjdY/4JT4cU1l5bakML3JuBxLBx
	 wcIogjysKhSxCeL1bHMgMtEdLbaZhy9umzw7/He+nrmR63d531dKFP58qghuhe4Oss
	 NPDehHsd+rvmgI69mBbESvL7sK+sJmszYiDPur2xfOH828T3uYAwc5UZf3aN0OHQDt
	 MotKIK39Vpdq7iSbBxlMX5oOWAO5ITAJUNJTWTsgacDBnHPavKcD/PmUFuaV3N10EI
	 acaI2aPflr+5w==
Date: Tue, 23 Jun 2026 18:26:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: iio: adc: at91-sama5d2: document
 sama7d65
Message-ID: <20260623-swiftness-catering-6884c3a58715@spud>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-2-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bWWrdvlOUOdbawuY"
Content-Disposition: inline
In-Reply-To: <20260623105944.128840-2-varshini.rajendran@microchip.com>
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


--bWWrdvlOUOdbawuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 04:29:33PM +0530, Varshini Rajendran wrote:
> Add dt-binding documentation for sama7d65 ADC.

Commit message is missing an explanation of why a fallback is not
suitable.
pw-bot: changes-requested

Thanks,
Conor

>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.=
yaml b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> index 4817b840977a..e8a65fdcd018 100644
> --- a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> @@ -15,6 +15,7 @@ properties:
>        - atmel,sama5d2-adc
>        - microchip,sam9x60-adc
>        - microchip,sama7g5-adc
> +      - microchip,sama7d65-adc
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--bWWrdvlOUOdbawuY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajrBywAKCRB4tDGHoIJi
0jM6AQDUdgx+Qm+a5ugJzb/Gn79+XAaFjUqEMNYBMSFtptCA6gEAj82jix8YsxqH
fgYFWhFEg5ve5yF6iKFTwp5ik+Oj8AM=
=HOgm
-----END PGP SIGNATURE-----

--bWWrdvlOUOdbawuY--

