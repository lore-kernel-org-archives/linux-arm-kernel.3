Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLBu0i+0j7vjmkvEaFTMtlbif/LlPOnUWtIsYDgcMhw=; b=MFgFg+yk0J4ec2jwfENK9J2GCe
	lpvrht0Lh0SqwTaaK9cAcCr/GbRSkFpfinlozoKn1Pnv5kUU7F58GXnYQGkTSlCe6APja2dJaTzSt
	n15h7kTjlHN98XjJbuI4BtfaDbL9Uu3Cvu7IuzPyB3+QVy4JosCyxgJnWWlwqAUjgMNseJ6lnGdFA
	xvzOD0jVtxMQWLy5i8TM3zUSBJMw71Kjr6DEY+qeVHaPkMCtkby7yDdN78ItmQo+0EDm78VVkYl/O
	gvPOeDPqX8FecN8XpToU82MVdzzyNhfVnXcahllh4oJiXLwgbvwW/4wO+pov6raiE4lu12o3j5AZE
	ro08rtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSn0-00000009RRg-2qoj;
	Wed, 12 Mar 2025 20:34:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSju-00000009Qvm-3Vc7;
	Wed, 12 Mar 2025 20:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAD065C56F5;
	Wed, 12 Mar 2025 20:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4E3C4CEDD;
	Wed, 12 Mar 2025 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741811501;
	bh=41vo/KySPmn6lx+PkucgbBzu2sRozu+C1kAa0ZRPpYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vfm0qvrl1PTl6ELOTIl5Vfo5FYI8TJXR2n1OwVzOt3GGHrxVTl2O0D8GpUuiJUUmO
	 o0RVLfNkmAh6VqMNgSm7boxgWK25rDly5F88OxB37LMGFDhmeD2HRcn9OyDUz4nXV0
	 tOUX9fnXz8trjH/SY/SmD6GR0302+2O96e9zYziwxjH0A9BVkMIr8oRZ0tYgTggPNq
	 rmxzl0B96DpJcWdAJ3ulbEgTGiAXKMmzjOpJFh+EDYC1wev6pGLboguTMygQnmntmO
	 W7z3hz3DMuw5hrYfbkUHd16PbSKHFKh3oNUpnsyJ0ykZkSVmYqMNHoKHyPNhasGNc2
	 L+M8lVw71daKg==
Date: Wed, 12 Mar 2025 20:31:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	zelong dong <zelong.dong@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
Message-ID: <20250312-atlas-paver-0f0e888a641b@spud>
References: <20240918074211.8067-1-zelong.dong@amlogic.com>
 <20240918074211.8067-2-zelong.dong@amlogic.com>
 <a5d9b775dd860d8f2bbf174300a2e3161b654035.camel@pengutronix.de>
 <20240918-delirious-skiing-224172be96d4@squawk>
 <84612c6b-621d-47cc-8a2e-41d1fa42f0fe@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ol8p5/GlP6j3ZPQ"
Content-Disposition: inline
In-Reply-To: <84612c6b-621d-47cc-8a2e-41d1fa42f0fe@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_133142_984838_6FC90474 
X-CRM114-Status: GOOD (  21.99  )
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


--7ol8p5/GlP6j3ZPQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 05:48:26PM +0800, Kelvin Zhang wrote:
>=20
>=20
> On 2024/9/18 16:01, Conor Dooley wrote:
> > On Wed, Sep 18, 2024 at 09:51:28AM +0200, Philipp Zabel wrote:
> > > On Mi, 2024-09-18 at 15:42 +0800, zelong dong wrote:
> > > > From: Zelong Dong<zelong.dong@amlogic.com>
> > > >=20
> > > > Add new compatible for Amlogic A4/A5 Reset Controller
> > > >=20
> > > > Signed-off-by: Zelong Dong<zelong.dong@amlogic.com>
> > > > Acked-by: Conor Dooley<conor.dooley@microchip.com>
> > > > ---
> > > >   .../bindings/reset/amlogic,meson-reset.yaml   | 23 ++++++++++++--=
-----
> > > >   1 file changed, 15 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-=
reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.ya=
ml
> > > > index 695ef38a7bb3..0ad81fe7b629 100644
> > > > --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.y=
aml
> > > > @@ -12,14 +12,21 @@ maintainers:
> > > >   properties:
> > > >     compatible:
> > > > -    enum:
> > > > -      - amlogic,meson8b-reset # Reset Controller on Meson8b and co=
mpatible SoCs
> > > > -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and co=
mpatible SoCs
> > > > -      - amlogic,meson-axg-reset # Reset Controller on AXG and comp=
atible SoCs
> > > > -      - amlogic,meson-a1-reset # Reset Controller on A1 and compat=
ible SoCs
> > > > -      - amlogic,meson-s4-reset # Reset Controller on S4 and compat=
ible SoCs
> > > > -      - amlogic,c3-reset # Reset Controller on C3 and compatible S=
oCs
> > > > -      - amlogic,t7-reset
> > > > +    oneOf:
> > > > +      - items:
> > > I'm not well versed in preferred dt-bindings style, but this items
> > > looks superfluous to me. It only contains a single enum.
> > Oh, ye. Good spot.
>=20
> Hello Philipp, Conor,
> Sorry for the late reply.
>=20
> Do you mean to use 'amlogic,meson-s4-reset' for A4 and A5 directly, witho=
ut
> the fallback?

No. We are saying that

+      - items:
+          - enum:
+              - amlogic,meson8b-reset # Reset Controller on Meson8b and co=
mpatible SoCs

is pointless duplication, because your "items" list only has only
entry in it (the enum) and you could just remove the "- items" line
entirely and have the same outcome.

--7ol8p5/GlP6j3ZPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9HvKAAKCRB4tDGHoIJi
0oJpAQCsKqKP6v3C+sdG604jzHLY00nK6OL35eoqXRnTmr5GCAD9HlCWknv/XRWI
47FHk1nMft6eKA4MOUPvOV1L9ByGJgs=
=rvWA
-----END PGP SIGNATURE-----

--7ol8p5/GlP6j3ZPQ--

