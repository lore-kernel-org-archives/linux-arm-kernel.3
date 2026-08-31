Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VvvoKDC1wr29Uiol9YvJUY/bwvK1+XCnZbX99tZNJE=; b=PKuwHKJb/K2FYcmbMBaCgenOx7
	du/p8FEA5lakroElFD/LrqSZrrE5Uv7ujDvSUSuZ5Crja7fC1VavxCPwH2aMo0d+DBsKNAt9KOUdP
	xM8IoiOm38uYW3Kg+TU74zh/TyckYtYiJjyljWz2wZn67b5pL5vMIFh2haNKOoBsYYieQwPT5/hlT
	CW6XSxBksIEWzYMbYKJZTKL2vCIkSxvZy6nfvXPh2sp1J//w+iyg2I2cnKJbu5p69PmrLJgy/TwMY
	0XAkLAhmrwD4lj4JrtcGu5gDUbhjh0Ja4OS2wjam+ZLhMwZkYCJO1C6eT6ig54VihJg6jC6MmoAwd
	qbpyWJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Zs-00000009nR7-0ZBq;
	Mon, 31 Aug 2026 15:05:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Zq-00000009nQn-42M4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:05:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6046C432A7;
	Mon, 31 Aug 2026 15:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E801F000E9;
	Mon, 31 Aug 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188738;
	bh=1VvvoKDC1wr29Uiol9YvJUY/bwvK1+XCnZbX99tZNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eAxREL+JwxK4CCvUSG59O7BfoSjE/SU+qgLy1b4QKFPq0PLowDQjdaLrtbTXDfIEg
	 lql2dy2fiPYxsfG7/YDI5JlcgnSx/WGsdh3kXqOWGHZgSeM5T9X7lPj55705sKs1s7
	 AGjqrBx/k2g1IZBlj184eZz5ltbna66eab1vX7OdyD+IlsxeYnEpuDNjdo6KdnfR36
	 PPKzyMcsnuC2Iz8vQClQ4T8pZFPCCCbMuHtrK4CLulRkNcnHmnkzHSumkSEOcEhjl9
	 Izl/ZPUEsJF4kZc3eGvIbyJA9fjYmvDAUXIlgdFSbGIIKU5MnAbcfCYDjpH6JmynGD
	 +ArVgANFEd79Q==
Date: Mon, 31 Aug 2026 16:05:33 +0100
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
Message-ID: <20260831-clustered-margarine-80bf19005aad@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5lg64idydn6ThKv"
Content-Disposition: inline
In-Reply-To: <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
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

--f5lg64idydn6ThKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 06:05:17PM +0200, Marek Vasut wrote:
> On 8/28/26 5:57 PM, Conor Dooley wrote:
>=20
> [...]
>=20
> > > +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> > > @@ -39,6 +39,17 @@ properties:
> > >     "#clock-cells":
> > >       const: 0
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +patternProperties:
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > @@ -57,10 +68,14 @@ allOf:
> > >     - if:
> > >         properties:
> > >           compatible:
> > > -          const: st,stm32mp25-syscfg
> > > +          enum:
> > > +            - st,stm32mp23-syscfg
> > > +            - st,stm32mp25-syscfg
> >=20
> > Sashiko comment here I believe is valid, the syntax here only works if
> > there's only the listed compatible present. It doesn't work with
> > fallbacks.
>=20
> This syntax is used all over the place ?
>=20
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
> ahci-common.yaml#
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatib=
le:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contai=
ns:

                                                                     ^^^^^^=
^^
This is the key difference, you need "contains" for partial matches.

> Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
> qcom,apq8064-ahci
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
> qcom,ipq806x-ahci
>=20
> > pw-bot: changes-requested
> >=20
> > >       then:
> > >         required:
> > >           - "#clock-cells"
> > > +        - "#address-cells"
> > > +        - "#size-cells"
> >=20
> > else, false? But I'm also not sure what the benefit is of requiring
> > addr/size cells when the child node is not?
> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
> arm64: dts: st: Add STM32MP2 USB support .

Right, but I was questioning why the properties describing the reg
property in children is required when the children (and thus the reg
property in them) were not made required.

--f5lg64idydn6ThKv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWYPQAKCRB4tDGHoIJi
0t7RAQDWb/zrIGYBOSSjIuT+OgUBR3G9/jhekewcsZ/GKvcGQwEA5b/UUOv0HryS
Nn2PuV3DMeWBtPkUe4TGBWprOTj96QY=
=JCq9
-----END PGP SIGNATURE-----

--f5lg64idydn6ThKv--

