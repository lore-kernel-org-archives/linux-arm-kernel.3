Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56872606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x+dBE7nD;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a5+Hi2vv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H14UoHzJZ4j9sWPkkPItkFe30w2Dx6yNR7iZmXK0OvI=; b=x+dBE7nDTWUf0yf5Vbg8HK9udW
	nQT8u37iqd/2hLvIglrbrUUJasy8h1fqeMji0BQejDcd05t859EMYlBjzzZYZ7f3TlTZ6hTZeSI1+
	XCNpQcJxNHfG/5rgLEVfipWUggriRsNkXlCBte+Jtf71/gyzdjKg76uJKTCCZCUkN6byfipxx0KoA
	R9pcd/QEDvbgb3y646/f0f5dggyRsQAXS0N/LlSmeCXOgHd29BZ7DRieaz0nbyrYtsNYNs5t6lOFe
	8r6ZjdRsvWFRhNRgEtEcmCZYqunUboBSOCjCRpdrRFm/2DjcXufncrKNfEOrSQ7qakSQP/ZraU8yY
	hXp+bt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxTM-000000004LO-2k6k;
	Mon, 02 Nov 2026 19:13:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxTJ-000000004KP-40W9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646812;
	bh=xP35owFT6jj4JxraKPGFthv8LA1p3Dy0waqfZfp5tt8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=a5+Hi2vvGUJ6PyPey/Qtf1f4ReGL3MbNjm3za+boS4zXkUyFmYwTCUv1zk1i4nYot
	 t3F1Iyxi5bVtXXKIqCihsqKu1v9Kcs/HQBhT+RkpgwHjP+7h0lq8HC+UAGGDTw3+FK
	 cip9JpqiUySMufgNqVhSUvjuJ5pmJh9pvjaeqO1BWsjaOzBC0fze4TOrWxw/VnaaLY
	 FxRKJaD+DSKhD7leyT+T79TSSuYRVjva0CBDdLR1JGJfXN6Ks7pKbGBUbBzPiM5U3q
	 z0Vv8AVHGAw0z9yfBIaRQ97gVsx/ubLgLEnP22w7Ax5Cg85bhk5Ou87BJdtMQI7AsX
	 HEOeeImTGYQvQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A54D17E07EF;
	Mon, 02 Nov 2026 20:13:30 +0100 (CET)
Message-ID: <9e6840bbc983d6c20228876787be3cbbb55bad4f.camel@collabora.com>
Subject: Re: [PATCH 09/10] staging: media: cedrus: h616: use the 256-bit DDR
 mode
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:13:28 -0500
In-Reply-To: <20261102170303.1973892-10-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-10-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NuyaBCaujCXR5cjPlJON"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_111334_169849_C687A9B8 
X-CRM114-Status: GOOD (  28.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-NuyaBCaujCXR5cjPlJON
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
> all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
> luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
> with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.
>=20
> The vendor library selects the DDR mode based on the VE IC version. It
> uses the 256-bit mode without the 2 MiB reconstruction write mode on
> the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
> write mode on older SoCs, like the H6. Doing the same on the H616 makes
> all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
> vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).
>=20
> Make the VE_MODE DDR settings a variant property and add an H616
> variant, which uses the 256-bit mode. Replace the FIXME about the
> DDR mode with a description of what the vendor library does.
>=20
> Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
>  drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
>  3 files changed, 25 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 756243795de8..2bbc79b44f99 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -27,6 +27,7 @@
>  #include "cedrus_video.h"
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> +#include "cedrus_regs.h"
> =20
>  /*
>   * The hardware decodes whatever picture size the bitstream headers desc=
ribe.
> @@ -697,6 +698,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_=
variant =3D {
>  	.mod_rate	=3D 600000000,
>  };
> =20
> +static const struct cedrus_variant sun50i_h616_cedrus_variant =3D {
> +	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
> +			  CEDRUS_CAPABILITY_MPEG2_DEC |
> +			  CEDRUS_CAPABILITY_H264_DEC |
> +			  CEDRUS_CAPABILITY_H265_DEC |
> +			  CEDRUS_CAPABILITY_H265_10_DEC |
> +			  CEDRUS_CAPABILITY_VP8_DEC,
> +	.mod_rate	=3D 600000000,
> +	.ve_mode_ddr	=3D VE_MODE_DDR_MODE_BW_256,
> +};
> +
>  static const struct of_device_id cedrus_dt_match[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-video-engine",
> @@ -744,7 +756,7 @@ static const struct of_device_id cedrus_dt_match[] =
=3D {
>  	},
>  	{
>  		.compatible =3D "allwinner,sun50i-h616-video-engine",
> -		.data =3D &sun50i_h6_cedrus_variant,
> +		.data =3D &sun50i_h616_cedrus_variant,
>  	},
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index a523b56a9b8c..d28fe91562d1 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -181,6 +181,7 @@ struct cedrus_dec_ops {
>  struct cedrus_variant {
>  	unsigned int	capabilities;
>  	unsigned int	mod_rate;
> +	u32		ve_mode_ddr;
>  };
> =20
>  struct cedrus_dev {
> @@ -204,6 +205,7 @@ struct cedrus_dev {
>  	struct reset_control	*rstc;
> =20
>  	unsigned int		capabilities;
> +	u32			ve_mode_ddr;
> =20
>  	struct delayed_work	watchdog_work;
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..b66d855daaf8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	u32 reg =3D 0;
> =20
>  	/*
> -	 * FIXME: This is only valid on 32-bits DDR's, we should test
> -	 * it on the A13/A33.
> +	 * The DDR mode depends on the SoC. Like the vendor library, use the
> +	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
> +	 * variant says otherwise.
>  	 */
> -	reg |=3D VE_MODE_REC_WR_MODE_2MB;
> -	reg |=3D VE_MODE_DDR_MODE_BW_128;
> +	if (ctx->dev->ve_mode_ddr) {
> +		reg |=3D ctx->dev->ve_mode_ddr;
> +	} else {
> +		reg |=3D VE_MODE_REC_WR_MODE_2MB;
> +		reg |=3D VE_MODE_DDR_MODE_BW_128;
> +	}
> =20
>  	switch (ctx->src_fmt.pixelformat) {
>  	case V4L2_PIX_FMT_MPEG2_SLICE:
> @@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  		return -EINVAL;
> =20
>  	dev->capabilities =3D variant->capabilities;
> +	dev->ve_mode_ddr =3D variant->ve_mode_ddr;
> =20
>  	irq_dec =3D platform_get_irq(dev->pdev, 0);
>  	if (irq_dec <=3D 0)

--=-NuyaBCaujCXR5cjPlJON
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujg2QAKCRDZQZRRKWBy
9NhBAP4kSne6wnIZLhGm2G9czUYCWyZLCP7dbgUBi0e2IA/m4QD7BvUXaIzqwlx3
CJ+7tQ46/WoK6ZOz3b4azrquy1xRKwc=
=lAUO
-----END PGP SIGNATURE-----

--=-NuyaBCaujCXR5cjPlJON--

