Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0778C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwbN+Au3bOVc/z9Y093i2qrVzxzmiuGTl9TiSkaROE0=; b=btfiIJrabl6JFP3tNF9gtWjnxn
	2DIqeld7kavWcpbFJqVtRjK20fCUvHexlyENwhrLpQDIckUdMbT/agq5EEpD2C/pCokB5g0jMepD6
	/xI/KPtj9QcK0KJK5z2n/TuSrEweUf0w8BvRdmp9vDfWU85eiD+nRd/SMYz4C6nnxjOybsgpUe4hg
	WNkEJ/vkve8pPxnw/hDvJhHIc12IQsJSsgrZxyFp6RBYa49Q/9k8ZcrEf/TNBxb9yjK1babA8pWLm
	nOoY678MfDtITtmVqul1vo5n4L/BJHLYRGOTw2rNhyvTYLzF+lgG/MEa7OGfwR2KGHVbnfNAQbsiX
	j/IbtmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN3g-00000008G2U-3vPM;
	Wed, 25 Jun 2025 10:08:48 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULCB-00000007ucb-1SI3;
	Wed, 25 Jun 2025 08:09:28 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 212581F00050;
	Wed, 25 Jun 2025 08:09:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 944ABAC7A07; Wed, 25 Jun 2025 08:09:20 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 37E5AAC7A00;
	Wed, 25 Jun 2025 08:09:19 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:09:16 +0200
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
Subject: Re: [PATCH 4/5] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON
 LCD0
Message-ID: <aFuurDqkJ3yaMqRS@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-5-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="id1qkDeCEtzLoxTA"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-5-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_010927_541484_FC408864 
X-CRM114-Status: GOOD (  18.87  )
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


--id1qkDeCEtzLoxTA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> The sun4i TCON needs a reference to the D-PHY in order to support LVDS
> on Allwinner D1s/T113.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..d241ba306 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -828,6 +828,8 @@ tcon_lcd0: lcd-controller@5461000 {
>  			resets =3D <&ccu RST_BUS_TCON_LCD0>,
>  				 <&ccu RST_BUS_LVDS0>;
>  			reset-names =3D "lcd", "lvds";
> +			phys =3D <&dphy>;
> +			phy-names =3D "dphy";

Like I mentionned in the other patch, I don't think the name "dphy" makes s=
ense.
"combo-phy" probably makes a lot more sense here.

Also the dt binding should be updated to reflect the introduction of the
property.

Paul

>  			#clock-cells =3D <0>;
> =20
>  			ports {
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--id1qkDeCEtzLoxTA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbrqwACgkQhP3B6o/u
lQw7sg//WLoQpyAqStd6AsRVh1QrfKNATtlAD2vpTMd1iAFGZif40Xf/eIUFKSHc
SzaFwDnYhc5d/1hJbOJ4gs866AaSGCTexQtq4wAOHuPQE+Kk3NqJ49L26Td3MtCk
aRmQ9brdHzvAK2DyMxWxro6Xrc5D3A7wtt0FM8Jwo5CpKJgOsC3OcAgmIx/eVkYr
pwHh3ajrnCvcPDOLvQRaALp6OOrgL1DiAs+Y61v7nDdU7U7wWNNPXd1fh4dtQbjC
lqsM2zbhxY8+pBU6Ec6XEKPC7yvwBYxmoah6D5ophlnyQoGJbah4nzZcJwILdlJl
6Ptb2oaRIA5D7u+2SgPKNj4ZQbhX4hdWPXn9yRMeAnf2LGziJU4BQ/AegTPWT4Zc
N7W1TsD/4SJ9fqsZYCu8FuKUHEWUfSLl36yROAoVOWLk6hVtEfMae/f2P3gUOUle
XXCVmn7In8LRK8THK/40O076jqSiytSnnHl2Do5wNnb95g+Rh06BVPf3OL6Z4O8i
hJaV4vdNSSR7ta+IenShS1fZcl15dIt1vjNFGoPUflEJUY+OVfL8zTwVRgi2KGSb
DRFue9mLKEvEtyGkGvZKscxaLVZtqfCkDg9D6w3WZG4OOigyI+N8jVTuaoVjzcWC
ohQ6sFkD+3w4n6uDKid8NSxD1p34DxSWphNP1vsz6OftJO/xFLM=
=LCaF
-----END PGP SIGNATURE-----

--id1qkDeCEtzLoxTA--

