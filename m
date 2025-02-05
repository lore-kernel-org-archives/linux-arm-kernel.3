Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B67DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0Rwf+7KXmSBpd29XWcnSBKvyFjgwiRGrhZblTkj1Lo=; b=F5eYRCgJ0spFSMeyjKLhhBNAGu
	BlOanwcGm/SJR4HEwZifNi28SNdWulELulVlrfZP3mnKrfnADvB5dX05yT0VdyhelpBIf/M9EbxM6
	k9G6Tq7gUuNaCkDDDMqYqw/JxV1iTWZw0O7hiiyPM8yxi7vJuGGrNVJRqAVqAIoHQnWE+InnY5BC3
	HxeNMLEG2T4XuU9uykBxMUdrOegsvhhCDrkTCTHqNpqlomHNat92SVoneadSVswk9Mo/kqyxwM0gr
	oTPvNIYFlAD9uJo08Yta6MnoXMdZhU3YkO6t64jfRlO2ftZ6p252FyxFyERSDmK8s+aaXQ0AdNbj1
	+kRLZ4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfm2Y-00000004YWI-45oI;
	Wed, 05 Feb 2025 20:30:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfm1B-00000004YMM-2sbK;
	Wed, 05 Feb 2025 20:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB3E1A43A3D;
	Wed,  5 Feb 2025 20:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313CBC4CED1;
	Wed,  5 Feb 2025 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738787344;
	bh=UHkPohJyD6W+yHwDxBWd3ec6wZ6zz/r14WTyWTqKyDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrV8oUjBaTMt0iHnJGaHE8EBmG+hkGWw/HWjit7ByqbUbaROY/m73cSUN9VgB2142
	 oCFt2uPCTv/A5D6UeZXdkb6rYhNqj/d+9oDX9db+j94sRjSwHDoBUn1xWXMXW9rWZI
	 1wU3ljHEqkligtCTCrJ6qK+vcixxkdVhzf1hs2gMxVL4rlI+CoxidUcmZjzuD9coDV
	 3FTvP8DtqU4DTlyv3LR4DxEV3MCdUEk36+me4c3GNtNxTzt4a/SagwaxUVTFeCzGuY
	 aufDHWbbSIt+L8ZeCF4YyuCuF7pHDHEIH5HiSsaFzcV1af2lBg3L7RcZtL4LCcmytj
	 F90H504cKB20g==
Date: Wed, 5 Feb 2025 20:28:59 +0000
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
Message-ID: <20250205-patronage-finisher-bbfbdb5b7dbc@spud>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JrqZzneimgP/IQht"
Content-Disposition: inline
In-Reply-To: <20250205-disagree-motive-517efca2b90c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_122905_857348_3C9B9CA8 
X-CRM114-Status: GOOD (  29.56  )
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


--JrqZzneimgP/IQht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 08:01:26PM +0000, Conor Dooley wrote:
> On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > > Introduce the airoha,npu property for the npu syscon node available=
 on
> > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offl=
oad
> > > > network traffic forwarded between Packet Switch Engine (PSE) ports.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 +=
+++++++
> > > >  1 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-et=
h.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a2023=
0b0c4e58534aa61f984da 100644
> > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > @@ -63,6 +63,12 @@ properties:
> > > >    "#size-cells":
> > > >      const: 0
> > > > =20
> > > > +  airoha,npu:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      Phandle to the syscon node used to configure the NPU module
> > > > +      used for traffic offloading.
> > >=20
> > > Why do you need a phandle for this, instead of a lookup by compatible?
> > > Do you have multiple instances of this ethernet controller on the
> > > device, that each need to look up a different npu?
> >=20
> > actually not, but looking up via the compatible string has been naked by
> > Krzysztof on a different series [0].
>=20
> Hmm, I disagree with adding phandles that are not needed. I don't agree
> that there's no reuse, if you can treat the phandle identically on a new
> device, in all likelihood, that node should have a fallback to the
> existing one.

Also, where is the binding for this npu? It looks like a brand-new
module that you're adding a driver for in this series and a phandle to
the node for here but I see no binding for it.

>=20
> That said, the bigger problem in what you link is the ABI break caused by
> requiring the presence of a new node. I'd NAK that patch too.
>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > [0] https://patchwork.kernel.org/project/linux-pci/patch/20250115-en758=
1-pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org/
> >=20
> > >=20
> > > > +
> > > >  patternProperties:
> > > >    "^ethernet@[1-4]$":
> > > >      type: object
> > > > @@ -132,6 +138,8 @@ examples:
> > > >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > > >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > > > =20
> > > > +        airoha,npu =3D <&npu>;
> > > > +
> > > >          #address-cells =3D <1>;
> > > >          #size-cells =3D <0>;
> > > > =20
> > > >=20
> > > > --=20
> > > > 2.48.1
> > > >=20
> >=20
> >=20
>=20
>=20



--JrqZzneimgP/IQht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6PKCwAKCRB4tDGHoIJi
0kebAQCz6BaGDCwUWDirTEOkxpfSmpiIgYPo05mdyydf0MuO8QD+JZVQu1ZGmOgT
e9zBvQ58441WWLaD6GSiqMwKzpKmHws=
=yZil
-----END PGP SIGNATURE-----

--JrqZzneimgP/IQht--

