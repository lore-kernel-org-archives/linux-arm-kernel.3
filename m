Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA67C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOGXnUcJmm4PFhKr0X9jqtNeoEKmozgd1Hh3Lrn/iwc=; b=0cYfDozkJBKaYFGf0Uo39g2NBL
	oTmwVS+cN91o0nrHpSl+gZ/zs+jl3osSmhOloQRWasgWyENJeApMilxi5ldRi3TUbY5qskNrSuwQF
	xpvCYkvWmfCX/F726khecV1b0e+eFhAvRH3UAwtS99TO3l29fj8bKG915OMtuZaWXra3n3upD68zO
	D/Th6+AcLY4r6foUi9RazzFGsu9rYumbas5ayKqt0rXgsSFlT6WEvPeEjIBx/IrExb3Q+aCryHUOa
	yhhmxs49EqeIUU5Hd2SDJO6Y6Pc6UL6+X0gzPNL1gZ1H5YgMORhppBEzWhWiWCX1NWNVrSANAMbYX
	C1ZVl7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMFo-000000086CY-2Q5x;
	Wed, 25 Jun 2025 09:17:16 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULbJ-00000007yTU-44uK;
	Wed, 25 Jun 2025 08:35:27 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 42AC51F00050;
	Wed, 25 Jun 2025 08:35:21 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id F2609AC7A37; Wed, 25 Jun 2025 08:35:19 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4EC5EAC7A2F;
	Wed, 25 Jun 2025 08:35:18 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:35:16 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Message-ID: <aFu0xIHURuDttwJn@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lE79oaprNLAlqRlL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_013526_330326_9E3653E6 
X-CRM114-Status: GOOD (  23.49  )
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


--lE79oaprNLAlqRlL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your work!

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>=20
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.

=46rom what I understand of section 5.1.4.2 LVDS Mode Configuration Process
there's two LVDS outputs:
- LVDS0, driven by the combo-phy
- LVDS1, driven by the usual TCON0 LVDS PHY

As far as I understand the LVDS_IF register still has to be configured for
LVDS0. The D1 manual mentions a LVDS1_IF register at offset 0x244 (which I =
don't
see in the T113-S3 manual, but is probably also there), which is liekely us=
ed to
configure LVDS1. Then we find our LVDS_ANA0/ANA1 registers that are likely =
just
used for LVDS1.

While this series adds support for LVDS0 only, it would be good to also be =
able
to support LVDS1, including dual-link modes. So eventually we'd need a way =
to
actually support both cases.

It would be great if you could include these details somewhere so they don'=
t get
lost. And this seems to be the exact same situation as the A133 by the way.

All the best,

Paul

> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>=20
> Kuba Szczodrzy=C5=84ski (5):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>=20
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 10 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 40 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 65 ++++++++++++++++++-
>  4 files changed, 119 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--lE79oaprNLAlqRlL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtMQACgkQhP3B6o/u
lQy1gA/+Iu8VPy90JA8o66lrxeIiIPWu6Xc+0rbfnad0J7/iNziGmCOxQ3XaZbd7
W5L9p+yX9ByxxHM5Ijwujnq47fMWfOSXRCtwxN7BR2rlpp9F6RmnI7qxRnv14n74
ygKt4UEbPCsvtLj6X7w76NQK1qotvnQYwwdkoRKM0zKKvah2N49FFgSmue/AI3QZ
rDbK/WWXOdxuEIv8kp6L3zlWLsm9Rdc9NprRjlXzTESyHfFlE7be8hiKs1OLwoh2
jy9PFCzCSSbWx6ePb6pjPq07gVmjQxr4IQys0EHgxWvNeq4d/AdLzzijuiWR9sbM
FfzTvWtV/eSrg1cedRGejZqY9K+rHC1naCmaJaxXppqBcTveO/coAb3Gt3HJh6PL
NU+LWe1mFgKS1iU+PZX8Kz2eRmeqYBxPHNIpgLsqGlnqeHG1yNODCgj84PJF5nN6
1vnELm6+dBfMhg7LYv/N0Z1kaYHAyFPU7F0Cq3L+NHRiqBCZK2nSRnb7DhqNt4Nn
jcQbee+prBnM+tMoH5qtJLQ8vZ37XNZwbmHKOP/f5mzS04YUsWI2cvdSvXReMgLZ
TfJjvNYmIZdarxMFsA6+E0TeZp7l7zLuxMFAO/v83VpxtmRnx5w+kYc4VJG7vAe3
cMlHuxed0U8beaagiB+SYqTPx4VFjBLAw2SY8RYS4HuovYh4v5o=
=RNKR
-----END PGP SIGNATURE-----

--lE79oaprNLAlqRlL--

