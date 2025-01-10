Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4B1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m6c4FwAYkYMGXX7rpHwtw4Dxuzv0S7JE1cji+1x434=; b=I1lR/cVnFYBpuHFaIteQaPP7Nj
	ntNa/r/J4l4kgDl7cyztr0+4VaYGch5nnw3dglPdl2EZTc3M4YOhm9t3uEEvDMdCAgESouSgpziA/
	6GsZYd5K5XI2DKpStP4if0oxWRqRENTlkhdaQvfnU/NrcoyH5x6ZVHuzUOSvx4vrXwvJQ7ARyn4P9
	Sa006MgitM4YUCv3ZMwFGhjO9J8j3wfNts4fA9mVAWYyTxSnO3ZbwGJd/+PUb4sj709551qUiTgQt
	m5TUIVSo+Mh5DJoADB38WmK0PBCuH2CTmZ2Na698ngMSjXskLwpPcQTPUcwnrUW5HPhE9ZUIuZQGi
	4v2j1EEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAWj-0000000EZR4-0vL7;
	Fri, 10 Jan 2025 08:37:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAVG-0000000EYbu-09zO;
	Fri, 10 Jan 2025 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EA5CA41AA8;
	Fri, 10 Jan 2025 08:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25483C4CED6;
	Fri, 10 Jan 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736498184;
	bh=UZYR9BQ78eQpmXxKNkzo8ij+KKJLIbLq6n6+WAIXr+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE3jWFU7ipWWPgNiDIphsdBeFWdglPSMmOiMUVZpwQi9vqkL3mxTpMOdwng9QnNjE
	 rQEOQtByIlqG+JMOXUUANwi/0K1GSf9Qzgf5A8JyNdLKuT3EAJrzYf8sTy3Pk1IShw
	 MjpC164el4vygwvsJJ8H2qaq97sp4oLv3wsBJw92JAv7kGbE/NBjA/Oq+bD2PHfiW9
	 DEWhT9+j0ai40Ah8orT/yboOL6EvBGnp/7TdEIvIAh/Rk9ZPUVU9TnGW6JbDRMokUv
	 Kgd9LQzDdcbeFKx9YoyVj4dUVnJWjazeaTYVfUt+RTnE7zkco2gin6UszxSu5SA7tC
	 7HHamEXgtZywA==
Date: Fri, 10 Jan 2025 09:36:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
Message-ID: <20250110-flat-quantum-frigatebird-2432f1@houat>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="z2aeiokg3uqigxue"
Content-Disposition: inline
In-Reply-To: <20250110074458.3624094-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_003626_211545_18224FD5 
X-CRM114-Status: GOOD (  23.66  )
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


--z2aeiokg3uqigxue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
MIME-Version: 1.0

Hi,

On Fri, Jan 10, 2025 at 07:44:58AM +0000, Christian Hewitt wrote:
> Playing YUV420 @ 59.94 media causes HDMI output to lose sync
> with a fatal error reported:
>=20
> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
>=20
> In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
> 593407 but YUV420 modes halve the value to 296703.5 and this
> is stored as int which loses precision by rounding down to
> 296703. The rounded value is later doubled to 593406 and then
> meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
> and the error triggers during meson_vlkc_setup validation.
>=20
> Fix precision in meson_encoder_hdmi_set_vclk by switching to
> unsigned long long KHz values instead of int MHz. As values
> for phy_freq are now more accurate we also need to handle an
> additional match scenario in meson_vclk_setup.
>=20
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>  drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
>  2 files changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm=
/meson/meson_encoder_hdmi.c
> index 0593a1cde906..fa37cf975992 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_=
encoder_hdmi *encoder_hdmi,
>  {
>  	struct meson_drm *priv =3D encoder_hdmi->priv;
>  	int vic =3D drm_match_cea_mode(mode);
> -	unsigned int phy_freq;
> -	unsigned int vclk_freq;
> -	unsigned int venc_freq;
> -	unsigned int hdmi_freq;
> +	unsigned long long vclk_freq;
> +	unsigned long long phy_freq;
> +	unsigned long long venc_freq;
> +	unsigned long long hdmi_freq;
> =20
> -	vclk_freq =3D mode->clock;
> +	vclk_freq =3D mode->clock * 1000ULL;

You should be using drm_hdmi_compute_mode_clock() here



>  	/* For 420, pixel clock is half unlike venc clock */
>  	if (encoder_hdmi->output_bus_fmt =3D=3D MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_en=
coder_hdmi *encoder_hdmi,
>  	phy_freq =3D vclk_freq * 10;
> =20
>  	if (!vic) {
> -		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
> -				 vclk_freq, vclk_freq, vclk_freq, false);
> +		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
> +				 vclk_freq / 1000ULL, vclk_freq / 1000ULL,
> +				 vclk_freq / 1000ULL, false);
>  		return;
>  	}
> =20
> @@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson=
_encoder_hdmi *encoder_hdmi,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		venc_freq /=3D 2;
> =20
> -	dev_dbg(priv->dev, "vclk:%d phy=3D%d venc=3D%d hdmi=3D%d enci=3D%d\n",
> -		phy_freq, vclk_freq, venc_freq, hdmi_freq,
> -		priv->venc.hdmi_use_enci);
> -
> -	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
> -			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
> +	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
> +			 vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
> +			 priv->venc.hdmi_use_enci);
>  }
> =20
>  static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bri=
dge *bridge,
> @@ -122,10 +120,10 @@ static enum drm_mode_status meson_encoder_hdmi_mode=
_valid(struct drm_bridge *bri
>  	struct meson_encoder_hdmi *encoder_hdmi =3D bridge_to_meson_encoder_hdm=
i(bridge);
>  	struct meson_drm *priv =3D encoder_hdmi->priv;
>  	bool is_hdmi2_sink =3D display_info->hdmi.scdc.supported;
> -	unsigned int phy_freq;
> -	unsigned int vclk_freq;
> -	unsigned int venc_freq;
> -	unsigned int hdmi_freq;
> +	unsigned long long vclk_freq;
> +	unsigned long long phy_freq;
> +	unsigned long long venc_freq;
> +	unsigned long long hdmi_freq;
>  	int vic =3D drm_match_cea_mode(mode);
>  	enum drm_mode_status status;
> =20
> @@ -149,7 +147,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_v=
alid(struct drm_bridge *bri
>  	} else if (!meson_venc_hdmi_supported_vic(vic))
>  		return MODE_BAD;
> =20
> -	vclk_freq =3D mode->clock;
> +	vclk_freq =3D mode->clock * 1000ULL;

And here too.

Maxime

--z2aeiokg3uqigxue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4DcBQAKCRAnX84Zoj2+
dn9+AX0WIzrGw8NcHeicQHdElHcmHrP/e9bXGuOH6onY2l7buxWUY4niinP1ivWy
O2jmKVgBgKFBwgNAvpSLOsf5QXxgiCr5fqCVkln5DwS1slVVRJgw0EeQkrcvvb5N
QXY0HcWZ7A==
=FFqZ
-----END PGP SIGNATURE-----

--z2aeiokg3uqigxue--

