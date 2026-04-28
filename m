Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN8g5IvF8YQ/kKz/8DwL2qnwEQpVz//ymxbpAPgSoLo=; b=ecEz+xRFBV3dRqr/MiMoxoHwnf
	eoCN3SchLT0VWMS7Tf5SqaaOJnCK9i4BKNWBqlNv5ZCk5gSBE4OFmlmDRu3jGqie2cfwoDeDx2ZHn
	ds0zRXh3gdxdLDNnKMSDxY8cakZeBsCZLiN77yqdpKkdq76UDsnwGyzhYEcWdJE3CTAWV4D4hhisP
	+4CKrb6OstcZ9fUWGkcN2vb0eguYk64Q72wziMfv/+e9FxQxhIBbxq1BCDdOXx7pkq3P0uRcwSh99
	Xbfz5tsKX+jjecVGvJyVHAN0bTvO/9F4K/mvGX7MKQPZKCdjPIZylUyYUKeSdsSDqOk0F6KpBwe59
	yVD52KEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHor2-00000002OKe-1Lzu;
	Tue, 28 Apr 2026 20:16:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHopG-00000002Llt-0vrT;
	Tue, 28 Apr 2026 20:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777407270;
	bh=n52sIa7hBm6ai6W8sMRaiMmDFW4qaL5TUk9D2hKkq20=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k6d8rESlbbQXJLC0eOlVys7JmTXCkRtMbKFikoYKF0BPGO3g2PygftkRdoBs6olR5
	 yUUo7jEoxpMlbjArQY+htFNZEuAg6BARVt8b/f+uHcBxxUGiQJsu6wwURtYpEN9kW0
	 1Ne/5sosvEtaYRykbjqQa0yvwkeLCHqDTi0xqVbZcIYEk+pI2x6OXywNGXs1EolgpU
	 CWH4zKVDcYSF0CJnyCBqikaUf9TnQxZ22FknqfFA7HUTihuUYmDKZzycOSoA+ASiX+
	 q/X8J98ez24x8n+qu5B6HGFCrDycgOkUk+qDDFvY3J+0RbzcS8kY8++3eqw34N+Shf
	 rWQDSJ1JsJsAg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C27D317E0EB6;
	Tue, 28 Apr 2026 22:14:28 +0200 (CEST)
Message-ID: <3bc30a4e04ad49e5b119b61e1e6392d8b454a7d6.camel@collabora.com>
Subject: Re: [PATCH v6 3/6] media: ioctl: Add pixel formats NV12MT_COL128
 and NV12MT_10_COL128
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 28 Apr 2026 16:14:27 -0400
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-3-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
	 <20260304-media-rpi-hevc-dec-v6-3-93868ae6dff8@raspberrypi.com>
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
	protocol="application/pgp-signature"; boundary="=-tGxzQtJlib/xM1/4dGWX"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_131434_589023_D994E81B 
X-CRM114-Status: GOOD (  18.53  )
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


--=-tGxzQtJlib/xM1/4dGWX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 14:05 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>=20
> NV12MT_COL128 has been added to v4l2_format_info.
> NV12MT_10_COL128 has not as the block width is not a power of 2,
> but the framework uses ALIGN with the value.

The performance of that code is not critical, any reason you can't just por=
t
everything to round up to the next multiple of ? (to be done in its own pat=
ch).

Nicolas

p.s. we should really add a ktest for that table ...

>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 ++
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0 | 2 ++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 4 ++++
> =C2=A03 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e1113..20a7066df570 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -311,6 +311,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bp=
p_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 1, 1, 0, 0 }},
> =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +		{ .format =3D V4L2_PIX_FMT_NV12MT_COL128, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +		/* V4L2_PIX_FMT_NV12MT_10_COL128 can not be described within the curre=
nt constraints of v4l2_format_info as 96 pixels is not a power of 2 */
> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 37d33d4a363d..2fe8f591cdb3 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1379,7 +1379,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0	case V4L2_PIX_FMT_NV16M:	descr =3D "Y/UV 4:2:2 (N-C)"; break;
> =C2=A0	case V4L2_PIX_FMT_NV61M:	descr =3D "Y/VU 4:2:2 (N-C)"; break;
> =C2=A0	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; =
break;
> +	case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols)"; =
break;
> =C2=A0	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (16x16 MB, N=
-C)"; break;
> +	case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (128=
b cols)"; break;
> =C2=A0	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N-C)"; brea=
k;
> =C2=A0	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (N-C)"; bre=
ak;
> =C2=A0	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (N-C)"; bre=
ak;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index eda4492e40dc..e466c816ff2f 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -697,6 +697,10 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /=
* 12=C2=A0 Y/CbCr 4:2:0 16x16 tiles */
> =C2=A0#define V4L2_PIX_FMT_NV12M_8L128=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2=
_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
> =C2=A0#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1',=
 '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12=
=C2=A0 Y/CbCr 4:2:0 128 pixel wide column */
> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
> +			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pix=
el wide column */
> +
> =C2=A0
> =C2=A0/* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.ht=
m=C2=A0*/
> =C2=A0#define V4L2_PIX_FMT_SBGGR8=C2=A0 v4l2_fourcc('B', 'A', '8', '1') /=
*=C2=A0 8=C2=A0 BGBG.. GRGR.. */

--=-tGxzQtJlib/xM1/4dGWX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEVIwAKCRDZQZRRKWBy
9J8UAQCuP0morTUyDPD/NNdhubR85mByJNrNBbLzHV+uLAQNQQD/eQUcx2XK2E9+
Cgs60mkBfDrXtJA0+lIklNYMLTrhJwM=
=Qopn
-----END PGP SIGNATURE-----

--=-tGxzQtJlib/xM1/4dGWX--

