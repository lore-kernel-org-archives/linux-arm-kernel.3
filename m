Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43625C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDvoH1YmRW8AU7a5L1KNYRgx7Cc3C7EA6+6x8L93qA4=; b=l3brZQs+TUxNh9ph3KMALJkNc2
	75bBBiPFtakHtWe5TV68hQsKs+ckrJQBQT2/Ht574F60CojogOeJfSp+fhpomgngOD9HSdOT/lpb8
	dHRbTEDklcK9UbfDQVIQgvy3y7tCO95iVH1zZJwUoofzCFEesAJKqLve7s2kEoyW5ZPAhrEH95D7z
	A55o47031E/Xw2PmctC8UKtvU6iTF1dzWKIrrRFcm/LB7DYlE6rCNe9ZIcHx5jBxvsOSxDSTpqbRv
	9/PoQgB+W9EPwlg+KS349NzonXyQpsJO3INTzblg6WlfoQzq8ALVBr1vWi1gOtLzUgpTWopfZTrK9
	d2LG9j+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIaf-00000009Lv3-2doy;
	Thu, 17 Jul 2025 06:59:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIYD-00000009LSB-23ZN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 06:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A374AA57735;
	Thu, 17 Jul 2025 06:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB41BC4CEE3;
	Thu, 17 Jul 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752735424;
	bh=7UNIxyfgxpuJvviww/9S/FSs6awv1lrEbpiKGrlQfIo=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=LGPR5+GTb/BQ6QwL6rq/umhI9EbasKfBVpAbuqgSa36ENcO3R2YGSTF07mI1KUTPW
	 puvKRTk/9ApIeaBeabcbSR34Tfc088hplI1iseH+UlCujENqKajzeY784YeyXtVfRS
	 FCh1ru2LAnQ4RVO51IxZSPSbYaSOI+JSdl8eJ+lMB8CDmLjlUW62eKIZyKIxtRGgR+
	 2nqNQ7cu2g8tCHQZmxJv3h60D/y2bbkm9qz3DqXpy7IFqVqTnaQI7lIeCDASfy25U6
	 BJm1n/WYGeS1aIgb6KJamwa5Dc0PW88eXb7sViBtdRQJolYLg+PVQ24Ysq5G0NbpXZ
	 lw+XTDM4ayzYw==
Content-Type: multipart/signed;
 boundary=b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 17 Jul 2025 08:56:59 +0200
Message-Id: <DBE4UO2RGAYX.17V1DAF8MQYJM@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andrew Davis" <afd@ti.com>, "Frank Binns" <frank.binns@imgtec.com>,
 "Matt Coster" <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20250716134717.4085567-1-mwalle@kernel.org>
 <20250716134717.4085567-2-mwalle@kernel.org>
 <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
In-Reply-To: <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235705_668507_BA74A9DD 
X-CRM114-Status: GOOD (  17.91  )
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

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Wed Jul 16, 2025 at 6:17 PM CEST, Andrew Davis wrote:
> On 7/16/25 8:47 AM, Michael Walle wrote:
> > The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add =
a
> > new SoC specific compatible.
> >=20
>
> If the GPU is the same, and the integration is the same, do you really ne=
ed
> a new compatible?

AFAIK it's good practise to have one to have a base for future SoC
specific quirks. For example, there are differences how that IP was
integrated, i.e. the am62p doesn't have DMA coherency (for this
peripheral), the clock is dedicated and there might be more.

>
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >   Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 4450e2e73b3c..bad3e412a168 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -23,6 +23,7 @@ properties:
> >             - const: img,img-rogue
> >         - items:
> >             - enum:
> > +              - ti,am62p-gpu
>
> There is a check below based on SoC compat:
>
> >  - if:
> >      properties:
> >        compatible:
> >          contains:
> >            enum:
> >              - ti,am62-gpu
> >              - ti,j721s2-gpu
> >    then:
> >      properties:
> >        clocks:
> >          maxItems: 1
>
> If you do add a new SoC specific compatible does this check need updating=
?

Thanks! Yes probably.

-michael

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHievBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5owGAm2rEvW9RmbxVokhD0dJUoLHn70z6itL9
b5tCySRPREmz+X0GKE03SJhXp9kaOms3AYDO/Zxy0UXbuWjjBW92jHZ9S/6Wo2dM
tpjaLZDW7YArWfJEju57j2GH/KEnPp9KQ3E=
=VcfS
-----END PGP SIGNATURE-----

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c--

