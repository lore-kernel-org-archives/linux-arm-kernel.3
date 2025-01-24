Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C998C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K59hpdystkn8QFRkAhSRoR2AxPXCsaehF/2nh6Z9iJE=; b=EnI11PJ4Owp5Nx/FJemWjx7xzn
	6vF71DRyy4ChL0u5L3hq74xBpneaDgmeB3f1SkgQUpaCo9RHUE8UwfLZZUfKISKWXgPfXahb/MWG9
	shj89xH/GXyMxgNUuVfemaqTPd2DG9C38u/0yJ2xGwi4w2PdcL7498UKSzOz1PBzY0UnzhvKIl7Ml
	/g0dBLjQDJ9z2C/L0gYEB0gQHSE+yG8ehEDr2u6uHxGIXLEkvnEIjKsMgtipOdA6RI0zO7eE61onz
	mrFwCLR2zNOUDfuhK0IjvlJKLizMhp0S5LgDTQPEJgtgqWzjlhPhzLi9P8NJ+DO0aMC6Q+Ba+kP95
	IoiJzqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNYC-0000000FDFp-3sIy;
	Fri, 24 Jan 2025 17:33:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNWu-0000000FD8C-1jCT;
	Fri, 24 Jan 2025 17:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FB325C60DC;
	Fri, 24 Jan 2025 17:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE7DC4CED2;
	Fri, 24 Jan 2025 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737739899;
	bh=hgo5Gm6nDhGIQgSJHFT/RmxBxdtq+iVJ5SoDgdrUDWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQvRZcd4e2GNQdo7p0U4OCCfPvGv6YOcR/Ps8DznEY6RoRrIRB/osheeIqYU+O+0B
	 9EGwizhOSWwtVXT53fP3XGQeR05fXIKdOkbPDIQPh6yLWIhqhSSSWR//PK5LRWv5vR
	 CubAIK9WJR+q0+wPXdUfkkTDnJQk8Xcb5vv7eZf6D+7a6m1opDV2Z7oeVjPT3UCqOV
	 7ZQfxwNyvo76Z1kH6z5oMzCBHC8AFM/RFpTbpspC5qC2AzCvbGnMIm3UHEpnAHpaAG
	 DY0WtlHXROP9+injXE/p8n9p914ERjlxe9yPN0/Ldm4qh9RNalYVmFIhQxmke/TjQI
	 VwOJNjGPP9Iyw==
Date: Fri, 24 Jan 2025 17:31:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Friday Yang =?utf-8?B?KOadqOmYsyk=?= <Friday.Yang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Garmin Chang =?utf-8?B?KOW8teWutumKmCk=?= <Garmin.Chang@mediatek.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Message-ID: <20250124-aide-feisty-821cf9cf1382@spud>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
 <20250121065045.13514-2-friday.yang@mediatek.com>
 <20250121-violet-widely-df3567b085a4@spud>
 <2bfb6c05a3471e54f51c06895709853661e82c9a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D7rLUrhVT1Wjp55T"
Content-Disposition: inline
In-Reply-To: <2bfb6c05a3471e54f51c06895709853661e82c9a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_093140_540210_D93B6EE8 
X-CRM114-Status: GOOD (  32.83  )
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


--D7rLUrhVT1Wjp55T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 07:40:12AM +0000, Friday Yang (=E6=9D=A8=E9=98=B3) =
wrote:
> On Tue, 2025-01-21 at 17:30 +0000, Conor Dooley wrote:
> > On Tue, Jan 21, 2025 at 02:50:40PM +0800, Friday Yang wrote:
> > > SMI LARBs require reset functions when applying clamp operations.
> > > Add '#reset-cells' for the clock controller located in image,
> > > camera
> > > and IPE subsystems.
> >=20
> > A new required property is an abi break, please explain why this is
> > required.

You never answered this part. From a quick check, looks like the change
you made will cause probe failures if the resets are not present? Maybe
I misread the driver code in my quick skim - but that is the implication
of a new required property, so I didn't dig super far.

Adding new properties that break a driver is not really acceptable, so I
hope I made a mistake there.

> What are "SMI LARBs"? Why did things previously work
> > without
> > acting as a reset controller?
> >=20
>=20
> The background can refer to the discussion in the following link:
>=20
> https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=3DwXpobD=
WU1CnvkA@mail.gmail.com/
>=20
> https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fa=
sm2rFg@mail.gmail.com/
> SMI clamp and reset operations should be implemented in SMI driver
> instead of PM driver.

So the answer to how it worked previously was that nothing actually used
this multimedia interface?

Your commit message needs to explain why a new required property is okay
and why it was not there before.

Thanks,
Conor.

>=20
> I previously added the SMI reset control driver. However, the
> reviewer's comments are correct, these functions have already
> been implemented in the clock control driver. There is no need
> to submit duplicate code.=20
>=20
> https://lore.kernel.org/lkml/20241120063305.8135-2-friday.yang@mediatek.c=
om/
>=20
> https://lore.kernel.org/lkml/20241120063305.8135-3-friday.yang@mediatek.c=
om/
>=20
>=20
> On the MediaTek platform, the SMI block diagram like this:
>=20
>                 DRAM
>                  |
>             EMI(External Memory Interface)
>                  |  |
>           MediaTek IOMMU(Input Output Memory Management Unit)
>                  |  |
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
>=20
> The SMI-Common connects with SMI LARBs and IOMMU. The maximum LARBs
> number that connects with a SMI-Common is 8. If the engines number is
> over 8, sometimes we use a SMI-Sub-Common which is nearly same with
> SMI-Common. It supports up to 8 input and 1 output(SMI-Common has 2
> output).
>=20
> > >=20
> > > Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> > > ---
> > >  .../bindings/clock/mediatek,mt8188-clock.yaml | 21
> > > +++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/mediatek,mt8188-
> > > clock.yaml
> > > b/Documentation/devicetree/bindings/clock/mediatek,mt8188-
> > > clock.yaml
> > > index 860570320545..2985c8c717d7 100644
> > > --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-
> > > clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-
> > > clock.yaml
> > > @@ -57,6 +57,27 @@ required:
> > >    - reg
> > >    - '#clock-cells'
> > >=20
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mt8188-camsys-rawa
> > > +              - mediatek,mt8188-camsys-rawb
> > > +              - mediatek,mt8188-camsys-yuva
> > > +              - mediatek,mt8188-camsys-yuvb
> > > +              - mediatek,mt8188-imgsys-wpe1
> > > +              - mediatek,mt8188-imgsys-wpe2
> > > +              - mediatek,mt8188-imgsys-wpe3
> > > +              - mediatek,mt8188-imgsys1-dip-nr
> > > +              - mediatek,mt8188-imgsys1-dip-top
> > > +              - mediatek,mt8188-ipesys
> > > +
> > > +    then:
> > > +      required:
> > > +        - '#reset-cells'
> > > +
> > >  additionalProperties: false
> > >=20
> > >  examples:
> > > --
> > > 2.46.0
> > >=20

--D7rLUrhVT1Wjp55T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5POdQAKCRB4tDGHoIJi
0i5YAP9Dx5bXus4xwjvaYC4iLzVHrcUXsxmP4pUtVR6hWDrycwD9GKZ11XB4OJbc
HOrve7a/fbLIiPLQfLUBCD2A5m4nbQ8=
=oF2i
-----END PGP SIGNATURE-----

--D7rLUrhVT1Wjp55T--

