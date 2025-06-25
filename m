Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC562C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tNxVqILGkshM2vIysQ5MS1iDIfaA77GddJCD/fmHPI=; b=rnk32+hZ9i9ZdfDjV+yw0SSLW0
	l/1DodW6nX+hroUP/idUh8XFpgiwwgQOkPZxcs28hqfcKQEMuO6b+3OPGNK2rE6IATGIHEHtKK0HB
	P6XcTFOpzkP+izW7nZs0MMaWFD9nKJdWu3g5HJnWXbnHvsPUmsZU+l3DCWTvEqALEBytVNvdr+MBr
	J20F4w+pqw2zKU3q970dy6JFgZwTLsz3Cas/lR+4S2pWQg8/PfM16qUsnsgCqtXv/XkO3lIx77eOo
	PVj80nErmrgjr+cehRE6mScQ2M9E00I2mlCTzOJHe3Xg4OTR7265bjKkK5pHnHJqWpo2/d6NrdIsO
	t5IhA/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOEF-00000008SOe-496h;
	Wed, 25 Jun 2025 11:23:47 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULQW-00000007wl3-2bt9;
	Wed, 25 Jun 2025 08:24:17 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 817561F0004F;
	Wed, 25 Jun 2025 08:24:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2A3FCAC7A17; Wed, 25 Jun 2025 08:24:11 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id CF3E5AC7A0B;
	Wed, 25 Jun 2025 08:24:09 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:24:07 +0200
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
Subject: Re: [PATCH 5/5] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Message-ID: <aFuyJ6AqTX_aOr_b@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-6-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kGlgOBmJpN53EYeN"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-6-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_012416_814529_23255C07 
X-CRM114-Status: GOOD (  17.05  )
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


--kGlgOBmJpN53EYeN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Add LVDS pins to the PIO since it's now supported on D1s/T113.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index d241ba306..174b6d8f9 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -78,6 +78,15 @@ dsi_4lane_pins: dsi-4lane-pins {
>  				function =3D "dsi";
>  			};
> =20
> +			/omit-if-no-ref/
> +			lvds0_pins: lvds0-pins {

This usually has a lcd_ prefix (see sun7i-a20.dtsi and sun8i-a83t.dtsi).
It should also be sorted alphabetically.

Thanks!

Paul

> +				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
> +				       "PD6", "PD7", "PD8", "PD9";
> +				function =3D "lvds0";
> +				drive-strength =3D <30>;
> +				bias-disable;
> +			};
> +
>  			/omit-if-no-ref/
>  			lcd_rgb666_pins: lcd-rgb666-pins {
>  				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--kGlgOBmJpN53EYeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbsicACgkQhP3B6o/u
lQz4gA//XMSaMwlEF955t7sMD+r2G+0gnvduzRuZ8ICdmPh5+wc5fdr8o8F4SZ9T
lke1oY00cGYpQ8CbMd0kKJahUwHpFVZhrfBdWC/2o92/0SW9rYJk4fgrbupgOWkN
S70jFWJ1UcPVEbNwTImFWr5DlgsJPZbmsS4d3EkzN1nMEe7WGW0syw1paZEaW7IN
Usr7dtl5UVoFqzlKOy0foPf3pG/7Qv9UrnL6mJv4llPysXDeFHvK9X86j4ev3n6/
5py1bS/nTLtl9a4p4iIzuOPzYQXnQ3vUOZmYDWF+7vyMrgnNX16S/lgkyWhbJdHB
rHDelmgVbxUzPBVyLFgdKtCO6QRpUyS8cblkci/NwcSF8geQAM9Mr7N336jYDI7j
FdZ05N5CTtwvUAmFzX6v7cPE55b0qVVusc7/f5QPEcDDuGlQaRjyjUndlT11/qOh
wRePXbpOiaJQxrzvOMr6BSW9ir6RsF+rfvs3js2mMaiBYV3VzE2C2Blx8/ri6x90
FfYv5GzCVcZjWU7rctdgtc1xR5mQbLHhNVbTHPDgk7yiCVFQYDGKwbnOlCLrmYI1
JEjvbYHcQL7lV6HNzW91tTSgHrl2tiu/1v9aEirMwJDgxzNdXDXOlXEEHaPF0FTU
1elYSGp3JdKyEbFfhXPLysq8ryn9/9/pVvwm0NKv6i9gN3KemD8=
=S9I0
-----END PGP SIGNATURE-----

--kGlgOBmJpN53EYeN--

