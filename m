Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E8C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0F8BYIBain3XCPaojazpffPXrFOGPfPC0Ap4Fxv6PM=; b=X3GdkgW6Qkpn5sdqFPVVvsinPf
	og7UyRmKDwRuWHBKv1cA6xHsAhGQi6IK2ptI9zQUGXfWx93gkN5Jeh47kyzJLKokWImxaXN8wCP3u
	AoV8wUNrJlLstStIKaGbcbOu9FVvpq62Rz/Qeei9V8Z+44QXcFbuOzXOM8PdEy1ieXf5h3gkzhsRc
	DVJELk89ivtdSnWs1VgGAQoCS5ZCS7Ri5a/fnDR581jJUj5jqow0BSSVyhV2dDipsGiixyuF9XcO+
	7VrZLGq6A5sZ7Fsb8+Eo/ZF7n9mn1pCTU6wDNIUk76wn2vvcg8vJp2cznbmdNCj48Q0B6lSNoNyMi
	FjqLOACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x187p-0000000APBV-05zP;
	Mon, 31 Aug 2026 19:57:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x187n-0000000APBP-1DiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 19:56:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D248601DE;
	Mon, 31 Aug 2026 19:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D681F000E9;
	Mon, 31 Aug 2026 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788206217;
	bh=r0F8BYIBain3XCPaojazpffPXrFOGPfPC0Ap4Fxv6PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZIiP524kYCP6XiC0VDMBmoGlGe5gNKdplctnttXuNoPusl5IyLBj4oEnp5f4Y29Ng
	 Xq8q7mr8Khq1i4MQLVGIARJ39WvK83Ac33jkn3q+XdRpHZ8z8B2Ewqtu0vPZhmBBYo
	 I8uuk/z4QW93rJBefySi40Gf18EnnhPvBMxJfVaMismlpbZZ+aZyYfe9zierY19hay
	 Q7GEmltMn7ibtWDJNsI3nq1KoQ5jmW+CF2yp9IvmGQywrtLLqn/7WkxONItYoK+Z8n
	 c5vo7+I4SCQP3UxDoha4qNah6uf893mJjIIPa0BRxpKh0187rwUAk0wN+s1hY4kGAS
	 Eu10Lw9Lt0xdA==
Date: Mon, 31 Aug 2026 20:56:52 +0100
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
Message-ID: <20260831-attentive-headpiece-c14d7d4086cb@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
 <20260831-craftily-operative-ac855bdbe897@spud>
 <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mJZgOBe/0R5PdO65"
Content-Disposition: inline
In-Reply-To: <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
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

--mJZgOBe/0R5PdO65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:38:21PM +0200, Marek Vasut wrote:
> On 8/31/26 7:13 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > > > > >         then:
> > > > > > >           required:
> > > > > > >             - "#clock-cells"
> > > > > > > +        - "#address-cells"
> > > > > > > +        - "#size-cells"
> > > > > >=20
> > > > > > else, false? But I'm also not sure what the benefit is of requi=
ring
> > > > > > addr/size cells when the child node is not?
> > > > > The subnodes of this syscfg node have reg property , see [PATCH v=
4 0/4]
> > > > > arm64: dts: st: Add STM32MP2 USB support .
> > > >=20
> > > > Right, but I was questioning why the properties describing the reg
> > > > property in children is required when the children (and thus the reg
> > > > property in them) were not made required.
> > >=20
> > > Do you mean this patternProperties should be made required in here ?
> > >=20
> > > "
> > > +patternProperties:
> > > +  "^phy@[0-9a-f]+$":
> > > "
> > >=20
> > > Could you please give me a hint how to do that ? git grep gives me no=
thing.
> >=20
> > I mean, if the phys aren't going to be required I would not make the
> > cells properties required. I seem to recall a warning that dtbs_check
> > can emit when there are size/addr cells properties in a node where there
> > are no children, which is why I questioned this in the first place.
> >=20
> > Otherwise, if the phys are to be made required (no idea if they should
> > be), I can only recall this being done with the non-pattern variant. IOW
> > required:
> >    - phy@0
> >    - phy@1
> The PHYs are part of the hardware and are (going to be) described in the =
SoC
> DT, so I would argue they should be described as required ?

Yeah, and there's almost certainly no chance of them being required
being problematic is there, since they don't impact existing code, but
have a new (or at least a previously unused on this platform) driver.

--mJZgOBe/0R5PdO65
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapXchAAKCRB4tDGHoIJi
0ucHAQC5DqttP9INbtx8CZiW4Hs/d/3Eu6d98axXNumJR8kr+wEAqBi1bgb+G2U7
cC1ePu6jgS0swqZBiJvQkvLAH3t1vQI=
=7YiT
-----END PGP SIGNATURE-----

--mJZgOBe/0R5PdO65--

