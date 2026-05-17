Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A56CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9IqvZXzRKHrM06BgMCVnIpa54okeXS9JhGSaedJ7rc=; b=G5M+YpLyfxMhNg0R9vEe/w2hhI
	CsHwRN3m2YhxXH9P7ViWjx0oH+TFYTzxACjGCUSupBGRCv7hhQdi9pw8I7tvGl3fvEIIiusoy93Aq
	sh9ULBCB6zp6rE5lwaqoLbz4ISJ7+EjvSOrhsfK+r6YGu5CNwHOcCBPs4iN33E73M/U2nmhODD0rG
	/5rH+0kVsQCnE8+YmFFvKW9LnCORZnqlDbXmyI//avB+97PuH3lofzpS0MWwEvqtFw6vPl5KS0IL0
	9G/I6NAjLba6D+BJ/XF1DfBw5mdjK/i+jhHkcfQScRmt7GW4s1iET4x3GZiUS+ZWgPhsx39L42SlA
	D82ajsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOjLR-0000000DXF5-2vmT;
	Sun, 17 May 2026 21:48:21 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOjLO-0000000DXEE-0hy4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 21:48:20 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1D7071F8004F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 21:48:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5656EB407A8; Sun, 17 May 2026 21:48:12 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A490AB4079E;
	Sun, 17 May 2026 21:48:10 +0000 (UTC)
Date: Sun, 17 May 2026 23:48:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <ago3mOxf1adhogFW@collins>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
 <20260509050921.22158-4-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yC5mSo+r2Ck9CJ8n"
Content-Disposition: inline
In-Reply-To: <20260509050921.22158-4-arash.golgol@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_144818_528124_E162D1F7 
X-CRM114-Status: GOOD (  33.25  )
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


--yC5mSo+r2Ck9CJ8n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Sat 09 May 26, 08:39, Arash Golgol a =C3=A9crit :
> Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> pixel formats based on the provided mbus code. Advertise MC I/O support
> on the video device to reflect its intended usage within a media graph.

There is one (important) thing I overlooked last time: the list of
direct matches between mbus code and pixelformat only covers some of the
formats that the driver supports, but not all of them.

This is reflected in sun6i_csi_capture_link_validate, where we check
that a given mbus format set on the bridge is compatible with the
pixelformat set on the capture side.

I think we essentially have to extract that validation logic into a new
helper and then use it against all supported pixel formats for a given
mbus code to find out if that pixel format should be returned or not.
So it also means that multiple pixel formats can be supported for a given
mbus format.

A typical example of this would be MEDIA_BUS_FMT_YUYV8_2X8 than can be
stored to either YUYV (raw mode), NV16/YUV422 (YUV mode, no resampling) or
NV12/YUV420 (YUV mode, 422 -> 420 resampling).

You're welcome to give it a try if you'd like or I could take a look at
this myself.

Also the first comment after the sun6i_csi_capture_format_matches
declaration should be "YUV422", not "YUV420" (would be good to fix it
while touching these parts).

All the best,

Paul

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes in v3:
>  - No change
>  - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/202=
60508161721.94285-4-arash.golgol@gmail.com/
>=20
> Changes in v2:
>  - Return pixelformat directly instead of a pointer
>  - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/202=
60217064050.18388-4-arash.golgol@gmail.com/
>=20
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index f788b4234673..5737ebaa7297 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixel=
format, u32 mbus_code)
>  	return false;
>  }
> =20
> +static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> +		const struct sun6i_csi_capture_format_match *match =3D
> +			&sun6i_csi_capture_format_matches[i];
> +
> +		if (match->mbus_code =3D=3D mbus_code)
> +			return match->pixelformat;
> +	}
> +
> +	/* Valid fourcc is non-zero. */
> +	return 0;
> +}
> +
>  /* Capture */
> =20
>  static void
> @@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *=
file, void *priv,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index =3D fmtdesc->index;
> +	u32 mbus_code =3D fmtdesc->mbus_code;
> +	u32 pixelformat;
> +
> +	/* MC-centric or Video-node-centric */
> +	if (mbus_code) {
> +		/* There is only one pixelformat for a mbus_code. */
> +		if (index)
> +			return -EINVAL;
> +
> +		pixelformat =3D sun6i_csi_capture_pixelformat_find(mbus_code);
> +	} else {
> +		if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +			return -EINVAL;
> +
> +		pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	}
> =20
> -	if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +	if (!pixelformat)
>  		return -EINVAL;
> =20
> -	fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	fmtdesc->pixelformat =3D pixelformat;
> =20
>  	return 0;
>  }
> @@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +				 V4L2_CAP_IO_MC;
>  	video_dev->vfl_dir =3D VFL_DIR_RX;
>  	video_dev->release =3D video_device_release_empty;
>  	video_dev->fops =3D &sun6i_csi_capture_fops;
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--yC5mSo+r2Ck9CJ8n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoKN5gACgkQhP3B6o/u
lQxjFQ/9ElbgKI3F/VxE16ifDGEGHAuxRHku9cp2Mp9t9Vvc//lpAWOPDKwk+8nr
giitJevUYjpBW6EWcvre964byYHBI6Ep+GwHbryHbQ0Whhcfs7auaIXV0aGikY+w
NqZx7Uh5rd3ZCofFxa903cW3Oiz5aPYr9th5iVoXJum/bf7YRDsp3//nQOkHbPBr
i3ZIYVFCc/R9o8O1KGVd3GNGkYjduH9H5Jpxs210Ti0sxngQjYz4NHtzI9HQ+SO8
n1N7lxdchE9B6zROCvhPLTPnR680J9aDFsn39LLFRLG/r0iUbQmlmwby1MjDCxyY
7Xz6xZBKRcLXI6jg3gXVdnH7+q0SPHu4iScZE/55glACRR5ffDIJo1dE+Ons4t++
c1RW8DzzWkRLwLxA8rKxfDU1GYSHzzlKznl27jjIERAo8ZDFYYeVn3Iu/eKWhnKw
tD6OgnRP57iCDO0TkE/twbGkIrdxJlbADjiMYaWDhQ2uqDi+UBzQF0TA+SSOAJSF
GFDeyqkKt/yKdnwmiwNOwnmUICwGHtV7pH7ORyRp2kgYsL+9oV1N8QEeyPBLDeNV
7wnItI4HfPegIQBUzs7RHVev86QaACxuQFqOTgPGhCbWl24/K7BPg5B8bPOmotid
kb9ciJP+8S5Z0vRdm6b63p9RYd1kbQEIlVCB9ss1n3rd1DZCqw0=
=EjDr
-----END PGP SIGNATURE-----

--yC5mSo+r2Ck9CJ8n--

