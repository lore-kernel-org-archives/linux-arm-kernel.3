Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290FBC7115E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5cJrF81YLt54hags74Fip5+p/V91wDTFTMUNw5O8cc=; b=DnYj4JWeasc6MNQVHRaykbJX7m
	Dzat7+RLE4QISPI0MZXAIfISil+YFc31VVhi3sLqMCh6NzLNv1aJfn0RddxtMiLklv2aPY8mvMM+R
	TcHxsxYhINTSrPmuqNLPowPY4ImN3R/WkQ62h3/52xNPgXsha7O1kJOyJGv5qYbGLf9YSggqxgL9I
	yuIhNYvMmVhIp9GUfoPXoolrjfwAucvcYMV72duK7AxT7x8OqXCx4auEjLwMptPyMyUObFXLpjgnZ
	Ru55t6PbUgKeVNM8KHFP+sunzRGh4Y8g9te6e7qOv59uTQfxS51pFuUUFqB/u1J3fArsK0peyXPD5
	GCoLYYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZri-000000080Tr-1dHC;
	Tue, 17 Jun 2025 17:12:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZBr-00000007sfy-2J4H;
	Tue, 17 Jun 2025 16:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBC5D4458B;
	Tue, 17 Jun 2025 16:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABF6C4CEF0;
	Tue, 17 Jun 2025 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750177778;
	bh=rShkEFiN3B4/lnFN+KTqYUr+N+x16Xl6MwINsbfyY/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pr1FiKOSDtyZcoi1+CE6fklUnJXY2L6KqCsIJWxehcEJI7gk2wK/JOZvpSNq/DBu3
	 kF33Azyo3G7f///u4lOdj8T5M22Qtd2JzSTdJiP5voW0pYAsUiwxeOI/n7yZigcNON
	 f4B8vuv16p4Inr4SPdOFcUMYS7tRe6Ic6AGWYRKf0mdY9sxWIsKfeR4tpG1k/jXAxW
	 41uPG/KhIU9o1OTN947LwA1ehEERmOxUlCQD6vp2yBIbEs9HsKIfWbgQfTqNICyg4P
	 6ycyFzBZyJQUyZ7sOudYg6c7BTnv1gaHKmbPIjtivXJIUaeIr4CqOJGfdsJDQtb5II
	 8UuDjclv1csLw==
Date: Tue, 17 Jun 2025 17:29:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: airoha: Document support for
 AN7583 PCIe PHY
Message-ID: <20250617-thrower-syrup-05f1bdbee613@spud>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
 <20250609-shifty-dingbat-31aa70d7d7b1@spud>
 <68517436.050a0220.b9e1c.ed09@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5cZ2bQ10tXXgpc4h"
Content-Disposition: inline
In-Reply-To: <68517436.050a0220.b9e1c.ed09@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092939_631089_5D86DBE4 
X-CRM114-Status: GOOD (  31.27  )
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


--5cZ2bQ10tXXgpc4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 03:57:09PM +0200, Christian Marangi wrote:
> On Mon, Jun 09, 2025 at 05:51:10PM +0100, Conor Dooley wrote:
> > On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> > > Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> > > work. Add the rwquired register to configure the PCIe PHY and provide=
 an
> > > example for it.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++=
++
> > >  1 file changed, 72 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an75=
83-pcie-phy.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie=
-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.ya=
ml
> > > new file mode 100644
> > > index 000000000000..93252092c2e3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.ya=
ml
> > > @@ -0,0 +1,72 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha AN7583 PCI-Express PHY
> > > +
> > > +maintainers:
> > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > +
> > > +description:
> > > +  The PCIe PHY supports physical layer functionality for PCIe Gen2/G=
en3 port.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: airoha,an7583-pcie-phy
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: PCIE G3 analog base address
> > > +      - description: PCIE G3 PMA base address
> > > +      - description: PCIE QPhy analog base address
> > > +      - description: PCIE QPhy PMA base address
> > > +      - description: PCIE QPhy diagnostic base address
> > > +      - description: PCIE detection time base address
> > > +      - description: PCIE Rx AEQ base address
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: g3-ana
> > > +      - const: g3-pma
> > > +      - const: qp-ana
> > > +      - const: qp-pma
> > > +      - const: qp-dig
> > > +      - const: xr-dtime
> > > +      - const: rx-aeq
> > > +
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - "#phy-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/phy/phy.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        phy@11e80000 {

Oh also, this address doesn't match the reg property below.

> > > +            compatible =3D "airoha,an7583-pcie-phy";
> > > +            #phy-cells =3D <0>;
> > > +            reg =3D <0x0 0x1fc7f000 0x0 0xfff>,
> > > +                  <0x0 0x1fc7e000 0x0 0xfff>,
> > > +                  <0x0 0x1fa5f000 0x0 0xff>,
> > > +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> > > +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> > > +                  <0x0 0x1fc30044 0x0 0x4>,
> > > +                  <0x0 0x1fc35030 0x0 0x4>;
> >=20
> > Can you explain please why you have so many reg regions, some of which
> > are directly beside one another? Why is one (or more) larger region(s)
> > not viable here? Are some of these coming from a syscon that is not
> > modelled or are there other devices sharing in between?
> >
>=20
> It's to keep consistency with the documentation and how stuff is
> modelled in the SDK driver. The single region defined reflect real
> register space. In the middle they are invalid register that might cause
> system stall if read/written.

Some of the regions are directly bordering one another, with gaps of
only one byte? e.g. The second region runs from 0x1fc7e000 to 0x1fc7effe
and the next region starts at 0x1fc7ef000. One invalid byte in the
range is not worth splitting it out for. Although, are you sure that
there is exactly invalid byte and you're not propagating a mistake from
the en7581 where 0xfff was used instead of 0x1000 as a misunderstanding
of how to the size field worked?

I would expect, at the very least, that the 0x1fc7xxxx and 0x1fc5xxxx bits
should be grouped. The two 4-byte regions seem pretty suspect and really
do look like some sort of syscon that you're trying to expose only one word
=66rom. Are you sure that there is nothing at addresses 0x1fc30040 and
0x1fc30048, for example? It seems odd to me to put single words at these
addresses (and likewise on the en7581) with nothing at all around them.
Do you have a regmap for this device, or are you mostly working
backwards from some sdk?

> Also this is to keep consistency with the en7581 pcie phy driver.

But your reg regions aren't even the same as with that phy?
It has:
      - description: PCIE analog base address
      - description: PCIE lane0 base address
      - description: PCIE lane1 base address
      - description: PCIE lane0 detection time base address
      - description: PCIE lane1 detection time base address
      - description: PCIE Rx AEQ base address

of which only 3 map 1:1 with yours?

>=20
> Is it really that bad ? :(
>=20
> > > +            reg-names =3D "g3-ana", "g3-pma",
> > > +                        "qp-ana", "qp-pma", "qp-dig",
> > > +                        "xr-dtime", "rx-aeq";
> > > +        };
> > > +    };
> > > --=20
> > > 2.48.1
> > >=20
>=20
>=20
>=20
> --=20
> 	Ansuel

--5cZ2bQ10tXXgpc4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGX7gAKCRB4tDGHoIJi
0i/1AP4l7cuShLhNKB3HPj7a/bggHv2B1//wt8nzpEJMDvOjLgD8DMBnBbyIkiGu
mKY9KLVXFaIoaqSEszOXztcOZYKLPQY=
=4xkD
-----END PGP SIGNATURE-----

--5cZ2bQ10tXXgpc4h--

