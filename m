Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ECDC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT459s7JOIoFufpThnBajgHM3pHv914ZiqLhtjTI8dk=; b=pFUY8A1l1Cr8X2dSRXG+FZVYrv
	wSfDeny8H0fI3Y3VcwzMW9PKG95gHFAwKJ59y/ta/tlTWm9zfc4IF462xYOKCACBN86vIQXF8cdem
	II7wCCjkVHGOA+3ZzHRqXBW5oo4rERUqYVhC/95yeyvzc1p6GnvXTH42rHrjEzyOWrk8NSdXvv/yK
	RAwK2I8LCGKQrrmW3QrMc4MmaYnaZgI+Rh/itZHBCIsEDLgFUflw5mjvIGyaJKT5YXIFtNlYZf4L8
	Bcek2CeFwuXEY4esRgAOxwioLjVQd5cq8Ju2WKqlPYglUihA2ooSR4x3+ztPX9Kxwn85A0AONkDbk
	J7PT6dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMI6-000000086f5-1Fpf;
	Wed, 25 Jun 2025 09:19:38 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULcR-00000007yXb-2bfk;
	Wed, 25 Jun 2025 08:36:37 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9EBCA1F00036;
	Wed, 25 Jun 2025 08:36:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 392B0AC7A3C; Wed, 25 Jun 2025 08:36:31 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 0CA55AC7A32;
	Wed, 25 Jun 2025 08:36:30 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:36:28 +0200
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
Subject: Re: [PATCH 2/5] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Message-ID: <aFu1DC4eGtYmAuSf@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-3-kuba@szczodrzynski.pl>
 <aFutWCScsMNgXUAu@shepard>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mMddwFhTjlnTEsAi"
Content-Disposition: inline
In-Reply-To: <aFutWCScsMNgXUAu@shepard>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_013635_819969_5EBF7B05 
X-CRM114-Status: GOOD (  16.40  )
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


--mMddwFhTjlnTEsAi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 25 Jun 25, 10:03, Paul Kocialkowski wrote:
> On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> > @@ -183,6 +184,8 @@ static void sun4i_tcon_lvds_set_status(struct sun4i=
_tcon *tcon,
> >  	} else {
> >  		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
> >  				   SUN4I_TCON0_LVDS_IF_EN, 0);
>=20
> Does the T113-S3/D1 also have LVDS support in TCON regsiters?
> My understanding is that it only has the combo-phy, so this register write
> should not take place.
>=20
> I think it would be easier to just move this to a common callback for use=
rs of
> the tcon0 lvds phy and always call=20

Nevermind this comment, the LVDS_IF writes are actually necessary and
independent from the LVDS PHY configuration.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--mMddwFhTjlnTEsAi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtQwACgkQhP3B6o/u
lQxNJQ/+NRLOuDtviPYOloG5xp+nX3B4qO2FXp19IWGBOrz/SEL34AfiP1Bb30fu
7uwvYvURCKtY9J68zna5ovG4mex4pLo5sA81xZVc/1Cs5+7pMV2F2ixnPkAWHP6i
um3pIEKP5amDFP9DCAVAchAAQdZHD5D4+FZlu9Mw5CCWt0XToXkUpmfcExA07kzD
KnlpKPJhc1DPgXku5izWrAkrgAC0k8uMlENVclI0djMw67aO7vOyqIJpABp5ZOe4
oHIsanTWy3/2PWx2RyrXdvrXwUaZRcJUmbezq+VOxyqtVY+IytVWHj13l2CzL+eu
dyKm538s55HpwBvEbo9vYiFvLMRaMct637GGK9Z3TG2khO6LJHtBZ8nvfEHCBVmu
vUxTCl6/Mm7HEm6Wkg2wOzeBc94OsYYib2WDnPJ2TnmB2vWua9Nk96t5TQ48qOQT
J/N1sRyvy3iBX2U+gYCS9bb2SmQ+yVDSoIulX25hTqypn5peaJgQh9miq4UtC21M
4F73RP0zjS6Dn/1Hw7lE3l/M7Pd169b5ymguuxorKg+rGDpz62TMsClNQr/tPg9M
NPUZK7YW4s+O3VOXjkAy/aj+iQ8gTVvifRn14lB+lYQFPcnb82l2Ra+x6YnRTo//
6VzXsjUgV9sGRYKxcau8DQPfRDfKrZNpruYazhAOToyO96tvKiY=
=o01Z
-----END PGP SIGNATURE-----

--mMddwFhTjlnTEsAi--

