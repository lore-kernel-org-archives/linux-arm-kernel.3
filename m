Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B922FD1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTe3t3TVsb+fEajvHj3NCEBIuG8sr3/4QPiIddSnnn4=; b=2ug8yrYpVtrT6eMUZW5dOV1G7r
	in0A15ycL+Ln4W50ucaZ619JHj0j/DZKXcW8I+BfEzEa6Xi4RLKyToQLC7clmmvtVuCGJDRCpptiJ
	JrvjKlfKMW8yyMKru46ui4m33+pHxoDI1Y+CUS+pzxUYEWuzieqAv/EwUSroDH74r0r8NWYL4Lwys
	2RoAs9VaMrHhL89hxjvO2OTF+cN/4vzmR4diitfNu/Rniz6mD7QvJgrwzS+WGloraEQl+k/e4ym4x
	6KsW6uK9lq5rBsNQIRkQOXQwlVYUcWpOBVUHUtRr+NpK/GFuwBKrpmhLKtmjhzfmABBVD7P1UjdhD
	nWy22s9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKz0-0000000FXih-3em2;
	Wed, 26 Nov 2025 19:15:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKyx-0000000FXiK-3gOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 19:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3258444007;
	Wed, 26 Nov 2025 19:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B32CC4CEF7;
	Wed, 26 Nov 2025 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764184515;
	bh=YV4pjAqMNH1e8RyHMHOeLoCuMUlXuCmev7wEOw+8lts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzxXgapT5UAmitacwrTn7wIBEWHn94AQ18oypryE31BJUDw8zdKDGI0Je2Pc1tQK9
	 qkN1yY+zTBnZJcFEmMfBzwjtybACmegBWSzrvQ/fiKKt7BzFAEs8Rb81mPnsEejvR7
	 A7S/x+NcPoLijEBK8EApQBIDu1rT2YtLi/3K9xTEnOAK/b2s/ultsTsbbCTVOzkRWs
	 2KWKgEy/ene5Y+5CQsn2o1rsEvcoHO7MByF8Chdp6yXoi5TLOm6rTVyIuqFOUPcgA4
	 1xT+YYMxGPID0h5jtA0mFS9pSks0fz34spTbRZQzdLf141aeLRmnTBZcEy3T6UojXx
	 F4QFAV+84rgog==
Date: Wed, 26 Nov 2025 19:15:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v3 1/3]
 dt-bindings: reset: add sky1 reset controller
Message-ID: <20251126-dreamily-shorty-cb543d993e7a@spud>
References: <20251124063235.952136-1-gary.yang@cixtech.com>
 <20251124063235.952136-2-gary.yang@cixtech.com>
 <20251124-selector-blemish-ec6e9a356bc6@spud>
 <PUZPR06MB5887CB84BC4D006EC594B654EFD1A@PUZPR06MB5887.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Jh5ZsEUVAe/DzXG"
Content-Disposition: inline
In-Reply-To: <PUZPR06MB5887CB84BC4D006EC594B654EFD1A@PUZPR06MB5887.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_111515_965447_DB779FBA 
X-CRM114-Status: GOOD (  38.81  )
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


