Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A06ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msoNP98X9TIxX7NoNwzaqySzNM1G8U+6UESCKSkm6qA=; b=wfZ/EsQFn0EcxrCF+AsndUaGzQ
	NcaNjOFtv9PfKMikwIFMXwYHz1zYObbz+gZgKYqqfPq/7/p4YAsjVbRGMjyQ8m/TmZ7RRlm194xCy
	vaTC/5Ziyzv8+cO+Tuq50EcD2SOBfxsmoD1vbha1/7Ka3PAbGUSYwTuhrP2vOgyQ/a7ejxva/LYC4
	U/ttm2SMeIG5rYziy9Kjkp3zlT98hMkjzKLrn1YEyOPdA+vXoFnQDUFketwsXMSoOiyid5NzV6umH
	mV56lizrCp72F81nY565uV8rtIYGlJRiIwxOFvt6+bC+TmWBqdyAG8m3BKoccRa1hV+xM+dIgM/ws
	tKSNTomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjAz-000000053oC-2Chr;
	Wed, 20 May 2026 15:49:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjAw-000000053n9-365T;
	Wed, 20 May 2026 15:49:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D167441ADA;
	Wed, 20 May 2026 15:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C891F000E9;
	Wed, 20 May 2026 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292177;
	bh=msoNP98X9TIxX7NoNwzaqySzNM1G8U+6UESCKSkm6qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzAW5I8OdwnywObXjHsKrGC7033vSs7Zjf5/OeBCkFCeb5UACy2QbBKAYFxYXM/X7
	 Ix21ccOOrz5SOJIjOBUVSJpHqzqbJSqyEg1fGoVpE/MFGIiEk8fKuaHmvmuTZudrjl
	 VQlkkt6L7rgVC+z5x5gGighmOQcVk0FlURgm6nHbaNxml/KwwoyWowbL0LZaCA1LLC
	 tuGZ1dlgbPjFEA17n75ushCRISquVMVgMTMI7drMLtsyjbMFgXBo/p2Ekg43q1TFcX
	 u9QIgg+jJI8US6Oy0o2531uCdMwwKX38l/hs7Xyt3+dte6780LVPZfM0tpPVwige9h
	 l5yhWeU7C7ttA==
Date: Wed, 20 May 2026 16:49:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: i2c: mt7621: Document an7581
 compatible
Message-ID: <20260520-ample-ultimatum-b947112dfc5c@spud>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
 <20260519223253.1093-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N8qZPmLSc3aPNqva"
Content-Disposition: inline
In-Reply-To: <20260519223253.1093-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_084938_799951_AB695537 
X-CRM114-Status: GOOD (  16.83  )
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


--N8qZPmLSc3aPNqva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 12:32:45AM +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having a dedicated reset line to reset it.
>=20
> Add a dedicated compatible for the Airoha AN7581 SoC and reject the
> unsupported property.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> index 118ec00fc190..8223fbc74f14 100644
> --- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> @@ -14,7 +14,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt7621-i2c
> +    enum:
> +      - airoha,an7581-i2c
> +      - mediatek,mt7621-i2c
> =20
>    reg:
>      maxItems: 1
> @@ -38,6 +40,16 @@ required:
>    - "#address-cells"
>    - "#size-cells"
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: airoha,an7581-i2c
> +then:
> +  properties:
> +    resets: false
> +    reset-names: false

The sashiko report looks valid here.
pw-bot: changes-requested

> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.53.0
>=20

--N8qZPmLSc3aPNqva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3YDQAKCRB4tDGHoIJi
0nwoAQD5LVwdLYofHn+NnDry6+KleqvkZPQ+C/mqn6QwtJmgpAD/elTm5Vluv3Mc
pu12sSvva0dnNq60VV/jPiXwB7tT+AU=
=l22U
-----END PGP SIGNATURE-----

--N8qZPmLSc3aPNqva--

