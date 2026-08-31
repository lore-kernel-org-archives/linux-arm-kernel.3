Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NBepZs32jJuyj31qdS12NqahL9gkzrdWlTOwWDa6Zk=; b=vCO2sKUP/PTEPeFQkNGKdbFHwy
	BG+vrZngAy1FECHUEMUCMyZ5JpvNvl7BYB2EH3oZcv1np3dTWXrIm9X9cPuY45mNz6F5xa6N3am6a
	3ACyY8Pi27Xa4S04CIT95RlOKbKy/+tQh5k1yRhjo1QxFuPBcLGcujXv9WXKIsCDP6ur9pX6jYl2Q
	cKHAFjXyJSkhMmVKYo/TO+fC5bJ3TpQaWq4tg5juZ92o2HdSNjiPwaUXluxosqzg/y24lPmLL7E8E
	s1FqMImYbuAl5c0Q83R8erUNyS5eOL4IuNqDq3CHOFeDMgKfnUHNc8Jh8WFJURktRsmKVP51wSjjM
	1Hj2UhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15ZG-0000000A96U-1gAz;
	Mon, 31 Aug 2026 17:13:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15ZE-0000000A96G-3dcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:13:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2FA760120;
	Mon, 31 Aug 2026 17:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9C91F000E9;
	Mon, 31 Aug 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788196387;
	bh=9NBepZs32jJuyj31qdS12NqahL9gkzrdWlTOwWDa6Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOugAfknSWYgpXqCWh5rgXHbGJ32ERGty7oL7RF7QXjEtJoymox+iCZiXcwS64z0J
	 SkDKOlGs6XAJmR326V35Jrou5sKhsBBvWSfCHEt/azJYFuriPC3rrGsl8688Wh7HLl
	 tFAFxtA29z+jaizrYQmqG3o3wTEkFfWkCSeGFO3MfZSKeRTabFuwAI6mkzb5tdCSnr
	 +p895wkSfO5L5zTLhCh2XrZHQxiqFcqz20ty/2eQagWLDcqqK2jUNeKZcAsMBe9UDJ
	 fynXLcSVQSz4HRVqXCUk7GC2LtSf/fA3LUPibMsi0RKzqzzi8vhPUq3nKa6ZWrGUEs
	 DSvDAt1VG5Itg==
Date: Mon, 31 Aug 2026 18:13:02 +0100
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
Message-ID: <20260831-craftily-operative-ac855bdbe897@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2GKJtW1sIt798CcL"
Content-Disposition: inline
In-Reply-To: <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
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

--2GKJtW1sIt798CcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 06:27:21PM +0200, Marek Vasut wrote:
> On 8/31/26 5:05 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > > Sashiko comment here I believe is valid, the syntax here only works=
 if
> > > > there's only the listed compatible present. It doesn't work with
> > > > fallbacks.
> > >=20
> > > This syntax is used all over the place ?
> > >=20
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
> > > ahci-common.yaml#
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-      proper=
ties:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-        comp=
atible:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml:          co=
ntains:
> >=20
> >                                                                       ^=
^^^^^^^
> > This is the key difference, you need "contains" for partial matches.
>=20
> Uh ... right ... fixed in V5. Thank you.
>=20
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
enum:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
  -
> > > qcom,apq8064-ahci
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
  -
> > > qcom,ipq806x-ahci
> > >=20
> > > > pw-bot: changes-requested
> > > >=20
> > > > >        then:
> > > > >          required:
> > > > >            - "#clock-cells"
> > > > > +        - "#address-cells"
> > > > > +        - "#size-cells"
> > > >=20
> > > > else, false? But I'm also not sure what the benefit is of requiring
> > > > addr/size cells when the child node is not?
> > > The subnodes of this syscfg node have reg property , see [PATCH v4 0/=
4]
> > > arm64: dts: st: Add STM32MP2 USB support .
> >=20
> > Right, but I was questioning why the properties describing the reg
> > property in children is required when the children (and thus the reg
> > property in them) were not made required.
>=20
> Do you mean this patternProperties should be made required in here ?
>=20
> "
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> "
>=20
> Could you please give me a hint how to do that ? git grep gives me nothin=
g.

I mean, if the phys aren't going to be required I would not make the
cells properties required. I seem to recall a warning that dtbs_check
can emit when there are size/addr cells properties in a node where there
are no children, which is why I questioned this in the first place.

Otherwise, if the phys are to be made required (no idea if they should
be), I can only recall this being done with the non-pattern variant. IOW
required:
  - phy@0
  - phy@1

Cheers,
Conor.

--2GKJtW1sIt798CcL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapW2HgAKCRB4tDGHoIJi
0oDsAQCU71FAQQ1ExxLvSXyXK8BWpq+GTE6dd/z9sFMeJkNg/AD9FOwlnBwTzcbA
Vd/ANfeIW8hrBeqGBGmJLJQit2I7Rw4=
=T0Jt
-----END PGP SIGNATURE-----

--2GKJtW1sIt798CcL--