--9Jh5ZsEUVAe/DzXG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 02:12:23PM +0000, Gary Yang wrote:
> Hi Conor:
>=20
> Thanks for your comments
>=20
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Conor Dooley <conor@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B411=E6=9C=8825=E6=97=
=A5 3:54
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Gary Yang <gary.yang@cixtech.com>
> > =E6=8A=84=E9=80=81: p.zabel@pengutronix.de; robh@kernel.org; krzk+dt@ke=
rnel.org;
> > conor+dt@kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v3 1/3] dt-bindings: reset: add sky1 res=
et controller
> >=20
> > On Mon, Nov 24, 2025 at 02:32:33PM +0800, Gary Yang wrote:
> > > There are two reset controllers on Cix sky1 Soc.
> > > One is located in S0 domain, and the other is located in S5 domain.
> > >
> > > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > > ---
> > >  .../bindings/reset/cix,sky1-rst.yaml          |  50 ++++++
> > >  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
> > >  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++=
++
> > >  3 files changed, 256 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > >  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
> > >  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > new file mode 100644
> > > index 000000000000..a28f938a283d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > @@ -0,0 +1,50 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: CIX Sky1 Reset Controller
> > > +
> > > +maintainers:
> > > +  - Gary Yang <gary.yang@cixtech.com>
> > > +
> > > +description: |
> > > +  CIX Sky1 reset controller can be used to reset various set of peri=
pherals.
> > > +  There are two reset controllers, one is located in S0 domain, the
> > > +other
> > > +  is located in S5 domain.
> > > +
> > > +  See also:
> > > +  - include/dt-bindings/reset/cix,sky1-rst.h
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - cix,sky1-rst
> > > +          - cix,sky1-rst-fch
> >=20
> > You've not addressed my v2 commentary:
> > https://lore.kernel.org/all/20251114-problem-overbook-383f8e45cd0b@spud
> > /
> > I asked what else the device does, but you didn't answer me. Dropping t=
he
> > syscon doesn't make sense if the device genuinely has other functions.
> >=20
>=20
> First I'm sorry for not responding your questions earlier. We agree the f=
act the register space of reset should not depends on other modules.
> We found that while the reset register spaces on the sky1 platform are no=
n-contiguous, a specific register space among them is exclusively used by r=
eset.
> So we can remove syscon property and split serval register spaces. All ri=
ght?

No, not all right, sorry.
It's perfectly okay for some region to do multiple things, most SoCs have
multiple regions exactly like this.
The normal thing to do is to treat these regions as a syscon like your
earlier version did. The problem with your v1 was that you called the
whole thing a reset, when it isn't just that.
There's plenty of examples using mfd for how these kinds of devices are
handled in the kernel. There's some using the simple-mfd compatible,
which is for when there are subdevices with their own nodes and other
defining mfd_cells and calling mfd_add_devices() when the subdevices do
not have enough complexity for a node (like your reset controller that
has one property and is unlikely to be reusable on another platform).

> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  '#reset-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#reset-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/reset/cix,sky1-rst.h>
> > > +    reset-controller@16000304 {
> > > +      compatible =3D "cix,sky1-rst";
> >=20
> > > +      reg =3D <0x16000304 0xc>,
> > > +            <0x16000400 0x10>,
> > > +            <0x16000800 0x8>;
> >=20
> > This is also highly suspect, and I believe what you had before was prob=
ably
> > much more realistic.
> > Do things properly and fully *now*, rather than pay the price of unrave=
lling it
> > all later. I just did this for one of my own platforms, and putting in =
the effort to
> > completely describe stuff up front is actually worth it rather than hav=
ing to
> > refactor years down the line.

> Yes, I agree your view.=20
> This scheme is discussed in our team. It is our decision, not only mine.
> There are some modules here that haven't been pushed upstream yet.
> If we take them as our internal names, maybe make you confuse. For exampl=
e,

If the naming is going to be confusing, then explain things in the
description property.

> The register space based 0x16000000 belongs to PMCTRL_S5. It is a system =
power control module, not SCP.
> It not only includes reset controller, but also some usb control, wakeup =
sources, clk gates, sleep states settings,
> generic registers for software, and so on. But In kernel, we mainly focus=
 on reset controller and usb control.
> They are controlled by the different registers. So we decide to adopt thi=
s scheme.

This is all very normal stuff that syscons are used for on other
platforms. Describe the register region based on what it contains, not
based on what you currently thing that linux is going to use. Maybe
later you'll need the other functions either in linux, or in other
projects (like u-boot) that import our devicetrees.

> If you have any questions, please let us know. If make any mistakes, plea=
se remind me kindly.=20

--9Jh5ZsEUVAe/DzXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSdRvgAKCRB4tDGHoIJi
0hKhAQCmbr+7ztWuuydaMxE6QdXogDKJNwiNrECRbFXrMJrPgAEAxXl9/vmMAbon
99sfh1Atv25w8arcMrKKyKA+l5ptWw8=
=4RAm
-----END PGP SIGNATURE-----

--9Jh5ZsEUVAe/DzXG--

