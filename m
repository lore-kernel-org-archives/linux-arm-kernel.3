Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8489C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7vwLCGJAT+HR9wS7KqDq3zChQmQOqN725uqMPRJGs4=; b=O9ggD6pYXIm50yee7s2AIshLed
	gnkJEIhCCLqQMaGcmS4VaKLcHMUnRea3IG5UGDHy44JGlqpU7J0TjtyleNfEjSy1Ep1+0g9rY8bga
	cJJFBpOpJV4vbAcsH5C9OJZedkFUktm99ryn6loPToFIxo8X650B1pHePsAtF4zgpk0iP9XVXvSXR
	nn2AWSv5ccm7y9UAaCGXXmXxjfPU2GW9/X8O0luGEVrqKGNeDYR6r06NqNYLgmnrbiu6ZBE46q5rA
	36TgQa20ftfsJftnRpiwPujdxcyAjzRD9xF4gltdHInN0mfOevS0IcXuqi/l6GPYBINPfKA+ByRrv
	P7+HgDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN3f-00000008G0u-1OTo;
	Wed, 25 Jun 2025 10:08:47 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL9X-00000007uBA-2ZNj;
	Wed, 25 Jun 2025 08:06:45 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id EE1301F00050;
	Wed, 25 Jun 2025 08:06:39 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7B867AC7A00; Wed, 25 Jun 2025 08:06:38 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C2E29AC79F3;
	Wed, 25 Jun 2025 08:06:36 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:06:19 +0200
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
Subject: Re: [PATCH 3/5] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Message-ID: <aFut-yuJS2lfWaE8@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-4-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zc2DNXh9m8XgbscL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-4-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_010643_962592_756A3078 
X-CRM114-Status: GOOD (  25.03  )
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


--Zc2DNXh9m8XgbscL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Some comments below.

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> The Allwinner D1s/T113 needs to use the combo D-PHY to enable LVDS
> output.
>=20
> Enable LVDS support in the TCON and configure it using the PHY.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index ccf335a61..58230a552 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -171,6 +171,30 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_t=
con *tcon,
>  			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
>  }
> =20
> +static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
> +					const struct drm_encoder *encoder)
> +{
> +	union phy_configure_opts opts =3D { };
> +
> +	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
> +		return;
> +
> +	phy_init(tcon->dphy);
> +	phy_set_mode(tcon->dphy, PHY_MODE_LVDS);
> +	phy_configure(tcon->dphy, &opts);
> +	phy_power_on(tcon->dphy);

While the callback doesn't have any return code (and it probably should, fe=
el
free to fix that), the return codes for the phy_ calls should be checked and
the function aborted early in case of error.

> +}
> +
> +static void sun20i_tcon_disable_lvds_dphy(struct sun4i_tcon *tcon,
> +					  const struct drm_encoder *encoder)
> +{
> +	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
> +		return;
> +
> +	phy_power_off(tcon->dphy);
> +	phy_exit(tcon->dphy);

Same comment here.

> +}
> +
>  static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
>  				       const struct drm_encoder *encoder,
>  				       bool enabled)
> @@ -1550,8 +1574,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tc=
on_tv_quirks =3D {
> =20
>  static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks =3D {
>  	.has_channel_0		=3D true,
> +	.has_combo_dphy		=3D true,
> +	.supports_lvds		=3D true,
>  	.dclk_min_div		=3D 1,
>  	.set_mux		=3D sun8i_r40_tcon_tv_set_mux,
> +	.setup_lvds_phy		=3D sun20i_tcon_setup_lvds_dphy,
> +	.disable_lvds_phy	=3D sun20i_tcon_disable_lvds_dphy,
>  };
> =20
>  /* sun4i_drv uses this list to check if a device node is a TCON */
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Zc2DNXh9m8XgbscL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbrfsACgkQhP3B6o/u
lQwpAQ//ejWbFNBH4z9VJ16EP4vlDwIeCKa/jCLxdPV14o7aRNZfyfLW+MU5LoZb
583jqZAEAzyLgyElFfWOmpTVzZgoPzfZArozcWQKfzfTpvcn2y0/DSVXrh8XWVRW
v9xC8/hIeMXflvorPgeJKJw2UagKbgwHTipQ1dq49by/uIz0UpidtfyfUI5Gc5Qz
+wxS9jIEyYX2Hq5hmQhDsVYjnL2MrCC6ITlCeE1Sq+ifiBA+bZ1UqQQKswh2IO2O
BVzOseWscsfG1BazmVGLPOba0PyS/qRMuesCE1hDTmFMvvLKN6TDYw/fYAC4gE64
xJm72Ou4GtoIz+7YSKZNDeVkap1ulDNxim4FpOFgTwssha1vNIM2YK1HoFAo5YhD
H9mDqrpol1+ti4L4R9UjDtt7RAg97hxwXfvWhQzt6gMRDWsfkiMqAz2gB9Tn4SDP
DzQZJYhL+k1AkxxIoQtw89+eQ6Ipcss4EBHu5LjB340x4CruXUrFXNXRPdDQyFUi
qV6cV9fvMev1lDvQAmH8z2U45ezhLm0kdkgzXyHXGfXfV24UmuST3TcbBIhdrBcL
2L0SJqcj87i4YLrrmp05O/oen1QseIlxyn6Y3l2HWq/35Q8iSA63iOnw+NySZnb6
RUqGYYj48OX2EZHaCLWaiDRUh41yCSwbWQmyXPEfmgfu6K+YKGQ=
=1Zjq
-----END PGP SIGNATURE-----

--Zc2DNXh9m8XgbscL--

