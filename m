Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5974DCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQFWPVB0zEZe7oBOEOpZ/iZToN7Noppw3P3NRqtvS1c=; b=0RR58c2GXZGeu5kn961UbMl7Kw
	ej+CuFMu+xaCUUfdlqFKSv7JpSLQfPlmOFMHXyZQjj72u+zHYurG6S3pwkr1/OGd2xq+9xoeQsbuL
	MEF3wuqCg81aXqgOagUrE3mFCsyDIvX7dWf6y9PR1/DJAj0QUaZoUmSoL0E954x1umlXVUAZbR/xy
	u3C3v2dKJyr7/ettHor2fEWlnU60hAQo+/5oRS/K1Q7UNSpddrmSW+pdjiJsd9ntd7evYXIl8krXR
	1c4K2qdXgLiW6NgdTKKyhZUCy+pOw0xFFwWzjPZqzJDVgn5u33XGWptrV/YNomJxbwssvAJqZRptv
	JJUHFuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9B2-00000003VKV-3Czj;
	Wed, 27 May 2026 07:59:44 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Ay-00000003VJw-2d0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:59:43 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AA7FD37002E2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 07:59:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0A297B40913; Wed, 27 May 2026 07:59:31 +0000 (UTC)
Received: from shepard (unknown [37.167.96.158])
	by laika.paulk.fr (Postfix) with ESMTPSA id A8A93B4090D;
	Wed, 27 May 2026 07:59:29 +0000 (UTC)
Date: Wed, 27 May 2026 09:59:18 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric
 format enumeration
Message-ID: <ahakVq7Fv78ODicG@shepard>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VM0xxLJ6muTXhGz3"
Content-Disposition: inline
In-Reply-To: <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_005940_992869_8D28BCD3 
X-CRM114-Status: GOOD (  40.87  )
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


--VM0xxLJ6muTXhGz3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 27 May 26, 09:20, arash golgol wrote:
> On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> >
> > Use the dedicated helper to check possible pixelformats against the
> > provided mbus code in order to support MC-centric format enumeration.
> >
> > Note that multiple pixelformats may be returned for a given mbus code.
> >
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
> >  1 file changed, 34 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c=
 b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index a836fa7f081a..409c28621093 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file=
 *file, void *priv,
> >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> >                                       struct v4l2_fmtdesc *fmtdesc)
> >  {
> > +       const struct sun6i_csi_capture_format *capture_format;
> > +       const struct sun6i_csi_bridge_format *bridge_format;
> > +       u32 mbus_code =3D fmtdesc->mbus_code;
> >         u32 index =3D fmtdesc->index;
> > +       unsigned int index_valid =3D 0;
> > +       unsigned int i;
> > +
> > +       /* Video-node-centric enumeration. */
> > +       if (!mbus_code) {
> > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +                       return -EINVAL;
> > +
> > +               fmtdesc->pixelformat =3D
> > +                       sun6i_csi_capture_formats[index].pixelformat;
> > +               return 0;
> > +       }
> >
> > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > +       if (!bridge_format)
> >                 return -EINVAL;
> >
> > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixel=
format;
> > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > +               capture_format =3D &sun6i_csi_capture_formats[i];
> >
> > -       return 0;
> > +               if (!sun6i_csi_capture_format_check(capture_format,
> > +                                                   bridge_format))
> > +                       continue;
> > +
> > +               if (index_valid =3D=3D index) {
> > +                       fmtdesc->pixelformat =3D capture_format->pixelf=
ormat;
> > +                       return 0;
> > +               }
> > +
> > +               index_valid++;
> > +       }
> > +
> > +       return -EINVAL;
> >  }
> >
> >  static int sun6i_csi_capture_enum_framesize(struct file *file, void *f=
h,
> > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_devi=
ce *csi_dev)
> >
> >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> >                 sizeof(video_dev->name));
> > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING;
> > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING |
> > +                                V4L2_CAP_IO_MC;
> >         video_dev->vfl_dir =3D VFL_DIR_RX;
> >         video_dev->release =3D video_device_release_empty;
> >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > --
> > 2.54.0
> >
>=20
> Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
>=20
> ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
>=20
> I verified that mbus-code-based format enumeration works correctly
> from userspace and that the reported capture formats change according
> to the selected media bus format.
>=20
> I could also successfully start streaming with several of the
> enumerated capture formats (e.g. YUYV and BA81)

Excellent, thank-you very much for testing this!

> However, I could not fully validate actual format conversion behavior
> (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> currently has non-functional test patterns except for 'shifting-1'
> mode.

That's fine. I don't think I have tested it recently either.

> Tested-by: Arash Golgol <arash.golgol@gmail.com>
>=20
> PS:
>=20
> While testing this patch I also noticed that
> VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
>  - MEDIA_BUS_FMT_UYVY8_2X8
>  - MEDIA_BUS_FMT_UYVY8_1X16
> on sun6i-csi-bridge.

I just had a look and you are definitely right, the entries are clearly
duplicates and at the same time all the relevant formats are included, so t=
hey
are not taking the place of another format that was forgotten.

You're welcome to submit a patch to remove these entries if you'd like,
or I could do it otherwise.

By the way would you be interested in testing the H.264 encoder support for
V3/V3s once I send a first version for it? I had written initial support for
it a while ago (did not send it to the list) and now that my work on the V4=
L2
stateless uAPI has reached a point of usability I will probably try to upda=
te
my rework of the cedrus driver to use it.

All the best,

Paul

> This appears to come from duplicate format entries being exposed by
> the bridge driver.
>=20
> --=20
> Regards,
> Arash Golgol

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VM0xxLJ6muTXhGz3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoWpFYACgkQhP3B6o/u
lQxhLQ//UIWt6mBSslymh22RIUaC6Ssr3TIPM+Sa5Ik1yWHnmejqqtwsxJB+oAnr
jY32nQFq3RCmrrYqTmPGnKT5GwzKfkLXpdmrCGfE5GWIMKUVGaDvUwGLs+NCdaHZ
RR7Yye5eWXPnFuReDK94PJobjvM2SAfedOatfBdL9e4QWU3Oy2d43spUe1uvjtrY
CbMsddSpG5CJt/QtfiaTf850AJIkzqIaSrRNhuspnNrVIGy6V/w+HUSODSJmivGt
m1+s1MowdYEboSN1U6eFfT+Icg5pKtU81lNgY+YZBtZlmAQmumDnq1KZSj4RUhAI
YHIuK8A+8nro002WFKuepuT7TTj6V49sNt6GG6Muko+BhSXMm9SRF43w6aTY7de0
TW+JX5fzd0tDPMqV+DRiiRUEkIiKwb4FvX+601aTRlYTXcRbOdtL/jGoIVyvVmet
B2tXadzbZ4bxhsSqfrLwLmwuMgoT7gZboI6kqk3ztei4v2ZTcE5j2iT7RU6HRRWl
MHsq2GeRqpnH2Y/anQDRXIq0U5S1xkG4syfG+uA8PweftAqO/tusvUVRqODdPfAL
X9wfdXCS0usJyCfNB4lTyiAJnEcs3/s35plcFIsQsAJDdqj2Gnb3N5bTMSMfgS9s
FN5U8zy9gSslrokVVy6IsQ/+K5/K2PGuvqE0gVwDDMKeS0UQOs8=
=Li0w
-----END PGP SIGNATURE-----

--VM0xxLJ6muTXhGz3--

