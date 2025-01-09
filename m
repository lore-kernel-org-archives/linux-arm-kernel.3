Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2787AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is0wzx5VfaQSS39zqezax6hpD2UoDB/5ZSK9ROPQWV4=; b=4YVQGCrdUERyhClZe8Wad5C63V
	YjYE9oLnb84NPnoJYcr3qW2e6N9xPiOUztxHSMJN+baJNBpbTV9Y0HdOJQcylEwD1pgcrAPh2CI/N
	MAnE1xp9yc+LHU+29ycjmPzbHsCbu9H9uIuzJOjLlbCb+LNmRKvD4RSvtoWhYfaQyi1USSFX/y2Q/
	Ie2wUBOfdKEzjmIGZEOVI52e8lYcwPwZZNFLv1nnYHU/WTppAswW+8PfTK31fWtHVhQpHouGxwNpx
	HdHiMSYVixq7VFOvRq984UzNVoEUoOksHZe56Q2huIAMTZXMUTiT1kRXU6OpyZkMX+FbpNg901lKa
	GAp5+Pkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtg1-0000000CGXG-2Zvv;
	Thu, 09 Jan 2025 14:38:25 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVteo-0000000CGHM-1mjy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:37:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54FC110408FB6;
	Thu,  9 Jan 2025 15:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736433425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=is0wzx5VfaQSS39zqezax6hpD2UoDB/5ZSK9ROPQWV4=;
	b=bXnEQ+r3aWt8kayLcG4mq6vJk5x/OzJlwKfDOKs5xgBItImGeL82S77YsUyZ34sEAF+aqB
	ffV/5Hi5Ty2KKupNvZ0Wz8uFqn6YBbF4l++7uaK2RrtOj2FGA3dfNCe6Dx0rT6uURjv95B
	N7/ndSXrr85RSHpONv9m20IUvNAqa6POq2KCLDjzqXu4IWcJy9SJDkTxd/p8VP9EKlbukR
	UhvYa1qh1OBbtm3iIQ3a2VRcWoJ44JqSkgExRA9AgINcxuFWWW9Rd+h9IrWEyyReluOZdK
	M8cQIpkf1EUsLQDuRZHJQ+2TDSPLyE6f+wqkXENJzWXWhe2pJ09o31tgvdhljw==
Date: Thu, 9 Jan 2025 15:37:02 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250109153702.2d149023@wsk>
In-Reply-To: <20241220112950.4673bb3f@wsk>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241209105240.72d8d84a@wsk>
	<20241220112950.4673bb3f@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zzrtl27UrGiMrDDp8vKZoSh";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_063710_785900_BB08660E 
X-CRM114-Status: GOOD (  30.94  )
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

--Sig_/zzrtl27UrGiMrDDp8vKZoSh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Dear Community,
>=20
> > Dear Community,
> >  =20
> > > This patch provides the DT Schema description of:
> > > - powertip,st7272  320 x 240 LCD display
> > > - powertip,hx8238a 320 x 240 LCD display
> > >=20
> > > Used with the different HW revisions of btt3 devices.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>   =20
> >=20
> > Are there any more comments for this particular patch?
> >=20
> > If not - can it be applied as it prevents dts patchs to be pull by
> > Shawn. =20
>=20
> Gentle ping on this patch ...

Gentle ping on this patch ...

>=20
> >  =20
> > > ---
> > >=20
> > > Changes for v9:
> > > - New patch
> > >=20
> > > Changes for v10:
> > > - None
> > >=20
> > > Changes for v11:
> > > - Combine both separate dt-bindings patches for powertip,st7272
> > > and powertip,hx8238a into one
> > > - Drop the quotes for in "title" entry of powertip*.yaml files
> > > ---
> > >  .../display/panel/powertip,hx8238a.yaml       | 29
> > > +++++++++++++++++++ .../display/panel/powertip,st7272.yaml
> > > | 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > > create mode 100644
> > > Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > new file mode 100644 index 000000000000..b7d74faeb5d5 ---
> > > /dev/null +++
> > > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > > BSD-2-Clause +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > > +
> > > +maintainers:
> > > +  - Lukasz Majewski <lukma@denx.de>
> > > +
> > > +allOf:
> > > +  - $ref: panel-dpi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: powertip,hx8238a
> > > +      - {} # panel-dpi, but not listed here to avoid false select
> > > +
> > > +  height-mm: true
> > > +  panel-timing: true
> > > +  port: true
> > > +  power-supply: true
> > > +  width-mm: true
> > > +
> > > +additionalProperties: false
> > > +
> > > +...
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > new file mode 100644 index 000000000000..f3622800f13f ---
> > > /dev/null +++
> > > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > > BSD-2-Clause +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > > +
> > > +maintainers:
> > > +  - Lukasz Majewski <lukma@denx.de>
> > > +
> > > +allOf:
> > > +  - $ref: panel-dpi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: powertip,st7272
> > > +      - {} # panel-dpi, but not listed here to avoid false select
> > > +
> > > +  height-mm: true
> > > +  panel-timing: true
> > > +  port: true
> > > +  power-supply: true
> > > +  width-mm: true
> > > +
> > > +additionalProperties: false
> > > +
> > > +...   =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/zzrtl27UrGiMrDDp8vKZoSh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmd/3w4ACgkQAR8vZIA0
zr1Jfwf/XyJG7WjdWC+SAb10s3s+rrOoXQCD+ORWLwk/26QdW4FdjElnNmXlEVgz
o/yvu1+OE3UFXmX/LNrwLaZB5NtA+qK57AMIAKg+ukxoft5Qa3bHrq2H/N5Usyew
lIwUKJzsibEbzfRlPJzltIKJ5k+303iwBE4BRa6FHHrtpVoPkEIx2HUJ0YVVfZa7
nIke3BNs3MlseuZh0LHY2344IWZcBaifpiaokADVsoCME2mQtdmguIGBNpZmSv3P
Xf0dylY/DV0BcHR698IZGJYVmW7+sryhWfM1l0MeSaZ5vW+WR2SiZ0vfHM5mEntD
bCh5eRq/Png33nWF5TMyi/+ZjPk1dA==
=dl+C
-----END PGP SIGNATURE-----

--Sig_/zzrtl27UrGiMrDDp8vKZoSh--

