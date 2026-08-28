Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNRuYNMMYQIuEnuu2o2Nr6GCoLL2edAk+oJ21dlQJKg=; b=TQ8PWNR9MNeo/H0v+5ob3RKnN2
	jkjS4m4aH3a//Qv0rDeUDRKfGewRCJub8i0GElxcaj6j+ZjkC67UoBa5XyvJ6vpOUe1AGFmQ7O0EA
	CoYjsf9XlhE7jF+v3cVfZA3/TDWHqgbyuXCenpxFvR/GYlh+lw/PhNmS/dRspaVz2VOQ67Fh/56AV
	mrpq/9CoO8GA/2PBFy4hoCqG7qcUeTNUXZMNvH3vGIDdJUC2T8cUQy9NeGDy/N86UMzuhEk6OOuX1
	A+S9Qx1GzTfoH2fJ153mo3kUe309Qu/T2ntGFldM8188gUBd3grwSGWdEplkkYlHkPZYDSirp+78y
	gjF+DjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyxw-000000069ja-1FID;
	Fri, 28 Aug 2026 15:58:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyxv-000000069jH-0sj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1D3A4329A;
	Fri, 28 Aug 2026 15:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD471F000E9;
	Fri, 28 Aug 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932682;
	bh=vNRuYNMMYQIuEnuu2o2Nr6GCoLL2edAk+oJ21dlQJKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrckKejphv8pIR/LxNrFlXIqDCmnOkl5o7bTsL7TC+CcmOLzupeuhS4/d8OqB7zN+
	 oASHtrP2fAO0wfuZ1MHQ0ro8RkrS3mALxnhUe8GAOm/SE4SzDYOrKNxcm/3iWcIEM5
	 cWtCxwyFCv6pO7rpPwfDHpa2069mmnboxmrczbfpiOHd/NI5X1HbULCnYOW46FhSNT
	 o5K3IzIzG3UTJuN/fOrAqKxpOSoqAnPdbBTYc4QXMYgoORWsUtBNo5vKjq1lwDR4xt
	 14dm70438CW+TEVaUn/BkFpgPW72Xl1e8wqWFQ6I0Rh0kSF78gRMDPL5AnduVMRVeD
	 NGRNIL5XGpHhA==
Date: Fri, 28 Aug 2026 16:57:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260828-target-operable-ebc87e0bf30a@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l71MiO8iJ3sqx4wd"
Content-Disposition: inline
In-Reply-To: <20260828151216.175020-1-marex@nabladev.com>
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

--l71MiO8iJ3sqx4wd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 05:11:14PM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: New patch
> V3: Fix the bindings
> V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
>     - Update commit message to match, this used to be patch
>       dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-=
mfd
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB s=
upport
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.=
com/
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml     | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..d82afa39960b9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,17 @@ properties:
>    "#clock-cells":
>      const: 0
> =20
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -57,10 +68,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          enum:
> +            - st,stm32mp23-syscfg
> +            - st,stm32mp25-syscfg

Sashiko comment here I believe is valid, the syntax here only works if
there's only the listed compatible present. It doesn't work with
fallbacks.

pw-bot: changes-requested

>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"

else, false? But I'm also not sure what the benefit is of requiring
addr/size cells when the child node is not?

Cheers,
Conor.

> =20
>  additionalProperties: false
> =20
> --=20
> 2.53.0
>=20

--l71MiO8iJ3sqx4wd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapGwBQAKCRB4tDGHoIJi
0ucHAQDgn40VE909HoU9lRj0S7+8LHXJkh16SZLWZNJDm6BXPQEAz13NUR1AIwgI
bmVXe8M9FQgOUteJySSW709JXg9IdQE=
=vNEp
-----END PGP SIGNATURE-----

--l71MiO8iJ3sqx4wd--

