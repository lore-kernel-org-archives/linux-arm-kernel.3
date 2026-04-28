Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3610FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HQjgyu5KxB/zFAhYUh/hXr2rWKh7ek2AMPsY5XxvXI=; b=Jo+3FQ6wg0zmn6/EQHq4uvph8u
	G3ShmkPDAGzaO0ESbGaLIAC2whL9ojmJx7rtfROxSA0Z7npb9hdejYNSDkEOayUwwxXOca2ULIPw3
	KDfwRl4R+fdHqgvXC9zOp333qDXgVeUVogkvy6FLZ5k7d8k+l5h7wmryWXmqfwIR8kqhxLNiAPGim
	u0c+CIaOZd9ySLjOI3pZaexIyHzQKU9m95ba+vJqxTPJY9/4p+cZ3Z2zdiQUhiSXj80DpqRqoExdD
	tRi32h2C2Oy/1pBzHrwiMCsSWgDkeG03y5S6u7xPEKzCEGXTSG2jhHWLXh7HGc3kse0VR/1NRNjgN
	oC6uOBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHomz-00000002IcR-3eDp;
	Tue, 28 Apr 2026 20:12:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHok5-00000002EXc-083T;
	Tue, 28 Apr 2026 20:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777406949;
	bh=4HQjgyu5KxB/zFAhYUh/hXr2rWKh7ek2AMPsY5XxvXI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZGs2m1nIR8KVifEa1X2O9Zxm1hHTAJdzHQ2Q38bfB7mbQvjhhR13/D9tD1sY4f7Jv
	 mIA5mA0ygj3TNZ1g+FM4DBT4UGcfNOhoBqzLcvTMaXDTLCum8jlUdZDudu3akpiwkJ
	 Uejr+gm+sDU8LGV5K7zGWLKOWCRzNL3SzQ2YwAifXmOOpTRzlRCHFmBroDT6+0U95k
	 e9IUYZhM/3tZVrlRubph5kxWeJAGYGaZ2iU/Qwx3b30Kxa8AAWiFxfA2bFzBAV7noF
	 OIEd5ZwDlStLHxB5IiNHC53yrJX5II8Y9qmUxIfq/bekmxjqT7pIBSnWCome9rO9yb
	 /+QOAMkuBP7+w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4AEE17E1513;
	Tue, 28 Apr 2026 22:09:07 +0200 (CEST)
Message-ID: <7e7bccd3553444c0ebda80685f46a366e8bf49ad.camel@collabora.com>
Subject: Re: [PATCH v6 2/6] docs: uapi: media: Document Raspberry Pi NV12
 column format
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
Date: Tue, 28 Apr 2026 16:09:06 -0400
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-2-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
	 <20260304-media-rpi-hevc-dec-v6-2-93868ae6dff8@raspberrypi.com>
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
	protocol="application/pgp-signature"; boundary="=-7Ch6iLaTw0XauR+6FJtM"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130913_677662_33F6514D 
X-CRM114-Status: GOOD (  14.56  )
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


--=-7Ch6iLaTw0XauR+6FJtM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 14:05 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../userspace-api/media/v4l/pixfmt-yuv-planar.rst=C2=A0 | 46 ++++++=
++++++++++++++++
> =C2=A01 file changed, 46 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 0631919bd667..1aa4182b8adc 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -957,6 +957,52 @@ Data in the 12 high bits, zeros in the 4 low bits, a=
rranged in little endian ord
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`11`
> =C2=A0
> =C2=A0
> +.. _V4L2-PIX-FMT-NV12MT-COL128:
> +.. _V4L2-PIX-FMT-NV12MT-10-COL128:
> +
> +NV12MT_COL128 and NV12MT_10_COL128
> +----------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide=
 columns
> +of Y or interleaved CbCr. The height is always aligned to a multiple of =
8 lines.
> +
> +V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10=
 bit
> +values are packed into a 32bit word. A 128 byte wide column therefore ho=
lds 96
> +samples (either Y or interleaved CrCb). That effectively makes it 6 valu=
es in a
> +64 bit word for the CbCr plane, as the values always go in pairs.
> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 8 8 8 8
> +
> +=C2=A0=C2=A0=C2=A0 * - Y'\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub=
:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub=
:`01[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\=
 (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 12 12 12 12 12 12 12 12
> +
> +=C2=A0=C2=A0=C2=A0 * - Cb\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :su=
b:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :su=
b:`00[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ =
(bits 5--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`01[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :su=
b:`01[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :su=
b:`02[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ =
(bits 5--0)
> +
> +
> =C2=A0Fully Planar YUV Formats
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =C2=A0

--=-7Ch6iLaTw0XauR+6FJtM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafET4wAKCRDZQZRRKWBy
9Df7AQDdDm+K0RDoDm4EmYyFb7f/DZl/G7cMSaGO8VxO/5JluAEAvBactothia6u
XLthlVZdgV7+TAHdpocsHpuQSmts+Qo=
=F9Cy
-----END PGP SIGNATURE-----

--=-7Ch6iLaTw0XauR+6FJtM--

