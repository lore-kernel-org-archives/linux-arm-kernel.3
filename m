Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0173DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5zQ5jNX0LK7CcArZm38pdfH5DH0Uw2Db/qDMJbNIBk=; b=MDFFe54EYmjqb0xRcGuiYHsavk
	dhmqarQcSFwKPR0OYbysny9yMQbls0AVk17sedc0jvCbCPSe8Dif0vzGrNbZC9/ncWhWVL9t1DX6l
	TadZ1Zwv3NzVjmLlOcM+zDz0TENYjW3zkIlDgdqWqOfixe1g7lJB5Exv+8cfAXgv6n1uhJMxf1flc
	oOFEiSrh32rm4EP4r6p3gXk+QZojYNUeDYQfn9tyey52T/YFbNPrkePby26GHDFyrtilETc5k02w8
	osQGYiCoYN8m07n2Yi5gaIYnXIeVCLlL9wvlEc9KQ2Nl63+IekELfR9vGjWvdBrkYDnkhlfea6pW6
	g/1RKFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa1-00000005Dfn-3qaX;
	Mon, 16 Jun 2025 18:29:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCDy-00000004wh6-0vVC;
	Mon, 16 Jun 2025 15:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DA845C63C3;
	Mon, 16 Jun 2025 15:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E588C4CEEA;
	Mon, 16 Jun 2025 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089497;
	bh=LuhQSb+DK+8zQUn35OeyQUEtiFm17Yx6iJkF9jT6jAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXuopUs8dZg+nW4ulZ3NCybN4E/fYmTKA3fG5vdNipDSwoMSw9v0GNdk9sHuMTgk8
	 7zEkBsHS609cRj2ocvQqoaRYiQYrkQqFHmnc4IyoA5nUX0U5GEfLt4DpQV7lGSALSx
	 IEbxO+EC/PWMviGLSOjSkMPCccA6CPwTwZNp5FJra76eEtwT0itnitLfln/5tAKCEx
	 O0B8v020LKb+AAm1AuMcyyi1pqEJevNe+RnC+VSDE/IjdV6Og84wboQlUun8Ipw+79
	 NE7txRrswhZNSLPD1I0SeYZPZOWoimaKVXGCMWKY/0QTIb1RAAW2TP/0XCT1JeD8Pd
	 oNTZIZ69riAiQ==
Date: Mon, 16 Jun 2025 16:58:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
Message-ID: <20250616-capped-rehab-6e7fd24d23ae@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
 <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
 <20250616-contempt-remix-5af2b7281cbd@spud>
 <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="seyiFdYL5UYYiB4P"
Content-Disposition: inline
In-Reply-To: <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_085818_342622_40676D60 
X-CRM114-Status: GOOD (  29.35  )
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


--seyiFdYL5UYYiB4P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 05:50:50PM +0200, Benjamin Gaignard wrote:
>=20
> Le 16/06/2025 =E0 17:42, Conor Dooley a =E9crit=A0:
> > On Mon, Jun 16, 2025 at 05:30:44PM +0200, Benjamin Gaignard wrote:
> > > Le 16/06/2025 =E0 17:14, Conor Dooley a =E9crit=A0:
> > > > On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
> > > > > Add a device tree binding for the Verisilicon (VSI) IOMMU. This I=
OMMU sits
> > > > > in front of hardware encoder and decoder blocks on SoCs using Ver=
isilicon IP,
> > > > > such as the Rockchip RK3588.
> > > > >=20
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > ---
> > > > >    .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++=
++++++++
> > > > >    1 file changed, 71 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/iommu/ver=
isilicon,iommu.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,=
iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..acef855fc61d
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.y=
aml
> > > > > @@ -0,0 +1,71 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Verisilicon IOMMU
> > > > > +
> > > > > +maintainers:
> > > > > +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > +
> > > > > +description: |+
> > > > > +  A Versilicon iommu translates io virtual addresses to physical=
 addresses for
> > > > > +  its associated video decoder.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: verisilicon,iommu
> > > > You're missing a soc-specific compatible at the very least here, bu=
t is
> > > > there really no versioning on the IP at all? I'd be surprised if
> > > > verisilicon only produced exactly one version of an iommu IP.
> > > I only aware this version of the iommu for the moment.
> > "for the moment", yeah. Is there any information that could be used to
> > version this available?
>=20
> The hardware block isn't documented in the TRM so I don't know if there i=
s a version
> field or something like that.
>=20
> >=20
> > > Does adding verisilicon,rk3588-iommu sound good for you ?
> > It'd be "rockchip,rk3588-iommu", but sure.
>=20
> "rockchip,rk3588-iommu" is already use for other MMUs in rk3588.

"rockchip,rk3588-video-iommu" then? Instances of an IP in an SoC get a
specific compatible with the SoC vendor's prefix, so having verisilicon
there isn't suitable unless they made the SoC.

--seyiFdYL5UYYiB4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA/EwAKCRB4tDGHoIJi
0kI2AP9KzlLbf7P4rTL1jmXCfJUvvM/YIgPfj9+baZXHSXGhrAEAjEfA2e8F23cf
LiiZ9+IgE8h/RFOqP0RqrYnEJHimugI=
=bE0w
-----END PGP SIGNATURE-----

--seyiFdYL5UYYiB4P--

