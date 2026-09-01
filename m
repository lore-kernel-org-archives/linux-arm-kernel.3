Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C5BC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A3D77oYb9lO2ucgy7opOnh1NQarpM3lLRvGIFImSmo=; b=emqlgsN+fwS8l79uKP6GAmQlPf
	1joJfr0XyzjiD/cc4I/bItfz7y7ix3jVhl9sXGGoegxMiw0UhOu92d/wUlCwZCn55NIvgqZBsrYdX
	8kPfXVLKbltFuna2orpca36Lt61G2xOL0uhZRQ/7pAkoyS0BLJI5iklnXtEARepH1uQ8g+6eq//Bk
	w355OUpu6P3lm+xePlFw1k8AGmh5rUnksHlbDRErIODA7p6suxiqL1KdiJ93zja6TIpNnNJKlQNb6
	9HgZ9GpgwxMBGdN5F7xz5/C2MNLhTq9ppliSOm8A7lyKOUJIIIhnhGqwY7xS3Qe4C40axCkWH3ji+
	KDrdakkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Sx6-0000000CvJ0-1vWw;
	Tue, 01 Sep 2026 18:11:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Sx5-0000000CvIu-1ByI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 592D0438B4;
	Tue,  1 Sep 2026 18:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB6B1F000E9;
	Tue,  1 Sep 2026 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286278;
	bh=7A3D77oYb9lO2ucgy7opOnh1NQarpM3lLRvGIFImSmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fUffxqNdnjN4dvqLa8HkRpjcz3WbnjAQJanhSO32KLlYCj2QlPM9hu9jXo8Hd6k14
	 kdwY/6QnQUSVBl4Jwel63zOhYrlQkmloBx+LCGZ8xgVU+HeBY6dHdt3x4csS4vmBUL
	 WeJ5c/Hu7KgMVu7uOfFlWhTZKRTtGZxV9UnDdQklwZ75cpyDa7XY+H39lHCXcwTFca
	 YrK4jXg8UPtUs16KlaYQHZnK2he5SH4ofcL3ejuTlEyD6gYqDzMdqH4bxu7uepVDZG
	 dVxKb7BISMNHYcMZGfMF/WNuBOC7ZadxXkYM4WNHgb+fX2uc0jy6DoHtnrzka6OrMM
	 2MC297KQHH+AQ==
Date: Tue, 1 Sep 2026 19:11:13 +0100
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
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260901-smolder-debug-e37fdd2b3d20@spud>
References: <20260831231359.136475-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XitfqtQqCQMp0V+w"
Content-Disposition: inline
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>
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

--XitfqtQqCQMp0V+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 01:13:24AM +0200, Marek Vasut wrote:
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
> V5: - Add missing contains: into conditional
>     - Add phy subnodes into required list for stm32mp23-syscfg/stm32mp25-=
syscfg
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..2cce174004fe0 100644
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
> @@ -57,10 +68,17 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          contains:
> +            enum:
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"
> +        - phy@2400
> +        - phy@2800

This looks good now, thanks.

I got hung up last time though and maybe didn't notice - in addition to
requiring these things here, should we also not forbid them on other
platforms that don't have them? IOW, adding "else: properties: foo: false".

With that, if appropriate,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> =20
>  additionalProperties: false
> =20
> --=20
> 2.53.0
>=20

--XitfqtQqCQMp0V+w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcVQQAKCRB4tDGHoIJi
0nfWAP0ZEF856WKBOfVU5KFg53DSHMTrpa6sx2s+k3F4RZWmdQEA3HajU/xt/Ow7
GKRdXPOLWgOMe1YO+YsbITvz8L85tgg=
=4NeS
-----END PGP SIGNATURE-----

--XitfqtQqCQMp0V+w--

