Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A30C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=admGa1ABgmtovoT8X4DukApgTpiu806Ch4o9AsHPGRI=; b=CQC28A5A1vRzYXNKB6CZZarS+Z
	okp4ZjrcGuxgqzC2YXuzm8SDxMLrc3hqwP/4CYCe5IwTClJgXbf1bGwRpZ5s0KYyBCNWL6qAb9V34
	oyXQzVtZsJOV+kzktDk1OepnYsr9EoWPdOmWrcJCSozVzdsetRE+YCaduL4SREPjNE4bSQeKXg6mY
	VeBiqWRU5KQ4rgnPSsrDeBiJV1nF5Y1zr4RNb4qB9MeWYMZFwNbfPjiyQXh29gNq4o8hX2kKtC8wO
	SsEELGhgK7EkkXaL+jdnGb06OCIVL6HqsO7dg0CqDB9PrPUdU/szoR7fgMYS5PAK0p++IfNzS/iGw
	+3bS/yRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflbv-00000004U53-0Mlo;
	Wed, 05 Feb 2025 20:02:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflaX-00000004Tip-0wwM;
	Wed, 05 Feb 2025 20:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E887A43A0C;
	Wed,  5 Feb 2025 19:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7F6C4CED1;
	Wed,  5 Feb 2025 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738785692;
	bh=zOnN62hnfOYzsZsZ1yqWDdh3AcKyO5WluPvt8FnYicU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPLkhPCgFcstIW6OHk4zmyDv9D3tzA3HND/6+cSNek0HdfolFYop5s6BZUn3En3bZ
	 rem8N/fPzYbxFU63P8N9r1N5yZF3W7f54JomMGeQyiaWmckAQumkuQeWjE1vcn1nWB
	 ixjmLoMJoX6RMCFqmzIYcBay0qaH/iAtijhb04QthI+dscnlheIuypco1Q3UunkUaO
	 dXU6yuL+NHiUNlgraYHUOtZMXZ2TIliSSkalEWTgvY9GDEqynPmZVIXFXhYgYtoRV9
	 0hyG7Jd2+cmR4J+IaOWnjaguuk4MhaI6p2w5o8aCU572qhwPg4iXc9bTLIY/O0jDbE
	 teYhHL8fNV74Q==
Date: Wed, 5 Feb 2025 20:01:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <20250205-disagree-motive-517efca2b90c@spud>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6JLUwNNYYeOqsh0O"
Content-Disposition: inline
In-Reply-To: <Z6O8-dUrLNmvnW1u@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_120133_395578_51DEAD37 
X-CRM114-Status: GOOD (  24.26  )
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


--6JLUwNNYYeOqsh0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > Introduce the airoha,npu property for the npu syscon node available on
> > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offload
> > > network traffic forwarded between Packet Switch Engine (PSE) ports.
> > >=20
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 +++=
+++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.=
yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20230b=
0c4e58534aa61f984da 100644
> > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > @@ -63,6 +63,12 @@ properties:
> > >    "#size-cells":
> > >      const: 0
> > > =20
> > > +  airoha,npu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle to the syscon node used to configure the NPU module
> > > +      used for traffic offloading.
> >=20
> > Why do you need a phandle for this, instead of a lookup by compatible?
> > Do you have multiple instances of this ethernet controller on the
> > device, that each need to look up a different npu?
>=20
> actually not, but looking up via the compatible string has been naked by
> Krzysztof on a different series [0].

Hmm, I disagree with adding phandles that are not needed. I don't agree
that there's no reuse, if you can treat the phandle identically on a new
device, in all likelihood, that node should have a fallback to the
existing one.

That said, the bigger problem in what you link is the ABI break caused by
requiring the presence of a new node. I'd NAK that patch too.

>=20
> Regards,
> Lorenzo
>=20
> [0] https://patchwork.kernel.org/project/linux-pci/patch/20250115-en7581-=
pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org/
>=20
> >=20
> > > +
> > >  patternProperties:
> > >    "^ethernet@[1-4]$":
> > >      type: object
> > > @@ -132,6 +138,8 @@ examples:
> > >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > > =20
> > > +        airoha,npu =3D <&npu>;
> > > +
> > >          #address-cells =3D <1>;
> > >          #size-cells =3D <0>;
> > > =20
> > >=20
> > > --=20
> > > 2.48.1
> > >=20
>=20
>=20



--6JLUwNNYYeOqsh0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6PDlgAKCRB4tDGHoIJi
0sRCAP9d6SH8K30LUrgTiCNUSGDr2F3QfyW4PrcGQhOC7aQb0gD9GmCcJdrSa90i
ABDTHH6uK3n8fQsIKfLUMyZLM/drUAY=
=pu0V
-----END PGP SIGNATURE-----

--6JLUwNNYYeOqsh0O--

