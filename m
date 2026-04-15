Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C66F43832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhGe1Hzil+sC9PQLm0l9jMjqbdQaF/fqF/Ys0ezK/DE=; b=tsYiwUAjrfAhL5XXZ2HvmQMBQ1
	/nGvjHfqImVITzHXv3H8MyX0frY3VpiwBT5ClPfPgHvDIJqLbZr6TLcmXhopMskv2Aa+qz563TVKP
	WBF7emH1vhnaQbRlZDR64adf2pk6/WzvTRxNMoWlP5n/e4F6HmYqYxIgP5igMqS9WG2aJevOWj++U
	a1yTQkTVRQ1MZ2xFCbjF0Q6buAMwx25fY+yRjQztt1kh5ua3g0d3zqNid1h+/KCxP4Rmk48Nlyg6u
	5CVm12UGDkg21za3BkJhaBlJIKpP7VFCuNzFQ+FNEUKIwp6du6QLfbfRjEsRFWgCZYS44dFUkAeWU
	RNzg3F+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1jr-00000001Gzd-2bGp;
	Wed, 15 Apr 2026 15:01:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1jp-00000001GzX-1379
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F759600AD;
	Wed, 15 Apr 2026 15:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E383C19424;
	Wed, 15 Apr 2026 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265268;
	bh=BkVPFcAIuT9ItmchTe1dNaR4kZ/g7siiF/QjERIMqmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2icnaHqjp0xdrxXzB5xuSUu42KVP25gMmFYjCNm3a7Il6RLNqqR4teE4IRbeTWux
	 R2QKNaX3I8+yq0oAALvxJCB0wo4K+CdctFhzDSXAWdva6SV5s8ZaEd0+3SvBvqAn7D
	 HOOSpuVOmo6/c12itOJBTlTK1Bhib/A2tKFd3C4Lg0lowNiZAFKYXj/gcTuZRs1VL2
	 7VH0ORDi9Q46fIAGgVuwnHQLYcjI0QVgWfvUuKLRQUMa01TSqXnPlvblNLU6WEZY/a
	 lgi+8CB/ZhGhP/cq25p/cbCWKuDfbO9yLbixAlYx13lcjovMcPV+AORNGI7vt8z9p3
	 L1oZZqzol+J8A==
Date: Wed, 15 Apr 2026 16:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260415-rectal-visible-a8ccb534a176@spud>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmNPlvI7e/DqiZwD"
Content-Disposition: inline
In-Reply-To: <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
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


--fmNPlvI7e/DqiZwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:26:27PM +0530, Shubhrajyoti Datta wrote:
> EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..


Why does the compatible have a "1.0" when it is in silicon?
Why doesn't the compatible contain "xa2ve3288"?
Why is this device not compatible with existing ones, since
gpio-lines-names appears to be the sole difference?

>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
> Changes in v2:
> - Add description of EIO block in the dt-bindings patch
>=20
>  .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index 30a7f836c341..1ca067217509 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - xlnx,eio-gpio-1.0
>        - xlnx,pmc-gpio-1.0
>        - xlnx,versal-gpio-1.0
>        - xlnx,zynq-gpio-1.0
> @@ -30,7 +31,7 @@ properties:
> =20
>    gpio-line-names:
>      description: strings describing the names of each gpio line
> -    minItems: 58
> +    minItems: 52
>      maxItems: 174
> =20
>    interrupt-controller: true
> @@ -89,6 +90,17 @@ allOf:
>            minItems: 116
>            maxItems: 116
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,eio-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 52
> +          maxItems: 52
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--fmNPlvI7e/DqiZwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+oLwAKCRB4tDGHoIJi
0kH6AP4zWEn75f2KqDah6ah38m6Ed/q3Z94RTDr52QeRGt4XVgEAzjDeYo1oCmhR
rMEPeV6W7EqbJr5PlW6vW0H+f+vtoQs=
=vZwx
-----END PGP SIGNATURE-----

--fmNPlvI7e/DqiZwD--

