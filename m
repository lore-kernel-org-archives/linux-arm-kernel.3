Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE64DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeZaduVBoWJpFnE0cLOMjmAhuCR7ZmaFxmj807ebBEU=; b=2z2xPnRYOIqUquYGj03IVx1kAu
	nwXOp098hwDM4Khq7ztfO0V20/Xr61RRpVgBzUdoGEUTNAJsdympTOXm4lQCCJvPB2L/OFmAXvn7o
	8Z6wfV2k4niRUlk3nT+CUn7A5Qg13+Qw/6bNEbKsKCaSgiwxsRj0HKjm6O77k1zKG2F6tgOqN3J5q
	+1RgDv5N0oYGO7k4gad22t7DFfxzljZ/RWIZZXn4s8Hhx5o4zniVSezbQTav+5//Myo8sLezkhDsL
	Vvybwr+CrwnTDAN5ekLP/KcVgsm2V/iLdcGo9bBis9C3e6z4pzSL90OjypjJHFixsbFz/2MJNg7iO
	54TZ0ohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGKa-00000002jRM-2Pzf;
	Wed, 26 Aug 2026 16:18:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGKZ-00000002jQu-3m2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 16:18:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72D4C43BA6;
	Wed, 26 Aug 2026 16:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389F71F000E9;
	Wed, 26 Aug 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787761107;
	bh=TeZaduVBoWJpFnE0cLOMjmAhuCR7ZmaFxmj807ebBEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jz/0/H0PsmNhBHeE2PMFfKMXNUrMSuW1LQgYn1GLuoD2NqhIN8OR/ZEb72pAtR4vI
	 xSJNCATWSqkBzLOc6zp7s0g9zYWI2BKEgbzYAbKEWcATVHv1jvdmKqlDIOcTvIo1Dg
	 RSJ4c4xdGI45S/qd3NQjnbmdrInNyafc2Q10Coypu/ePQDnAsI0lm/cDou7OELyRhG
	 4MLT4g1SR2xWMSYbos+bCMmZUUBPouFFxAX/X4scmiSGoJuimto7Q11n5F5K+cKPZW
	 r7D8TYD+Q90ASuVksE/anFT36eFIKm+NT3g3qDV1lWbYROikZA3biu72LaRy5ATnl/
	 rf6kxhrBOUBsA==
Date: Wed, 26 Aug 2026 17:18:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <20260826-maverick-economy-3727a959a776@spud>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-4-cbfaaa3f0000@oss.nxp.com>
 <ao8PoOqPX7gwlm3L@SMW015318>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLXwz6jAJ9Z240OI"
Content-Disposition: inline
In-Reply-To: <ao8PoOqPX7gwlm3L@SMW015318>
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

--lLXwz6jAJ9Z240OI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:09:04AM -0500, Frank Li wrote:
> On Wed, Aug 26, 2026 at 12:55:45PM +0800, Guoniu Zhou wrote:
> > The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> > revision. It can process up to 8 image sources simultaneously and
> > obtain image data from up to 4 pixel link sources.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 14 ++++++++++++++
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index c1c16dbc1539..5b19b581b38e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -392,6 +392,19 @@ static const struct mxc_isi_plat_data mxc_imx95_da=
ta =3D {
> >  	.has_36bit_dma		=3D true,
> >  };
> >
> > +static const struct mxc_isi_plat_data mxc_imx952_data =3D {
> > +	.model			=3D MXC_ISI_IMX952,
> > +	.num_ports		=3D 4,
> > +	.num_channels		=3D 8,
> > +	.num_vc			=3D 8,
> > +	.reg_offset		=3D 0x10000,
> > +	.ier_reg		=3D &mxc_imx8_isi_ier_v2,
> > +	.set_thd		=3D &mxc_imx8_isi_thd_v1,
> > +	.format_mask		=3D GENMASK(30, 24),
> > +	.buf_active_reverse	=3D true,
> > +	.has_36bit_dma		=3D true,
> > +};
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Power management
> >   */
> > @@ -582,6 +595,7 @@ static const struct of_device_id mxc_isi_of_match[]=
 =3D {
> >  	{ .compatible =3D "fsl,imx91-isi", .data =3D &mxc_imx91_data },
> >  	{ .compatible =3D "fsl,imx93-isi", .data =3D &mxc_imx93_data },
> >  	{ .compatible =3D "fsl,imx95-isi", .data =3D &mxc_imx95_data },
> > +	{ .compatible =3D "fsl,imx952-isi", .data =3D &mxc_imx952_data },
>=20
> It is the almost same as imx95 except model, I am not sure if model is
> used in code.
>=20
> why not fallback to fsl,imx95-isi.
>=20
> compatible =3D "fsl,imx952-isi", "fsl,imx952-isi";

Typo here, but I agree - fallback to imx95-isi would be nice.

--lLXwz6jAJ9Z240OI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8RzgAKCRB4tDGHoIJi
0hZmAQDIhGvqiGWzfAZlp7K0I6uuR31QzcGxd8YiqNs+dGB07AD49UEqj2Wt2UNU
8Lg+xrgS/YYcnJjXmm0q4ywsQ9pwBQ==
=JtDY
-----END PGP SIGNATURE-----

--lLXwz6jAJ9Z240OI--

